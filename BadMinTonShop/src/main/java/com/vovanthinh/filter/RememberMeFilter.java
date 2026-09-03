package com.vovanthinh.filter;

import java.io.IOException;
import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import com.vovanthinh.model.User;
import com.vovanthinh.service.UserService;
import com.vovanthinh.service.impl.UserServiceImpl;

@WebFilter("/*")
public class RememberMeFilter implements Filter {
    private final UserService service = new UserServiceImpl();

    @Override
    public void doFilter(jakarta.servlet.ServletRequest req, jakarta.servlet.ServletResponse res, FilterChain chain)
            throws IOException, ServletException {
        HttpServletRequest request = (HttpServletRequest) req;
        HttpServletResponse response = (HttpServletResponse) res;
        HttpSession session = request.getSession(false);

        if (session == null || session.getAttribute("authUser") == null) {
            String token = getCookie(request, "remember_token");
            if (token != null) {
                User user = service.findByRememberToken(token);
                if (user != null) {
                    session = request.getSession(true);
                    session.setAttribute("authUser", user);
                    session.setMaxInactiveInterval(30 * 60);
                }
            }
        }
        chain.doFilter(request, response);
    }

    private String getCookie(HttpServletRequest request, String name) {
        Cookie[] cookies = request.getCookies();
        if (cookies == null) return null;
        for (Cookie c : cookies) if (name.equals(c.getName())) return c.getValue();
        return null;
    }
}
