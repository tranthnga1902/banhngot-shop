package com.example.projectend.service;

import com.example.projectend.entity.*;
import com.example.projectend.repository.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.util.Collections;
import java.util.List;
import java.util.Optional;

/**
 * Service xử lý logic nghiệp vụ cho đơn hàng
 */
@Service
public class DonHangService {

    @Autowired
    private DonHangRepository donHangRepository;
    @Autowired
    private DonHangChiTietRepository donHangChiTietRepository;
    @Autowired
    private DiaChiRepository diaChiRepository;
    @Autowired
    private PhuongThucThanhToanRepository phuongThucThanhToanRepository;
    @Autowired
    private TrangThaiDonHangRepository trangThaiDonHangRepository;
    @Autowired
    private SanPhamRepository sanPhamRepository;

    /**
     * Tạo đơn hàng mới từ giỏ hàng
     */
    @Transactional
    public DonHang createDonHang(TaiKhoan khachHang, Integer diaChiId, Integer phuongThucId, List<GioHang> items, String ghiChu) {
        if (items == null || items.isEmpty()) {
            throw new RuntimeException("Giỏ hàng không được trống.");
        }

        // Validate các entity cần thiết
        DiaChi dc = diaChiRepository.findById(diaChiId)
                .orElseThrow(() -> new RuntimeException("Địa chỉ không hợp lệ."));
        PhuongThucThanhToan pttt = phuongThucThanhToanRepository.findById(phuongThucId)
                .orElseThrow(() -> new RuntimeException("Phương thức thanh toán không hợp lệ."));
        TrangThaiDonHang ttdhChoXacNhan = trangThaiDonHangRepository.findByTenTTDH("Chờ xác nhận")
                .orElseThrow(() -> new RuntimeException("Trạng thái đơn hàng 'Chờ xác nhận' không tìm thấy."));

        // Kiểm tra tồn kho và tính tổng tiền
        BigDecimal tongTienHang = BigDecimal.ZERO;
        for (GioHang item : items) {
            SanPham sp = sanPhamRepository.findById(item.getSanPham().getMaSP())
                    .orElseThrow(() -> new RuntimeException("Sản phẩm không tồn tại: " + item.getSanPham().getMaSP()));

            if (sp.getSoLuong() < item.getSoLuong()) {
                throw new RuntimeException("Sản phẩm " + sp.getTenSP() + " không đủ số lượng tồn kho (" + sp.getSoLuong() + ").");
            }

            tongTienHang = tongTienHang.add(sp.getGia().multiply(BigDecimal.valueOf(item.getSoLuong())));
        }

        // Tính phí ship và tổng tiền cuối
        BigDecimal phiShip = tinhPhiShip(tongTienHang);
        BigDecimal tongTienCuoi = tongTienHang.add(phiShip);

        // Tạo đơn hàng
        DonHang dh = new DonHang();
        dh.setKhachHang(khachHang);
        dh.setDiaChiGiaoHang(dc);
        dh.setPhuongThucThanhToan(pttt);
        dh.setTrangThaiDonHang(ttdhChoXacNhan);
        dh.setTongTien(tongTienCuoi);
        dh.setNgayDat(LocalDateTime.now());
        dh = donHangRepository.save(dh);

        // Tạo chi tiết đơn hàng
        for (GioHang item : items) {
            SanPham sp = sanPhamRepository.findById(item.getSanPham().getMaSP()).get();
            DonHangChiTiet dhct = new DonHangChiTiet();
            dhct.setDonHang(dh);
            dhct.setSanPham(sp);
            dhct.setSoLuong(item.getSoLuong());
            dhct.setDonGia(sp.getGia());
            donHangChiTietRepository.save(dhct);
        }

        return dh;
    }

    /**
     * Lấy chi tiết đơn hàng
     */
    public List<DonHangChiTiet> getChiTietDonHang(DonHang donHang) {
        return donHangChiTietRepository.findByDonHang(donHang);
    }

    /**
     * Tìm đơn hàng theo ID và khách hàng (bảo mật)
     */
    public Optional<DonHang> findByIdAndKhachHang(Integer id, TaiKhoan khachHang) {
        return donHangRepository.findByMaDHAndKhachHang_MaTK(id, khachHang.getMaTK());
    }

    /**
     * Lấy lịch sử đơn hàng của khách hàng
     */
    public Page<DonHang> getDonHangByKhachHang(TaiKhoan tk, Pageable pageable) {
        return donHangRepository.findByKhachHang_MaTKOrderByNgayDatDesc(tk.getMaTK(), pageable);
    }

    /**
     * Hủy đơn hàng (chỉ khi đang chờ xác nhận)
     */
    @Transactional
    public boolean cancelOrder(Integer donHangId, TaiKhoan khachHang) {
        Optional<DonHang> dhOpt = findByIdAndKhachHang(donHangId, khachHang);

        if (!dhOpt.isPresent()) {
            return false;
        }

        DonHang dh = dhOpt.get();
        Optional<TrangThaiDonHang> ttdhCurrentOpt = Optional.ofNullable(dh.getTrangThaiDonHang());
        if (!ttdhCurrentOpt.isPresent() || !"Chờ xác nhận".equals(ttdhCurrentOpt.get().getTenTTDH())) {
            return false;
        }

        TrangThaiDonHang ttdhHuy = trangThaiDonHangRepository.findByTenTTDH("Đã hủy").orElse(null);
        if (ttdhHuy == null) {
            throw new RuntimeException("Không tìm thấy trạng thái 'Đã hủy'.");
        }

        dh.setTrangThaiDonHang(ttdhHuy);
        donHangRepository.save(dh);

        return true;
    }

    /**
     * Tìm kiếm đơn hàng cho admin
     */
    public Page<DonHang> searchAdmin(String keyword, String trangThai, Pageable pageable) {
        Specification<DonHang> spec = Specification.where(null);

        // Lọc theo trạng thái
        if (trangThai != null && !trangThai.isEmpty()) {
            Optional<TrangThaiDonHang> ttdhOpt = trangThaiDonHangRepository.findByTenTTDH(trangThai.trim());
            if (ttdhOpt.isPresent()) {
                final int maTTDH = ttdhOpt.get().getMaTTDH();
                spec = spec.and((root, query, cb) -> cb.equal(root.get("trangThaiDonHang").get("maTTDH"), maTTDH));
            }
        }

        // Tìm kiếm theo mã đơn hàng
        if (keyword != null && !keyword.trim().isEmpty()) {
            try {
                int maDH = Integer.parseInt(keyword.trim());
                spec = spec.and((root, query, criteriaBuilder) -> criteriaBuilder.equal(root.get("maDH"), maDH));
            } catch (NumberFormatException e) {
                // Bỏ qua nếu không phải số
            }
        }

        return donHangRepository.findAll(spec, pageable);
    }

    /**
     * Cập nhật trạng thái đơn hàng
     */
    public boolean updateTrangThai(Integer donHangId, String trangThaiMoi) {
        Optional<DonHang> dhOpt = donHangRepository.findById(donHangId);

        if (!dhOpt.isPresent()) {
            return false;
        }

        TrangThaiDonHang ttdh = trangThaiDonHangRepository.findByTenTTDH(trangThaiMoi).orElse(null);
        if (ttdh == null) {
            return false;
        }

        DonHang dh = dhOpt.get();
        dh.setTrangThaiDonHang(ttdh);
        donHangRepository.save(dh);

        return true;
    }

    /**
     * Cập nhật trạng thái và gán nhân viên xử lý
     */
    @Transactional
    public boolean updateTrangThaiWithStaff(Integer donHangId, String trangThaiMoi, TaiKhoan nhanVien) {
        Optional<DonHang> dhOpt = donHangRepository.findById(donHangId);

        if (!dhOpt.isPresent()) {
            return false;
        }

        TrangThaiDonHang ttdh = trangThaiDonHangRepository.findByTenTTDH(trangThaiMoi).orElse(null);
        if (ttdh == null) {
            return false;
        }

        DonHang dh = dhOpt.get();
        dh.setTrangThaiDonHang(ttdh);

        if (nhanVien != null) {
            dh.setNhanVien(nhanVien);
        }

        donHangRepository.save(dh);

        return true;
    }

    /**
     * Lấy danh sách đơn hàng chờ xác nhận
     */
    public List<DonHang> getPendingOrders(int limit) {
        TrangThaiDonHang ttdh = trangThaiDonHangRepository.findByTenTTDH("Chờ xác nhận").orElse(null);
        if (ttdh == null) {
            return Collections.emptyList();
        }

        return donHangRepository.findByTrangThaiDonHang_MaTTDHOrderByNgayDatDesc(ttdh.getMaTTDH(), PageRequest.of(0, limit)).getContent();
    }

    /**
     * Tính phí ship đơn giản theo tổng tiền
     */
    public BigDecimal tinhPhiShip(BigDecimal tongTien) {
        BigDecimal MUC_MIEN_PHI = new BigDecimal("300000");
        BigDecimal PHI_SHIP_CO_BAN = new BigDecimal("30000");

        if (tongTien.compareTo(MUC_MIEN_PHI) >= 0) {
            return BigDecimal.ZERO;
        }
        return PHI_SHIP_CO_BAN;
    }

    /**
     * Tính phí ship theo địa chỉ giao hàng
     */
    public BigDecimal tinhPhiShipByDiaChi(DiaChi diaChi) {
        BigDecimal PHI_SHIP_HN_HCM = new BigDecimal("30000");
        BigDecimal PHI_SHIP_TINH_KHAC = new BigDecimal("50000");

        String chiTiet = diaChi.getDiaChiChiTiet().toUpperCase();

        if (chiTiet.contains("HÀ NỘI") || chiTiet.contains("TP.HCM") || chiTiet.contains("HỒ CHÍ MINH")) {
            return PHI_SHIP_HN_HCM;
        }
        return PHI_SHIP_TINH_KHAC;
    }

    /**
     * Tìm đơn hàng theo ID
     */
    public Optional<DonHang> findById(Integer id) {
        return donHangRepository.findById(id);
    }

    /**
     * Đếm tổng số đơn hàng
     */
    public long countAll() {
        return donHangRepository.count();
    }

    /**
     * Lấy danh sách đơn hàng gần đây
     */
    public List<DonHang> getRecentOrders(int limit) {
        return donHangRepository.findAll(
                PageRequest.of(0, limit, org.springframework.data.domain.Sort.by("ngayDat").descending())
        ).getContent();
    }

    // ========================================
    // THỐNG KÊ & BÁO CÁO
    // ========================================

    /**
     * Tính tổng doanh thu theo khoảng thời gian
     */
    public BigDecimal tinhDoanhThu(LocalDateTime start, LocalDateTime end) {
        BigDecimal revenue = donHangRepository.sumRevenueByDateRange(start, end);
        return revenue != null ? revenue : BigDecimal.ZERO;
    }

    /**
     * Thống kê doanh thu theo tháng (trả về Map với key = "Tháng YYYY-MM", value = doanh thu)
     */
    public java.util.Map<String, BigDecimal> thongKeTheoThang(int soThang) {
        java.util.Map<String, BigDecimal> result = new java.util.LinkedHashMap<>();
        LocalDateTime now = LocalDateTime.now();

        for (int i = soThang - 1; i >= 0; i--) {
            LocalDateTime start = now.minusMonths(i).withDayOfMonth(1).withHour(0).withMinute(0).withSecond(0);
            LocalDateTime end = start.plusMonths(1).minusSeconds(1);
            BigDecimal revenue = donHangRepository.sumRevenueByDateRange(start, end);
            String label = "T" + (start.getMonthValue()) + "/" + start.getYear();
            result.put(label, revenue != null ? revenue : BigDecimal.ZERO);
        }
        return result;
    }

    /**
     * Lấy danh sách nhãn tháng cho biểu đồ
     */
    public List<String> getLabelsForChart(int soThang) {
        List<String> labels = new java.util.ArrayList<>();
        LocalDateTime now = LocalDateTime.now();
        for (int i = soThang - 1; i >= 0; i--) {
            LocalDateTime date = now.minusMonths(i);
            labels.add("T" + date.getMonthValue() + "/" + date.getYear());
        }
        return labels;
    }

    /**
     * Lấy dữ liệu doanh thu theo tháng cho biểu đồ
     */
    public List<BigDecimal> getDataForChart(int soThang) {
        List<BigDecimal> data = new java.util.ArrayList<>();
        LocalDateTime now = LocalDateTime.now();
        for (int i = soThang - 1; i >= 0; i--) {
            LocalDateTime start = now.minusMonths(i).withDayOfMonth(1).withHour(0).withMinute(0).withSecond(0);
            LocalDateTime end = start.plusMonths(1).minusSeconds(1);
            BigDecimal revenue = donHangRepository.sumRevenueByDateRange(start, end);
            data.add(revenue != null ? revenue : BigDecimal.ZERO);
        }
        return data;
    }

    /**
     * Top sản phẩm bán chạy (trả về List<Map với thông tin sản phẩm và số lượng bán)
     */
    public List<java.util.Map<String, Object>> topSanPhamBanChay(int limit) {
        List<DonHang> completedOrders = donHangRepository.findByTrangThaiDonHang_MaTTDHAndNgayDatBetween(
                3, // MaTTDH = 3: Hoàn tất
                LocalDateTime.now().minusYears(1),
                LocalDateTime.now()
        );

        java.util.Map<Integer, Long> productSales = new java.util.HashMap<>();
        for (DonHang dh : completedOrders) {
            for (DonHangChiTiet ct : dh.getChiTietList()) {
                Integer maSP = ct.getSanPham().getMaSP();
                productSales.merge(maSP, ct.getSoLuong().longValue(), Long::sum);
            }
        }

        // Sắp xếp theo số lượng bán và lấy top N
        List<java.util.Map.Entry<Integer, Long>> sorted = new java.util.ArrayList<>(productSales.entrySet());
        sorted.sort((a, b) -> b.getValue().compareTo(a.getValue()));

        List<java.util.Map<String, Object>> result = new java.util.ArrayList<>();
        int count = 0;
        for (java.util.Map.Entry<Integer, Long> entry : sorted) {
            if (count >= limit) break;
            java.util.Map<String, Object> item = new java.util.HashMap<>();
            item.put("maSP", entry.getKey());
            Optional<SanPham> spOpt = sanPhamRepository.findById(entry.getKey());
            if (spOpt.isPresent()) {
                item.put("tenSP", spOpt.get().getTenSP());
                item.put("hinhAnh", spOpt.get().getHinhAnh());
            } else {
                item.put("tenSP", "Sản phẩm #" + entry.getKey());
                item.put("hinhAnh", "/img/default-product.png");
            }
            item.put("soLuongBan", entry.getValue());
            result.add(item);
            count++;
        }
        return result;
    }

    /**
     * Doanh thu hôm nay
     */
    public BigDecimal doanhThuHomNay() {
        LocalDateTime today = LocalDateTime.now();
        LocalDateTime start = today.toLocalDate().atStartOfDay();
        LocalDateTime end = today.toLocalDate().atTime(23, 59, 59);
        return tinhDoanhThu(start, end);
    }

    /**
     * Số đơn hàng hôm nay
     */
    public long demDonHangHomNay() {
        LocalDateTime today = LocalDateTime.now();
        LocalDateTime start = today.toLocalDate().atStartOfDay();
        LocalDateTime end = today.toLocalDate().atTime(23, 59, 59);
        return donHangRepository.countByNgayDatBetween(start, end);
    }

    /**
     * Sản phẩm bán ra hôm nay
     */
    public long sanPhamBanRaHomNay() {
        LocalDateTime today = LocalDateTime.now();
        LocalDateTime start = today.toLocalDate().atStartOfDay();
        LocalDateTime end = today.toLocalDate().atTime(23, 59, 59);
        Long total = donHangRepository.sumTotalProductsSoldByDateRange(start, end);
        return total != null ? total : 0;
    }

    /**
     * Doanh thu 7 ngày gần đây
     */
    public List<java.util.Map<String, Object>> doanhThu7NgayGanDay() {
        List<java.util.Map<String, Object>> result = new java.util.ArrayList<>();
        LocalDateTime today = LocalDateTime.now();
        java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("dd/MM");

        for (int i = 6; i >= 0; i--) {
            LocalDateTime date = today.minusDays(i);
            LocalDateTime start = date.toLocalDate().atStartOfDay();
            LocalDateTime end = date.toLocalDate().atTime(23, 59, 59);
            BigDecimal revenue = donHangRepository.sumRevenueByDateRange(start, end);

            java.util.Map<String, Object> item = new java.util.HashMap<>();
            item.put("ngay", sdf.format(java.sql.Timestamp.valueOf(date)));
            item.put("doanhThu", revenue != null ? revenue : BigDecimal.ZERO);
            result.add(item);
        }
        return result;
    }
}

