package com.vovanthinh.dao.impl;
import jakarta.persistence.EntityManager;
import com.vovanthinh.dao.UserDAO;
import com.vovanthinh.jpa.JPAUtil;
import com.vovanthinh.model.User;
public class UserDAOImpl implements UserDAO {
 public User findByUsername(String x){return one("SELECT u FROM User u WHERE u.username=:v AND u.active=true",x);}
 public User findByEmail(String x){return one("SELECT u FROM User u WHERE u.email=:v AND u.active=true",x);}
 public User findByUsernameOrEmail(String x){return one("SELECT u FROM User u WHERE (u.username=:v OR LOWER(u.email)=LOWER(:v)) AND u.active=true",x);}
 public User findByUsernameAnyStatus(String x){return one("SELECT u FROM User u WHERE u.username=:v",x);}
 private User one(String q,String v){try(EntityManager em=JPAUtil.getEntityManager()){var l=em.createQuery(q,User.class).setParameter("v",v).setMaxResults(1).getResultList();return l.isEmpty()?null:l.get(0);}}
 public User findByRememberToken(String t){return one("SELECT u FROM User u WHERE u.rememberToken=:v AND u.active=true",t);}
 public void updateRememberToken(int id,String token){tx(em->{User u=em.find(User.class,id);if(u!=null)u.setRememberToken(token);});}
 public boolean existsByUsername(String x){return count("SELECT COUNT(u) FROM User u WHERE u.username=:v",x)>0;}
 public boolean existsByEmail(String x){return count("SELECT COUNT(u) FROM User u WHERE u.email=:v",x)>0;}
 private long count(String q,String v){try(EntityManager em=JPAUtil.getEntityManager()){return em.createQuery(q,Long.class).setParameter("v",v).getSingleResult();}}
 public void insert(User u){tx(em->em.persist(u));}
 public void delete(int id){tx(em->{User u=em.find(User.class,id);if(u!=null)em.remove(u);});}
 public void update(User u){tx(em->em.merge(u));}
 public boolean resetPassword(String username,String fullName,String ph){EntityManager em=JPAUtil.getEntityManager();try{em.getTransaction().begin();int n=em.createQuery("UPDATE User u SET u.passwordHash=:p,u.rememberToken=NULL WHERE u.username=:u AND u.fullName=:f AND u.active=true").setParameter("p",ph).setParameter("u",username).setParameter("f",fullName).executeUpdate();em.getTransaction().commit();return n>0;}catch(RuntimeException e){if(em.getTransaction().isActive())em.getTransaction().rollback();throw e;}finally{em.close();}}
 public boolean updateProfile(int id,String name,String phone,String image){EntityManager em=JPAUtil.getEntityManager();try{em.getTransaction().begin();User u=em.find(User.class,id);if(u==null){em.getTransaction().rollback();return false;}u.setFullName(name);u.setPhone(phone);if(image!=null&&!image.isBlank())u.setImage(image);em.getTransaction().commit();return true;}catch(RuntimeException e){if(em.getTransaction().isActive())em.getTransaction().rollback();throw e;}finally{em.close();}}
 private void tx(java.util.function.Consumer<EntityManager>a){EntityManager em=JPAUtil.getEntityManager();try{em.getTransaction().begin();a.accept(em);em.getTransaction().commit();}catch(RuntimeException e){if(em.getTransaction().isActive())em.getTransaction().rollback();throw e;}finally{em.close();}}
}
