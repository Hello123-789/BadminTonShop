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

@WebServlet("/admin/product/edit")
@MultipartConfig(
        maxFileSize = 5 * 1024 * 1024,
        maxRequestSize = 6 * 1024 * 1024
)
public class ProductEditController extends HttpServlet {

    private final ProductService productService = new ProductServiceImpl();
    private final CategoryService categoryService = new CategoryServiceImpl();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            int id = Integer.parseInt(request.getParameter("id"));
            Product product = productService.get(id);

            if (product == null) {
                response.sendError(HttpServletResponse.SC_NOT_FOUND);
                return;
            }

            request.setAttribute("product", product);
            request.setAttribute("categories", categoryService.getAll());
            request.getRequestDispatcher("/admin/product-edit.jsp").forward(request, response);

        } catch (Exception e) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");

        try {
            int id = Integer.parseInt(request.getParameter("productId"));
            Product product = productService.get(id);

            if (product == null) {
                response.sendError(HttpServletResponse.SC_NOT_FOUND);
                return;
            }

            product.setProductName(request.getParameter("productName"));
            product.setBrand(request.getParameter("brand"));
            product.setPrice(new BigDecimal(request.getParameter("price")));
            product.setQuantity(Integer.parseInt(request.getParameter("quantity")));
            product.setDescription(request.getParameter("description"));

            String categoryId = request.getParameter("categoryId");
            product.setCategory((categoryId == null || categoryId.isBlank()) ? null : categoryService.get(Integer.parseInt(categoryId)));

            Part part = request.getPart("image");
            if (part != null && part.getSize() > 0) {
                product.setImage(FileUploadUtil.saveImage(request.getServletContext(), part));
            }

            productService.update(product);
            response.sendRedirect(request.getContextPath() + "/admin/product/list");

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Không thể cập nhật sản phẩm: " + e.getMessage());
            request.setAttribute("categories", categoryService.getAll());
            request.getRequestDispatcher("/admin/product-edit.jsp").forward(request, response);
        }
    }
}
