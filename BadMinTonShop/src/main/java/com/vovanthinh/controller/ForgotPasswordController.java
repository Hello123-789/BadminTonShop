package com.vovanthinh.controller;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import com.vovanthinh.service.UserService;
import com.vovanthinh.service.impl.UserServiceImpl;

@WebServlet("/forgot-password")
public class ForgotPasswordController extends HttpServlet {

    private final UserService service = new UserServiceImpl();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        req.getRequestDispatcher("/forgot-password.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        req.setCharacterEncoding("UTF-8");

        String username = req.getParameter("username");
        String fullName = req.getParameter("fullName");
        String password = req.getParameter("newPassword");
        String confirm = req.getParameter("confirmPassword");

        if (password == null || !password.equals(confirm)) {
            req.setAttribute("error", "Mật khẩu xác nhận không khớp.");
            req.getRequestDispatcher("/forgot-password.jsp").forward(req, resp);
            return;
        }

        if (password.length() < 6) {
            req.setAttribute("error", "Mật khẩu mới phải có ít nhất 6 ký tự.");
            req.getRequestDispatcher("/forgot-password.jsp").forward(req, resp);
            return;
        }

        boolean reset = service.resetPassword(username, fullName, password);

        if (reset) {
            resp.sendRedirect(req.getContextPath() + "/login?reset=1");
            return;
        }

        req.setAttribute(
                "error",
                "Không tìm thấy tài khoản phù hợp với tên đăng nhập và họ tên."
        );
        req.getRequestDispatcher("/forgot-password.jsp").forward(req, resp);
    }
}
