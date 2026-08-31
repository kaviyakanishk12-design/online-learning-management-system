package com.lms.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.lms.model.Attendance;
import com.lms.util.DBConnection;

public class AttendanceDAO {
    public boolean markAttendance(Attendance attendance){

        boolean status = false;

        try{

            Connection con = DBConnection.getConnection();

            String sql = "INSERT INTO attendance(student_id,course_id,attendance_date,status) VALUES(?,?,?,?)";

            PreparedStatement ps = con.prepareStatement(sql);

            ps.setInt(1, attendance.getStudentId());
            ps.setInt(2, attendance.getCourseId());
            ps.setString(3, attendance.getAttendanceDate());
            ps.setString(4, attendance.getStatus());

            status = ps.executeUpdate() > 0;

            con.close();

        }catch(Exception e){

            e.printStackTrace();

        }

        return status;
    }
    public List<Attendance> getAttendance(){

        List<Attendance> list = new ArrayList<>();

        try{

            Connection con = DBConnection.getConnection();

            String sql = "SELECT * FROM attendance";

            PreparedStatement ps = con.prepareStatement(sql);

            ResultSet rs = ps.executeQuery();

            while(rs.next()){

                Attendance a = new Attendance();

                a.setId(rs.getInt("id"));
                a.setStudentId(rs.getInt("student_id"));
                a.setCourseId(rs.getInt("course_id"));
                a.setAttendanceDate(rs.getString("attendance_date"));
                a.setStatus(rs.getString("status"));

                list.add(a);

            }

            con.close();

        }catch(Exception e){

            e.printStackTrace();

        }

        return list;
    }

}