package com.vovanthinh.controller;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import com.vovanthinh.service.UserService;
import com.vovanthinh.service.impl.UserServiceImpl;

@WebServlet("/forgot-password")
public class ForgotPasswordController extends HttpServlet {

    private final UserService service = new UserServiceImpl();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("/forgot-password.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        HttpSession session = request.getSession();

        String value = request.getParameter("usernameOrEmail");
        String otp = request.getParameter("otp");
        String newPassword = request.getParameter("newPassword");
        String confirmPassword = request.getParameter("confirmPassword");

        // Phase 1: Request OTP
        if (otp == null || otp.isBlank()) {
            if (value == null || value.isBlank()) {
                request.setAttribute("error", "Vui lòng nhập tên đăng nhập hoặc email.");
                request.getRequestDispatcher("/forgot-password.jsp").forward(request, response);
                return;
            }

            if (!service.sendForgotPasswordOtp(value)) {
                request.setAttribute("error", "Không tìm thấy tài khoản hoặc hệ thống gửi OTP gặp sự cố.");
                request.getRequestDispatcher("/forgot-password.jsp").forward(request, response);
                return;
            }

            session.setAttribute("forgotValue", value.trim());
            request.setAttribute("verifyMode", true);
            request.getRequestDispatcher("/forgot-password.jsp").forward(request, response);
            return;
        }

        // Phase 2: Verify OTP & Reset Password
        request.setAttribute("verifyMode", true);
        String savedValue = (String) session.getAttribute("forgotValue");

        if (otp == null || !otp.matches("^[0-9]{6}$")) {
            request.setAttribute("error", "Mã OTP phải gồm chính xác 6 chữ số.");
            request.getRequestDispatcher("/forgot-password.jsp").forward(request, response);
            return;
        }

        if (newPassword == null || newPassword.length() < 6) {
            request.setAttribute("error", "Mật khẩu mới phải có ít nhất 6 ký tự.");
            request.getRequestDispatcher("/forgot-password.jsp").forward(request, response);
            return;
        }

        if (!newPassword.equals(confirmPassword)) {
            request.setAttribute("error", "Mật khẩu xác nhận không khớp.");
            request.getRequestDispatcher("/forgot-password.jsp").forward(request, response);
            return;
        }

        if (savedValue == null || !service.resetPasswordWithOtp(savedValue, otp, newPassword)) {
            request.setAttribute("error", "Mã OTP không đúng hoặc đã hết hạn.");
            request.getRequestDispatcher("/forgot-password.jsp").forward(request, response);
            return;
        }

        session.removeAttribute("forgotValue");
        response.sendRedirect(request.getContextPath() + "/login?reset=1");
    }
}
