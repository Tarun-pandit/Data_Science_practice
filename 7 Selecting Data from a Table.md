# 📘 Selecting Data from a Table

In this section, you'll learn how to query data from a MySQL table using the **SELECT** statement, apply filters using the **WHERE** clause, and handle conditions including **NULL** values and pattern matching.

---

## 🟦 1. Basic SELECT Statement

Retrieve all data from the `student` table:
```sql
SELECT * FROM student;
```

Retrieve specific columns (e.g., only name and grade):
```sql
SELECT name, grade FROM student;
```

---

## 🟦 2. Using the WHERE Clause

Filter rows based on a condition.

**Example: Students in 10th grade**
```sql
SELECT * FROM student WHERE grade = '10th';
```

**Example: Students older than 16**
```sql
SELECT * FROM student WHERE age > 16;
```

---

## 🟦 3. Comparison Operators in MySQL

| Operator | Description | Example |
|-----------|--------------|----------|
| = | Equals | WHERE age = 16 |
| != | Not equal to | WHERE grade != '12th' |
| <> | Not equal to (alternative) | WHERE grade <> '12th' |
| > | Greater than | WHERE age > 16 |
| < | Less than | WHERE age < 17 |
| >= | Greater than or equal to | WHERE age >= 16 |
| <= | Less than or equal to | WHERE age <= 18 |
| BETWEEN | Within a range (inclusive) | WHERE age BETWEEN 15 AND 17 |
| IN | Matches any in a list | WHERE grade IN ('10th', '12th') |
| NOT IN | Excludes list items | WHERE grade NOT IN ('9th', '11th') |
| LIKE | Pattern matching | WHERE name LIKE 'A%' |
| NOT LIKE | Pattern not matching | WHERE name NOT LIKE '%a' |

---

## 🟦 4. Handling NULL Values

**What is NULL?**  
NULL represents *missing or unknown* values — it’s not equal to `0`, an empty string, or any other value.

❌ Incorrect:
```sql
SELECT * FROM student WHERE grade = NULL;
```

✅ Correct ways:

| Condition | Correct Syntax |
|------------|----------------|
| Is NULL | WHERE grade IS NULL |
| Is NOT NULL | WHERE grade IS NOT NULL |

**Example: Students with no grade**
```sql
SELECT * FROM student WHERE grade IS NULL;
```

**Example: Students with a grade**
```sql
SELECT * FROM student WHERE grade IS NOT NULL;
```

---

## 🟦 5. Combining Conditions

Combine multiple filters using **AND**, **OR**, and parentheses.

**Example: Students in 10th grade and older than 16**
```sql
SELECT * FROM student WHERE grade = '10th' AND age > 16;
```

**Example: Students in 9th or 12th grade**
```sql
SELECT * FROM student WHERE grade = '9th' OR grade = '12th';
```

**Example: Complex conditions**
```sql
SELECT * FROM student 
WHERE (grade = '10th' OR grade = '11th') AND age >= 16;
```

---

## 🟦 6. Sorting Results with ORDER BY

Sort results in ascending order (default):
```sql
SELECT * FROM student ORDER BY age ASC;
```

Sort results in descending order:
```sql
SELECT * FROM student ORDER BY name DESC;
```

---

## 🟦 7. Limiting Results with LIMIT

Get only the first 5 rows:
```sql
SELECT * FROM student LIMIT 5;
```

Get 5 rows starting from the 3rd (offset 2):
```sql
SELECT * FROM student LIMIT 2, 5;
```

---

## 🟦 8. Using Wildcards with LIKE

Wildcards are used with the **LIKE** operator to match text patterns.

| Wildcard | Meaning |
|-----------|----------|
| % | Matches zero or more characters |
| _ | Matches exactly one character |

**Example: Names starting with 'A'**
```sql
SELECT * FROM student WHERE name LIKE 'A%';
```
→ Matches names like *Aakash*, *Ananya*, *Aryan*.

---

### 📅 Matching Dates with `_` Wildcard

In date format `YYYY-MM-DD`, `_` can match positions precisely.

**Example: Find records from the 5th day of any month**
```sql
SELECT * FROM attendance
WHERE date LIKE '____-__-05';
```

**Explanation:**
- `____` → any 4-digit year  
- `__` → any 2-digit month  
- `05` → 5th day  

✅ Returns all records where the date ends with **“-05”** (5th day of any month/year).

---

### 🧩 More Date Pattern Examples

| Pattern | Matches |
|----------|----------|
| `'2025-05-%'` | Any day in May 2025 |
| `'2024-12-__'` | All 2-digit days in December 2024 |
| `'____-01-01'` | 1st January of any year |
