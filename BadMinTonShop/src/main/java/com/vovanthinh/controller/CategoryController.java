package com.vovanthinh.controller;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import com.vovanthinh.model.Category;
import com.vovanthinh.service.CategoryService;
import com.vovanthinh.service.impl.CategoryServiceImpl;

@WebServlet("/admin/category/list")
public class CategoryController extends HttpServlet {

    private final CategoryService service = new CategoryServiceImpl();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setAttribute("categories", service.getAll());
        request.getRequestDispatcher("/admin/category.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws IOException {
        request.setCharacterEncoding("UTF-8");
        String name = request.getParameter("cateName");

        if (name != null && !name.isBlank()) {
            Category category = new Category();
            category.setCateName(name.trim());
            category.setIcons(request.getParameter("icons"));
            service.insert(category);
        }

        response.sendRedirect(request.getContextPath() + "/admin/category/list");
    }
}
