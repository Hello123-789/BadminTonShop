package com.vovanthinh.test;

import jakarta.persistence.EntityManager;
import com.vovanthinh.jpa.JPAUtil;

public class TestConnection {
    public static void main(String[] args) {
        try (EntityManager em = JPAUtil.getEntityManager()) {
            System.out.println("JPA KET NOI MYSQL THANH CONG: " +
                    em.createNativeQuery("SELECT DATABASE()").getSingleResult());
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            JPAUtil.close();
        }
    }
}
