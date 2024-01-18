-- Create User table
create database user;
CREATE TABLE users (
                       user_id INT PRIMARY KEY AUTO_INCREMENT,
                       username VARCHAR(50) UNIQUE NOT NULL,
                       password VARCHAR(255) NOT NULL,
                       email VARCHAR(100) UNIQUE NOT NULL
);

-- Create CurrencyConversion table
TABLE currency_conversion (
                                     conversion_id INT PRIMARY KEY AUTO_INCREMENT,
                                     user_id INT,
                                     source_currency VARCHAR(3) NOT NULL,
                                     target_currency VARCHAR(3) NOT NULL,
                                     amount DOUBLE NOT NULL,
                                     converted_amount DOUBLE NOT NULL,
                                     conversion_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
                                     FOREIGN KEY (user_id) REFERENCES users(user_id)
);