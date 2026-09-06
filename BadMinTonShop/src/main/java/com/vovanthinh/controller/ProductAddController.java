package com.vovanthinh.controller;

import java.io.IOException;
import java.math.BigDecimal;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

import com.vovanthinh.model.Product;
import com.vovanthinh.service.CategoryService;
import com.vovanthinh.service.ProductService;
import com.vovanthinh.service.impl.CategoryServiceImpl;
import com.vovanthinh.service.impl.ProductServiceImpl;
import com.vovanthinh.util.FileUploadUtil;

@WebServlet("/admin/product/add")
@MultipartConfig(
        maxFileSize = 5 * 1024 * 1024,
        maxRequestSize = 6 * 1024 * 1024
)
public class ProductAddController extends HttpServlet {

    private final ProductService productService = new ProductServiceImpl();
    private final CategoryService categoryService = new CategoryServiceImpl();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setAttribute("categories", categoryService.getAll());
        request.getRequestDispatcher("/admin/product-add.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");

        try {
            Product product = new Product();
            product.setProductName(request.getParameter("productName"));
            product.setBrand(request.getParameter("brand"));
            product.setPrice(new BigDecimal(request.getParameter("price")));
            product.setQuantity(Integer.parseInt(request.getParameter("quantity")));
            product.setDescription(request.getParameter("description"));

            String categoryId = request.getParameter("categoryId");
            if (categoryId != null && !categoryId.isBlank()) {
                product.setCategory(categoryService.get(Integer.parseInt(categoryId)));
            }

            Part part = request.getPart("image");
            product.setImage(FileUploadUtil.saveImage(request.getServletContext(), part));

            productService.insert(product);
            response.sendRedirect(request.getContextPath() + "/admin/product/list");

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Không thể thêm sản phẩm: " + e.getMessage());
            request.setAttribute("categories", categoryService.getAll());
            request.getRequestDispatcher("/admin/product-add.jsp").forward(request, response);
        }
    }
}
