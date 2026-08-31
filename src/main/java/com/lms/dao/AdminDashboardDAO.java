package com.lms.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.lms.model.AdminDashboard;
import com.lms.util.DBConnection;

public class AdminDashboardDAO {

    public AdminDashboard getDashboardData() {

        AdminDashboard dashboard = new AdminDashboard();

        try {

            Connection con = DBConnection.getConnection();

            PreparedStatement ps1 =
                    con.prepareStatement("SELECT COUNT(*) FROM students");
            ResultSet rs1 = ps1.executeQuery();

            if(rs1.next()){
                dashboard.setTotalStudents(rs1.getInt(1));
            }

            PreparedStatement ps2 =
                    con.prepareStatement("SELECT COUNT(*) FROM courses");
            ResultSet rs2 = ps2.executeQuery();

            if(rs2.next()){
                dashboard.setTotalCourses(rs2.getInt(1));
            }

            PreparedStatement ps3 =
                    con.prepareStatement("SELECT COUNT(*) FROM assignments");
            ResultSet rs3 = ps3.executeQuery();

            if(rs3.next()){
                dashboard.setTotalAssignments(rs3.getInt(1));
            }

            PreparedStatement ps4 =
                    con.prepareStatement("SELECT COUNT(*) FROM assignment_submissions");
            ResultSet rs4 = ps4.executeQuery();

            if(rs4.next()){
                dashboard.setTotalSubmissions(rs4.getInt(1));
            }

            PreparedStatement ps5 =
                    con.prepareStatement("SELECT COUNT(*) FROM quizzes");
            ResultSet rs5 = ps5.executeQuery();

            if(rs5.next()){
                dashboard.setTotalQuizzes(rs5.getInt(1));
            }

            PreparedStatement ps6 =
                    con.prepareStatement("SELECT COUNT(*) FROM certificates");
            ResultSet rs6 = ps6.executeQuery();

            if(rs6.next()){
                dashboard.setTotalCertificates(rs6.getInt(1));
            }

            con.close();

        } catch(Exception e) {

            e.printStackTrace();

        }

        return dashboard;
    }

}