package com.lms.lmsrestapi.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.lms.lmsrestapi.model.Admin;
import com.lms.lmsrestapi.repository.AdminRepository;

@Service
public class AdminService {

    private final AdminRepository adminRepository;

    public AdminService(AdminRepository adminRepository) {
        this.adminRepository = adminRepository;
    }

    public List<Admin> getAllAdmins() {
        return adminRepository.findAll();
    }

    public Admin getAdminById(int id) {
        return adminRepository.findById(id).orElse(null);
    }

    public Admin addAdmin(Admin admin) {
        return adminRepository.save(admin);
    }

    public Admin updateAdmin(int id, Admin admin) {

        Admin existing = adminRepository.findById(id).orElse(null);

        if (existing == null) {
            return null;
        }

        existing.setUsername(admin.getUsername());
        existing.setPassword(admin.getPassword());

        return adminRepository.save(existing);
    }

    public boolean deleteAdmin(int id) {

        if (!adminRepository.existsById(id)) {
            return false;
        }

        adminRepository.deleteById(id);
        return true;
    }
}