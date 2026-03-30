package com.example.projectend.service;

import jakarta.mail.MessagingException;
import jakarta.mail.internet.MimeMessage;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

/**
 * Service xử lý việc gửi email
 */
@Service
public class EmailService {

    @Autowired
    private JavaMailSender mailSender;

    @Value("${spring.mail.username}")
    private String fromEmail;

    /**
     * Gửi email đặt lại mật khẩu
     * @param toEmail Email người nhận
     * @param newPassword Mật khẩu mới
     * @param hoTen Tên người dùng
     * @return true nếu gửi thành công, false nếu thất bại
     */
    public boolean sendPasswordResetEmail(String toEmail, String newPassword, String hoTen) {
        try {
            MimeMessage message = mailSender.createMimeMessage();
            MimeMessageHelper helper = new MimeMessageHelper(message, true, "UTF-8");

            helper.setFrom(fromEmail);
            helper.setTo(toEmail);
            helper.setSubject("🔑 Đặt lại mật khẩu - Tiệm Bánh");

            String htmlContent = buildPasswordResetEmailContent(hoTen, newPassword);
            helper.setText(htmlContent, true);

            mailSender.send(message);
            return true;
        } catch (MessagingException e) {
            System.err.println("Lỗi gửi email: " + e.getMessage());
            return false;
        }
    }

    /**
     * Xây dựng nội dung email đặt lại mật khẩu
     */
    private String buildPasswordResetEmailContent(String hoTen, String newPassword) {
        String html = """
            <!DOCTYPE html>
            <html>
            <head>
                <meta charset="UTF-8">
                <style>
                    body { font-family: Arial, sans-serif; background-color: #FDF6E3; margin: 0; padding: 20px; }
                    .container { max-width: 500px; margin: 0 auto; background: #fff; border-radius: 16px; overflow: hidden; box-shadow: 0 4px 20px rgba(0,0,0,0.1); }
                    .header { background: linear-gradient(135deg, #4A2E1A 0%, #6B3E26 100%); padding: 30px; text-align: center; }
                    .header h1 { color: #FDF6E3; margin: 0; font-size: 24px; }
                    .header p { color: #EDD99A; margin: 5px 0 0; font-size: 14px; }
                    .content { padding: 30px; }
                    .content h2 { color: #4A2E1A; margin-top: 0; }
                    .content p { color: #3D2010; line-height: 1.6; }
                    .password-box { background: #FDF6E3; border: 2px dashed #C9974C; border-radius: 12px; padding: 20px; text-align: center; margin: 20px 0; }
                    .password { font-size: 28px; font-weight: bold; color: #A0522D; letter-spacing: 3px; font-family: monospace; }
                    .warning { background: #FFF3CD; border-left: 4px solid #C9974C; padding: 15px; border-radius: 8px; margin-top: 20px; }
                    .warning p { margin: 0; font-size: 13px; color: #856404; }
                    .footer { background: #F5E9C8; padding: 20px; text-align: center; font-size: 12px; color: #8C6A52; }
                </style>
            </head>
            <body>
                <div class="container">
                    <div class="header">
                        <h1>🍰 Tiệm Bánh</h1>
                        <p>Yêu cầu đặt lại mật khẩu</p>
                    </div>
                    <div class="content">
                        <h2>Xin chào, REPLACE_NAME!</h2>
                        <p>Chúng tôi đã nhận được yêu cầu đặt lại mật khẩu cho tài khoản của bạn.</p>
                        <p>Dưới đây là mật khẩu mới của bạn:</p>
                        <div class="password-box">
                            <p class="password">REPLACE_PASSWORD</p>
                        </div>
                        <div class="warning">
                            <p><strong>⚠️ Lưu ý bảo mật:</strong></p>
                            <p>• Vui lòng đăng nhập và đổi mật khẩu ngay sau khi nhận được email này.<br>
                            • Không chia sẻ mật khẩu này cho bất kỳ ai.<br>
                            • Nếu bạn không yêu cầu đặt lại mật khẩu, vui lòng bỏ qua email này.</p>
                        </div>
                    </div>
                    <div class="footer">
                        <p>Email này được gửi tự động từ Tiệm Bánh.<br>
                        Vui lòng không trả lời email này.</p>
                    </div>
                </div>
            </body>
            </html>
            """;
        
        html = html.replace("REPLACE_NAME", hoTen);
        html = html.replace("REPLACE_PASSWORD", newPassword);
        return html;
    }
}
