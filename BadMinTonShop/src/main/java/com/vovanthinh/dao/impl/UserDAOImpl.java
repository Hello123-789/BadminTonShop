package com.vovanthinh.dao.impl;

import jakarta.persistence.EntityManager;
import com.vovanthinh.dao.UserDAO;
import com.vovanthinh.jpa.JPAUtil;
import com.vovanthinh.model.User;

public class UserDAOImpl implements UserDAO {

    @Override
    public User findByUsername(String username) {
        try (EntityManager em = JPAUtil.getEntityManager()) {
            var list = em.createQuery(
                    "SELECT u FROM User u WHERE u.username = :username AND u.active = true",
                    User.class)
                    .setParameter("username", username)
                    .setMaxResults(1)
                    .getResultList();
            return list.isEmpty() ? null : list.get(0);
        }
    }

    @Override
    public User findByRememberToken(String token) {
        try (EntityManager em = JPAUtil.getEntityManager()) {
            var list = em.createQuery(
                    "SELECT u FROM User u WHERE u.rememberToken = :token AND u.active = true",
                    User.class)
                    .setParameter("token", token)
                    .setMaxResults(1)
                    .getResultList();
            return list.isEmpty() ? null : list.get(0);
        }
    }

    @Override
    public void updateRememberToken(int userId, String token) {
        executeInTransaction(em -> {
            User user = em.find(User.class, userId);
            if (user != null) user.setRememberToken(token);
        });
    }

    @Override
    public boolean existsByUsername(String username) {
        try (EntityManager em = JPAUtil.getEntityManager()) {
            Long count = em.createQuery(
                    "SELECT COUNT(u) FROM User u WHERE u.username = :username", Long.class)
                    .setParameter("username", username)
                    .getSingleResult();
            return count > 0;
        }
    }

    @Override
    public void insert(User user) {
        executeInTransaction(em -> em.persist(user));
    }

    @Override
    public boolean resetPassword(String username, String fullName, String passwordHash) {
        EntityManager em = JPAUtil.getEntityManager();
        try {
            em.getTransaction().begin();
            int updated = em.createQuery(
                    "UPDATE User u SET u.passwordHash = :passwordHash, " +
                    "u.rememberToken = NULL " +
                    "WHERE u.username = :username AND u.fullName = :fullName AND u.active = true")
                    .setParameter("passwordHash", passwordHash)
                    .setParameter("username", username)
                    .setParameter("fullName", fullName)
                    .executeUpdate();
            em.getTransaction().commit();
            return updated > 0;
        } catch (RuntimeException e) {
            if (em.getTransaction().isActive()) em.getTransaction().rollback();
            throw e;
        } finally {
            em.close();
        }
    }

    private void executeInTransaction(java.util.function.Consumer<EntityManager> action) {
        EntityManager em = JPAUtil.getEntityManager();
        try {
            em.getTransaction().begin();
            action.accept(em);
            em.getTransaction().commit();
        } catch (RuntimeException e) {
            if (em.getTransaction().isActive()) em.getTransaction().rollback();
            throw e;
        } finally {
            em.close();
        }
    }
}
