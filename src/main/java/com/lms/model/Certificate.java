package com.lms.model;

public class Certificate {

    private int id;
    private int studentId;
    private int courseId;
    private String issueDate;
    private String certificateNo;
    private String status;
    private String courseName;   
    private String studentName;
    public Certificate() {
    }

    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public int getStudentId() { return studentId; }
    public void setStudentId(int studentId) { this.studentId = studentId; }

    public int getCourseId() { return courseId; }
    public void setCourseId(int courseId) { this.courseId = courseId; }

    public String getIssueDate() { return issueDate; }
    public void setIssueDate(String issueDate) { this.issueDate = issueDate; }

    public String getCertificateNo() { return certificateNo; }
    public void setCertificateNo(String certificateNo) { this.certificateNo = certificateNo; }

    public String getStatus() { return status; }
    public void setStatus(String status) { this.status = status; }

    public String getCourseName() { return courseName; }
    public void setCourseName(String courseName) { this.courseName = courseName; }

public String getStudentName() { return studentName; }
public void setStudentName(String studentName) { this.studentName = studentName; }
}
