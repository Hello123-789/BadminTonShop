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
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        req.getRequestDispatcher("/register.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        req.setCharacterEncoding("UTF-8");

        String username = req.getParameter("username");
        String fullName = req.getParameter("fullName");
        String password = req.getParameter("password");
        String confirm = req.getParameter("confirmPassword");

        if (password == null || !password.equals(confirm)) {
            req.setAttribute("error", "Mật khẩu xác nhận không khớp.");
            req.getRequestDispatcher("/register.jsp").forward(req, resp);
            return;
        }

        if (password.length() < 6) {
            req.setAttribute("error", "Mật khẩu phải có ít nhất 6 ký tự.");
            req.getRequestDispatcher("/register.jsp").forward(req, resp);
            return;
        }

        try {
            boolean registered = service.register(username, password, fullName);

            if (!registered) {
                req.setAttribute(
                        "error",
                        "Tên đăng nhập đã tồn tại hoặc dữ liệu không hợp lệ."
                );
                req.getRequestDispatcher("/register.jsp").forward(req, resp);
                return;
            }

            resp.sendRedirect(req.getContextPath() + "/login?registered=1");
        } catch (RuntimeException e) {
            req.setAttribute("error", "Không thể đăng ký tài khoản.");
            req.getRequestDispatcher("/register.jsp").forward(req, resp);
        }
    }
}
