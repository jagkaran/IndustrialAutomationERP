package com.industrialauto.erp.auth.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.industrialauto.erp.auth.model.User;

public interface UserRepository extends JpaRepository<User, Long> {
    User findByUsername(String username);
}
