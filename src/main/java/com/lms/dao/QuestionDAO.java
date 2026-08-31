package com.lms.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.lms.model.Question;
import com.lms.util.DBConnection;

public class QuestionDAO {

    public boolean addQuestion(Question question) {

        boolean status = false;

        try {

            Connection con = DBConnection.getConnection();

            String sql =
            "INSERT INTO questions(quiz_id,question,option1,option2,option3,option4,correct_answer) VALUES(?,?,?,?,?,?,?)";

            PreparedStatement ps = con.prepareStatement(sql);

            ps.setInt(1, question.getQuizId());
            ps.setString(2, question.getQuestion());
            ps.setString(3, question.getOption1());
            ps.setString(4, question.getOption2());
            ps.setString(5, question.getOption3());
            ps.setString(6, question.getOption4());
            ps.setString(7, question.getCorrectAnswer());

            int row = ps.executeUpdate();

            if(row > 0){
                status = true;
            }

            con.close();

        } catch(Exception e){
            e.printStackTrace();
        }

        return status;
    }
    public List<Question> getQuestionsByQuiz(int quizId){

        List<Question> list = new ArrayList<>();

        try{

            Connection con = DBConnection.getConnection();

            String sql = "SELECT * FROM questions WHERE quiz_id=?";

            PreparedStatement ps = con.prepareStatement(sql);

            ps.setInt(1, quizId);

            ResultSet rs = ps.executeQuery();

            while(rs.next()){

                Question q = new Question();

                q.setId(rs.getInt("id"));
                q.setQuizId(rs.getInt("quiz_id"));
                q.setQuestion(rs.getString("question"));
                q.setOption1(rs.getString("option1"));
                q.setOption2(rs.getString("option2"));
                q.setOption3(rs.getString("option3"));
                q.setOption4(rs.getString("option4"));
                q.setCorrectAnswer(rs.getString("correct_answer"));

                list.add(q);
            }

            con.close();

        }catch(Exception e){
            e.printStackTrace();
        }

        return list;
    }
}