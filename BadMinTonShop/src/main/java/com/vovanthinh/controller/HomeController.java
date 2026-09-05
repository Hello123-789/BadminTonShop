package com.vovanthinh.controller;
import java.io.IOException;
import java.util.*;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import com.vovanthinh.model.Product;
import com.vovanthinh.service.ProductService;
import com.vovanthinh.service.impl.ProductServiceImpl;
@WebServlet("/home") public class HomeController extends HttpServlet {
 private final ProductService ps=new ProductServiceImpl();
 protected void doGet(HttpServletRequest request,HttpServletResponse response)throws ServletException,IOException{String brand=request.getParameter("brand"),keyword=request.getParameter("keyword");List<Product> products;if(keyword!=null&&!keyword.isBlank())products=ps.search(keyword);else if(brand!=null&&!brand.isBlank()){products=new ArrayList<>();for(Product p:ps.getAll())if(brand.equalsIgnoreCase(p.getBrand()))products.add(p);}else products=ps.getTop10Newest();request.setAttribute("products",products);request.setAttribute("selectedBrand",brand);request.setAttribute("keyword",keyword);request.getRequestDispatcher("/index.jsp").forward(request,response);}
}
