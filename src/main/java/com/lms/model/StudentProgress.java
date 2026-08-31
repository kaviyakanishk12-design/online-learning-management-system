package com.lms.model;

public class StudentProgress {

    private int totalCourses;
    private int assignmentsSubmitted;
    private int quizzesCompleted;
    private int certificatesEarned;

    public StudentProgress() {
    }

    public int getTotalCourses() {
        return totalCourses;
    }

    public void setTotalCourses(int totalCourses) {
        this.totalCourses = totalCourses;
    }

    public int getAssignmentsSubmitted() {
        return assignmentsSubmitted;
    }

    public void setAssignmentsSubmitted(int assignmentsSubmitted) {
        this.assignmentsSubmitted = assignmentsSubmitted;
    }

    public int getQuizzesCompleted() {
        return quizzesCompleted;
    }

    public void setQuizzesCompleted(int quizzesCompleted) {
        this.quizzesCompleted = quizzesCompleted;
    }

    public int getCertificatesEarned() {
        return certificatesEarned;
    }

    public void setCertificatesEarned(int certificatesEarned) {
        this.certificatesEarned = certificatesEarned;
    }

    public int getProgressPercentage() {

        int completed =
                assignmentsSubmitted +
                quizzesCompleted +
                certificatesEarned;

        int total = totalCourses * 3;

        if (total == 0) {
            return 0;
        }

        return (completed * 100) / total;
    }
}