package com.lms.lmsrestapi.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import com.lms.lmsrestapi.model.Enrollment;

public interface EnrollmentRepository extends JpaRepository<Enrollment, Integer> {
}