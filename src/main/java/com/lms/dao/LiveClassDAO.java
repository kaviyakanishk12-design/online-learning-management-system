package com.lms.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.lms.model.LiveClass;
import com.lms.util.DBConnection;

public class LiveClassDAO {

    public boolean addLiveClass(LiveClass live) {

        boolean status = false;

        try {

            Connection con = DBConnection.getConnection();

            String sql =
                    "INSERT INTO live_classes " +
                    "(course_id, class_title, instructor, class_date, class_time, meet_link) " +
                    "VALUES (?, ?, ?, ?, ?, ?)";

            PreparedStatement ps =
                    con.prepareStatement(sql);

            ps.setInt(1, live.getCourseId());
            ps.setString(2, live.getClassTitle());
            ps.setString(3, live.getInstructor());
            ps.setString(4, live.getClassDate());
            ps.setString(5, live.getClassTime());
            ps.setString(6, live.getMeetLink());

            status = ps.executeUpdate() > 0;

            ps.close();
            con.close();

        } catch (Exception e) {

            e.printStackTrace();
        }

        return status;
    }

    public ArrayList<LiveClass> getAllClasses() {

        ArrayList<LiveClass> list =
                new ArrayList<>();

        try {

            Connection con =
                    DBConnection.getConnection();

            String sql =
                    "SELECT * FROM live_classes " +
                    "ORDER BY class_date, class_time";

            PreparedStatement ps =
                    con.prepareStatement(sql);

            ResultSet rs =
                    ps.executeQuery();

            while (rs.next()) {

                LiveClass live =
                        new LiveClass();

                live.setId(
                        rs.getInt("id")
                );

                live.setCourseId(
                        rs.getInt("course_id")
                );

                live.setClassTitle(
                        rs.getString("class_title")
                );

                live.setInstructor(
                        rs.getString("instructor")
                );

                live.setClassDate(
                        rs.getString("class_date")
                );

                live.setClassTime(
                        rs.getString("class_time")
                );

                live.setMeetLink(
                        rs.getString("meet_link")
                );

                list.add(live);
            }

            rs.close();
            ps.close();
            con.close();

        } catch (Exception e) {

            e.printStackTrace();
        }

        return list;
    }


    public boolean deleteLiveClass(int id) {

        boolean status = false;

        try {

            Connection con =
                    DBConnection.getConnection();

            String sql =
                    "DELETE FROM live_classes WHERE id=?";

            PreparedStatement ps =
                    con.prepareStatement(sql);

            ps.setInt(1, id);

            status =
                    ps.executeUpdate() > 0;

            ps.close();
            con.close();

        } catch (Exception e) {

            e.printStackTrace();
        }

        return status;
    }

    public LiveClass getClassById(int id) {

        LiveClass live = null;

        try {

            Connection con =
                    DBConnection.getConnection();

            String sql =
                    "SELECT * FROM live_classes WHERE id=?";

            PreparedStatement ps =
                    con.prepareStatement(sql);

            ps.setInt(1, id);

            ResultSet rs =
                    ps.executeQuery();

            if (rs.next()) {

                live =
                        new LiveClass();

                live.setId(
                        rs.getInt("id")
                );

                live.setCourseId(
                        rs.getInt("course_id")
                );

                live.setClassTitle(
                        rs.getString("class_title")
                );

                live.setInstructor(
                        rs.getString("instructor")
                );

                live.setClassDate(
                        rs.getString("class_date")
                );

                live.setClassTime(
                        rs.getString("class_time")
                );

                live.setMeetLink(
                        rs.getString("meet_link")
                );
            }

            rs.close();
            ps.close();
            con.close();

        } catch (Exception e) {

            e.printStackTrace();
        }

        return live;
    }

    public boolean updateLiveClass(LiveClass live) {

        boolean status = false;

        try {

            Connection con =
                    DBConnection.getConnection();

            String sql =
                    "UPDATE live_classes SET " +
                    "course_id=?, " +
                    "class_title=?, " +
                    "instructor=?, " +
                    "class_date=?, " +
                    "class_time=?, " +
                    "meet_link=? " +
                    "WHERE id=?";

            PreparedStatement ps =
                    con.prepareStatement(sql);

            ps.setInt(
                    1,
                    live.getCourseId()
            );

            ps.setString(
                    2,
                    live.getClassTitle()
            );

            ps.setString(
                    3,
                    live.getInstructor()
            );

            ps.setString(
                    4,
                    live.getClassDate()
            );

            ps.setString(
                    5,
                    live.getClassTime()
            );

            ps.setString(
                    6,
                    live.getMeetLink()
            );

            ps.setInt(
                    7,
                    live.getId()
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
}