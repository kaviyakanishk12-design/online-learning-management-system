package com.lms.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.lms.model.Video;
import com.lms.util.DBConnection;

public class VideoDAO {
    public boolean addVideo(Video video){

        boolean status = false;

        try{

            Connection con = DBConnection.getConnection();

            String sql =
            "INSERT INTO videos(course_id,title,youtube_link) VALUES(?,?,?)";

            PreparedStatement ps = con.prepareStatement(sql);

            ps.setInt(1, video.getCourseId());
            ps.setString(2, video.getTitle());
            ps.setString(3, video.getYoutubeLink());

            status = ps.executeUpdate() > 0;

            con.close();

        }catch(Exception e){

            e.printStackTrace();

        }

        return status;
    }
    public ArrayList<Video> getVideosByCourse(int courseId) {

        ArrayList<Video> list = new ArrayList<>();

        try {

            Connection con = DBConnection.getConnection();

            String sql = "SELECT * FROM videos WHERE course_id=?";

            PreparedStatement ps = con.prepareStatement(sql);

            ps.setInt(1, courseId);

            ResultSet rs = ps.executeQuery();

            System.out.println("========== VIDEO DEBUG ==========");
            System.out.println("Course ID received: " + courseId);

            int count = 0;

            while (rs.next()) {

                count++;

                Video video = new Video();

                video.setId(rs.getInt("id"));
                video.setCourseId(rs.getInt("course_id"));
                video.setTitle(rs.getString("title"));
                video.setYoutubeLink(rs.getString("youtube_link"));

                System.out.println("Video ID    : " + video.getId());
                System.out.println("Course ID   : " + video.getCourseId());
                System.out.println("Title       : " + video.getTitle());
                System.out.println("YouTube URL : " + video.getYoutubeLink());

                list.add(video);
            }

            System.out.println("Total videos found: " + count);
            System.out.println("================================");

            con.close();

        } catch (Exception e) {

            e.printStackTrace();

        }

        return list;
    }
    public ArrayList<Video> getAllVideos() {

        ArrayList<Video> list = new ArrayList<>();

        try {

            Connection con = DBConnection.getConnection();

            String sql = "SELECT * FROM videos";

            PreparedStatement ps = con.prepareStatement(sql);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {

                Video video = new Video();

                video.setId(rs.getInt("id"));
                video.setCourseId(rs.getInt("course_id"));
                video.setTitle(rs.getString("title"));
                video.setYoutubeLink(rs.getString("youtube_link"));

                list.add(video);
            }

            con.close();

        } catch (Exception e) {

            e.printStackTrace();
        }

        return list;
    }
}