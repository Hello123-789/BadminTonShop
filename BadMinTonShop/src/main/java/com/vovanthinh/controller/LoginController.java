package com.vovanthinh.controller;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import com.vovanthinh.model.User;
import com.vovanthinh.service.UserService;
import com.vovanthinh.service.impl.UserServiceImpl;

@WebServlet("/login")
public class LoginController extends HttpServlet {
    private final UserService service = new UserServiceImpl();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/login.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String remember = request.getParameter("remember");

        User user = service.authenticate(username, password);
        if (user == null) {
            request.setAttribute("error", "Tên đăng nhập hoặc mật khẩu không đúng.");
            request.getRequestDispatcher("/login.jsp").forward(request, response);
            return;
        }

        HttpSession session = request.getSession(true);
        session.setAttribute("authUser", user);
        session.setMaxInactiveInterval(30 * 60);

        if ("on".equals(remember)) {
            String token = service.createRememberToken(user);
            Cookie cookie = new Cookie("remember_token", token);
            cookie.setHttpOnly(true);
            cookie.setMaxAge(30 * 24 * 60 * 60);
            cookie.setPath(request.getContextPath().isEmpty() ? "/" : request.getContextPath());
            response.addCookie(cookie);
        }

        String redirect = request.getContextPath() + ("ADMIN".equals(user.getRole()) ? "/admin/product/list" : "/home");
        response.sendRedirect(redirect);
    }
}
