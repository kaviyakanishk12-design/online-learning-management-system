package com.lms.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.lms.model.Student;
import com.lms.util.DBConnection;

public class StudentProfileDAO {

    public Student getStudent(int id){

        Student student = null;

        try{

            Connection con = DBConnection.getConnection();

            String sql = "SELECT * FROM students WHERE id=?";

            PreparedStatement ps = con.prepareStatement(sql);

            ps.setInt(1, id);

            ResultSet rs = ps.executeQuery();

            if(rs.next()){

                student = new Student();

                student.setId(rs.getInt("id"));
                student.setName(rs.getString("name"));
                student.setEmail(rs.getString("email"));
                student.setPassword(rs.getString("password"));

            }

            con.close();

        }catch(Exception e){

            e.printStackTrace();

        }

        return student;
    }
    public boolean updateStudent(Student student){

        boolean status = false;

        try{

            Connection con = DBConnection.getConnection();

            String sql =
            "UPDATE students SET name=?, email=? WHERE id=?";

            PreparedStatement ps = con.prepareStatement(sql);

            ps.setString(1, student.getName());
            ps.setString(2, student.getEmail());
            ps.setInt(3, student.getId());

            status = ps.executeUpdate() > 0;

            con.close();

        }catch(Exception e){

            e.printStackTrace();

        }

        return status;
    }

}