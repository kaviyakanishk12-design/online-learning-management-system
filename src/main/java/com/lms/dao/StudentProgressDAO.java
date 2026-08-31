package com.lms.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.lms.model.StudentProgress;
import com.lms.util.DBConnection;

public class StudentProgressDAO {

    public StudentProgress getProgress(int studentId) {

        StudentProgress progress = new StudentProgress();

        try {

            Connection con = DBConnection.getConnection();

            PreparedStatement ps1 = con.prepareStatement(
                    "SELECT COUNT(*) FROM enrollments WHERE student_id=?");
            ps1.setInt(1, studentId);
            ResultSet rs1 = ps1.executeQuery();

            if (rs1.next()) {
                progress.setTotalCourses(rs1.getInt(1));
            }

            PreparedStatement ps2 = con.prepareStatement(
                    "SELECT COUNT(*) FROM assignment_submissions WHERE student_id=?");
            ps2.setInt(1, studentId);
            ResultSet rs2 = ps2.executeQuery();

            if (rs2.next()) {
                progress.setAssignmentsSubmitted(rs2.getInt(1));
            }

            PreparedStatement ps3 = con.prepareStatement(
                    "SELECT COUNT(*) FROM quiz_results WHERE student_id=?");
            ps3.setInt(1, studentId);
            ResultSet rs3 = ps3.executeQuery();

            if (rs3.next()) {
                progress.setQuizzesCompleted(rs3.getInt(1));
            }
            PreparedStatement ps4 = con.prepareStatement(
                    "SELECT COUNT(*) FROM certificates WHERE student_id=?");
            ps4.setInt(1, studentId);
            ResultSet rs4 = ps4.executeQuery();

            if (rs4.next()) {
                progress.setCertificatesEarned(rs4.getInt(1));
            }

            con.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return progress;
    }
}