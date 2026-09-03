package com.vovanthinh.controller;

import java.io.IOException;
import java.math.BigDecimal;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import com.vovanthinh.model.Product;
import com.vovanthinh.service.ProductService;
import com.vovanthinh.service.impl.ProductServiceImpl;
import com.vovanthinh.util.FileUploadUtil;

@WebServlet("/admin/product/add")
@MultipartConfig(maxFileSize = 5 * 1024 * 1024, maxRequestSize = 6 * 1024 * 1024)
public class ProductAddController extends HttpServlet {
    private final ProductService ps = new ProductServiceImpl();
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/admin/product-add.jsp").forward(request, response);
    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        try {
            Product p = new Product();
            p.setProductName(request.getParameter("productName")); p.setBrand(request.getParameter("brand"));
            p.setPrice(new BigDecimal(request.getParameter("price"))); p.setQuantity(Integer.parseInt(request.getParameter("quantity")));
            p.setDescription(request.getParameter("description"));
            p.setImage(FileUploadUtil.saveImage(getServletContext(), request.getPart("image")));
            ps.insert(p); response.sendRedirect(request.getContextPath() + "/admin/product/list");
        } catch (Exception e) { request.setAttribute("error", e.getMessage()); request.getRequestDispatcher("/admin/product-add.jsp").forward(request, response); }
    }
}
