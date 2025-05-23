-- Tạo CSDL
CREATE DATABASE IF NOT EXISTS qlns CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE qlns;

-- Bảng users: tài khoản đăng nhập
CREATE TABLE users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    role ENUM('admin', 'hr', 'employee') NOT NULL
);

-- Bảng departments: phòng ban
CREATE TABLE departments (
    department_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL UNIQUE,
    manager_id INT,
    FOREIGN KEY (manager_id) REFERENCES employees(employee_id)
);

-- Bảng employees: nhân viên
CREATE TABLE employees (
    employee_id INT AUTO_INCREMENT PRIMARY KEY,
    full_name VARCHAR(100) NOT NULL,
    gender ENUM('M', 'F') NOT NULL,
    dob DATE NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    phone VARCHAR(20) NOT NULL,
    address TEXT,
    department_id INT,
    hire_date DATE NOT NULL,
    position VARCHAR(100) NOT NULL,
    user_id INT,
    FOREIGN KEY (department_id) REFERENCES departments(department_id),
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);

-- Bảng attendance: chấm công
CREATE TABLE attendance (
    attendance_id INT AUTO_INCREMENT PRIMARY KEY,
    employee_id INT,
    date DATE,
    check_in TIME,
    check_out TIME,
    FOREIGN KEY (employee_id) REFERENCES employees(employee_id)
);

-- Bảng salary: lương
CREATE TABLE salary (
    salary_id INT AUTO_INCREMENT PRIMARY KEY,
    employee_id INT,
    month INT,
    year INT,
    basic_salary DECIMAL(10,2) NOT NULL,
    allowance DECIMAL(10,2) DEFAULT 0,
    bonus DECIMAL(10,2) DEFAULT 0,
    deduction DECIMAL(10,2) DEFAULT 0,
    total_salary DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (employee_id) REFERENCES employees(employee_id)
);

-- Bảng leaves: nghỉ phép
CREATE TABLE leaves (
    leave_id INT AUTO_INCREMENT PRIMARY KEY,
    employee_id INT,
    leave_type ENUM('phép', 'bệnh', 'khác'),
    start_date DATE,
    end_date DATE,
    status ENUM('pending', 'approved', 'rejected') DEFAULT 'pending',
    FOREIGN KEY (employee_id) REFERENCES employees(employee_id)
);

-- Bảng contracts: hợp đồng lao động
CREATE TABLE contracts (
    contract_id INT AUTO_INCREMENT PRIMARY KEY,
    employee_id INT,
    contract_type VARCHAR(100),
    start_date DATE,
    end_date DATE,
    note TEXT,
    FOREIGN KEY (employee_id) REFERENCES employees(employee_id)
);

-- Bảng rewards_discipline: khen thưởng / kỷ luật
CREATE TABLE rewards_discipline (
    record_id INT AUTO_INCREMENT PRIMARY KEY,
    employee_id INT,
    type ENUM('reward', 'discipline'),
    title VARCHAR(255),
    description TEXT,
    date_recorded DATE,
    FOREIGN KEY (employee_id) REFERENCES employees(employee_id)
);
