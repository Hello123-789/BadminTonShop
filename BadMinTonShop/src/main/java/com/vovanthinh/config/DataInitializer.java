package com.vovanthinh.config;

import jakarta.persistence.EntityManager;
import jakarta.servlet.ServletContextEvent;
import jakarta.servlet.ServletContextListener;
import jakarta.servlet.annotation.WebListener;
import com.vovanthinh.jpa.JPAUtil;
import com.vovanthinh.model.Product;
import com.vovanthinh.model.User;
import com.vovanthinh.service.impl.UserServiceImpl;

@WebListener
public class DataInitializer implements ServletContextListener {
    @Override
    public void contextInitialized(ServletContextEvent event) {
        try (EntityManager em = JPAUtil.getEntityManager()) {
            em.getTransaction().begin();
            seedUsers(em);
            seedProducts(em);
            em.getTransaction().commit();
        } catch (Exception e) {
            throw new IllegalStateException("Không thể khởi tạo dữ liệu JPA.", e);
        }
    }

    private void seedUsers(EntityManager em) {
        Long count = em.createQuery("SELECT COUNT(u) FROM User u", Long.class).getSingleResult();
        if (count > 0) return;

        User admin = new User();
        admin.setUsername("admin");
        admin.setPasswordHash(UserServiceImpl.hash("admin123"));
        admin.setFullName("Quản trị viên");
        admin.setRole("ADMIN");
        admin.setActive(true);
        em.persist(admin);

        User user = new User();
        user.setUsername("user");
        user.setPasswordHash(UserServiceImpl.hash("user123"));
        user.setFullName("Khách hàng");
        user.setRole("USER");
        user.setActive(true);
        em.persist(user);
    }

    private void seedProducts(EntityManager em) {
        Long count = em.createQuery("SELECT COUNT(p) FROM Product p", Long.class).getSingleResult();
        if (count > 0) return;
        persistProduct(em, "Yonex Astrox 88D Pro", "Yonex", 3990000, 10, "uploads/yonex-astrox-88d-pro.jpg", "Vợt cầu lông Yonex Astrox 88D Pro.");
        persistProduct(em, "Victor Thruster Ryuga II Pro", "Victor", 4290000, 10, "uploads/victor-thruster-ryuga-ii-pro.jpg", "Vợt cầu lông Victor Thruster Ryuga II Pro.");
        persistProduct(em, "Li-Ning Axforce 100", "Li-Ning", 4990000, 10, "uploads/lining-axforce-100.jpg", "Vợt cầu lông Li-Ning Axforce 100.");
        persistProduct(em, "Mizuno Fortius 11 Power", "Mizuno", 3290000, 10, "uploads/mizuno-fortius-11-power.jpg", "Vợt cầu lông Mizuno Fortius 11 Power.");
        persistProduct(em, "Apacs Z-Ziggler", "Apacs", 1490000, 10, "uploads/apacs-z-ziggler.jpg", "Vợt cầu lông Apacs Z-Ziggler.");
        persistProduct(em, "Yonex Duora Z Strike", "Yonex", 5500000, 10, "uploads/yonex-duora-z-strike.jpg", "Vợt cầu lông Yonex Duora Z Strike.");
        persistProduct(em, "Astrox 77 Tour", "Yonex", 2899000, 10, "uploads/yonex-astrox-77-tour.jpg", "Vợt cầu lông Yonex Astrox 77 Tour.");
        persistProduct(em, "Yonex Nanoflare 1000 Tour", "Yonex", 3599000, 10, "uploads/yonex-nanoflare-1000-tour.jpg", "Vợt cầu lông Yonex Nanoflare 1000 Tour.");
        persistProduct(em, "Victor Auraspeed 100X B 2026", "Victor", 4350000, 10, "uploads/victor-auraspeed-100x-b-2026.jpg", "Vợt cầu lông Victor Auraspeed 100X B 2026.");
        persistProduct(em, "Victor Thruster Hammer Light", "Victor", 1250000, 10, "uploads/victor-thruster-hammer-light.jpg", "Vợt cầu lông Victor Thruster Hammer Light.");
        persistProduct(em, "Victor DriveX 12 O Zheng Siwei", "Victor", 3590000, 10, "uploads/victor-drivex-12-o-zheng-siwei.jpg", "Vợt cầu lông Victor DriveX 12 O Zheng Siwei.");
        persistProduct(em, "Victor Jetspeed S12 II R", "Victor", 3900000, 10, "uploads/victor-jetspeed-s12-ii-r.jpg", "Vợt cầu lông Victor Jetspeed S12 II R.");
        persistProduct(em, "Li-Ning Black-Iron - Fire Red P-AYP1746-4", "Li-Ning", 735000, 10, "uploads/lining-black-iron-fire-red.jpg", "Vợt cầu lông Li-Ning Black-Iron Fire Red.");
        persistProduct(em, "Li-Ning Fengying BLADEX SPR Pink (4U) AYTP365-4", "Li-Ning", 618000, 10, "uploads/lining-fengying-bladex-spr-pink.jpg", "Vợt cầu lông Li-Ning Fengying BLADEX SPR Pink.");
        persistProduct(em, "TURBOCHARGING 01D P-AYP032-4", "Li-Ning", 927000, 10, "uploads/lining-turbocharging-01d.jpg", "Vợt cầu lông Li-Ning TURBOCHARGING 01D.");
        persistProduct(em, "Li-Ning Fengying BladeX 200 (J) P-AYPT357-3", "Li-Ning", 859000, 10, "uploads/lining-fengying-bladex-200.jpg", "Vợt cầu lông Li-Ning Fengying BladeX 200.");
        persistProduct(em, "Mizuno Altair 5.3 Ryūjin", "Mizuno", 3640000, 10, "uploads/mizuno-altair-5-3-ryujin.jpg", "Vợt cầu lông Mizuno Altair 5.3 Ryūjin.");
        persistProduct(em, "Mizuno Altair T329", "Mizuno", 1400000, 10, "uploads/mizuno-altair-t329.jpg", "Vợt cầu lông Mizuno Altair T329.");
        persistProduct(em, "Apacs Pro Commander 6.4", "Apacs", 1879000, 10, "uploads/apacs-pro-commander-6-4.jpg", "Vợt cầu lông Apacs Pro Commander 6.4.");
        persistProduct(em, "Apacs Honor Pro New", "Apacs", 2500000, 10, "uploads/apacs-honor-pro-new.jpg", "Vợt cầu lông Apacs Honor Pro New.");
    }

    private void persistProduct(EntityManager em, String name, String brand, int price, int quantity, String image, String description) {
        Product p = new Product();
        p.setProductName(name);
        p.setBrand(brand);
        p.setPrice(java.math.BigDecimal.valueOf(price));
        p.setQuantity(quantity);
        p.setImage(image);
        p.setDescription(description);
        em.persist(p);
    }

    @Override
    public void contextDestroyed(ServletContextEvent event) {
        JPAUtil.close();
    }
}
