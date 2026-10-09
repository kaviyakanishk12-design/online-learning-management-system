package com.lms.lmsrestapi.controller;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import com.lms.lmsrestapi.model.Admin;
import com.lms.lmsrestapi.model.AdminLoginRequest;
import com.lms.lmsrestapi.repository.AdminRepository;

@RestController
@RequestMapping("/api/admin")
public class AdminAuthController {

    private final AdminRepository adminRepository;

    public AdminAuthController(AdminRepository adminRepository) {
        this.adminRepository = adminRepository;
    }

    @PostMapping("/login")
    public ResponseEntity<?> login(@RequestBody AdminLoginRequest request) {

        for (Admin admin : adminRepository.findAll()) {

            if (admin.getUsername().equals(request.getUsername())
                    && admin.getPassword().equals(request.getPassword())) {

                return ResponseEntity.ok("Admin Login Successful");
            }
        }

        return ResponseEntity.status(401)
                .body("Invalid Username or Password");
    }
}