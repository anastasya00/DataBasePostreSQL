-- Таблица филиалов
CREATE TABLE IF NOT EXISTS branches (
    branch_id SERIAL PRIMARY KEY,
    name VARCHAR(255) UNIQUE NOT NULL,
    address VARCHAR(255) UNIQUE NOT NULL,
    phone VARCHAR(20) UNIQUE NOT NULL
);

-- Таблица клиентов
CREATE TABLE IF NOT EXISTS clients (
    client_id SERIAL PRIMARY KEY,
    full_name VARCHAR(255) NOT NULL,
    address VARCHAR(255) NOT NULL,
    phone VARCHAR(20) UNIQUE NOT NULL,
    gender CHAR(1) CHECK (gender IN ('M', 'F')),
    birth_date DATE CHECK (birth_date <= CURRENT_DATE),
    passport_number VARCHAR(20) UNIQUE NOT NULL
);

-- Таблица агентов
CREATE TABLE IF NOT EXISTS agents (
    agent_id SERIAL PRIMARY KEY,
    full_name VARCHAR(255) NOT NULL,
    address VARCHAR(255) NOT NULL,
    phone VARCHAR(20) UNIQUE NOT NULL,
    salary DECIMAL(10, 2) NOT NULL CHECK (salary > 0),
    branch_id INT REFERENCES branches(branch_id) ON DELETE RESTRICT
);

-- Таблица типов страхования
CREATE TABLE IF NOT EXISTS insurance_types (
    insurance_type_id SERIAL PRIMARY KEY,
    type_name VARCHAR(255) UNIQUE NOT NULL
);

-- Таблица договоров
CREATE TABLE IF NOT EXISTS contracts (
    contract_id SERIAL PRIMARY KEY,
    date DATE NOT NULL CHECK (date <= CURRENT_DATE),
    insurance_type_id INT REFERENCES insurance_types(insurance_type_id) ON DELETE RESTRICT,
    insurance_amount DECIMAL(10, 2) NOT NULL CHECK (insurance_amount > 0),
    rate DECIMAL(5, 2) NOT NULL CHECK (rate > 0 AND rate <= 100),
    branch_id INT REFERENCES branches(branch_id) ON DELETE CASCADE,
    client_id INT REFERENCES clients(client_id) ON DELETE CASCADE,
    agent_id INT REFERENCES agents(agent_id) ON DELETE SET NULL,
    contract_status VARCHAR(50) DEFAULT 'active' CHECK (contract_status IN ('active', 'terminated', 'expired')),
    UNIQUE (client_id, date, insurance_type_id)
);