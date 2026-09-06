package com.vovanthinh.controller;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import com.vovanthinh.service.UserService;
import com.vovanthinh.service.impl.UserServiceImpl;

@WebServlet("/register")
public class RegisterController extends HttpServlet {

    private final UserService service = new UserServiceImpl();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("/register.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");

        String username = request.getParameter("username");
        String email = request.getParameter("email");
        String fullName = request.getParameter("fullName");
        String password = request.getParameter("password");
        String confirmPassword = request.getParameter("confirmPassword");

        // Server-side validation
        if (fullName == null || fullName.isBlank()) {
            request.setAttribute("error", "Vui lòng nhập họ và tên.");
            request.getRequestDispatcher("/register.jsp").forward(request, response);
            return;
        }

        if (email == null || !email.matches("^[A-Za-z0-9+_.-]+@(.+)$")) {
            request.setAttribute("error", "Địa chỉ email không đúng định dạng.");
            request.getRequestDispatcher("/register.jsp").forward(request, response);
            return;
        }

        if (username == null || username.trim().length() < 3) {
            request.setAttribute("error", "Tên đăng nhập phải có ít nhất 3 ký tự.");
            request.getRequestDispatcher("/register.jsp").forward(request, response);
            return;
        }

        if (password == null || password.length() < 6) {
            request.setAttribute("error", "Mật khẩu phải có ít nhất 6 ký tự.");
            request.getRequestDispatcher("/register.jsp").forward(request, response);
            return;
        }

        if (!password.equals(confirmPassword)) {
            request.setAttribute("error", "Mật khẩu xác nhận không khớp.");
            request.getRequestDispatcher("/register.jsp").forward(request, response);
            return;
        }

        try {
            if (!service.registerWithEmail(username, email, password, fullName)) {
                request.setAttribute("error", "Tên đăng nhập hoặc email đã được sử dụng.");
                request.getRequestDispatcher("/register.jsp").forward(request, response);
                return;
            }

            request.getSession().setAttribute("verifyUsername", username.trim());
            response.sendRedirect(request.getContextPath() + "/verify-otp");

        } catch (RuntimeException e) {
            e.printStackTrace();
            request.setAttribute("error", "Có lỗi xảy ra trong quá trình đăng ký.");
            request.getRequestDispatcher("/register.jsp").forward(request, response);
        }
    }
}
