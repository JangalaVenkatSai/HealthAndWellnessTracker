package com.healthwellness.model;

public class Activity {
    private String activityType;
    private double duration; // Duration in minutes
    private double caloriesBurned;

    // Constructor
    public Activity(String activityType, double duration, double caloriesBurned) {
        this.activityType = activityType;
        this.duration = duration;
        this.caloriesBurned = caloriesBurned;
    }

    // Getters and Setters
    public String getActivityType() {
        return activityType;
    }

    public void setActivityType(String activityType) {
        this.activityType = activityType;
    }

    public double getDuration() {
        return duration;
    }

    public void setDuration(double duration) {
        this.duration = duration;
    }

    public double getCaloriesBurned() {
        return caloriesBurned;
    }

    public void setCaloriesBurned(double caloriesBurned) {
        this.caloriesBurned = caloriesBurned;
    }

    @Override
    public String toString() {
        return "Activity{" +
                "activityType='" + activityType + '\'' +
                ", duration=" + duration +
                ", caloriesBurned=" + caloriesBurned +
                '}';
    }
}
