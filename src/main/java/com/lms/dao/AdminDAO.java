package com.lms.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.lms.model.Admin;
import com.lms.util.DBConnection;

public class AdminDAO {

    public boolean loginAdmin(String username, String password) {

        boolean status = false;

        try {

            Connection con = DBConnection.getConnection();

            String sql = "SELECT * FROM admins WHERE username=? AND password=?";

            PreparedStatement ps = con.prepareStatement(sql);

            ps.setString(1, username);
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

    public boolean addAdmin(Admin admin) {

        boolean status = false;

        try {

            Connection con = DBConnection.getConnection();

            String sql = "INSERT INTO admins(username,password) VALUES(?,?)";

            PreparedStatement ps = con.prepareStatement(sql);

            ps.setString(1, admin.getUsername());
            ps.setString(2, admin.getPassword());

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
    public int getAdminCount() {

        int count = 0;

        try {

            Connection con = DBConnection.getConnection();

            String sql = "SELECT COUNT(*) FROM admins";

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