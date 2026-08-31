package com.lms.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.lms.model.Certificate;
import com.lms.util.DBConnection;

public class CertificateDAO {
    public boolean generateCertificate(Certificate certificate) {
        boolean status = false;

        try {
            Connection con = DBConnection.getConnection();

            String sql = "INSERT INTO certificates(student_id, course_id, issue_date, certificate_no, status) VALUES(?,?,?,?,?)";

            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, certificate.getStudentId());
            ps.setInt(2, certificate.getCourseId());
            ps.setString(3, certificate.getIssueDate());
            ps.setString(4, certificate.getCertificateNo());
            ps.setString(5, certificate.getStatus());

            status = ps.executeUpdate() > 0;

            con.close();
        } catch (Exception e) {
            System.out.println("===== Certificate Error =====");
            e.printStackTrace();
        }
        return status;
    }

    public List<Certificate> getAllCertificates() {
        List<Certificate> list = new ArrayList<>();

        try {
            Connection con = DBConnection.getConnection();

            String sql = "SELECT c.id, c.student_id, c.course_id, c.issue_date, c.certificate_no, c.status, cr.course_name " +
                         "FROM certificates c " +
                         "JOIN courses cr ON c.course_id = cr.id";

            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Certificate c = new Certificate();
                c.setId(rs.getInt("id"));
                c.setStudentId(rs.getInt("student_id"));
                c.setCourseId(rs.getInt("course_id"));
                c.setIssueDate(rs.getString("issue_date"));
                c.setCertificateNo(rs.getString("certificate_no"));
                c.setStatus(rs.getString("status"));
                c.setCourseName(rs.getString("course_name")); // ✅ NEW

                list.add(c);
            }

            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }
    public Certificate getCertificateById(int id) {

        Certificate cert = null;

        try {

            Connection con = DBConnection.getConnection();

            String sql =
                "SELECT c.id, c.student_id, c.course_id, " +
                "c.issue_date, c.certificate_no, c.status, " +
                "cr.course_name, s.name AS student_name " +
                "FROM certificates c " +
                "LEFT JOIN courses cr ON c.course_id = cr.id " +
                "LEFT JOIN students s ON c.student_id = s.id " +
                "WHERE c.id = ?";

            PreparedStatement ps = con.prepareStatement(sql);

            ps.setInt(1, id);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {

                cert = new Certificate();

                cert.setId(rs.getInt("id"));
                cert.setStudentId(rs.getInt("student_id"));
                cert.setCourseId(rs.getInt("course_id"));
                cert.setIssueDate(rs.getString("issue_date"));
                cert.setCertificateNo(rs.getString("certificate_no"));
                cert.setStatus(rs.getString("status"));
                cert.setCourseName(rs.getString("course_name"));
                cert.setStudentName(rs.getString("student_name"));
            }

            rs.close();
            ps.close();
            con.close();

        } catch (Exception e) {

            System.out.println("===== Get Certificate Error =====");
            e.printStackTrace();
        }

        return cert;
    }
   

 }