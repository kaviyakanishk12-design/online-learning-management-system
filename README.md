# Online Learning Management System (LMS)

A full-stack Learning Management System built in Java, featuring separate Student and Admin portals for managing courses, assignments, discussion forums, and live classes.

> **Note:** This is a full-stack Java application requiring Apache Tomcat and a MySQL/MariaDB database to run — it isn't deployed to a live URL. Clone and run locally using the steps below to try it out.

## Problem

Colleges need one platform to manage courses, assignments, and live classes for both students and staff, instead of juggling multiple disconnected tools.

## Solution

Built separate Student and Admin portals covering course management, assignment submission, discussion forums, live-class scheduling, and JDBC-based database integration — delivered as a fully functional full-stack application spanning database design, backend logic, and UI.

## Features

- **Student Portal** — browse courses, submit assignments, participate in discussion forums, join scheduled live classes
- **Admin Portal** — manage courses, review/grade assignment submissions, oversee live-class scheduling
- Server-side rendering with JSP and Servlets handling application logic
- JDBC-based integration with a MySQL/MariaDB database for persistent data storage
- Deployed and run on Apache Tomcat

## Tech Stack

- **Backend:** Java, JSP, Servlets
- **Frontend:** HTML, CSS, JavaScript
- **Database:** MySQL / MariaDB (via JDBC)
- **Server:** Apache Tomcat
- **IDE:** Eclipse

## Project Structure
online-learning-management-system/
├── src/main/ # Java source code — servlets, JDBC logic, business logic
├── build/classes/ # Compiled class files
├── .settings/ # Eclipse project settings
├── .classpath # Eclipse classpath configuration
├── .project # Eclipse project descriptor
└── README.md

## Running Locally

1. Clone the repository:
git clone https://github.com/kaviyakanishk12-design/online-learning-management-system.git
2. Import the project into Eclipse (or your preferred Java IDE) as an existing project
3. Set up a MySQL/MariaDB database and update the JDBC connection details in the source code
4. Deploy the project to Apache Tomcat
5. Access the application through your local Tomcat server URL

## What I Learned / Built

- Designing and structuring a full-stack Java web application from the ground up
- Writing JDBC code to connect a Java backend to a relational database
- Building two distinct user portals (Student and Admin) with different permissions and views within one application
- Handling server-side logic with Servlets and dynamic page rendering with JSP
- Managing application deployment on Apache Tomcat

## Possible Next Steps

- Migrate to a modern framework (Spring Boot) for cleaner architecture and easier maintenance
- Add REST APIs to support a separate frontend (e.g., React) instead of JSP-rendered pages
- Implement role-based authentication and authorization
- Add automated testing for core business logic

## License

MIT
