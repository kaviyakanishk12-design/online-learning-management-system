package com.lms.lmsrestapi.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import com.lms.lmsrestapi.model.Student;

public interface StudentRepository extends JpaRepository<Student, Integer> {
}