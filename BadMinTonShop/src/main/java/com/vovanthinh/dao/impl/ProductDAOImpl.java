package com.vovanthinh.dao.impl;

import java.util.List;
import jakarta.persistence.EntityManager;
import com.vovanthinh.dao.ProductDAO;
import com.vovanthinh.jpa.JPAUtil;
import com.vovanthinh.model.Product;

public class ProductDAOImpl implements ProductDAO {

    @Override
    public void insert(Product product) {
        executeInTransaction(em -> em.persist(product));
    }

    @Override
    public void update(Product product) {
        executeInTransaction(em -> em.merge(product));
    }

    @Override
    public void delete(int id) {
        executeInTransaction(em -> {
            Product product = em.find(Product.class, id);
            if (product != null) em.remove(product);
        });
    }

    @Override
    public Product get(int id) {
        try (EntityManager em = JPAUtil.getEntityManager()) {
            return em.find(Product.class, id);
        }
    }

    @Override
    public List<Product> getAll() {
        try (EntityManager em = JPAUtil.getEntityManager()) {
            return em.createNamedQuery("Product.findAll", Product.class).getResultList();
        }
    }

    @Override
    public List<Product> search(String keyword) {
        try (EntityManager em = JPAUtil.getEntityManager()) {
            String k = "%" + (keyword == null ? "" : keyword.trim()).toLowerCase() + "%";
            return em.createQuery(
                    "SELECT p FROM Product p " +
                    "WHERE LOWER(p.productName) LIKE :k " +
                    "OR LOWER(p.brand) LIKE :k " +
                    "OR LOWER(COALESCE(p.description, '')) LIKE :k " +
                    "ORDER BY p.productId DESC", Product.class)
                    .setParameter("k", k)
                    .getResultList();
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
