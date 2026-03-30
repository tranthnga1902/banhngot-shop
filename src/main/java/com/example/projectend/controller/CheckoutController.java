package com.example.projectend.controller;

import com.example.projectend.entity.*;
import com.example.projectend.service.DiaChiService;
import com.example.projectend.service.DonHangService;
import com.example.projectend.service.GioHangService;
import com.example.projectend.service.TaiKhoanService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.math.BigDecimal;
import java.security.Principal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;
import java.util.stream.Collectors;
import java.util.ArrayList;

/**
 * Controller xử lý thanh toán và đặt hàng
 */
@Controller
@RequestMapping("/checkout")
public class CheckoutController {

    @Autowired
    private GioHangService gioHangService;

    @Autowired
    private TaiKhoanService taiKhoanService;

    @Autowired
    private DiaChiService diaChiService;

    @Autowired
    private DonHangService donHangService;

    /**
     * Hiển thị trang thanh toán
     */
    @GetMapping("")
    public String checkout(@RequestParam(value = "ids", required = false) List<Integer> selectedIds, 
                           Model model, Principal principal) {

        // Kiểm tra đăng nhập
        if (principal == null) {
            return "redirect:/login?returnUrl=/checkout";
        }

        TaiKhoan tk = taiKhoanService.findByEmail(principal.getName());
        if (tk == null) {
            return "redirect:/login";
        }

        // Lấy TOÀN BỘ giỏ hàng
        List<GioHang> allItems = gioHangService.getGioHangByTaiKhoan(tk);
        if (allItems.isEmpty()) {
            return "redirect:/giohang?error=empty";
        }

        // --- BỘ LỌC ĐÂY RỒI ---
        // Chỉ lấy những sản phẩm có ID nằm trong danh sách truyền từ Frontend sang
        List<GioHang> checkoutItems = new ArrayList<>();
        if (selectedIds != null && !selectedIds.isEmpty()) {
            checkoutItems = allItems.stream()
                    .filter(item -> selectedIds.contains(item.getSanPham().getMaSP()))
                    .collect(Collectors.toList());
        } else {
            // Nếu không có ID nào (do user gõ trực tiếp URL /checkout), lấy hết giỏ hàng
            checkoutItems = allItems;
        }

        if (checkoutItems.isEmpty()) {
            return "redirect:/giohang?error=noselection"; // Nếu lỡ truyền ID bậy, trả về giỏ hàng
        }

        // Truyền ĐÚNG danh sách đã lọc ra màn hình
        model.addAttribute("cartItems", checkoutItems);

        // Tính tổng tiền cho CHÍNH XÁC những món đã lọc
        BigDecimal tongTien = gioHangService.tinhTongTien(checkoutItems);
        model.addAttribute("orderSubtotal", tongTien);
        model.addAttribute("orderTotal", tongTien);

        // Truyền lại danh sách ID này sang trang HTML để lát nữa POST xuống
        model.addAttribute("selectedIds", selectedIds);

        // Lấy danh sách địa chỉ
        List<DiaChi> diaChiList = diaChiService.getDiaChiByTaiKhoan(tk);
        model.addAttribute("diaChiList", diaChiList);

        // Địa chỉ mặc định
        Optional<DiaChi> defaultAddress = diaChiService.getDiaChiMacDinh(tk);
        if (defaultAddress.isPresent()) {
            model.addAttribute("defaultAddress", defaultAddress.get());
        }

        model.addAttribute("user", tk);

        // Breadcrumb
        Map<String, String> breadcrumb1 = new HashMap<>();
        breadcrumb1.put("name", "Giỏ hàng");
        breadcrumb1.put("url", "/giohang");
        Map<String, String> breadcrumb2 = new HashMap<>();
        breadcrumb2.put("name", "Thanh toán");
        breadcrumb2.put("url", null);
        model.addAttribute("breadcrumbItems", List.of(breadcrumb1, breadcrumb2));

        model.addAttribute("currentPage", "checkout");
        model.addAttribute("pageTitle", "Thanh toán - Cửa hàng đồ Tết");
        return "checkout";
    }
    

    /**
     * Xử lý đặt hàng
     */
    @PostMapping("/place-order")
    public String processCheckout(@RequestParam Integer diaChiId,
            @RequestParam(name = "paymentMethod", required = false, defaultValue = "1") Integer phuongThucId,
            @RequestParam(required = false) String ghiChu,
            @RequestParam(value = "selectedIds", required = false) List<Integer> selectedIds, // BẠN ĐANG THIẾU DÒNG NÀY NÈ!
            Principal principal,
            RedirectAttributes redirectAttributes) {

        try {
            if (principal == null) {
                return "redirect:/login";
            }

            TaiKhoan tk = taiKhoanService.findByEmail(principal.getName());
            if (tk == null) {
                return "redirect:/login";
            }
// Lấy TOÀN BỘ giỏ hàng
            List<GioHang> allItems = gioHangService.getGioHangByTaiKhoan(tk);
            
            // LỌC LẠI LẦN NỮA ĐỂ CHUẨN BỊ TẠO ĐƠN
            List<GioHang> checkoutItems = new ArrayList<>();
            if (selectedIds != null && !selectedIds.isEmpty()) {
                checkoutItems = allItems.stream()
                        .filter(item -> selectedIds.contains(item.getSanPham().getMaSP()))
                        .collect(Collectors.toList());
            } else {
                checkoutItems = allItems;
            }

            if (checkoutItems.isEmpty()) {
                redirectAttributes.addFlashAttribute("error", "Không có sản phẩm nào để đặt hàng!");
                return "redirect:/giohang";
            }

            // Tạo đơn hàng VỚI CÁC MÓN ĐÃ CHỌN THÔI
            DonHang donHang = donHangService.createDonHang(tk, diaChiId, phuongThucId, checkoutItems, ghiChu);

            if (donHang == null) {
                redirectAttributes.addFlashAttribute("error", "Đặt hàng thất bại!");
                return "redirect:/checkout";
            }
            /// Xóa giỏ hàng
            if (selectedIds == null || selectedIds.isEmpty() || checkoutItems.size() == allItems.size()) {
                // Nếu mua hết giỏ hàng thì xóa toàn bộ
                gioHangService.clearGioHang(tk);
            } else {
                // TODO: Báo team Backend viết thêm hàm xóa từng món thay vì xóa sạch (clearGioHang)
                // Ví dụ: gioHangService.xoaCacMonDaMua(tk, selectedIds);
            }

            redirectAttributes.addFlashAttribute("success", "Đặt hàng thành công!");
            return "redirect:/checkout/success?orderId=" + donHang.getMaDH();

        } catch (Exception e) {
            redirectAttributes.addFlashAttribute("error", "Lỗi: " + e.getMessage());
            return "redirect:/checkout";
        }
    }

    /**
     * Trang cảm ơn sau khi đặt hàng thành công
     */
    @GetMapping("/success")
    public String checkoutSuccess(@RequestParam Integer orderId, Model model, Principal principal) {

        if (principal == null) {
            return "redirect:/login";
        }

        TaiKhoan tk = taiKhoanService.findByEmail(principal.getName());
        if (tk == null) {
            return "redirect:/login";
        }

        // Lấy thông tin đơn hàng
        Optional<DonHang> donHangOpt = donHangService.findByIdAndKhachHang(orderId, tk);
        if (!donHangOpt.isPresent()) {
            return "redirect:/profile";
        }

        DonHang donHang = donHangOpt.get();
        model.addAttribute("donHang", donHang);

        // Lấy chi tiết đơn hàng
        List<DonHangChiTiet> chiTiet = donHangService.getChiTietDonHang(donHang);
        model.addAttribute("chiTiet", chiTiet);

        model.addAttribute("pageTitle", "Đặt hàng thành công");
        model.addAttribute("currentPage", "checkout-success");
        return "checkout-success";
    }
}
