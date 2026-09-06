package com.vovanthinh.service.impl;

import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.security.SecureRandom;
import java.time.LocalDateTime;
import java.util.HexFormat;

import com.vovanthinh.dao.UserDAO;
import com.vovanthinh.dao.impl.UserDAOImpl;
import com.vovanthinh.model.User;
import com.vovanthinh.service.UserService;
import com.vovanthinh.util.EmailService;

public class UserServiceImpl implements UserService {

    private final UserDAO userDAO = new UserDAOImpl();
    private final SecureRandom random = new SecureRandom();

    @Override
    public User authenticate(String username, String password) {
        User user = userDAO.findByUsername(username);
        if (user != null && hash(password).equalsIgnoreCase(user.getPasswordHash())) {
            return user;
        }
        return null;
    }

    @Override
    public User findByRememberToken(String token) {
        if (token == null || token.isBlank()) {
            return null;
        }
        return userDAO.findByRememberToken(token);
    }

    @Override
    public String createRememberToken(User user) {
        byte[] bytes = new byte[32];
        random.nextBytes(bytes);
        String token = HexFormat.of().formatHex(bytes);
        userDAO.updateRememberToken(user.getUserId(), token);
        user.setRememberToken(token);
        return token;
    }

    @Override
    public void clearRememberToken(int userId) {
        userDAO.updateRememberToken(userId, null);
    }

    @Override
    public boolean register(String username, String password, String fullName) {
        return registerWithEmail(username, null, password, fullName);
    }

    @Override
    public boolean registerWithEmail(String username, String email, String password, String fullName) {
        if (username == null || password == null || fullName == null || email == null) {
            return false;
        }
        if (username.isBlank() || password.length() < 6 || fullName.isBlank() || email.isBlank()) {
            return false;
        }

        username = username.trim();
        email = email.trim().toLowerCase();
        fullName = fullName.trim();

        if (userDAO.existsByUsername(username) || userDAO.existsByEmail(email)) {
            return false;
        }

        User user = new User();
        user.setUsername(username);
        user.setEmail(email);
        user.setPasswordHash(hash(password));
        user.setFullName(fullName);
        user.setActive(false);

        String otp = generateOtpCode();
        user.setOtpCode(otp);
        user.setOtpExpiry(LocalDateTime.now().plusMinutes(5));

        userDAO.insert(user);

        if (!EmailService.sendOtp(email, otp, "Xác thực tài khoản")) {
            userDAO.delete(user.getUserId());
            return false;
        }

        return true;
    }

    @Override
    public boolean verifyOtp(String username, String code) {
        User user = userDAO.findByUsernameAnyStatus(username);
        if (user == null || user.isActive() || code == null) {
            return false;
        }
        if (!code.equals(user.getOtpCode()) || user.getOtpExpiry() == null) {
            return false;
        }
        if (LocalDateTime.now().isAfter(user.getOtpExpiry())) {
            return false;
        }

        user.setActive(true);
        user.setOtpCode(null);
        user.setOtpExpiry(null);
        userDAO.update(user);
        return true;
    }

    @Override
    public boolean sendForgotPasswordOtp(String value) {
        if (value == null || value.isBlank()) {
            return false;
        }
        User user = userDAO.findByUsernameOrEmail(value.trim());
        if (user == null) {
            return false;
        }

        String otp = generateOtpCode();
        user.setOtpCode(otp);
        user.setOtpExpiry(LocalDateTime.now().plusMinutes(5));
        userDAO.update(user);

        return EmailService.sendOtp(user.getEmail(), otp, "Mã OTP đặt lại mật khẩu");
    }

    @Override
    public boolean resetPasswordWithOtp(String value, String code, String newPassword) {
        if (value == null || code == null || newPassword == null || newPassword.length() < 6) {
            return false;
        }
        User user = userDAO.findByUsernameOrEmail(value.trim());
        if (user == null || user.getOtpCode() == null) {
            return false;
        }
        if (!code.equals(user.getOtpCode()) || user.getOtpExpiry() == null) {
            return false;
        }
        if (LocalDateTime.now().isAfter(user.getOtpExpiry())) {
            return false;
        }

        user.setPasswordHash(hash(newPassword));
        user.setOtpCode(null);
        user.setOtpExpiry(null);
        user.setRememberToken(null);
        userDAO.update(user);
        return true;
    }

    @Override
    public boolean resetPassword(String username, String fullName, String newPassword) {
        if (username == null || fullName == null || newPassword == null || newPassword.length() < 6) {
            return false;
        }
        return userDAO.resetPassword(username.trim(), fullName.trim(), hash(newPassword));
    }

    @Override
    public boolean updateProfile(int userId, String fullName, String phone, String image) {
        if (fullName == null || fullName.isBlank()) {
            return false;
        }
        return userDAO.updateProfile(userId, fullName.trim(), phone == null ? "" : phone.trim(), image);
    }

    private String generateOtpCode() {
        return String.format("%06d", random.nextInt(1_000_000));
    }

    public static String hash(String value) {
        try {
            MessageDigest md = MessageDigest.getInstance("SHA-256");
            return HexFormat.of().formatHex(md.digest(value.getBytes(StandardCharsets.UTF_8)));
        } catch (Exception e) {
            throw new IllegalStateException(e);
        }
    }
}
