package com.vovanthinh.dao.impl;

import java.util.List;
import java.util.function.Consumer;

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
            if (product != null) {
                em.remove(product);
            }
        });
    }

    @Override
    public Product get(int id) {
        try (EntityManager em = JPAUtil.getEntityManager()) {
            return em.createQuery(
                    "SELECT p FROM Product p LEFT JOIN FETCH p.category WHERE p.productId = :id",
                    Product.class
            )
            .setParameter("id", id)
            .getResultStream()
            .findFirst()
            .orElse(null);
        }
    }

    @Override
    public List<Product> getAll() {
        try (EntityManager em = JPAUtil.getEntityManager()) {
            return em.createQuery(
                    "SELECT p FROM Product p LEFT JOIN FETCH p.category ORDER BY p.productId DESC",
                    Product.class
            ).getResultList();
        }
    }

    @Override
    public List<Product> search(String keyword) {
        try (EntityManager em = JPAUtil.getEntityManager()) {
            String searchPattern = "%" + (keyword == null ? "" : keyword.trim()).toLowerCase() + "%";
            return em.createQuery(
                    "SELECT p FROM Product p LEFT JOIN FETCH p.category " +
                    "WHERE LOWER(p.productName) LIKE :k " +
                    "OR LOWER(p.brand) LIKE :k " +
                    "ORDER BY p.productId DESC",
                    Product.class
            )
            .setParameter("k", searchPattern)
            .getResultList();
        }
    }

    @Override
    public List<Product> findTop10Newest() {
        try (EntityManager em = JPAUtil.getEntityManager()) {
            return em.createQuery(
                    "SELECT p FROM Product p LEFT JOIN FETCH p.category ORDER BY p.productId DESC",
                    Product.class
            )
            .setMaxResults(10)
            .getResultList();
        }
    }

    @Override
    public List<Product> findPaging(int page, int pageSize) {
        int safePage = Math.max(1, page);
        int safeSize = Math.max(1, pageSize);
        try (EntityManager em = JPAUtil.getEntityManager()) {
            return em.createQuery(
                    "SELECT p FROM Product p LEFT JOIN FETCH p.category ORDER BY p.productId DESC",
                    Product.class
            )
            .setFirstResult((safePage - 1) * safeSize)
            .setMaxResults(safeSize)
            .getResultList();
        }
    }

    @Override
    public long countTotalProducts() {
        try (EntityManager em = JPAUtil.getEntityManager()) {
            return em.createQuery("SELECT COUNT(p) FROM Product p", Long.class).getSingleResult();
        }
    }

    @Override
    public List<Product> findPagingFiltered(Integer categoryId, String brand, String keyword, int page, int pageSize) {
        int safePage = Math.max(1, page);
        int safeSize = Math.max(1, pageSize);
        try (EntityManager em = JPAUtil.getEntityManager()) {
            StringBuilder hql = new StringBuilder("SELECT p FROM Product p LEFT JOIN FETCH p.category WHERE 1=1 ");
            if (categoryId != null && categoryId > 0) {
                hql.append("AND p.category.cateId = :categoryId ");
            }
            if (brand != null && !brand.isBlank()) {
                hql.append("AND LOWER(p.brand) = :brand ");
            }
            if (keyword != null && !keyword.isBlank()) {
                hql.append("AND (LOWER(p.productName) LIKE :kw OR LOWER(p.brand) LIKE :kw) ");
            }
            hql.append("ORDER BY p.productId DESC");

            var query = em.createQuery(hql.toString(), Product.class);
            if (categoryId != null && categoryId > 0) {
                query.setParameter("categoryId", categoryId);
            }
            if (brand != null && !brand.isBlank()) {
                query.setParameter("brand", brand.trim().toLowerCase());
            }
            if (keyword != null && !keyword.isBlank()) {
                query.setParameter("kw", "%" + keyword.trim().toLowerCase() + "%");
            }

            return query.setFirstResult((safePage - 1) * safeSize)
                    .setMaxResults(safeSize)
                    .getResultList();
        }
    }

    @Override
    public long countTotalFiltered(Integer categoryId, String brand, String keyword) {
        try (EntityManager em = JPAUtil.getEntityManager()) {
            StringBuilder hql = new StringBuilder("SELECT COUNT(p) FROM Product p WHERE 1=1 ");
            if (categoryId != null && categoryId > 0) {
                hql.append("AND p.category.cateId = :categoryId ");
            }
            if (brand != null && !brand.isBlank()) {
                hql.append("AND LOWER(p.brand) = :brand ");
            }
            if (keyword != null && !keyword.isBlank()) {
                hql.append("AND (LOWER(p.productName) LIKE :kw OR LOWER(p.brand) LIKE :kw) ");
            }

            var query = em.createQuery(hql.toString(), Long.class);
            if (categoryId != null && categoryId > 0) {
                query.setParameter("categoryId", categoryId);
            }
            if (brand != null && !brand.isBlank()) {
                query.setParameter("brand", brand.trim().toLowerCase());
            }
            if (keyword != null && !keyword.isBlank()) {
                query.setParameter("kw", "%" + keyword.trim().toLowerCase() + "%");
            }

            return query.getSingleResult();
        }
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
