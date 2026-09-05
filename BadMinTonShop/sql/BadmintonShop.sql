-- =========================================================
-- 1. TẠO DATABASE
-- =========================================================

CREATE DATABASE IF NOT EXISTS BadmintonShop
CHARACTER SET utf8mb4
COLLATE utf8mb4_unicode_ci;

USE BadmintonShop;


-- =========================================================
-- 2. XÓA BẢNG CŨ
-- =========================================================

DROP TABLE IF EXISTS OrderDetail;
DROP TABLE IF EXISTS Orders;
DROP TABLE IF EXISTS Product;
DROP TABLE IF EXISTS Category;
DROP TABLE IF EXISTS Users;


-- =========================================================
-- 3. BẢNG USERS
-- =========================================================

CREATE TABLE Users (
    user_id INT PRIMARY KEY AUTO_INCREMENT,

    username VARCHAR(50) NOT NULL UNIQUE,

    password_hash VARCHAR(64) NOT NULL,

    full_name VARCHAR(100) NOT NULL,

    email VARCHAR(100) NOT NULL UNIQUE,

    phone VARCHAR(20) NULL,

    image VARCHAR(255) NULL,

    role VARCHAR(20) NOT NULL DEFAULT 'USER',

    remember_token VARCHAR(64) NULL UNIQUE,

    active TINYINT(1) NOT NULL DEFAULT 1,

    otp_code VARCHAR(10) NULL,

    otp_expiry DATETIME NULL
);


-- =========================================================
-- 4. DỮ LIỆU USERS
-- =========================================================

INSERT INTO Users
(
    username,
    password_hash,
    full_name,
    email,
    role,
    active
)
VALUES
(
    'admin',
    '240be518fabd2724ddb6f04eeb1da5967448d7e831c08c8fa822809f74c720a9',
    'Quản trị viên',
    'admin@example.com',
    'ADMIN',
    1
),
(
    'user',
    'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446',
    'Khách hàng',
    'user@example.com',
    'USER',
    1
);


-- =========================================================
-- 5. BẢNG CATEGORY
-- =========================================================

CREATE TABLE Category (
    cate_id INT PRIMARY KEY AUTO_INCREMENT,

    cate_name VARCHAR(100) NOT NULL UNIQUE,

    icons VARCHAR(255) NULL
);


-- =========================================================
-- 6. DỮ LIỆU CATEGORY
-- =========================================================

INSERT INTO Category
(
    cate_name,
    icons
)
VALUES
(
    'Vợt cầu lông',
    NULL
),
(
    'Phụ kiện',
    NULL
),
(
    'Giày cầu lông',
    NULL
);


-- =========================================================
-- 7. BẢNG PRODUCT
-- =========================================================

CREATE TABLE Product (
    product_id INT PRIMARY KEY AUTO_INCREMENT,

    product_name VARCHAR(200) NOT NULL,

    brand VARCHAR(100) NOT NULL,

    price DECIMAL(12,2) NOT NULL,

    quantity INT NOT NULL DEFAULT 0,

    image VARCHAR(255) NULL,

    description TEXT NULL,

    category_id INT NULL,

    CONSTRAINT fk_product_category
        FOREIGN KEY (category_id)
        REFERENCES Category(cate_id)
        ON UPDATE CASCADE
        ON DELETE SET NULL
);


-- =========================================================
-- 8. DỮ LIỆU VỢT CẦU LÔNG
-- category_id = 1
-- =========================================================

INSERT INTO Product
(
    product_name,
    brand,
    price,
    quantity,
    image,
    description,
    category_id
)
VALUES

(
    'Yonex Astrox 100 ZZ',
    'Yonex',
    4500000,
    10,
    'uploads/astrox100zz.jpg',
    'Vợt cầu lông cao cấp Yonex Astrox 100 ZZ.',
    1
),

(
    'Yonex Astrox 88D Pro',
    'Yonex',
    4200000,
    12,
    'uploads/astrox88dpro.jpg',
    'Vợt cầu lông Yonex Astrox 88D Pro.',
    1
),

(
    'Yonex Astrox 88S Pro',
    'Yonex',
    4100000,
    10,
    'uploads/astrox88spro.jpg',
    'Vợt cầu lông Yonex Astrox 88S Pro.',
    1
),

(
    'Yonex Nanoflare 1000 Z',
    'Yonex',
    4600000,
    8,
    'uploads/nanoflare1000z.jpg',
    'Vợt cầu lông tốc độ cao Yonex Nanoflare 1000 Z.',
    1
),

(
    'Yonex Nanoflare 800 Pro',
    'Yonex',
    3900000,
    15,
    'uploads/nanoflare800pro.jpg',
    'Vợt cầu lông Yonex Nanoflare 800 Pro.',
    1
),

(
    'Yonex Arcsaber 11 Pro',
    'Yonex',
    4000000,
    10,
    'uploads/arcsaber11pro.jpg',
    'Vợt cầu lông Yonex Arcsaber 11 Pro.',
    1
),

(
    'Victor Thruster Ryuga II',
    'Victor',
    3800000,
    9,
    'uploads/ryuga2.jpg',
    'Vợt cầu lông Victor Thruster Ryuga II.',
    1
),

(
    'Victor Auraspeed 100X',
    'Victor',
    3600000,
    11,
    'uploads/auraspeed100x.jpg',
    'Vợt cầu lông Victor Auraspeed 100X.',
    1
),

(
    'Victor Auraspeed 90K',
    'Victor',
    3500000,
    14,
    'uploads/auraspeed90k.jpg',
    'Vợt cầu lông Victor Auraspeed 90K.',
    1
),

(
    'Victor Thruster K Falcon',
    'Victor',
    3200000,
    10,
    'uploads/thrusterkfalcon.jpg',
    'Vợt cầu lông Victor Thruster K Falcon.',
    1
),

(
    'Li-Ning Axforce 100',
    'Li-Ning',
    4300000,
    8,
    'uploads/axforce100.jpg',
    'Vợt cầu lông Li-Ning Axforce 100.',
    1
),

(
    'Li-Ning Axforce 80',
    'Li-Ning',
    3900000,
    10,
    'uploads/axforce80.jpg',
    'Vợt cầu lông Li-Ning Axforce 80.',
    1
),

(
    'Li-Ning Axforce 75',
    'Li-Ning',
    3700000,
    12,
    'uploads/axforce75.jpg',
    'Vợt cầu lông Li-Ning Axforce 75.',
    1
),

(
    'Li-Ning Tectonic 9',
    'Li-Ning',
    3500000,
    9,
    'uploads/tectonic9.jpg',
    'Vợt cầu lông Li-Ning Tectonic 9.',
    1
),

(
    'Mizuno Fortius 11 Power',
    'Mizuno',
    3300000,
    10,
    'uploads/fortius11power.jpg',
    'Vợt cầu lông Mizuno Fortius 11 Power.',
    1
),

(
    'Mizuno Fortius 10 Power',
    'Mizuno',
    3100000,
    12,
    'uploads/fortius10power.jpg',
    'Vợt cầu lông Mizuno Fortius 10 Power.',
    1
),

(
    'Victor DriveX 9X',
    'Victor',
    3000000,
    15,
    'uploads/drivex9x.jpg',
    'Vợt cầu lông Victor DriveX 9X.',
    1
),

(
    'Victor Auraspeed 80X',
    'Victor',
    2900000,
    10,
    'uploads/auraspeed80x.jpg',
    'Vợt cầu lông Victor Auraspeed 80X.',
    1
),

(
    'Yonex Duora Z Strike',
    'Yonex',
    3400000,
    7,
    'uploads/duorazstrike.jpg',
    'Vợt cầu lông Yonex Duora Z Strike.',
    1
),

(
    'Yonex Voltric Z Force II',
    'Yonex',
    3700000,
    6,
    'uploads/voltriczforce2.jpg',
    'Vợt cầu lông Yonex Voltric Z Force II.',
    1
);


-- =========================================================
-- 9. DỮ LIỆU GIÀY CẦU LÔNG
-- category_id = 3
-- =========================================================

INSERT INTO Product
(
    product_name,
    brand,
    price,
    quantity,
    image,
    description,
    category_id
)
VALUES

(
    'Yonex Power Cushion 65 Z3',
    'Yonex',
    3200000,
    10,
    'uploads/65z3.jpg',
    'Giày cầu lông Yonex Power Cushion 65 Z3.',
    3
),

(
    'Yonex Power Cushion 88 Dial',
    'Yonex',
    3500000,
    8,
    'uploads/88dial.jpg',
    'Giày cầu lông Yonex Power Cushion 88 Dial.',
    3
),

(
    'Victor P9200 III',
    'Victor',
    3000000,
    10,
    'uploads/p9200iii.jpg',
    'Giày cầu lông Victor P9200 III.',
    3
),

(
    'Victor A970 Nitro Lite',
    'Victor',
    2800000,
    12,
    'uploads/a970.jpg',
    'Giày cầu lông Victor A970 Nitro Lite.',
    3
),

(
    'Li-Ning Ranger Lite',
    'Li-Ning',
    2200000,
    10,
    'uploads/rangerlite.jpg',
    'Giày cầu lông Li-Ning Ranger Lite.',
    3
),

(
    'Mizuno Wave Claw Neo',
    'Mizuno',
    2900000,
    8,
    'uploads/waveclawneo.jpg',
    'Giày cầu lông Mizuno Wave Claw Neo.',
    3
);


-- =========================================================
-- 10. DỮ LIỆU PHỤ KIỆN
-- category_id = 2
-- =========================================================

INSERT INTO Product
(
    product_name,
    brand,
    price,
    quantity,
    image,
    description,
    category_id
)
VALUES

(
    'Yonex AC102EX Power Cushion Grip',
    'Yonex',
    80000,
    50,
    'uploads/ac102ex.jpg',
    'Quấn cán vợt Yonex AC102EX.',
    2
),

(
    'Yonex Aerosensa 50',
    'Yonex',
    650000,
    30,
    'uploads/aerosensa50.jpg',
    'Cầu lông Yonex Aerosensa 50.',
    2
),

(
    'Yonex AC110EX Towel Grip',
    'Yonex',
    90000,
    40,
    'uploads/ac110ex.jpg',
    'Quấn cán khăn Yonex AC110EX.',
    2
),

(
    'Victor GR262',
    'Victor',
    70000,
    45,
    'uploads/gr262.jpg',
    'Quấn cán Victor GR262.',
    2
),

(
    'Li-Ning GP20',
    'Li-Ning',
    75000,
    40,
    'uploads/gp20.jpg',
    'Quấn cán vợt Li-Ning GP20.',
    2
),

(
    'Yonex 3D Power Cushion Socks',
    'Yonex',
    120000,
    35,
    'uploads/powersocks.jpg',
    'Vớ cầu lông Yonex 3D Power Cushion.',
    2
);
