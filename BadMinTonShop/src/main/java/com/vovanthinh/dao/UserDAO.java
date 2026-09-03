package com.vovanthinh.dao;

import com.vovanthinh.model.User;

public interface UserDAO {
    User findByUsername(String username);
    User findByRememberToken(String token);
    void updateRememberToken(int userId, String token);
    boolean existsByUsername(String username);
    void insert(User user);
    boolean resetPassword(String username, String fullName, String passwordHash);
    boolean updateProfile(int userId, String fullName, String phone, String image);
}
