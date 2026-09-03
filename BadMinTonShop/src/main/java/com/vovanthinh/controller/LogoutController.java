package com.vovanthinh.controller;

import java.io.IOException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import com.vovanthinh.model.User;
import com.vovanthinh.service.UserService;
import com.vovanthinh.service.impl.UserServiceImpl;

@WebServlet("/logout")
public class LogoutController extends HttpServlet {
    private final UserService service = new UserServiceImpl();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        HttpSession session = request.getSession(false);
        if (session != null) {
            User user = (User) session.getAttribute("authUser");
            if (user != null) service.clearRememberToken(user.getUserId());
            session.invalidate();
        }
        Cookie cookie = new Cookie("remember_token", "");
        cookie.setMaxAge(0);
        cookie.setPath(request.getContextPath().isEmpty() ? "/" : request.getContextPath());
        cookie.setHttpOnly(true);
        response.addCookie(cookie);
        response.sendRedirect(request.getContextPath() + "/home");
    }
}
