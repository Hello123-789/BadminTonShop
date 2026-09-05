package com.vovanthinh.dao;
import com.vovanthinh.model.User;
public interface UserDAO {
 User findByUsername(String username); User findByEmail(String email); User findByUsernameOrEmail(String value); User findByUsernameAnyStatus(String username);
 User findByRememberToken(String token); void updateRememberToken(int userId,String token); boolean existsByUsername(String username); boolean existsByEmail(String email);
 void insert(User user); void delete(int userId); void update(User user); boolean resetPassword(String username,String fullName,String passwordHash); boolean updateProfile(int userId,String fullName,String phone,String image);
}
