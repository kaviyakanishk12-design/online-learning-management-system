# Online Learning Management System (LMS)

A full-stack Java-based **Online Learning Management System** with separate Student and Admin portals, built using JSP, Servlets, JDBC, and a separate Spring Boot REST API with Spring Data JPA, Hibernate, Spring Security, and MariaDB.

> **Note:** The application runs locally. The original JSP/Servlet application runs on Apache Tomcat, while the separate Spring Boot REST API runs on its embedded Tomcat server. Both applications connect to the shared `lms_db` database.

## Problem Statement

Colleges need a centralized platform to manage courses, student enrollments, assignments, discussions, and live classes instead of relying on multiple disconnected tools.

## Solution

Developed an LMS with dedicated Student and Admin portals for learning activities and administrative operations. Also developed a separate Spring Boot REST API that provides CRUD functionality for courses, students, enrollments, and administrators.

## Features

### Student Portal

* Browse available courses.
* Access learning activities supported by the application.
* View assignments, participate in discussion forums, and access scheduled live classes.

### Admin Portal

* Manage courses and student-related records.
* Manage assignments and live classes.
* Access administrative features for LMS operations.

### Spring Boot REST API

* CRUD operations for courses, students, enrollments, and administrators.
* RESTful endpoints with JSON request and response handling.
* Spring Data JPA and Hibernate for database persistence.
* Spring Security HTTP Basic Authentication for API access.
* API endpoint testing using Postman.

## Technology Stack

| Category                | Technologies                               |
| ----------------------- | ------------------------------------------ |
| Programming Language    | Java 17                                    |
| Frontend                | HTML, CSS, JavaScript, JSP, Bootstrap      |
| Web Application Backend | Java Servlets, JDBC                        |
| REST API                | Spring Boot, Spring Web                    |
| ORM and Persistence     | Spring Data JPA, Hibernate                 |
| Database                | MariaDB / MySQL                            |
| Security                | Spring Security                            |
| Servers                 | Apache Tomcat, Spring Boot Embedded Tomcat |
| Development Tools       | Eclipse IDE, Maven                         |
| API Testing             | Postman                                    |
| Database Environment    | XAMPP                                      |

## Architecture

The project contains two separate application components that share the same database.

### 1. Original JSP/Servlet LMS

* JSP pages render the user interface.
* Java Servlets handle requests and application logic.
* JDBC manages database operations.
* Runs separately on Apache Tomcat.

### 2. Spring Boot REST API

* **Controller layer:** Exposes REST endpoints.
* **Service layer:** Handles application logic.
* **Repository layer:** Performs database operations using Spring Data JPA.
* **Model layer:** Defines entities mapped using JPA and Hibernate.
* **Security layer:** Protects API access using Spring Security.
* Runs on Spring Boot's embedded Tomcat server.

Both components connect to the shared `lms_db` database.

## REST API Endpoints

Base URL for local development: `http://localhost:8080`

> Ensure the Spring Boot application is configured to use port 8080 before using these URLs. If the port differs, update the base URL accordingly.

### Courses

| Method | Endpoint            | Purpose                 |
| ------ | ------------------- | ----------------------- |
| GET    | `/api/courses`      | Retrieve all courses    |
| GET    | `/api/courses/{id}` | Retrieve a course by ID |
| POST   | `/api/courses`      | Add a course            |
| PUT    | `/api/courses/{id}` | Update a course         |
| DELETE | `/api/courses/{id}` | Delete a course         |

### Students

| Method | Endpoint             | Purpose                  |
| ------ | -------------------- | ------------------------ |
| GET    | `/api/students`      | Retrieve all students    |
| GET    | `/api/students/{id}` | Retrieve a student by ID |
| POST   | `/api/students`      | Add a student            |
| PUT    | `/api/students/{id}` | Update a student         |
| DELETE | `/api/students/{id}` | Delete a student         |

### Enrollments

| Method | Endpoint                | Purpose                      |
| ------ | ----------------------- | ---------------------------- |
| GET    | `/api/enrollments`      | Retrieve all enrollments     |
| GET    | `/api/enrollments/{id}` | Retrieve an enrollment by ID |
| POST   | `/api/enrollments`      | Create an enrollment         |
| PUT    | `/api/enrollments/{id}` | Update an enrollment         |
| DELETE | `/api/enrollments/{id}` | Delete an enrollment         |

### Administrators

| Method | Endpoint           | Purpose                         |
| ------ | ------------------ | ------------------------------- |
| GET    | `/api/admins`      | Retrieve all administrators     |
| GET    | `/api/admins/{id}` | Retrieve an administrator by ID |
| POST   | `/api/admins`      | Add an administrator            |
| PUT    | `/api/admins/{id}` | Update an administrator         |
| DELETE | `/api/admins/{id}` | Delete an administrator         |

**Authentication:** API requests are protected by Spring Security HTTP Basic Authentication. Configure the appropriate credentials when testing protected endpoints in Postman.

## Project Structure

```text
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
```

The original JSP/Servlet LMS is maintained as a separate application.

## Running Locally

### Prerequisites

* JDK 17
* Eclipse IDE
* XAMPP with MariaDB
* Apache Tomcat for the JSP/Servlet application
* Maven support in Eclipse
* Postman for API testing

### Setup Instructions

1. Clone the repository containing the application you want to run.
2. Start MariaDB using the XAMPP Control Panel.
3. Create or configure the `lms_db` database and its required tables.
4. Configure the database URL, username, and password in the Spring Boot `application.properties` file.
5. Import the Spring Boot project into Eclipse as an existing Maven project.
6. Update Maven dependencies.
7. Run `LmsRestApiApplication.java` as a Java application.
8. Open Postman and test the API endpoints using the configured base URL and authentication credentials.
9. To run the original LMS, configure it separately in Eclipse and deploy it to Apache Tomcat.

**Important:** Ensure both applications use compatible database credentials and schemas. Since they share a database, changes made by one application may affect the data used by the other.

## What I Learned

* Developing Java web applications using JSP and Servlets.
* Connecting Java applications to MariaDB using JDBC.
* Designing RESTful APIs using Spring Boot.
* Implementing CRUD operations with Spring Data JPA and Hibernate.
* Structuring backend applications using controller, service, repository, and model layers.
* Configuring Spring Security for API access.
* Testing REST endpoints using Postman.
* Working with a shared database across separate application components.

## Future Improvements

* Integrate the REST API with a React frontend.
* Implement stronger authentication and role-based authorization.
* Hash passwords and prevent sensitive fields from appearing in API responses.
* Add request validation and centralized exception handling.
* Add automated unit and integration tests.
* Deploy the applications to a suitable hosting environment.

## License

MIT
