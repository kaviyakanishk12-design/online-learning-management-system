package com.lms.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.lms.model.Assignment;
import com.lms.util.DBConnection;

public class AssignmentDAO {

    public boolean addAssignment(Assignment assignment) {

        boolean status = false;

        try {

            Connection con = DBConnection.getConnection();

            String sql =
                "INSERT INTO assignments " +
                "(course_id,title,description,due_date,file_name,max_marks,assignment_type,status) " +
                "VALUES (?,?,?,?,?,?,?,?)";

            PreparedStatement ps = con.prepareStatement(sql);

            ps.setInt(1, assignment.getCourseId());
            ps.setString(2, assignment.getTitle());
            ps.setString(3, assignment.getDescription());
            ps.setString(4, assignment.getDueDate());
            ps.setString(5, assignment.getFileName());
            ps.setInt(6, assignment.getMaxMarks());
            ps.setString(7, assignment.getAssignmentType());
            ps.setString(8, assignment.getStatus());

            int row = ps.executeUpdate();

            if (row > 0) {
                status = true;
            }

            ps.close();
            con.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return status;
    }
    public List<Assignment> getAllAssignments() {

        List<Assignment> list = new ArrayList<>();

        try {

            Connection con = DBConnection.getConnection();

            String sql =
                "SELECT * FROM assignments ORDER BY id DESC";

            PreparedStatement ps = con.prepareStatement(sql);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {

                Assignment a = new Assignment();

                a.setId(rs.getInt("id"));
                a.setCourseId(rs.getInt("course_id"));
                a.setTitle(rs.getString("title"));
                a.setDescription(rs.getString("description"));
                a.setDueDate(rs.getString("due_date"));
                a.setFileName(rs.getString("file_name"));
                a.setMaxMarks(rs.getInt("max_marks"));
                a.setAssignmentType(rs.getString("assignment_type"));
                a.setStatus(rs.getString("status"));

                list.add(a);
            }

            rs.close();
            ps.close();
            con.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    public boolean deleteAssignment(int id) {

        boolean status = false;

        try {

            Connection con = DBConnection.getConnection();

            String sql =
                "DELETE FROM assignments WHERE id=?";

            PreparedStatement ps = con.prepareStatement(sql);

            ps.setInt(1, id);

            int row = ps.executeUpdate();

            if (row > 0) {
                status = true;
            }

            ps.close();
            con.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return status;
    }
}