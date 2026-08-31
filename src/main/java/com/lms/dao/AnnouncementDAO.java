package com.lms.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.lms.model.Announcement;
import com.lms.util.DBConnection;

public class AnnouncementDAO {

    public boolean addAnnouncement(Announcement a) {

        boolean status = false;

        try {

            Connection con = DBConnection.getConnection();

            String sql =
            "INSERT INTO announcements(title,message) VALUES(?,?)";

            PreparedStatement ps =
                    con.prepareStatement(sql);

            ps.setString(1, a.getTitle());
            ps.setString(2, a.getMessage());

            status = ps.executeUpdate() > 0;

            con.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return status;
    }

    public List<Announcement> getAllAnnouncements() {

        List<Announcement> list = new ArrayList<>();

        try {

            Connection con = DBConnection.getConnection();

            String sql =
            "SELECT * FROM announcements ORDER BY posted_date DESC";

            PreparedStatement ps =
                    con.prepareStatement(sql);

            ResultSet rs = ps.executeQuery();

            while(rs.next()){

                Announcement a = new Announcement();

                a.setId(rs.getInt("id"));
                a.setTitle(rs.getString("title"));
                a.setMessage(rs.getString("message"));
                a.setPostedDate(rs.getString("posted_date"));

                list.add(a);

            }

            con.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }
    
    public boolean deleteAnnouncement(int id) {

        boolean status = false;

        try {

            Connection con = DBConnection.getConnection();

            String sql = "DELETE FROM announcements WHERE id=?";

            PreparedStatement ps = con.prepareStatement(sql);

            ps.setInt(1, id);

            status = ps.executeUpdate() > 0;

            ps.close();
            con.close();

        } catch (Exception e) {

            e.printStackTrace();
        }

        return status;
    }
   
}