package com.lms.lmsrestapi.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.lms.lmsrestapi.model.Enrollment;
import com.lms.lmsrestapi.repository.EnrollmentRepository;

@Service
public class EnrollmentService {

    private final EnrollmentRepository enrollmentRepository;

    public EnrollmentService(EnrollmentRepository enrollmentRepository) {
        this.enrollmentRepository = enrollmentRepository;
    }

    public List<Enrollment> getAllEnrollments() {
        return enrollmentRepository.findAll();
    }

    public Enrollment getEnrollmentById(int id) {
        return enrollmentRepository.findById(id).orElse(null);
    }

    public Enrollment addEnrollment(Enrollment enrollment) {
        return enrollmentRepository.save(enrollment);
    }

    public Enrollment updateEnrollment(int id, Enrollment enrollment) {

        Enrollment existing =
                enrollmentRepository.findById(id).orElse(null);

        if (existing == null) {
            return null;
        }

        existing.setStudentId(enrollment.getStudentId());
        existing.setCourseId(enrollment.getCourseId());

        return enrollmentRepository.save(existing);
    }

    public boolean deleteEnrollment(int id) {

        if (!enrollmentRepository.existsById(id)) {
            return false;
        }

        enrollmentRepository.deleteById(id);
        return true;
    }
}