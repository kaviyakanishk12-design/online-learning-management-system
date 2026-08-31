package com.lms.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.lms.model.CourseMaterial;
import com.lms.util.DBConnection;

public class CourseMaterialDAO {

    public boolean addMaterial(CourseMaterial material) {

        boolean status = false;

        try {

            Connection con = DBConnection.getConnection();

            String sql =
            "INSERT INTO course_materials(course_id,title,file_name,video_link) VALUES(?,?,?,?)";

            PreparedStatement ps = con.prepareStatement(sql);

            ps.setInt(1, material.getCourseId());
            ps.setString(2, material.getTitle());
            ps.setString(3, material.getFileName());
            ps.setString(4, material.getVideoLink());

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

    public List<CourseMaterial> getMaterialsByCourse(int courseId) {

        List<CourseMaterial> list = new ArrayList<>();

        try {

            Connection con = DBConnection.getConnection();

            String sql =
            "SELECT * FROM course_materials WHERE course_id=?";

            PreparedStatement ps = con.prepareStatement(sql);

            ps.setInt(1, courseId);

            ResultSet rs = ps.executeQuery();

            while(rs.next()) {

                CourseMaterial m = new CourseMaterial();

                m.setId(rs.getInt("id"));
                m.setCourseId(rs.getInt("course_id"));
                m.setTitle(rs.getString("title"));
                m.setFileName(rs.getString("file_name"));
                m.setVideoLink(rs.getString("video_link"));

                list.add(m);
            }

            con.close();

        } catch(Exception e) {
            e.printStackTrace();
        }

        return list;
    }
}