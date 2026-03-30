package com.example.projectend.controller;
import java.security.Principal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;
import com.example.projectend.entity.DiaChi;
import com.example.projectend.entity.DonHang;
import com.example.projectend.entity.TaiKhoan;
import com.example.projectend.entity.DonHangChiTiet;
import com.example.projectend.entity.TrangThaiDonHang;
import com.example.projectend.repository.DiaChiRepository;
import com.example.projectend.repository.TrangThaiDonHangRepository;
import com.example.projectend.repository.DonHangRepository;
import com.example.projectend.repository.TaiKhoanRepository;
import com.example.projectend.service.DonHangService;
import com.example.projectend.service.DiaChiService;
import com.example.projectend.service.TaiKhoanService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import jakarta.servlet.http.HttpSession;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
/**
 * Controller quản lý thông tin cá nhân và đơn hàng người dùng
 */
@Controller
public class ProfileController {

    @Autowired
    private TaiKhoanRepository taiKhoanRepository;

    @Autowired
    private DiaChiRepository diaChiRepository;

    @Autowired
    private DonHangRepository donHangRepository;

    @Autowired
    private DonHangService donHangService;

    @Autowired
    private DiaChiService diaChiService;

    @Autowired
    private TaiKhoanService taiKhoanService;

    @Autowired
    private TrangThaiDonHangRepository trangThaiRepo;

    /**
     * Hiển thị trang thông tin cá nhân và đơn hàng
     */
    @GetMapping("/profile")
    public String profile(Model model, Principal principal) {
        if (principal == null) {
            return "redirect:/login";
        }

        model.addAttribute("currentPage", "profile");

        String email = principal.getName();
        TaiKhoan taiKhoan = taiKhoanRepository.findByEmail(email).orElse(null);
        if (taiKhoan == null) {
            model.addAttribute("error", "Không tìm thấy tài khoản của bạn.");
            return "error/403";
        }

        model.addAttribute("taiKhoan", taiKhoan);

        // Lấy danh sách địa chỉ
        List<DiaChi> diaChiList = diaChiRepository.findAllByMaTK(taiKhoan.getMaTK());
        model.addAttribute("diaChiList", diaChiList);

        // Lấy danh sách đơn hàng
        List<DonHang> donHangList = donHangRepository.findByKhachHangOrderByNgayDatDesc(taiKhoan);
        model.addAttribute("donHangList", donHangList);

        // Breadcrumb
        Map<String, String> breadcrumbItem = new HashMap<>();
        breadcrumbItem.put("name", "Thông tin cá nhân");
        breadcrumbItem.put("url", null);
        model.addAttribute("breadcrumbItems", List.of(breadcrumbItem));
        model.addAttribute("pageTitle", "Thông tin cá nhân - Tết Market");

        return "profile";
    }

    /**
     * Cập nhật thông tin cá nhân
     */
    @PostMapping("/profile/update")
    public String updateProfile(
            @RequestParam String hoTen,
            @RequestParam(required = false) String soDienThoai,
            Principal principal,
            RedirectAttributes redirectAttributes) {

        if (principal == null) {
            return "redirect:/login";
        }

        try {
            String email = principal.getName();
            TaiKhoan taiKhoan = taiKhoanRepository.findByEmail(email).orElse(null);

            if (taiKhoan == null) {
                redirectAttributes.addFlashAttribute("error", "Không tìm thấy tài khoản!");
                return "redirect:/profile";
            }

            taiKhoan.setHoTen(hoTen);
            taiKhoan.setSoDienThoai(soDienThoai);
            taiKhoanRepository.save(taiKhoan);

            redirectAttributes.addFlashAttribute("success", "Cập nhật thông tin thành công!");
        } catch (Exception e) {
            redirectAttributes.addFlashAttribute("error", "Có lỗi xảy ra: " + e.getMessage());
        }

        return "redirect:/profile";
    }

    /**
     * Đổi mật khẩu
     */
    @PostMapping("/profile/change-password")
    public String changePassword(
            @RequestParam String currentPassword,
            @RequestParam String newPassword,
            @RequestParam String confirmPassword,
            Principal principal,
            RedirectAttributes redirectAttributes) {

        if (principal == null) {
            return "redirect:/login";
        }

        try {
            String email = principal.getName();
            TaiKhoan taiKhoan = taiKhoanRepository.findByEmail(email).orElse(null);

            if (taiKhoan == null) {
                redirectAttributes.addFlashAttribute("errorPassword", "Không tìm thấy tài khoản!");
                return "redirect:/profile#password";
            }

            // Kiểm tra mật khẩu hiện tại
            if (!taiKhoan.getMatKhau().equals(currentPassword)) {
                redirectAttributes.addFlashAttribute("errorPassword", "Mật khẩu hiện tại không đúng!");
                return "redirect:/profile#password";
            }

            // Kiểm tra mật khẩu mới khớp
            if (!newPassword.equals(confirmPassword)) {
                redirectAttributes.addFlashAttribute("errorPassword", "Mật khẩu mới không khớp!");
                return "redirect:/profile#password";
            }

            taiKhoan.setMatKhau(newPassword);
            taiKhoanRepository.save(taiKhoan);

            redirectAttributes.addFlashAttribute("successPassword", "Đổi mật khẩu thành công!");
        } catch (Exception e) {
            redirectAttributes.addFlashAttribute("errorPassword", "Có lỗi xảy ra: " + e.getMessage());
        }

        return "redirect:/profile#password";
    }

    // 1. XỬ LÝ THÊM ĐỊA CHỈ MỚI
    @PostMapping("/profile/address/add")
    public String addAddress(@RequestParam("diaChiChiTiet") String diaChiChiTiet,
                             @RequestParam(value = "macDinh", defaultValue = "false") boolean macDinh,
                             Principal principal,
                             RedirectAttributes redirectAttributes) {
        try {
            // Lấy user đang đăng nhập
            TaiKhoan currentUser = taiKhoanService.findByEmail(principal.getName());

            // Nếu user chưa có địa chỉ nào, ép địa chỉ đầu tiên thành mặc định
            if (diaChiService.getDiaChiByTaiKhoan(currentUser).isEmpty()) {
                macDinh = true;
            }

            // Tạo và lưu địa chỉ (Dùng hàm save có sẵn)
            DiaChi dcMoi = new DiaChi(currentUser, diaChiChiTiet, macDinh);
            DiaChi savedDc = diaChiService.save(dcMoi);

            // Nếu người dùng tick chọn mặc định, dùng hàm setMacDinh của team để gỡ các địa chỉ cũ
            if (macDinh) {
                diaChiService.setMacDinh(savedDc.getMaDC(), currentUser);
            }

            redirectAttributes.addFlashAttribute("successAddress", "Thêm địa chỉ mới thành công!");
        } catch (Exception e) {
            redirectAttributes.addFlashAttribute("errorAddress", "Có lỗi xảy ra khi thêm địa chỉ!");
        }
        return "redirect:/profile#addresses";
    }

    // 2. XỬ LÝ CẬP NHẬT ĐỊA CHỈ
    @PostMapping("/profile/address/update/{id}")
    public String updateAddress(@PathVariable("id") Integer id,
                                @RequestParam("diaChiChiTiet") String diaChiChiTiet,
                                @RequestParam(value = "macDinh", defaultValue = "false") boolean macDinh,
                                Principal principal,
                                RedirectAttributes redirectAttributes) {
        try {
            TaiKhoan currentUser = taiKhoanService.findByEmail(principal.getName());
            Optional<DiaChi> optDiaChi = diaChiService.findById(id);

            if (optDiaChi.isPresent()) {
                DiaChi dcCu = optDiaChi.get();
                
                // Bảo mật: Kiểm tra xem địa chỉ này có đúng của user đang đăng nhập không
                if (dcCu.getTaiKhoan().getMaTK().equals(currentUser.getMaTK())) {
                    dcCu.setDiaChiChiTiet(diaChiChiTiet);
                    
                    // Nếu nó đang là mặc định thì không cho tắt (chỉ đổi mặc định bằng cách tick vào địa chỉ khác)
                    if (dcCu.getMacDinh()) {
                        macDinh = true; 
                    }
                    dcCu.setMacDinh(macDinh);
                    
                    diaChiService.save(dcCu); // Dùng hàm save có sẵn

                    // Nếu tick thành mặc định, cập nhật lại toàn bộ list
                    if (macDinh) {
                        diaChiService.setMacDinh(id, currentUser);
                    }
                    redirectAttributes.addFlashAttribute("successAddress", "Cập nhật địa chỉ thành công!");
                }
            }
        } catch (Exception e) {
            redirectAttributes.addFlashAttribute("errorAddress", "Có lỗi xảy ra khi cập nhật địa chỉ!");
        }
        return "redirect:/profile#addresses";
    }

    @GetMapping("/order-detail/{id}")
    public String viewOrderDetail(@PathVariable("id") Integer orderId, Model model, Principal principal, RedirectAttributes redirectAttributes) {
        try {
            // 1. Kiểm tra xem ai đang đăng nhập
            if (principal == null) {
                return "redirect:/login";
            }
            TaiKhoan currentUser = taiKhoanService.findByEmail(principal.getName());

            // 2. Lấy thông tin đơn hàng (Kèm theo điều kiện bảo mật: Đơn này phải của đúng user đang đăng nhập)
            Optional<DonHang> donHangOpt = donHangService.findByIdAndKhachHang(orderId, currentUser);
            
            if (donHangOpt.isEmpty()) {
                redirectAttributes.addFlashAttribute("error", "Không tìm thấy đơn hàng hoặc bạn không có quyền xem!");
                return "redirect:/profile#orders";
            }

            DonHang donHang = donHangOpt.get();
            
            // 3. Lấy danh sách các món bánh trong đơn hàng này
            List<DonHangChiTiet> chiTietList = donHangService.getChiTietDonHang(donHang);

            // 4. Đẩy dữ liệu ra ngoài file HTML
            model.addAttribute("donHang", donHang);
            model.addAttribute("chiTietList", chiTietList);
            model.addAttribute("pageTitle", "Chi tiết đơn hàng #" + donHang.getMaDH());

            return "order-detail"; // Trả về file order-detail.html
            
        } catch (Exception e) {
            redirectAttributes.addFlashAttribute("error", "Có lỗi xảy ra khi tải chi tiết đơn hàng.");
            return "redirect:/profile#orders";
        }
    }

    @PostMapping("/profile/orders/cancel/{id}")
    public String cancelOrder(@PathVariable("id") Integer id, RedirectAttributes ra) {
        try {
            DonHang dh = donHangService.findById(id).orElse(null);
            if (dh == null) {
                ra.addFlashAttribute("error", "Không tìm thấy đơn hàng!");
                return "redirect:/profile#orders";
            }

            // Kiểm tra: Chỉ cho hủy khi trạng thái là "Chờ xác nhận"
            if (!dh.getTrangThaiDonHang().getTenTTDH().equals("Chờ xác nhận")) {
                ra.addFlashAttribute("error", "Đơn hàng đang xử lý, không thể hủy!");
                return "redirect:/profile#orders";
            }

            // Cập nhật trạng thái sang "Đã hủy"
            // Đốm kiểm tra trong DB xem ID của trạng thái 'Đã hủy' là mấy (thường là 5)
            TrangThaiDonHang statusHuy = trangThaiRepo.findById(4).orElse(null);
            if (statusHuy != null) {
                dh.setTrangThaiDonHang(statusHuy);
                donHangRepository.save(dh);
                ra.addFlashAttribute("success", "Hủy đơn hàng thành công!");
            }
        } catch (Exception e) {
            ra.addFlashAttribute("error", "Lỗi: " + e.getMessage());
        }
        return "redirect:/profile#orders";
    }

    // --- CHỨC NĂNG MUA LẠI (REORDER) ---
    @GetMapping("/profile/orders/reorder/{id}")
    public String handleReorder(@PathVariable("id") Integer id, HttpSession session) {
        try {
            DonHang dhOld = donHangService.findById(id).orElse(null);
            if (dhOld != null && dhOld.getChiTietList() != null) {
                // Lặp qua danh sách chi tiết đơn cũ
                for (DonHangChiTiet ct : dhOld.getChiTietList()) {
                    // Gọi hàm thêm vào giỏ hàng của Thành viên 3 
                    // Ví dụ: cartService.addToCart(ct.getSanPham().getMaSP(), ct.getSoLuong(), session);
                }
            }
        } catch (Exception e) {
            return "redirect:/profile?error=reorder-failed";
        }
        return "redirect:/giohang"; // Thêm xong phi thẳng ra trang giỏ hàng
    }
}
