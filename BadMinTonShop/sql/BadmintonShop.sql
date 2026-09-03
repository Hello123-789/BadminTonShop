CREATE DATABASE IF NOT EXISTS BadmintonShop CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE BadmintonShop;

DROP TABLE IF EXISTS OrderDetail;
DROP TABLE IF EXISTS Orders;
DROP TABLE IF EXISTS Product;
DROP TABLE IF EXISTS Users;

CREATE TABLE Users(
 user_id INT PRIMARY KEY AUTO_INCREMENT, username VARCHAR(50) NOT NULL UNIQUE, password_hash VARCHAR(64) NOT NULL,
 full_name VARCHAR(100) NOT NULL, role VARCHAR(20) NOT NULL DEFAULT 'USER', remember_token VARCHAR(64) NULL UNIQUE, active TINYINT(1) NOT NULL DEFAULT 1
);

INSERT INTO Users(username,password_hash,full_name,role) VALUES
('admin','240be518fabd2724ddb6f04eeb1da5967448d7e831c08c8fa822809f74c720a9','Quản trị viên','ADMIN'),
('user','e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446','Khách hàng','USER');

CREATE TABLE Product(
 product_id INT PRIMARY KEY AUTO_INCREMENT,
 product_name VARCHAR(200) NOT NULL,
 brand VARCHAR(100) NOT NULL,
 price DECIMAL(12,2) NOT NULL,
 quantity INT NOT NULL DEFAULT 0,
 image VARCHAR(255),
 description TEXT
);

INSERT INTO Product(product_name,brand,price,quantity,image,description) VALUES
('Yonex Astrox 88D Pro','Yonex',3990000,15,'uploads/yonex-astrox-88d-pro.jpg','Vợt cầu lông Yonex Astrox 88D Pro.'),
('Victor Thruster Ryuga II Pro','Victor',4290000,10,'uploads/victor-thruster-ryuga-ii-pro.jpg','Vợt cầu lông Victor Thruster Ryuga II Pro.'),
('Li-Ning Axforce 100','Li-Ning',4990000,10,'uploads/lining-axforce-100.jpg','Vợt cầu lông Li-Ning Axforce 100.'),
('Mizuno Fortius 11 Power','Mizuno',3290000,10,'uploads/mizuno-fortius-11-power.jpg','Vợt cầu lông Mizuno Fortius 11 Power.'),
('Apacs Z-Ziggler','Apacs',1490000,10,'uploads/apacs-z-ziggler.jpg','Vợt cầu lông Apacs Z-Ziggler.'),
('Yonex Duora Z Strike','Yonex',5500000,10,'uploads/yonex-duora-z-strike.jpg','Vợt cầu lông Yonex Duora Z Strike.'),
('Astrox 77 Tour','Yonex',2899000,10,'uploads/yonex-astrox-77-tour.jpg','Vợt cầu lông Yonex Astrox 77 Tour.'),
('Yonex Nanoflare 1000 Tour','Yonex',3599000,10,'uploads/yonex-nanoflare-1000-tour.jpg','Vợt cầu lông Yonex Nanoflare 1000 Tour.'),
('Victor Auraspeed 100X B 2026','Victor',4350000,10,'uploads/victor-auraspeed-100x-b-2026.jpg','Vợt cầu lông Victor Auraspeed 100X B 2026.'),
('Victor Thruster Hammer Light','Victor',1250000,10,'uploads/victor-thruster-hammer-light.jpg','Vợt cầu lông Victor Thruster Hammer Light.'),
('Victor DriveX 12 O Zheng Siwei','Victor',3590000,10,'uploads/victor-drivex-12-o-zheng-siwei.jpg','Vợt cầu lông Victor DriveX 12 O Zheng Siwei.'),
('Victor Jetspeed S12 II R','Victor',3900000,10,'uploads/victor-jetspeed-s12-ii-r.jpg','Vợt cầu lông Victor Jetspeed S12 II R.'),
('Li-Ning Black-Iron - Fire Red P-AYP1746-4','Li-Ning',735000,10,'uploads/lining-black-iron-fire-red.jpg','Vợt cầu lông Li-Ning Black-Iron Fire Red.'),
('Li-Ning Fengying BLADEX SPR Pink (4U) AYTP365-4','Li-Ning',618000,10,'uploads/lining-fengying-bladex-spr-pink.jpg','Vợt cầu lông Li-Ning Fengying BLADEX SPR Pink.'),
('TURBOCHARGING 01D P-AYP032-4','Li-Ning',927000,10,'uploads/lining-turbocharging-01d.jpg','Vợt cầu lông Li-Ning TURBOCHARGING 01D.'),
('Li-Ning Fengying BladeX 200 (J) P-AYPT357-3','Li-Ning',859000,10,'uploads/lining-fengying-bladex-200.jpg','Vợt cầu lông Li-Ning Fengying BladeX 200.'),
('Mizuno Altair 5.3 Ryūjin','Mizuno',3640000,10,'uploads/mizuno-altair-5-3-ryujin.jpg','Vợt cầu lông Mizuno Altair 5.3 Ryūjin.'),
('Mizuno Altair T329','Mizuno',1400000,10,'uploads/mizuno-altair-t329.jpg','Vợt cầu lông Mizuno Altair T329.'),
('Apacs Pro Commander 6.4','Apacs',1879000,10,'uploads/apacs-pro-commander-6-4.jpg','Vợt cầu lông Apacs Pro Commander 6.4.'),
('Apacs Honor Pro New','Apacs',2500000,10,'uploads/apacs-honor-pro-new.jpg','Vợt cầu lông Apacs Honor Pro New.');
