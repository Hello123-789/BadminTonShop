package com.vovanthinh.service.impl;

import java.security.MessageDigest;
import java.security.SecureRandom;
import java.util.HexFormat;
import com.vovanthinh.dao.UserDAO;
import com.vovanthinh.dao.impl.UserDAOImpl;
import com.vovanthinh.model.User;
import com.vovanthinh.service.UserService;

public class UserServiceImpl implements UserService {
    private final UserDAO dao = new UserDAOImpl();
    private final SecureRandom random = new SecureRandom();

    @Override
    public User authenticate(String username, String password) {
        User user = dao.findByUsername(username);
        if (user == null) return null;
        return hash(password).equalsIgnoreCase(user.getPasswordHash()) ? user : null;
    }

    @Override
    public User findByRememberToken(String token) {
        if (token == null || token.isBlank()) return null;
        return dao.findByRememberToken(token);
    }

    @Override
    public String createRememberToken(User user) {
        byte[] bytes = new byte[32];
        random.nextBytes(bytes);
        String token = HexFormat.of().formatHex(bytes);
        dao.updateRememberToken(user.getUserId(), token);
        user.setRememberToken(token);
        return token;
    }

    @Override
    public void clearRememberToken(int userId) {
        dao.updateRememberToken(userId, null);
    }

    @Override
    public boolean register(String username, String password, String fullName) {
        if (username == null || password == null || fullName == null || username.isBlank() || password.length() < 6 || fullName.isBlank()) return false;
        if (dao.existsByUsername(username.trim())) return false;
        User u = new User(); u.setUsername(username.trim()); u.setPasswordHash(hash(password)); u.setFullName(fullName.trim()); dao.insert(u); return true;
    }

    @Override
    public boolean resetPassword(String username, String fullName, String newPassword) {
        if (username == null || fullName == null || newPassword == null || newPassword.length() < 6) return false;
        return dao.resetPassword(username.trim(), fullName.trim(), hash(newPassword));
    }

    public static String hash(String value) {
        try {
            MessageDigest md = MessageDigest.getInstance("SHA-256");
            return HexFormat.of().formatHex(md.digest(value.getBytes(java.nio.charset.StandardCharsets.UTF_8)));
        } catch (Exception e) {
            throw new IllegalStateException(e);
        }
    }
}
