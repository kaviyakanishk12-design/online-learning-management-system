package com.lms.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;

import com.lms.util.DBConnection;

public class ForgotPasswordDAO {

    public boolean resetPassword(String email, String newPassword) {

        boolean status = false;

        try {

            Connection con = DBConnection.getConnection();

            String sql = "UPDATE students SET password=? WHERE email=?";

            PreparedStatement ps = con.prepareStatement(sql);

            ps.setString(1, newPassword);
            ps.setString(2, email);

            status = ps.executeUpdate() > 0;

            con.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return status;
    }

}