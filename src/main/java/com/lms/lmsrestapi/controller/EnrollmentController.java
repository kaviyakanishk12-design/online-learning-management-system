package com.lms.lmsrestapi.controller;

import java.util.List;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.lms.lmsrestapi.model.Enrollment;
import com.lms.lmsrestapi.service.EnrollmentService;

@RestController
@RequestMapping("/api/enrollments")
public class EnrollmentController {

    private final EnrollmentService enrollmentService;

    public EnrollmentController(EnrollmentService enrollmentService) {
        this.enrollmentService = enrollmentService;
    }

    @GetMapping
    public List<Enrollment> getAllEnrollments() {
        return enrollmentService.getAllEnrollments();
    }

    @GetMapping("/{id}")
    public ResponseEntity<Enrollment> getEnrollmentById(
            @PathVariable int id) {

        Enrollment enrollment =
                enrollmentService.getEnrollmentById(id);

        if (enrollment == null) {
            return ResponseEntity.notFound().build();
        }

        return ResponseEntity.ok(enrollment);
    }

    @PostMapping
    public Enrollment addEnrollment(
            @RequestBody Enrollment enrollment) {

        return enrollmentService.addEnrollment(enrollment);
    }

    @PutMapping("/{id}")
    public ResponseEntity<Enrollment> updateEnrollment(
            @PathVariable int id,
            @RequestBody Enrollment enrollment) {

        Enrollment updated =
                enrollmentService.updateEnrollment(id, enrollment);

        if (updated == null) {
            return ResponseEntity.notFound().build();
        }

        return ResponseEntity.ok(updated);
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<Void> deleteEnrollment(
            @PathVariable int id) {

        boolean deleted =
                enrollmentService.deleteEnrollment(id);

        if (!deleted) {
            return ResponseEntity.notFound().build();
        }

        return ResponseEntity.noContent().build();
    }
}