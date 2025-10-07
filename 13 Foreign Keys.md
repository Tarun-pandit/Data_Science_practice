# Foreign Keys in MySQL

This guide demonstrates how to **create a database**, define tables, and use **foreign keys** to establish relationships.

---

## 1. Create a Database

```sql
CREATE DATABASE school;
USE school;
```

---

## 2. Create Tables

We'll create two tables:  
- `students`  
- `classes`  

Each student belongs to a class, creating a **one-to-many relationship** (one class → many students).

### Create `classes` Table

```sql
CREATE TABLE classes (
    class_id INT AUTO_INCREMENT PRIMARY KEY,
    class_name VARCHAR(50) NOT NULL
);
```

### Create `students` Table

```sql
CREATE TABLE students (
    student_id INT AUTO_INCREMENT PRIMARY KEY,
    student_name VARCHAR(100) NOT NULL,
    class_id INT,
    FOREIGN KEY (class_id) REFERENCES classes(class_id)
        ON UPDATE CASCADE
        ON DELETE SET NULL
);
```

---

## 3. Insert Sample Data

### Insert into `classes`

```sql
INSERT INTO classes (class_name) 
VALUES ('Mathematics'), ('Science'), ('History');
```

### Insert into `students`

```sql
INSERT INTO students (student_name, class_id) 
VALUES 
('Alice', 1),
('Bob', 2),
('Charlie', 1);
```

---

## 4. Explanation of Foreign Key Behavior

In the `students` table:

- `class_id` is a foreign key referencing `classes(class_id)`.  
- **ON DELETE SET NULL:** If a class is deleted, related students will have `class_id` set to NULL.  
- **ON UPDATE CASCADE:** If a class ID changes, it updates automatically in the `students` table.

---

## 5. View the Relationships

### Check foreign key constraints:

```sql
SHOW CREATE TABLE students;
```

### See all foreign keys in the current database:

```sql
SELECT 
    table_name, 
    column_name, 
    constraint_name, 
    referenced_table_name, 
    referenced_column_name
FROM 
    information_schema.key_column_usage
WHERE 
    referenced_table_name IS NOT NULL
    AND table_schema = 'school';
```

---

## 6. Understanding Referential Actions

### ON UPDATE CASCADE

- **Definition:** Updates child table automatically if parent table value changes.  
- **Example:**

```sql
UPDATE classes SET class_id = 10 WHERE class_id = 1;
```
> All students with `class_id = 1` will now have `class_id = 10`.

### ON DELETE SET NULL

- **Definition:** Sets child table foreign key to NULL if parent row is deleted.  
- **Example:**

```sql
DELETE FROM classes WHERE class_id = 2;
```
> All students with `class_id = 2` will have `class_id = NULL`.

---

## 7. Why Use These Options?

- **ON UPDATE CASCADE:** Useful when primary key of parent table might change.  
- **ON DELETE SET NULL:** Preserves child records but indicates broken relationship.

---

## 8. Alternatives

| Option                | Description                                          |
|-----------------------|------------------------------------------------------|
| ON DELETE CASCADE      | Deletes child rows when parent row is deleted      |
| ON DELETE RESTRICT     | Prevents deletion if child rows exist              |
| ON DELETE NO ACTION    | Same as RESTRICT in MySQL                           |
| ON DELETE SET DEFAULT  | Not supported in MySQL (available in some DBMSs)  |
