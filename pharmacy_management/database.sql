-- ================================================================
-- Pharmacy Management System - Compatibility Database
-- Import this file into phpMyAdmin before using the app.
-- The backend logic stays unchanged, so table and column names are
-- preserved for compatibility while the stored data represents a
-- pharmacy workflow.
-- ================================================================

CREATE DATABASE IF NOT EXISTS library_db CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE library_db;

CREATE TABLE IF NOT EXISTS admins (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL
) ENGINE=InnoDB COMMENT='Pharmacy system administrator accounts.';

CREATE TABLE IF NOT EXISTS librarians (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    contact VARCHAR(20) NOT NULL,
    username VARCHAR(50) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL
) ENGINE=InnoDB COMMENT='Pharmacist staff accounts (compatibility table name).';

CREATE TABLE IF NOT EXISTS books (
    id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(200) NOT NULL,
    author VARCHAR(100) NOT NULL,
    quantity INT NOT NULL DEFAULT 0,
    price DECIMAL(10,2) NOT NULL DEFAULT 0.00,
    librarian_id INT NULL,
    FOREIGN KEY (librarian_id) REFERENCES librarians(id) ON DELETE SET NULL
) ENGINE=InnoDB COMMENT='Medicine inventory records (compatibility table name).';

ALTER TABLE librarians
    MODIFY name VARCHAR(100) NOT NULL COMMENT 'Pharmacist full name',
    MODIFY contact VARCHAR(20) NOT NULL COMMENT 'Staff phone number',
    MODIFY username VARCHAR(50) NOT NULL COMMENT 'Pharmacist login username',
    MODIFY password VARCHAR(255) NOT NULL COMMENT 'Hashed password';

ALTER TABLE books
    MODIFY title VARCHAR(200) NOT NULL COMMENT 'Medicine name',
    MODIFY author VARCHAR(100) NOT NULL COMMENT 'Manufacturer or brand',
    MODIFY quantity INT NOT NULL DEFAULT 0 COMMENT 'Current stock units',
    MODIFY price DECIMAL(10,2) NOT NULL DEFAULT 0.00 COMMENT 'Selling price per unit',
    MODIFY librarian_id INT NULL COMMENT 'Pharmacist who created the medicine entry';

INSERT INTO books (title, author, quantity, price, librarian_id)
SELECT seed.title, seed.author, seed.quantity, seed.price, seed.librarian_id
FROM (
    SELECT 'Napa 500mg' AS title, 'Beximco Pharma' AS author, 150 AS quantity, 1.50 AS price, NULL AS librarian_id
    UNION ALL
    SELECT 'Seclo 20mg', 'Square Pharmaceuticals', 80, 6.00, NULL
    UNION ALL
    SELECT 'Monas 10mg', 'Incepta Pharmaceuticals', 65, 12.00, NULL
    UNION ALL
    SELECT 'ORS Powder', 'Renata Limited', 200, 0.75, NULL
) AS seed
WHERE NOT EXISTS (SELECT 1 FROM books);
