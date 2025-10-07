# Updating Data in a Table

Today we will learn how to modify existing data in a table using the **UPDATE** statement.  
We will use the **SET** keyword to assign new values and the **WHERE** clause to target specific rows.

---

## 1. Basic Syntax

```sql
UPDATE table_name
SET column1 = value1, column2 = value2, ...
WHERE condition;
```

**Explanation:**
- **UPDATE** → Specifies the table you want to modify.  
- **SET** → Assigns new values to columns.  
- **WHERE** → Filters which rows should be updated.  
⚠️ Always include a **WHERE** clause unless you want to update all rows.

---

## 2. Example Table

| id | name         | age | grade |
|----|---------------|-----|--------|
| 1  | Ayesha Khan   | 16  | 10th   |
| 2  | Ravi Sharma   | 17  | 11th   |
| 3  | Meena Joshi   | 15  | 9th    |

---

## 3. Update a Single Row

Example: Change the grade of student with **id = 2** to **12th**
```sql
UPDATE student
SET grade = '12th'
WHERE id = 2;
```

---

## 4. Update Multiple Columns

Example: Change age to **17** and grade to **10th** for **id = 3**
```sql
UPDATE student
SET age = 17, grade = '10th'
WHERE id = 3;
```

---

## 5. Update All Rows

⚠️ Be careful when updating without a WHERE clause.

Example: Set all students to age **18**
```sql
UPDATE student
SET age = 18;
```

**Warning:** This will modify every row in the table.

---

## 6. Conditional Update with Comparison Operators

Example 1: Promote all students in **9th** grade to **10th**
```sql
UPDATE student
SET grade = '10th'
WHERE grade = '9th';
```

Example 2: Increase age by **1** for students younger than **18**
```sql
UPDATE student
SET age = age + 1
WHERE age < 18;
```

---

## 7. Update Using IS NULL

Example: Set default grade to `'Unknown'` where grade is NULL
```sql
UPDATE student
SET grade = 'Unknown'
WHERE grade IS NULL;
```

---

## 8. Verify the Update

To check the results:
```sql
SELECT * FROM student;
```

---

✅ **Summary:**
- Use **UPDATE** and **SET** to modify data.
- Always use **WHERE** to prevent unwanted bulk updates.
- Combine with **comparison operators** or **IS NULL** for conditional updates.
