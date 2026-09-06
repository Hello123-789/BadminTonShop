package com.vovanthinh.controller;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import com.vovanthinh.service.ProductService;
import com.vovanthinh.service.impl.ProductServiceImpl;

@WebServlet("/product")
public class PublicProductController extends HttpServlet {

    private final ProductService productService = new ProductServiceImpl();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int page = 1;
        try {
            page = Integer.parseInt(request.getParameter("page"));
        } catch (Exception ignored) {
        }

        int pageSize = 6;
        long totalProducts = productService.countTotalProducts();
        int totalPages = (int) Math.ceil(totalProducts / (double) pageSize);

        if (totalPages > 0) {
            page = Math.min(Math.max(1, page), totalPages);
        }

        request.setAttribute("products", productService.getPaging(page, pageSize));
        request.setAttribute("currentPage", page);
        request.setAttribute("totalPages", totalPages);
        request.getRequestDispatcher("/product-list.jsp").forward(request, response);
    }
}
