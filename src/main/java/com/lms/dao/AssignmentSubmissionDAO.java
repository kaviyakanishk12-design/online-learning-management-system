
package com.lms.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.lms.model.AssignmentSubmission;
import com.lms.util.DBConnection;

public class AssignmentSubmissionDAO {

    public List<AssignmentSubmission> getAllSubmissions() {

        List<AssignmentSubmission> list = new ArrayList<>();

        String sql =
                "SELECT s.id, " +
                "s.assignment_id, " +
                "s.student_id, " +
                "s.file_name, " +
                "s.submitted_at, " +
                "s.marks, " +
                "s.feedback, " +
                "st.name AS student_name, " +
                "a.title AS assignment_title " +
                "FROM assignment_submissions s " +
                "JOIN students st ON s.student_id = st.id " +
                "JOIN assignments a ON s.assignment_id = a.id " +
                "ORDER BY s.submitted_at DESC";

        try (
            Connection con = DBConnection.getConnection();
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery()
        ) {

            while (rs.next()) {

                AssignmentSubmission sub =
                        new AssignmentSubmission();

                sub.setId(rs.getInt("id"));
                sub.setAssignmentId(rs.getInt("assignment_id"));
                sub.setStudentId(rs.getInt("student_id"));

                sub.setStudentName(
                        rs.getString("student_name")
                );

                sub.setAssignmentTitle(
                        rs.getString("assignment_title")
                );

                sub.setFileName(
                        rs.getString("file_name")
                );

                sub.setSubmittedAt(
                        rs.getString("submitted_at")
                );

                Integer marks =
                        (Integer) rs.getObject("marks");

                sub.setMarks(marks);

                sub.setFeedback(
                        rs.getString("feedback")
                );

                list.add(sub);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }


    public AssignmentSubmission getSubmission(
            int assignmentId,
            int studentId) {

        AssignmentSubmission sub = null;

        String sql =
                "SELECT id, assignment_id, student_id, " +
                "file_name, submitted_at, marks, " +
                "feedback, status " +
                "FROM assignment_submissions " +
                "WHERE assignment_id=? " +
                "AND student_id=? " +
                "ORDER BY id DESC LIMIT 1";

        try (
            Connection con = DBConnection.getConnection();
            PreparedStatement ps = con.prepareStatement(sql)
        ) {

            ps.setInt(1, assignmentId);
            ps.setInt(2, studentId);

            try (ResultSet rs = ps.executeQuery()) {

                if (rs.next()) {

                    sub = new AssignmentSubmission();

                    sub.setId(rs.getInt("id"));
                    sub.setAssignmentId(
                            rs.getInt("assignment_id")
                    );
                    sub.setStudentId(
                            rs.getInt("student_id")
                    );

                    sub.setFileName(
                            rs.getString("file_name")
                    );

                    sub.setSubmittedAt(
                            rs.getString("submitted_at")
                    );

                    Integer marks =
                            (Integer) rs.getObject("marks");

                    sub.setMarks(marks);

                    sub.setFeedback(
                            rs.getString("feedback")
                    );

                    sub.setStatus(
                            rs.getString("status")
                    );
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return sub;
    }


    public List<AssignmentSubmission> getStudentResults(
            int studentId) {

        List<AssignmentSubmission> list =
                new ArrayList<>();

        String sql =
                "SELECT s.id, " +
                "s.assignment_id, " +
                "s.student_id, " +
                "s.file_name, " +
                "s.submitted_at, " +
                "s.marks, " +
                "s.feedback, " +
                "a.title AS assignment_title " +
                "FROM assignment_submissions s " +
                "JOIN assignments a " +
                "ON s.assignment_id = a.id " +
                "WHERE s.student_id=? " +
                "ORDER BY s.submitted_at DESC";

        try (
            Connection con = DBConnection.getConnection();
            PreparedStatement ps = con.prepareStatement(sql)
        ) {

            ps.setInt(1, studentId);

            try (ResultSet rs = ps.executeQuery()) {

                while (rs.next()) {

                    AssignmentSubmission sub =
                            new AssignmentSubmission();

                    sub.setId(rs.getInt("id"));

                    sub.setAssignmentId(
                            rs.getInt("assignment_id")
                    );

                    sub.setStudentId(
                            rs.getInt("student_id")
                    );

                    sub.setAssignmentTitle(
                            rs.getString("assignment_title")
                    );

                    sub.setFileName(
                            rs.getString("file_name")
                    );

                    sub.setSubmittedAt(
                            rs.getString("submitted_at")
                    );

                    Integer marks =
                            (Integer) rs.getObject("marks");

                    sub.setMarks(marks);

                    sub.setFeedback(
                            rs.getString("feedback")
                    );

                    sub.setStatus(
                            rs.getString("status")
                    );

                    list.add(sub);
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }


    public boolean updateMarks(
            int id,
            int marks,
            String feedback) {

        String sql =
                "UPDATE assignment_submissions " +
                "SET marks=?, feedback=? " +
                "WHERE id=?";

        try (
            Connection con = DBConnection.getConnection();
            PreparedStatement ps = con.prepareStatement(sql)
        ) {

            ps.setInt(1, marks);
            ps.setString(2, feedback);
            ps.setInt(3, id);

            return ps.executeUpdate() > 0;

        } catch (Exception e) {

            e.printStackTrace();
            return false;
        }
    }
}
