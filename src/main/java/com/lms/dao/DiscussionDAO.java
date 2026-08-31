
package com.lms.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.lms.model.Discussion;
import com.lms.util.DBConnection;

public class DiscussionDAO {

    public boolean addQuestion(Discussion discussion) {

        boolean status = false;

        String sql =
            "INSERT INTO discussions " +
            "(student_id, course_id, question) " +
            "VALUES (?, ?, ?)";

        try {

            Connection con = DBConnection.getConnection();

            PreparedStatement ps =
                    con.prepareStatement(sql);

            ps.setInt(
                    1,
                    discussion.getStudentId()
            );

            ps.setInt(
                    2,
                    discussion.getCourseId()
            );

            ps.setString(
                    3,
                    discussion.getQuestion()
            );

            status = ps.executeUpdate() > 0;

            ps.close();
            con.close();

        } catch (Exception e) {

            e.printStackTrace();
        }

        return status;
    }

    public ArrayList<Discussion> getAllDiscussions() {

        ArrayList<Discussion> list =
                new ArrayList<>();

        String sql =
            "SELECT * FROM discussions " +
            "ORDER BY posted_date DESC";

        try {

            Connection con =
                    DBConnection.getConnection();

            PreparedStatement ps =
                    con.prepareStatement(sql);

            ResultSet rs =
                    ps.executeQuery();

            while (rs.next()) {

                Discussion d =
                        new Discussion();

                d.setId(
                        rs.getInt("id")
                );

                d.setStudentId(
                        rs.getInt("student_id")
                );

                d.setCourseId(
                        rs.getInt("course_id")
                );

                d.setQuestion(
                        rs.getString("question")
                );

                d.setReply(
                        rs.getString("reply")
                );

                d.setPostedDate(
                        rs.getString("posted_date")
                );

                list.add(d);
            }

            rs.close();
            ps.close();
            con.close();

        } catch (Exception e) {

            e.printStackTrace();
        }

        return list;
    }

    public boolean replyQuestion(
            int id,
            String reply) {

        boolean status = false;

        String sql =
            "UPDATE discussions " +
            "SET reply=? " +
            "WHERE id=?";

        try {

            Connection con =
                    DBConnection.getConnection();

            PreparedStatement ps =
                    con.prepareStatement(sql);

            ps.setString(
                    1,
                    reply
            );

            ps.setInt(
                    2,
                    id
            );

            status =
                    ps.executeUpdate() > 0;

            ps.close();
            con.close();

        } catch (Exception e) {

            e.printStackTrace();
        }

        return status;
    }

    public int getDiscussionCount() {

        int count = 0;

        String sql =
            "SELECT COUNT(*) FROM discussions";

        try {

            Connection con =
                    DBConnection.getConnection();

            PreparedStatement ps =
                    con.prepareStatement(sql);

            ResultSet rs =
                    ps.executeQuery();

            if (rs.next()) {

                count =
                        rs.getInt(1);
            }

            rs.close();
            ps.close();
            con.close();

        } catch (Exception e) {

            e.printStackTrace();
        }

        return count;
    }
}
