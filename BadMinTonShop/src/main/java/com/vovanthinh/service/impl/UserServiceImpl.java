package com.vovanthinh.service.impl;
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
 private final UserDAO dao=new UserDAOImpl(); private final SecureRandom random=new SecureRandom();
 public User authenticate(String u,String p){User user=dao.findByUsername(u);return user!=null&&hash(p).equalsIgnoreCase(user.getPasswordHash())?user:null;}
 public User findByRememberToken(String t){return t==null||t.isBlank()?null:dao.findByRememberToken(t);}
 public String createRememberToken(User u){byte[] b=new byte[32];random.nextBytes(b);String t=HexFormat.of().formatHex(b);dao.updateRememberToken(u.getUserId(),t);u.setRememberToken(t);return t;}
 public void clearRememberToken(int id){dao.updateRememberToken(id,null);}
 public boolean register(String u,String p,String f){return registerWithEmail(u,null,p,f);}
 public boolean registerWithEmail(String u,String email,String p,String f){
  if(u==null||p==null||f==null||u.isBlank()||p.length()<6||f.isBlank()||email==null||email.isBlank())return false;
  u=u.trim();email=email.trim().toLowerCase();f=f.trim();if(dao.existsByUsername(u)||dao.existsByEmail(email))return false;
  User x=new User();x.setUsername(u);x.setEmail(email);x.setPasswordHash(hash(p));x.setFullName(f);x.setActive(false);
  String otp=otp();x.setOtpCode(otp);x.setOtpExpiry(LocalDateTime.now().plusMinutes(5));dao.insert(x);
  if(!EmailService.sendOtp(email,otp,"Xác thực tài khoản")){ dao.delete(x.getUserId()); return false; }
  return true;
 }
 public boolean verifyOtp(String username,String code){User u=dao.findByUsernameAnyStatus(username);if(u==null||u.isActive()||code==null||!code.equals(u.getOtpCode())||u.getOtpExpiry()==null||LocalDateTime.now().isAfter(u.getOtpExpiry()))return false;u.setActive(true);u.setOtpCode(null);u.setOtpExpiry(null);dao.update(u);return true;}
 public boolean sendForgotPasswordOtp(String value){if(value==null||value.isBlank())return false;User u=dao.findByUsernameOrEmail(value.trim());if(u==null)return false;String otp=otp();u.setOtpCode(otp);u.setOtpExpiry(LocalDateTime.now().plusMinutes(5));dao.update(u);return EmailService.sendOtp(u.getEmail(),otp,"Mã OTP đặt lại mật khẩu");}
 public boolean resetPasswordWithOtp(String value,String code,String p){if(value==null||code==null||p==null||p.length()<6)return false;User u=dao.findByUsernameOrEmail(value.trim());if(u==null||u.getOtpCode()==null||!code.equals(u.getOtpCode())||u.getOtpExpiry()==null||LocalDateTime.now().isAfter(u.getOtpExpiry()))return false;u.setPasswordHash(hash(p));u.setOtpCode(null);u.setOtpExpiry(null);u.setRememberToken(null);dao.update(u);return true;}
 public boolean resetPassword(String u,String f,String p){if(u==null||f==null||p==null||p.length()<6)return false;return dao.resetPassword(u.trim(),f.trim(),hash(p));}
 public boolean updateProfile(int id,String n,String ph,String im){if(n==null||n.isBlank())return false;return dao.updateProfile(id,n.trim(),ph==null?"":ph.trim(),im);}
 private String otp(){return String.format("%06d",random.nextInt(1_000_000));}
 public static String hash(String v){try{MessageDigest md=MessageDigest.getInstance("SHA-256");return HexFormat.of().formatHex(md.digest(v.getBytes(java.nio.charset.StandardCharsets.UTF_8)));}catch(Exception e){throw new IllegalStateException(e);}}
}
