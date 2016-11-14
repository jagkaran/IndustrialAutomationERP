package com.industrialauto.erp.auth.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.industrialauto.erp.auth.model.Role;

public interface RoleRepository extends JpaRepository<Role, Long>{
}
