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
    income_type VARCHAR(255),
    benchmark VARCHAR(255),
    currency VARCHAR(255),
    investment_policy TEXT,
    fund_objective TEXT
);

CREATE TABLE fund_classes (
    id SERIAL PRIMARY KEY,
    fund_id INT REFERENCES funds(id),
    class_name VARCHAR(255),
    description TEXT
);

CREATE TABLE portfolio_composition (
    id SERIAL PRIMARY KEY,
    class_id INT REFERENCES fund_classes(id),
    asset_type VARCHAR(255),
    percentage NUMERIC,
    description TEXT
);

CREATE TABLE performances (
    id SERIAL PRIMARY KEY,
    class_id INT REFERENCES fund_classes(id),
    date DATE,
    assets NUMERIC,
    unit_value NUMERIC
);
