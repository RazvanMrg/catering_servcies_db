# 📦 Lefti Catering Database

This project contains a fully structured SQL database named `lefti_marganrazvan` designed to manage catering events. It includes all table definitions, relationships, and example data insertions.

## 📂 Database Structure

The `lefti_marganrazvan` schema includes the following tables:

- `Addresses`: Stores address details
- `Product_Companies`: Companies providing services
- `Contacts`: Contact persons related to the companies
- `Projects`: Catering projects/events
- `Project_Contacts`: Links projects with contacts
- `Location_Difficulties`: Difficulty levels of locations
- `Locations`: Locations where events take place
- `Project_Locations`: Connects projects with locations
- `Package_Types`: Types of catering packages
- `Packages`: Packages available for events
- `Project_Packages`: Connects projects with packages
- `Items`: Individual items (e.g., food, drinks)
- `Package_Items`: Connects items to packages

## 🧩 Features

The SQL script includes:

✅ Full database and table creation  
✅ All constraints (primary keys, foreign keys, cascading deletes)  
✅ Sample data inserts for testing and demonstration  

## ▶️ How to Use

1. Open your SQL client (e.g., MySQL Workbench, DBeaver)
2. Run the script `lefti_catering_db`
3. The database and all sample data will be created automatically

## 📋 Requirements

- MySQL Server 8.x or compatible  
- `CREATE SCHEMA`, `INSERT`, and `FOREIGN KEY` permissions  

## 📘 License

Distributed under the [Apache-2.0 license](LICENSE).

---

### 👤 Author

Developed by **RazvanMrg**  
A structured SQL project for managing catering services and event planning.

