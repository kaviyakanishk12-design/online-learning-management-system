package com.lms.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.lms.model.Course;
import com.lms.model.Enrollment;
import com.lms.util.DBConnection;

public class EnrollmentDAO {

    public boolean enrollCourse(Enrollment enrollment) {

        boolean status = false;

        try {

            Connection con = DBConnection.getConnection();

            String sql =
            "INSERT INTO enrollments(student_id,course_id) VALUES(?,?)";

            PreparedStatement ps =
            con.prepareStatement(sql);

            ps.setInt(1, enrollment.getStudentId());
            ps.setInt(2, enrollment.getCourseId());

            int row = ps.executeUpdate();

            if(row > 0) {
                status = true;
            }

            con.close();

        } catch(Exception e) {
            e.printStackTrace();
        }

        return status;
    }

    public List<Course> getMyCourses(int studentId) {

        List<Course> list = new ArrayList<>();

        try {

            Connection con = DBConnection.getConnection();

            String sql =
            "SELECT c.* FROM courses c INNER JOIN enrollments e ON c.id=e.course_id WHERE e.student_id=?";

            PreparedStatement ps =
            con.prepareStatement(sql);

            ps.setInt(1, studentId);

            ResultSet rs = ps.executeQuery();

            while(rs.next()) {

                Course c = new Course();

                c.setId(rs.getInt("id"));
                c.setCourseName(rs.getString("course_name"));
                c.setInstructor(rs.getString("instructor"));
                c.setDuration(rs.getString("duration"));

                list.add(c);
            }

            con.close();

        } catch(Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    public boolean isAlreadyEnrolled(int studentId, int courseId) {

        boolean status = false;

        try {

            Connection con = DBConnection.getConnection();

            String sql =
            "SELECT * FROM enrollments WHERE student_id=? AND course_id=?";

            PreparedStatement ps =
            con.prepareStatement(sql);

            ps.setInt(1, studentId);
            ps.setInt(2, courseId);

            ResultSet rs = ps.executeQuery();

            if(rs.next()) {
                status = true;
            }

            con.close();

        } catch(Exception e) {
            e.printStackTrace();
        }

        return status;
    }

    public List<Enrollment> getAllEnrollments() {

        List<Enrollment> list = new ArrayList<>();

        try {

            Connection con = DBConnection.getConnection();

            String sql =
            "SELECT e.id, s.name, c.course_name " +
            "FROM enrollments e " +
            "INNER JOIN students s ON e.student_id = s.id " +
            "INNER JOIN courses c ON e.course_id = c.id";

            PreparedStatement ps = con.prepareStatement(sql);

            ResultSet rs = ps.executeQuery();

            while(rs.next()) {

                Enrollment e = new Enrollment();

                e.setId(rs.getInt("id"));
                e.setStudentName(rs.getString("name"));
                e.setCourseName(rs.getString("course_name"));

                list.add(e);
            }

            con.close();

        } catch(Exception e) {
            e.printStackTrace();
        }

        return list;
    }
    public int getEnrollmentCount() {

        int count = 0;

        try {

            Connection con = DBConnection.getConnection();

            String sql = "SELECT COUNT(*) FROM enrollments";

            PreparedStatement ps = con.prepareStatement(sql);

            ResultSet rs = ps.executeQuery();

            if(rs.next()) {
                count = rs.getInt(1);
            }

            con.close();

        } catch(Exception e) {
            e.printStackTrace();
        }

        return count;
    }
}