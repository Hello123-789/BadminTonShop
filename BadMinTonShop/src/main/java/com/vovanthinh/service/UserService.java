package com.vovanthinh.service;
import com.vovanthinh.model.User;
public interface UserService {
 User authenticate(String username,String password); User findByRememberToken(String token); String createRememberToken(User user); void clearRememberToken(int userId);
 boolean register(String username,String password,String fullName); boolean registerWithEmail(String username,String email,String password,String fullName);
 boolean verifyOtp(String username,String otpCode); boolean sendForgotPasswordOtp(String usernameOrEmail); boolean resetPasswordWithOtp(String usernameOrEmail,String otpCode,String newPassword);
 boolean resetPassword(String username,String fullName,String newPassword); boolean updateProfile(int userId,String fullName,String phone,String image);
}
