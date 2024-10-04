package com.healthwellness.controller;

import com.healthwellness.util.CalorieCalculator;
import com.healthwellness.model.Activity;
import com.healthwellness.dao.DBConnection;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/activityTracker")
public class ActivityTrackerServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        Integer userId = (Integer) session.getAttribute("userId");
        if (userId == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        String activityType = request.getParameter("activityType");
        double duration = Double.parseDouble(request.getParameter("duration"));
        double caloriesBurned = CalorieCalculator.calculateCalories(activityType, duration);

        try (Connection conn = DBConnection.getConnection()) {
            String insertQuery = "INSERT INTO activity_tracker (user_id, activity_type, duration, calories_burned) VALUES (?, ?, ?, ?)";
            try (PreparedStatement stmt = conn.prepareStatement(insertQuery)) {
                stmt.setInt(1, userId);
                stmt.setString(2, activityType);
                stmt.setDouble(3, duration);
                stmt.setDouble(4, caloriesBurned);
                stmt.executeUpdate();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        // Fetch activities and set them as request attribute
        List<Activity> activities = getUserActivities(userId);
        request.setAttribute("activities", activities);
        
        // Forward to JSP
        request.getRequestDispatcher("activityTracker.jsp").forward(request, response);
    }

    private List<Activity> getUserActivities(int userId) {
        List<Activity> activities = new ArrayList<>();
        try (Connection conn = DBConnection.getConnection()) {
            String selectQuery = "SELECT activity_type, duration, calories_burned FROM activity_tracker WHERE user_id = ?";
            try (PreparedStatement stmt = conn.prepareStatement(selectQuery)) {
                stmt.setInt(1, userId);
                try (ResultSet rs = stmt.executeQuery()) {
                    while (rs.next()) {
                        String activityType = rs.getString("activity_type");
                        double duration = rs.getDouble("duration");
                        double caloriesBurned = rs.getDouble("calories_burned");
                        activities.add(new Activity(activityType, duration, caloriesBurned));
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return activities;
    }
}
