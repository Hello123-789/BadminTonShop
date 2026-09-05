package com.vovanthinh.dao.impl;
import java.util.List;
import jakarta.persistence.EntityManager;
import com.vovanthinh.dao.CategoryDAO;
import com.vovanthinh.jpa.JPAUtil;
import com.vovanthinh.model.Category;
public class CategoryDAOImpl implements CategoryDAO {
 public List<Category> getAll(){try(EntityManager em=JPAUtil.getEntityManager()){return em.createQuery("SELECT c FROM Category c ORDER BY c.cateId",Category.class).getResultList();}}
 public Category get(int id){try(EntityManager em=JPAUtil.getEntityManager()){return em.find(Category.class,id);}}
 public void insert(Category c){tx(em->em.persist(c));}
 public void update(Category c){tx(em->em.merge(c));}
 public void delete(int id){tx(em->{Category c=em.find(Category.class,id);if(c!=null)em.remove(c);});}
 private void tx(java.util.function.Consumer<EntityManager>a){EntityManager em=JPAUtil.getEntityManager();try{em.getTransaction().begin();a.accept(em);em.getTransaction().commit();}catch(RuntimeException e){if(em.getTransaction().isActive())em.getTransaction().rollback();throw e;}finally{em.close();}}
}
