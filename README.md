# Online Learning Management System (LMS)

A full-stack Java-based Learning Management System with separate Student and Admin portals, built using JSP, Servlets, JDBC, Spring Boot REST APIs, Spring Data JPA, Hibernate, and MariaDB.

> **Note:** The application runs locally. The original JSP/Servlet application requires Apache Tomcat, while the separate Spring Boot REST API runs on its embedded Tomcat server. Both use the `lms_db` database.

## Problem Statement

Colleges need a centralized platform to manage courses, student enrollments, assignments, discussions, and live classes instead of relying on multiple disconnected tools.

## Solution

Developed an LMS with separate Student and Admin portals for learning activities and administration. Also developed a separate Spring Boot REST API connected to the same database to manage courses, students, enrollments, and administrators through CRUD operations.

## Features

### Student Portal

* Browse available courses.
* View and manage learning activities supported by the application.
* Access assignments, discussion forums, and scheduled live classes.

### Admin Portal

* Manage courses and student-related records.
* Support administrative operations for assignments and live classes.

### Spring Boot REST API

* CRUD operations for courses.
* CRUD operations for students.
* CRUD operations for enrollments.
* CRUD operations for administrators.
* JSON request and response handling.
* API access protected with Spring Security HTTP Basic Authentication.
* API testing using Postman.

## Technology Stack

* **Programming Language:** Java 17
* **Frontend:** HTML, CSS, JavaScript, JSP
* **Backend:** Java Servlets, Spring Boot
* **REST API:** Spring Web
* **ORM:** Spring Data JPA, Hibernate
* **Database:** MariaDB / MySQL
* **Database Connectivity:** JDBC
* **Security:** Spring Security
* **Servers:** Apache Tomcat and Spring Boot embedded Tomcat
* **IDE:** Eclipse
* **API Testing:** Postman
* **Database Environment:** XAMPP

## Architecture

The project contains two related application components.

1. **Original LMS:** JSP and Servlets handle page rendering and application logic, with JDBC for database operations.
2. **Spring Boot REST API:** Controllers expose REST endpoints, services handle application logic, repositories perform database operations, and JPA/Hibernate maps Java entities to database tables.

Both components connect to the shared `lms_db` database.

## REST API Endpoints

Base URL for local development: `http://localhost:8080`

| Method | Endpoint                | Purpose                  |
| ------ | ----------------------- | ------------------------ |
| GET    | `/api/courses`          | Retrieve all courses     |
| GET    | `/api/courses/{id}`     | Retrieve a course        |
| POST   | `/api/courses`          | Add a course             |
| PUT    | `/api/courses/{id}`     | Update a course          |
| DELETE | `/api/courses/{id}`     | Delete a course          |
| GET    | `/api/students`         | Retrieve all students    |
| GET    | `/api/students/{id}`    | Retrieve a student       |
| POST   | `/api/students`         | Add a student            |
| PUT    | `/api/students/{id}`    | Update a student         |
| DELETE | `/api/students/{id}`    | Delete a student         |
| GET    | `/api/enrollments`      | Retrieve all enrollments |
| POST   | `/api/enrollments`      | Create an enrollment     |
| PUT    | `/api/enrollments/{id}` | Update an enrollment     |
| DELETE | `/api/enrollments/{id}` | Delete an enrollment     |
| GET    | `/api/admins`           | Retrieve administrators  |
| POST   | `/api/admins`           | Add an administrator     |
| PUT    | `/api/admins/{id}`      | Update an administrator  |
| DELETE | `/api/admins/{id}`      | Delete an administrator  |

The student, enrollment, and administrator APIs also support retrieving individual records by ID.

## Project Structure


lms-rest-api/
├── src/main/java/com/lms/lmsrestapi/
│   ├── controller/
│   │   ├── CourseController.java
│   │   ├── StudentController.java
│   │   ├── EnrollmentController.java
│   │   └── AdminController.java
│   ├── model/
│   │   ├── Course.java
│   │   ├── Student.java
│   │   ├── Enrollment.java
│   │   └── Admin.java
│   ├── repository/
│   ├── service/
│   ├── SecurityConfig.java
│   └── LmsRestApiApplication.java
├── src/main/resources/
│   └── application.properties
└── pom.xml

The original JSP/Servlet LMS is maintained as a separate application.

## Running Locally

### Prerequisites

* JDK 17
* Eclipse IDE
* XAMPP with MariaDB
* Apache Tomcat for the original JSP/Servlet application
* Maven support in Eclipse

### Setup

1. Clone the repository containing the application you want to run.
2. Start MariaDB using XAMPP.
3. Create or configure the `lms_db` database and required tables.
4. Configure the database URL, username, and password in `application.properties`.
5. Import the Spring Boot project into Eclipse as an existing Maven project.
6. Update Maven dependencies if needed.
7. Run `LmsRestApiApplication.java` as a Java application.
8. Open Postman and test the REST endpoints at `http://localhost:8080/api/courses`.
9. To run the original LMS, configure it separately in Eclipse and deploy it to Apache Tomcat.

## What I Learned

* Building Java web applications using JSP and Servlets.
* Connecting applications to MariaDB using JDBC.
* Designing RESTful APIs using Spring Boot.
* Implementing CRUD operations through Spring Data JPA and Hibernate.
* Organizing backend code using controller, service, repository, and model layers.
* Configuring Spring Security for API access.
* Testing REST endpoints with Postman.
* Working with a shared database across separate application components.

## Future Improvements

* Integrate the REST API with a React frontend.
* Add secure authentication and role-based authorization.
* Hash passwords and prevent sensitive fields from appearing in API responses.
* Add request validation and centralized exception handling.
* Add automated unit and integration tests.
* Deploy the applications to a suitable hosting environment.

## License

MIT
