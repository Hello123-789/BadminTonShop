package com.vovanthinh.controller;

import java.io.IOException;
import java.util.*;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import com.vovanthinh.model.CartItem;
import com.vovanthinh.model.Product;
import com.vovanthinh.service.ProductService;
import com.vovanthinh.service.impl.ProductServiceImpl;

@WebServlet("/cart")
public class CartController extends HttpServlet {

    private final ProductService ps = new ProductServiceImpl();

    @SuppressWarnings("unchecked")
    private List<CartItem> getCart(HttpSession session) {
        List<CartItem> cart = (List<CartItem>) session.getAttribute("cart");
        if (cart == null) {
            cart = new ArrayList<>();
            session.setAttribute("cart", cart);
        }
        return cart;
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("/cart.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws IOException {
        String action = request.getParameter("action");
        List<CartItem> cart = getCart(request.getSession());
        int id = Integer.parseInt(request.getParameter("id"));

        if ("add".equals(action)) {
            Product p = ps.get(id);
            boolean found = false;
            for (CartItem item : cart) {
                if (item.getProduct().getProductId() == id) {
                    item.setQuantity(item.getQuantity() + 1);
                    found = true;
                    break;
                }
            }
            if (!found) {
                cart.add(new CartItem(p, 1));
            }
        } else if ("remove".equals(action)) {
            cart.removeIf(item -> item.getProduct().getProductId() == id);
        } else if ("update".equals(action)) {
            int qty = Integer.parseInt(request.getParameter("quantity"));
            for (CartItem item : cart) {
                if (item.getProduct().getProductId() == id) {
                    item.setQuantity(Math.max(1, qty));
                }
            }
        }

        response.sendRedirect(request.getContextPath() + "/cart");
    }
}
