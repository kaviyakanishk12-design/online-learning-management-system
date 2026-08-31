package com.lms.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.lms.model.Student;
import com.lms.util.DBConnection;

public class StudentDAO {

    public boolean registerStudent(Student student) {

        boolean status = false;

        try {

            Connection con = DBConnection.getConnection();

            String sql =
            "INSERT INTO students(name,email,password) VALUES(?,?,?)";

            PreparedStatement ps =
            con.prepareStatement(sql);

            ps.setString(1, student.getName());
            ps.setString(2, student.getEmail());
            ps.setString(3, student.getPassword());

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

    public boolean loginStudent(String email, String password) {

        boolean status = false;

        try {

            Connection con = DBConnection.getConnection();

            String sql =
            "SELECT * FROM students WHERE email=? AND password=?";

            PreparedStatement ps =
            con.prepareStatement(sql);

            ps.setString(1, email);
            ps.setString(2, password);

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
    public int getStudentId(String email, String password) {

        int studentId = 0;

        try {

            Connection con = DBConnection.getConnection();

            String sql =
            "SELECT id FROM students WHERE email=? AND password=?";

            PreparedStatement ps =
            con.prepareStatement(sql);

            ps.setString(1, email);
            ps.setString(2, password);

            ResultSet rs = ps.executeQuery();

            if(rs.next()) {
                studentId = rs.getInt("id");
            }

            con.close();

        } catch(Exception e) {
            e.printStackTrace();
        }

        return studentId;
    }
    public String getStudentName(String email, String password) {

        String studentName = "";

        try {

            Connection con = DBConnection.getConnection();

            String sql =
            "SELECT name FROM students WHERE email=? AND password=?";

            PreparedStatement ps =
            con.prepareStatement(sql);

            ps.setString(1, email);
            ps.setString(2, password);

            ResultSet rs = ps.executeQuery();

            if(rs.next()) {

                studentName = rs.getString("name");
            }

            con.close();

        } catch(Exception e) {
            e.printStackTrace();
        }

        return studentName;
    }
    public boolean emailExists(String email) {

        boolean exists = false;

        try {

            Connection con = DBConnection.getConnection();

            String sql =
            "SELECT * FROM students WHERE email=?";

            PreparedStatement ps =
            con.prepareStatement(sql);

            ps.setString(1, email);

            ResultSet rs = ps.executeQuery();

            if(rs.next()) {
                exists = true;
            }

            con.close();

        } catch(Exception e) {
            e.printStackTrace();
        }

        return exists;
    }
    public List<Student> getAllStudents() {

        List<Student> list = new ArrayList<>();

        try {

            Connection con = DBConnection.getConnection();

            String sql = "SELECT * FROM students";

            PreparedStatement ps =
            con.prepareStatement(sql);

            ResultSet rs = ps.executeQuery();

            while(rs.next()) {

                Student student = new Student();

                student.setId(rs.getInt("id"));
                student.setName(rs.getString("name"));
                student.setEmail(rs.getString("email"));
                student.setPassword(rs.getString("password"));

                list.add(student);
            }

            con.close();

        } catch(Exception e) {
            e.printStackTrace();
        }

        return list;
    }
    public int getStudentCount() {

        int count = 0;

        try {

            Connection con = DBConnection.getConnection();

            String sql = "SELECT COUNT(*) FROM students";

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
    public Student getStudent(int id){

        Student s = new Student();

        try{

            Connection con = DBConnection.getConnection();

            String sql="SELECT * FROM students WHERE id=?";

            PreparedStatement ps=con.prepareStatement(sql);

            ps.setInt(1,id);

            ResultSet rs=ps.executeQuery();

            if(rs.next()){

                s.setId(rs.getInt("id"));
                s.setName(rs.getString("name"));
                s.setEmail(rs.getString("email"));
                s.setPassword(rs.getString("password"));

            }

            con.close();

        }catch(Exception e){
            e.printStackTrace();
        }

        return s;
    }
    public boolean updateStudent(Student student) {

        boolean status = false;

        try {

            Connection con = DBConnection.getConnection();

            String sql = "UPDATE students SET name=?, email=?, password=? WHERE id=?";

            PreparedStatement ps = con.prepareStatement(sql);

            ps.setString(1, student.getName());
            ps.setString(2, student.getEmail());
            ps.setString(3, student.getPassword());
            ps.setInt(4, student.getId());

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
}