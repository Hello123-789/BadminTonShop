package com.vovanthinh.dao.impl;

import java.util.List;
import java.util.function.Consumer;

import jakarta.persistence.EntityManager;

import com.vovanthinh.dao.CategoryDAO;
import com.vovanthinh.jpa.JPAUtil;
import com.vovanthinh.model.Category;

public class CategoryDAOImpl implements CategoryDAO {

    @Override
    public List<Category> getAll() {
        try (EntityManager em = JPAUtil.getEntityManager()) {
            return em.createQuery("SELECT c FROM Category c ORDER BY c.cateId", Category.class).getResultList();
        }
    }

    @Override
    public Category get(int id) {
        try (EntityManager em = JPAUtil.getEntityManager()) {
            return em.find(Category.class, id);
        }
    }

    @Override
    public void insert(Category category) {
        executeInTransaction(em -> em.persist(category));
    }

    @Override
    public void update(Category category) {
        executeInTransaction(em -> em.merge(category));
    }

    @Override
    public void delete(int id) {
        executeInTransaction(em -> {
            Category category = em.find(Category.class, id);
            if (category != null) {
                em.remove(category);
            }
        });
    }

    private void executeInTransaction(Consumer<EntityManager> action) {
        EntityManager em = JPAUtil.getEntityManager();
        try {
            em.getTransaction().begin();
            action.accept(em);
            em.getTransaction().commit();
        } catch (RuntimeException e) {
            if (em.getTransaction().isActive()) {
                em.getTransaction().rollback();
            }
            throw e;
        } finally {
            em.close();
        }
    }
}
