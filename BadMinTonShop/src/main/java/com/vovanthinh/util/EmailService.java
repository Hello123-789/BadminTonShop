package com.vovanthinh.util;

import jakarta.mail.*;
import jakarta.mail.internet.*;
import java.util.Properties;

public class EmailService {

    // Gmail dùng để gửi OTP
    private static final String SENDER_EMAIL = "vovanthinh2006@gmail.com";

    // Google App Password của Gmail trên
    private static final String SENDER_PASSWORD = "bsdx ases fdmu uegp";

    public static boolean sendOtp(
            String recipientEmail,
            String otp,
            String purpose) {

        try {
            Properties props = new Properties();

            props.put("mail.smtp.host", "smtp.gmail.com");
            props.put("mail.smtp.port", "587");
            props.put("mail.smtp.auth", "true");
            props.put("mail.smtp.starttls.enable", "true");

            Session session = Session.getInstance(
                    props,
                    new Authenticator() {
                        @Override
                        protected PasswordAuthentication getPasswordAuthentication() {
                            return new PasswordAuthentication(
                                    SENDER_EMAIL,
                                    SENDER_PASSWORD
                            );
                        }
                    }
            );

            MimeMessage m = new MimeMessage(session);

            m.setFrom(new InternetAddress(SENDER_EMAIL));
            m.setRecipients(
                    Message.RecipientType.TO,
                    InternetAddress.parse(recipientEmail)
            );

            m.setSubject(
                    "Badminton Shop - " + purpose,
                    "UTF-8"
            );

            m.setText(
                    "Mã OTP của bạn là: " + otp +
                    "\n\nMã OTP có hiệu lực trong 5 phút.",
                    "UTF-8"
            );

            Transport.send(m);

            System.out.println(
                    "[EmailService] Đã gửi OTP tới " + recipientEmail
            );

            return true;

        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
}