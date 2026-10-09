package com.lms.lmsrestapi.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import com.lms.lmsrestapi.model.Admin;

public interface AdminRepository extends JpaRepository<Admin, Integer> {
}