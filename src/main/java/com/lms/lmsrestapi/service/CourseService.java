package com.lms.lmsrestapi.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.lms.lmsrestapi.model.Course;
import com.lms.lmsrestapi.repository.CourseRepository;

@Service
public class CourseService {

    private final CourseRepository courseRepository;

    public CourseService(CourseRepository courseRepository) {
        this.courseRepository = courseRepository;
    }

    public List<Course> getAllCourses() {
        return courseRepository.findAll();
    }

    public Course getCourseById(int id) {
        return courseRepository.findById(id).orElse(null);
    }

    public Course addCourse(Course course) {
        return courseRepository.save(course);
    }

    public Course updateCourse(int id, Course course) {

        Course existingCourse = courseRepository.findById(id).orElse(null);

        if (existingCourse == null) {
            return null;
        }

        existingCourse.setCourseName(course.getCourseName());
        existingCourse.setInstructor(course.getInstructor());
        existingCourse.setDuration(course.getDuration());

        return courseRepository.save(existingCourse);
    }

    public boolean deleteCourse(int id) {

        if (!courseRepository.existsById(id)) {
            return false;
        }

        courseRepository.deleteById(id);
        return true;
    }
}