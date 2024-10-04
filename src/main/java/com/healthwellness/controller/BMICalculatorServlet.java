package com.healthwellness.controller;

import com.healthwellness.util.BMICalculator;
import com.healthwellness.model.User;
import com.healthwellness.dao.DBConnection;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

@WebServlet("/bmiCalculator")
public class BMICalculatorServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            double weight = Double.parseDouble(request.getParameter("weight"));
            double height = Double.parseDouble(request.getParameter("height"));

            double bmi = BMICalculator.calculateBMI(weight, height);
            String category = BMICalculator.getBMICategory(bmi);

            String bmiResult = String.format("Your BMI is %.2f, which is classified as %s.", bmi, category);

            // Retrieve diet recommendations from the database
            String recommendation = getRecommendation(bmi);

            request.setAttribute("bmiResult", bmiResult);
            request.setAttribute("recommendation", recommendation);
            request.getRequestDispatcher("diet.jsp").forward(request, response);
        } catch ( IllegalArgumentException e) {
            response.sendRedirect("diet.jsp?error=Invalid input. Please enter valid numbers.");
        }
    }

    private String getRecommendation(double bmi) {
        String recommendation = "No recommendation available.";
        try (Connection conn = DBConnection.getConnection()) {
            String query = "SELECT recommendation FROM diet_recommendations WHERE (? BETWEEN min_bmi AND IFNULL(max_bmi, ?))";
            try (PreparedStatement stmt = conn.prepareStatement(query)) {
                stmt.setDouble(1, bmi);
                stmt.setDouble(2, bmi);
                try (ResultSet rs = stmt.executeQuery()) {
                    if (rs.next()) {
                        recommendation = rs.getString("recommendation");
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace(); // Handle the exception properly in a real application
        }
        return recommendation;
    }
}
