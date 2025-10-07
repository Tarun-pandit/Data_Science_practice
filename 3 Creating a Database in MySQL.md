# Creating a Database in MySQL

To start working with MySQL, the first step is to create a database.

---

## Syntax
```sql
CREATE DATABASE database_name;
```

---

## Example
```sql
CREATE DATABASE student_db;
```
This command creates a new database named `student_db`.

---

## Tips
- Database names should be **unique**.  
- Avoid using **spaces** or **special characters**.  
- Use **lowercase** and **underscores (_)** for better readability (e.g., `employee_records`).

---

## Viewing All Databases
To see all available databases:

```sql
SHOW DATABASES;
```

---

## Switching to a Database
Before working with tables, select the database:

```sql
USE student_db;
```

---

## Dropping a Database
To delete an existing database (**irreversible**):

```sql
DROP DATABASE database_name;
```
