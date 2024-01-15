CREATE TABLE administrators (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255),
    contact_information TEXT
);

CREATE TABLE depositories (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255),
    contact_information TEXT
);

CREATE TABLE funds (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255),
    administrator_id INT REFERENCES administrators(id),
    depository_id INT REFERENCES depositories(id),
    creation_date DATE,
    income_type VARCHAR(255),
    benchmark VARCHAR(255),
    currency VARCHAR(255),
    investment_policy TEXT,
    fund_objective TEXT
);

CREATE TABLE performances (
    id SERIAL PRIMARY KEY,
    fund_id INT REFERENCES funds(id),
    date DATE,
    performance NUMERIC,
    unit_value NUMERIC
);
