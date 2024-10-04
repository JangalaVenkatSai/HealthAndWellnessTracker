package com.healthwellness.controller;

import com.healthwellness.model.User;
import com.healthwellness.service.UserService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/register")
public class RegisterController extends HttpServlet {
    private UserService userService = new UserService();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String email = request.getParameter("email");

        User user = new User();
        user.setUsername(username);
        user.setPassword(password);
        user.setEmail(email);

        if (userService.registerUser(user)) {
            response.sendRedirect("login.jsp");
        } else {
            response.sendRedirect("register.jsp?error=Registration failed");
        }
    }
}
