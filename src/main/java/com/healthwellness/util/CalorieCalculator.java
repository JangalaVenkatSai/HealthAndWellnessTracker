package com.healthwellness.util;

public class CalorieCalculator {

    public static double calculateCalories(String activityType, double duration) {
        double caloriesPerMinute = 0;
        switch (activityType) {
            case "Walking":
                caloriesPerMinute = 4.5;
                break;
            case "Swimming":
                caloriesPerMinute = 7.0;
                break;
            case "Running":
                caloriesPerMinute = 10.0;
                break;
            case "Cycling":
                caloriesPerMinute = 6.0;
                break;
            default:
                caloriesPerMinute = 0;
        }
        return caloriesPerMinute * duration;
    }
}
