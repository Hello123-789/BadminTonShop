package com.vovanthinh.controller;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import com.vovanthinh.service.UserService;
import com.vovanthinh.service.impl.UserServiceImpl;

@WebServlet("/verify-otp")
public class VerifyOtpController extends HttpServlet {

    private final UserService service = new UserServiceImpl();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        if (request.getSession().getAttribute("verifyUsername") == null) {
            response.sendRedirect(request.getContextPath() + "/register");
            return;
        }
        request.getRequestDispatcher("/verify-otp.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");

        String username = (String) request.getSession().getAttribute("verifyUsername");
        String otp = request.getParameter("otp");

        // Server-side validation for OTP
        if (otp == null || !otp.matches("^[0-9]{6}$")) {
            request.setAttribute("error", "Mã OTP phải gồm chính xác 6 chữ số.");
            request.getRequestDispatcher("/verify-otp.jsp").forward(request, response);
            return;
        }

        if (service.verifyOtp(username, otp)) {
            request.getSession().removeAttribute("verifyUsername");
            response.sendRedirect(request.getContextPath() + "/login?verified=1");
        } else {
            request.setAttribute("error", "Mã OTP không đúng hoặc đã hết hạn (chỉ có hiệu lực trong 5 phút).");
            request.getRequestDispatcher("/verify-otp.jsp").forward(request, response);
        }
    }
}
