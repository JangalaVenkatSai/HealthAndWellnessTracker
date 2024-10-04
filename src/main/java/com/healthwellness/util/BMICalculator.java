package com.healthwellness.util;

public class BMICalculator {

    /**
     * Calculates BMI based on weight (kg) and height (meters).
     *
     * @param weight in kilograms
     * @param height in meters
     * @return BMI value
     */
    public static double calculateBMI(double weight, double height) {
        if (height <= 0) {
            throw new IllegalArgumentException("Height must be greater than zero");
        }
        return weight / (height * height);
    }

    /**
     * Provides a BMI category based on the calculated BMI.
     *
     * @param bmi calculated BMI
     * @return BMI category
     */
    public static String getBMICategory(double bmi) {
        if (bmi < 18.5) {
            return "Underweight";
        } else if (bmi >= 18.5 && bmi < 24.9) {
            return "Normal weight";
        } else if (bmi >= 25 && bmi < 29.9) {
            return "Overweight";
        } else {
            return "Obesity";
        }
    }
}
