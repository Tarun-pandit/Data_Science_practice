DROP TABLE employe;

CREATE TABLE employe (
    e_id INT NOT NULL PRIMARY KEY,
    e_name VARCHAR(20),
    e_salary INT,
    e_age INT,
    e_gender VARCHAR(20),
    e_dep VARCHAR(20)
);
