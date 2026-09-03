package com.vovanthinh.controller;

import java.io.IOException;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import com.vovanthinh.service.ProductService;
import com.vovanthinh.service.impl.ProductServiceImpl;

@WebServlet("/admin/product/list")
public class ProductController extends HttpServlet {

    private final ProductService service = new ProductServiceImpl();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String keyword = request.getParameter("keyword");
        request.setAttribute("keyword", keyword);
        request.setAttribute("products", (keyword == null || keyword.isBlank()) ? service.getAll() : service.search(keyword));
        request.getRequestDispatcher("/admin/product.jsp").forward(request, response);
    }
}
