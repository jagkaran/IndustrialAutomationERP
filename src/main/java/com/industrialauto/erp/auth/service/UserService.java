package com.industrialauto.erp.auth.service;

import com.industrialauto.erp.auth.model.User;

public interface UserService {
    void save(User user);

    User findByUsername(String username);
}
