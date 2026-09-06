package com.vovanthinh.controller;

import java.io.IOException;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import com.vovanthinh.model.Category;
import com.vovanthinh.model.Product;
import com.vovanthinh.service.CategoryService;
import com.vovanthinh.service.ProductService;
import com.vovanthinh.service.impl.CategoryServiceImpl;
import com.vovanthinh.service.impl.ProductServiceImpl;

@WebServlet({"/product", "/products"})
public class PublicProductController extends HttpServlet {

    private final ProductService productService = new ProductServiceImpl();
    private final CategoryService categoryService = new CategoryServiceImpl();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int page = 1;
        try {
            page = Integer.parseInt(request.getParameter("page"));
        } catch (Exception ignored) {
        }

        Integer categoryId = null;
        try {
            String cateParam = request.getParameter("categoryId");
            if (cateParam != null && !cateParam.isBlank()) {
                categoryId = Integer.parseInt(cateParam);
            }
        } catch (Exception ignored) {
        }

        String brand = request.getParameter("brand");
        String keyword = request.getParameter("keyword");

        int pageSize = 6;
        long totalFiltered = productService.countTotalFiltered(categoryId, brand, keyword);
        int totalPages = (int) Math.ceil(totalFiltered / (double) pageSize);

        if (totalPages > 0) {
            page = Math.min(Math.max(1, page), totalPages);
        }

        List<Product> products = productService.getPagingFiltered(categoryId, brand, keyword, page, pageSize);
        List<Category> categories = categoryService.getAll();

        request.setAttribute("products", products);
        request.setAttribute("categories", categories);
        request.setAttribute("selectedCategoryId", categoryId);
        request.setAttribute("selectedBrand", brand);
        request.setAttribute("keyword", keyword);
        request.setAttribute("currentPage", page);
        request.setAttribute("totalPages", totalPages);
        request.setAttribute("totalProducts", totalFiltered);

        request.getRequestDispatcher("/product-list.jsp").forward(request, response);
    }
}
