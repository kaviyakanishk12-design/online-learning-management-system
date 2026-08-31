package com.lms.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.lms.model.Course;
import com.lms.util.DBConnection;

public class CourseDAO {
public boolean addCourse(Course course) {

    boolean status = false;

    try {

        Connection con = DBConnection.getConnection();

        String sql =
        "INSERT INTO courses(course_name,instructor,duration) VALUES(?,?,?)";

        PreparedStatement ps =
        con.prepareStatement(sql);

        ps.setString(1, course.getCourseName());
        ps.setString(2, course.getInstructor());
        ps.setString(3, course.getDuration());

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

// VIEW ALL COURSES
public List<Course> getAllCourses() {

    List<Course> list = new ArrayList<>();

    try {

        Connection con = DBConnection.getConnection();

        String sql = "SELECT * FROM courses";

        PreparedStatement ps =
        con.prepareStatement(sql);

        ResultSet rs = ps.executeQuery();
        while(rs.next()) {

      
        	System.out.println("Course Found: " +
        	rs.getString("course_name"));

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
public boolean updateCourse(Course course) {

    boolean status = false;

    try {

        Connection con = DBConnection.getConnection();

        String sql =
        "UPDATE courses SET course_name=?, instructor=?, duration=? WHERE id=?";

        PreparedStatement ps =
        con.prepareStatement(sql);

        ps.setString(1, course.getCourseName());
        ps.setString(2, course.getInstructor());
        ps.setString(3, course.getDuration());
        ps.setInt(4, course.getId());

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
public boolean deleteCourse(int id) {

    boolean status = false;

    try {

        Connection con = DBConnection.getConnection();

        String sql =
        "DELETE FROM courses WHERE id=?";

        PreparedStatement ps =
        con.prepareStatement(sql);

        ps.setInt(1, id);

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
public List<Course> searchCourses(String keyword) {

List<Course> list = new ArrayList<>();

try {

 Connection con = DBConnection.getConnection();

 String sql =
 "SELECT * FROM courses WHERE course_name LIKE ?";

 PreparedStatement ps =
 con.prepareStatement(sql);

 ps.setString(1, "%" + keyword + "%");

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

public int getCourseCount() {

 int count = 0;

 try {

     Connection con = DBConnection.getConnection();

     String sql = "SELECT COUNT(*) FROM courses";

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
public Course getCourseById(int id) {

    Course course = null;

    try {

        Connection con = DBConnection.getConnection();

        String sql = "SELECT * FROM courses WHERE id=?";

        PreparedStatement ps = con.prepareStatement(sql);

        ps.setInt(1, id);

        ResultSet rs = ps.executeQuery();

        if (rs.next()) {

            course = new Course();

            course.setId(rs.getInt("id"));
            course.setCourseName(rs.getString("course_name"));
            course.setInstructor(rs.getString("instructor"));
            course.setDuration(rs.getString("duration"));
        }

        con.close();

    } catch (Exception e) {
        e.printStackTrace();
    }

    return course;
}

}

