SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO';


CREATE SCHEMA IF NOT EXISTS `lefti_marganrazvan` DEFAULT CHARACTER SET utf8mb4;
USE `lefti_marganrazvan`;


DROP TABLE IF EXISTS Addresses;
CREATE TABLE Addresses (
  address_id INT PRIMARY KEY AUTO_INCREMENT,
  address_details VARCHAR(255) NOT NULL
) ENGINE=InnoDB;


DROP TABLE IF EXISTS Product_Companies;
CREATE TABLE Product_Companies (
  company_id INT PRIMARY KEY AUTO_INCREMENT,
  address_id INT,
  company_details VARCHAR(255),
  FOREIGN KEY (address_id) REFERENCES Addresses(address_id) ON DELETE CASCADE
) ENGINE=InnoDB;


DROP TABLE IF EXISTS Contacts;
CREATE TABLE Contacts (
  contact_id INT PRIMARY KEY AUTO_INCREMENT,
  address_id INT,
  company_id INT,
  contact_name VARCHAR(100) NOT NULL,
  contact_email VARCHAR(100),
  other_details VARCHAR(255),
  FOREIGN KEY (address_id) REFERENCES Addresses(address_id) ON DELETE CASCADE,
  FOREIGN KEY (company_id) REFERENCES Product_Companies(company_id) ON DELETE CASCADE
) ENGINE=InnoDB;


DROP TABLE IF EXISTS Projects;
CREATE TABLE Projects (
  project_id INT PRIMARY KEY AUTO_INCREMENT,
  company_id INT,
  project_name VARCHAR(100) NOT NULL,
  start_date DATE,
  end_date DATE,
  other_details VARCHAR(255),
  FOREIGN KEY (company_id) REFERENCES Product_Companies(company_id) ON DELETE CASCADE
) ENGINE=InnoDB;


DROP TABLE IF EXISTS Project_Contacts;
CREATE TABLE Project_Contacts (
  project_id INT,
  contact_id INT,
  PRIMARY KEY (project_id, contact_id),
  FOREIGN KEY (project_id) REFERENCES Projects(project_id) ON DELETE CASCADE,
  FOREIGN KEY (contact_id) REFERENCES Contacts(contact_id) ON DELETE CASCADE
) ENGINE=InnoDB;


DROP TABLE IF EXISTS Location_Difficulties;
CREATE TABLE Location_Difficulties (
  difficulty_code INT PRIMARY KEY,
  difficulty_description VARCHAR(100)
) ENGINE=InnoDB;


DROP TABLE IF EXISTS Locations;
CREATE TABLE Locations (
  location_id INT PRIMARY KEY AUTO_INCREMENT,
  difficulty_code INT,
  other_details VARCHAR(255),
  FOREIGN KEY (difficulty_code) REFERENCES Location_Difficulties(difficulty_code) ON DELETE CASCADE
) ENGINE=InnoDB;

DROP TABLE IF EXISTS Project_Locations;
CREATE TABLE Project_Locations (
  project_id INT,
  location_id INT,
  PRIMARY KEY (project_id, location_id),
  FOREIGN KEY (project_id) REFERENCES Projects(project_id) ON DELETE CASCADE,
  FOREIGN KEY (location_id) REFERENCES Locations(location_id) ON DELETE CASCADE
) ENGINE=InnoDB;

DROP TABLE IF EXISTS Package_Types;
CREATE TABLE Package_Types (
  type_code INT PRIMARY KEY,
  type_description VARCHAR(100)
) ENGINE=InnoDB;

DROP TABLE IF EXISTS Packages;
CREATE TABLE Packages (
  package_id INT PRIMARY KEY AUTO_INCREMENT,
  type_code INT,
  package_name VARCHAR(100),
  package_description VARCHAR(255),
  other_details VARCHAR(255),
  FOREIGN KEY (type_code) REFERENCES Package_Types(type_code) ON DELETE CASCADE
) ENGINE=InnoDB;

DROP TABLE IF EXISTS Project_Packages;
CREATE TABLE Project_Packages (
  project_id INT,
  package_id INT,
  PRIMARY KEY (project_id, package_id),
  FOREIGN KEY (project_id) REFERENCES Projects(project_id) ON DELETE CASCADE,
  FOREIGN KEY (package_id) REFERENCES Packages(package_id) ON DELETE CASCADE
) ENGINE=InnoDB;


DROP TABLE IF EXISTS Items;
CREATE TABLE Items (
  item_id INT PRIMARY KEY AUTO_INCREMENT,
  item_name VARCHAR(100) NOT NULL,
  item_description VARCHAR(255),
  item_unit_cost DECIMAL(10,2),
  item_unit_selling_price DECIMAL(10,2),
  other_details VARCHAR(255)
) ENGINE=InnoDB;


DROP TABLE IF EXISTS Package_Items;
CREATE TABLE Package_Items (
  package_id INT,
  item_id INT,
  PRIMARY KEY (package_id, item_id),
  FOREIGN KEY (package_id) REFERENCES Packages(package_id) ON DELETE CASCADE,
  FOREIGN KEY (item_id) REFERENCES Items(item_id) ON DELETE CASCADE
) ENGINE=InnoDB;


insert into addresses (address_details) values
('strada principală 123'), 
('strada ulmilor 456'), 
('strada pinilor 789'), 
('strada arțarilor 101'), 
('strada stejarilor 202'), 
('strada mestecenilor 303');


insert into product_companies (address_id, company_details) values
(1, 'compania a'), 
(2, 'compania b'), 
(3, 'compania c'), 
(4, 'compania d'), 
(5, 'compania e'), 
(6, 'compania f');


insert into contacts (address_id, company_id, contact_name, contact_email, other_details) values
(1, 1, 'ion popescu', 'ion@example.com', 'manager'),
(2, 2, 'maria ionescu', 'maria@example.com', 'director'),
(3, 3, 'mihai georgescu', 'mihai@example.com', 'vânzări'),
(4, 4, 'ana popa', 'ana@example.com', 'resurse umane'),
(5, 5, 'vasile radu', 'vasile@example.com', 'marketing'),
(6, 6, 'cristina moldovan', 'cristina@example.com', 'finanțe');


insert into projects (company_id, project_name, start_date, end_date, other_details) values
(1, 'eveniment catering a', '2025-05-01', '2025-05-03', 'eveniment în aer liber'),
(2, 'eveniment catering b', '2025-05-05', '2025-05-06', 'eveniment în interior'),
(3, 'eveniment catering c', '2025-05-10', '2025-05-12', 'eveniment corporate'),
(4, 'eveniment catering d', '2025-05-15', '2025-05-16', 'nuntă'),
(5, 'eveniment catering e', '2025-05-20', '2025-05-21', 'petrecere aniversară'),
(6, 'eveniment catering f', '2025-05-25', '2025-05-26', 'aniversare');


insert into project_contacts (project_id, contact_id) values
(1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6);


insert into location_difficulties (difficulty_code, difficulty_description) values
(1, 'ușor'), 
(2, 'moderat'), 
(3, 'dificil'), 
(4, 'foarte dificil'), 
(5, 'extrem'), 
(6, 'imposibil');


insert into locations (difficulty_code, other_details) values
(1, 'locație parc'), 
(2, 'sală de conferințe'), 
(3, 'locație montană'), 
(4, 'stațiune pe plajă'), 
(5, 'centru urban'), 
(6, 'vilă privată');


insert into project_locations (project_id, location_id) values
(1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6);


insert into package_types (type_code, type_description) values
(1, 'pachet de bază'), 
(2, 'pachet premium'), 
(3, 'pachet vip'), 
(4, 'pachet corporate'), 
(5, 'pachet personalizat'), 
(6, 'pachet familie');


insert into packages (type_code, package_name, package_description, other_details) values
(1, 'bufet de bază', 'meniul standard de catering', 'include băuturi'),
(2, 'bufet premium', 'meniul extins', 'include băuturi premium'),
(3, 'cină vip', 'preparate exclusive', 'servire la masă'),
(4, 'prânz corporate', 'meniul de afaceri', 'opțiuni personalizate'),
(5, 'eveniment personalizat', 'meniul adaptat', 'conform cerințelor'),
(6, 'reuniune familială', 'preparate casual', 'opțiuni pentru copii');


insert into project_packages (project_id, package_id) values
(1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6);


insert into package_items (package_id, item_id) values
(1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6);


insert into items (item_name, item_description, item_unit_cost, item_unit_selling_price, other_details) values
('sandviș', 'sandviș proaspăt preparat', 2.50, 5.00, 'opțiune vegetariană'),
('salată', 'salată verde sănătoasă', 1.50, 3.00, 'include dressing'),
('suc natural', 'suc de portocale proaspăt', 0.80, 2.00, 'fără adaos de zahăr'),
('cafea', 'cafea premium', 0.60, 1.50, 'opțiune cu lapte'),
('desert', 'felie de prăjitură cu ciocolată', 1.00, 3.00, 'opțiune fără gluten'),
('platou de fructe', 'fructe proaspete asortate', 3.00, 6.00, 'fructe de sezon');

