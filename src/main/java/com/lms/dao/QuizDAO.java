package com.lms.dao;

import java.sql.*;
import java.util.*;

import com.lms.model.Quiz;
import com.lms.util.DBConnection;

public class QuizDAO {

    public boolean addQuiz(Quiz quiz){

        boolean status = false;

        try{

            Connection con = DBConnection.getConnection();

            String sql = "INSERT INTO quizzes(title,course_id,total_questions) VALUES(?,?,?)";

            PreparedStatement ps = con.prepareStatement(sql);

            ps.setString(1, quiz.getTitle());
            ps.setInt(2, quiz.getCourseId());
            ps.setInt(3, quiz.getTotalQuestions());

            status = ps.executeUpdate() > 0;

            con.close();

        }catch(Exception e){
            e.printStackTrace();
        }

        return status;
    }
    public List<Quiz> getAllQuizzes(){

        List<Quiz> list = new ArrayList<>();

        try{

            Connection con = DBConnection.getConnection();

            String sql = "SELECT * FROM quizzes";

            PreparedStatement ps = con.prepareStatement(sql);

            ResultSet rs = ps.executeQuery();

            while(rs.next()){

                Quiz q = new Quiz();

                q.setId(rs.getInt("id"));
                q.setTitle(rs.getString("title"));
                q.setCourseId(rs.getInt("course_id"));
                q.setTotalQuestions(rs.getInt("total_questions"));

                list.add(q);

            }

            con.close();

        }catch(Exception e){
            e.printStackTrace();
        }

        return list;
    }

    public List<Quiz> getQuizzesByCourse(int courseId){

        List<Quiz> list = new ArrayList<>();

        try{

            Connection con = DBConnection.getConnection();

            String sql = "SELECT * FROM quizzes WHERE course_id=?";

            PreparedStatement ps = con.prepareStatement(sql);

            ps.setInt(1, courseId);

            ResultSet rs = ps.executeQuery();

            while(rs.next()){

                Quiz q = new Quiz();

                q.setId(rs.getInt("id"));
                q.setTitle(rs.getString("title"));
                q.setCourseId(rs.getInt("course_id"));
                q.setTotalQuestions(rs.getInt("total_questions"));

                list.add(q);

            }

            con.close();

        }catch(Exception e){
            e.printStackTrace();
        }

        return list;
    }

}