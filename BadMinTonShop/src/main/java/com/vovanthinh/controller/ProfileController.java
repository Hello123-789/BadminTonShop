package com.vovanthinh.controller;

import com.vovanthinh.model.User;
import com.vovanthinh.service.UserService;
import com.vovanthinh.service.impl.UserServiceImpl;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet("/profile")
public class ProfileController extends HttpServlet {

    private UserService userService;

    @Override
    public void init() {
        userService = new UserServiceImpl();
    }

    @Override
    protected void doGet(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        if (session == null || session.getAttribute("authUser") == null) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        User user = (User) session.getAttribute("authUser");

        request.setAttribute("user", user);

        request.getRequestDispatcher("/WEB-INF/views/profile.jsp")
                .forward(request, response);
    }

    @Override
    protected void doPost(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        if (session == null || session.getAttribute("authUser") == null) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        User user = (User) session.getAttribute("authUser");

        String fullName = request.getParameter("fullName");
        String phone = request.getParameter("phone");

        boolean success = userService.updateProfile(
                user.getUserId(),
                fullName,
                phone,
                null
        );

        if (success) {
            user.setFullName(fullName);
            user.setPhone(phone);

            session.setAttribute("authUser", user);

            response.sendRedirect(
                    request.getContextPath() + "/profile?success=1"
            );
        } else {
            request.setAttribute("error", "Cập nhật thông tin thất bại.");
            request.setAttribute("user", user);

            request.getRequestDispatcher("/WEB-INF/views/profile.jsp")
                    .forward(request, response);
        }
    }
}