package com.vovanthinh.controller;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import com.vovanthinh.model.Category;
import com.vovanthinh.service.CategoryService;
import com.vovanthinh.service.impl.CategoryServiceImpl;
@WebServlet("/admin/category/list")
public class CategoryController extends HttpServlet {
 private final CategoryService service=new CategoryServiceImpl();
 protected void doGet(HttpServletRequest req,HttpServletResponse resp)throws ServletException,IOException{req.setAttribute("categories",service.getAll());req.getRequestDispatcher("/admin/category.jsp").forward(req,resp);}
 protected void doPost(HttpServletRequest req,HttpServletResponse resp)throws IOException{req.setCharacterEncoding("UTF-8");String name=req.getParameter("cateName");if(name!=null&&!name.isBlank()){Category c=new Category();c.setCateName(name.trim());c.setIcons(req.getParameter("icons"));service.insert(c);}resp.sendRedirect(req.getContextPath()+"/admin/category/list");}
}
