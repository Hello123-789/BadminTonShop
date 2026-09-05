package com.vovanthinh.controller;
import java.io.IOException;
import jakarta.servlet.*;import jakarta.servlet.annotation.WebServlet;import jakarta.servlet.http.*;
import com.vovanthinh.service.UserService;import com.vovanthinh.service.impl.UserServiceImpl;
@WebServlet("/register") public class RegisterController extends HttpServlet {
 private final UserService service=new UserServiceImpl();
 protected void doGet(HttpServletRequest r,HttpServletResponse s)throws ServletException,IOException{r.getRequestDispatcher("/register.jsp").forward(r,s);}
 protected void doPost(HttpServletRequest r,HttpServletResponse s)throws ServletException,IOException{r.setCharacterEncoding("UTF-8");String u=r.getParameter("username"),email=r.getParameter("email"),f=r.getParameter("fullName"),p=r.getParameter("password"),c=r.getParameter("confirmPassword");
  if(p==null||!p.equals(c)||p.length()<6){r.setAttribute("error",p==null||p.length()<6?"Mật khẩu phải có ít nhất 6 ký tự.":"Mật khẩu xác nhận không khớp.");r.getRequestDispatcher("/register.jsp").forward(r,s);return;}
  try{if(!service.registerWithEmail(u,email,p,f)){r.setAttribute("error","Tên đăng nhập/email đã tồn tại hoặc chưa cấu hình gửi email OTP.");r.getRequestDispatcher("/register.jsp").forward(r,s);return;}r.getSession().setAttribute("verifyUsername",u.trim());s.sendRedirect(r.getContextPath()+"/verify-otp");}catch(RuntimeException e){e.printStackTrace();r.setAttribute("error","Không thể đăng ký tài khoản.");r.getRequestDispatcher("/register.jsp").forward(r,s);}
 }
}
