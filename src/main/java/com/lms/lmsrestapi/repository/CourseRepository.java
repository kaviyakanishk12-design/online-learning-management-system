package com.lms.lmsrestapi.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.lms.lmsrestapi.model.Course;

public interface CourseRepository extends JpaRepository<Course, Integer> {

}