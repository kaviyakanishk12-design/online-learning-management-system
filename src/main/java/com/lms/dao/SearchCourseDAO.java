package com.lms.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.lms.model.Course;
import com.lms.util.DBConnection;

public class SearchCourseDAO {

    public List<Course> searchCourses(String keyword){

        List<Course> list = new ArrayList<>();

        try{

            Connection con = DBConnection.getConnection();

            String sql =
            "SELECT * FROM courses WHERE course_name LIKE ?";

            PreparedStatement ps = con.prepareStatement(sql);

            ps.setString(1,"%"+keyword+"%");

            ResultSet rs = ps.executeQuery();

            while(rs.next()){

                Course c = new Course();

                c.setId(rs.getInt("id"));
                c.setCourseName(rs.getString("course_name"));
            
                c.setInstructor(rs.getString("instructor"));
                c.setDuration(rs.getString("duration"));
                list.add(c);

            }

            con.close();

        }catch(Exception e){

            e.printStackTrace();

        }

        return list;

    }

}