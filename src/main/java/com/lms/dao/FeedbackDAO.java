package com.lms.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.lms.model.Feedback;
import com.lms.util.DBConnection;

public class FeedbackDAO {

    public boolean addFeedback(Feedback feedback) {

        boolean status = false;

        try {

            Connection con = DBConnection.getConnection();

            String sql = "INSERT INTO feedback(student_id,course_id,rating,comments) VALUES(?,?,?,?)";

            PreparedStatement ps = con.prepareStatement(sql);

            ps.setInt(1, feedback.getStudentId());
            ps.setInt(2, feedback.getCourseId());
            ps.setInt(3, feedback.getRating());
            ps.setString(4, feedback.getComments());

            status = ps.executeUpdate() > 0;

            con.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return status;
    }

    public List<Feedback> getAllFeedback() {

        List<Feedback> list = new ArrayList<>();

        try {

            Connection con = DBConnection.getConnection();

            String sql = "SELECT * FROM feedback ORDER BY feedback_date DESC";

            PreparedStatement ps = con.prepareStatement(sql);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {

                Feedback feedback = new Feedback();

                feedback.setId(rs.getInt("id"));
                feedback.setStudentId(rs.getInt("student_id"));
                feedback.setCourseId(rs.getInt("course_id"));
                feedback.setRating(rs.getInt("rating"));
                feedback.setComments(rs.getString("comments"));
                feedback.setFeedbackDate(rs.getString("feedback_date"));

                list.add(feedback);
            }

            con.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }
}