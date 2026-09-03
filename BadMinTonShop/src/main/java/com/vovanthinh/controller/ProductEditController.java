package com.vovanthinh.controller;

import java.io.IOException;
import java.math.BigDecimal;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import com.vovanthinh.model.Product;
import com.vovanthinh.service.ProductService;
import com.vovanthinh.service.impl.ProductServiceImpl;
import com.vovanthinh.util.FileUploadUtil;

@WebServlet("/admin/product/edit")
@MultipartConfig(
        maxFileSize = 5 * 1024 * 1024,
        maxRequestSize = 6 * 1024 * 1024
)
public class ProductEditController extends HttpServlet {

    private final ProductService ps = new ProductServiceImpl();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int id = Integer.parseInt(request.getParameter("id"));
        request.setAttribute("product", ps.get(id));
        request.getRequestDispatcher("/admin/product-edit.jsp")
                .forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");
        int id = Integer.parseInt(request.getParameter("productId"));

        try {
            Product old = ps.get(id);
            Product product = new Product();

            product.setProductId(id);
            product.setProductName(request.getParameter("productName"));
            product.setBrand(request.getParameter("brand"));
            product.setPrice(new BigDecimal(request.getParameter("price")));
            product.setQuantity(
                    Integer.parseInt(request.getParameter("quantity"))
            );
            product.setDescription(request.getParameter("description"));

            String image = FileUploadUtil.saveImage(
                    getServletContext(),
                    request.getPart("image")
            );

            product.setImage(image != null ? image : old.getImage());
            ps.update(product);

            response.sendRedirect(
                    request.getContextPath() + "/admin/product/list"
            );
        } catch (Exception e) {
            request.setAttribute("error", e.getMessage());
            request.setAttribute("product", ps.get(id));
            request.getRequestDispatcher("/admin/product-edit.jsp")
                    .forward(request, response);
        }
    }
}
