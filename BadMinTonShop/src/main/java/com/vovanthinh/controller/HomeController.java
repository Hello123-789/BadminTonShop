package com.vovanthinh.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import com.vovanthinh.model.Product;
import com.vovanthinh.service.ProductService;
import com.vovanthinh.service.impl.ProductServiceImpl;

@WebServlet("/home")
public class HomeController extends HttpServlet {

    private final ProductService productService = new ProductServiceImpl();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String brand = request.getParameter("brand");
        String keyword = request.getParameter("keyword");
        List<Product> products;

        if (keyword != null && !keyword.isBlank()) {
            products = productService.search(keyword);
        } else if (brand != null && !brand.isBlank()) {
            products = new ArrayList<>();
            for (Product p : productService.getAll()) {
                if (brand.equalsIgnoreCase(p.getBrand())) {
                    products.add(p);
                }
            }
        } else {
            products = productService.getTop10Newest();
        }

        request.setAttribute("products", products);
        request.setAttribute("selectedBrand", brand);
        request.setAttribute("keyword", keyword);
        request.getRequestDispatcher("/index.jsp").forward(request, response);
    }
}
