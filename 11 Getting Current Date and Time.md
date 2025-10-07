# Getting Current Date and Time

MySQL provides built-in functions to retrieve the **current date, time, and timestamp**.  
These are commonly used in **data logging, time-based queries, and record tracking**.

---

## 1. CURRENT_DATE

Returns the current date in `YYYY-MM-DD` format.

```sql
SELECT CURRENT_DATE;
```

**Example Output:**
```
2025-05-02
```

---

## 2. CURRENT_TIME

Returns the current time in `HH:MM:SS` format.

```sql
SELECT CURRENT_TIME;
```

**Example Output:**
```
14:23:45
```

---

## 3. CURRENT_TIMESTAMP (or NOW())

Returns the current date and time.

```sql
SELECT CURRENT_TIMESTAMP;
-- or
SELECT NOW();
```

**Example Output:**
```
2025-05-02 14:23:45
```

> Useful for storing creation or update timestamps in records.

---

## 4. LOCALTIME and LOCALTIMESTAMP

Synonyms for `NOW()`, returning the current date and time.

```sql
SELECT LOCALTIME;
SELECT LOCALTIMESTAMP;
```

> These return the **local date and time of the MySQL server**, not the client’s system.

**Check server time zone:**
```sql
SELECT @@global.time_zone;
SELECT @@session.time_zone;
```

---

## 5. Using in Table Inserts

You can use `NOW()` or `CURRENT_TIMESTAMP` to auto-fill date-time columns.

```sql
INSERT INTO logs (event, created_at)
VALUES ('data_import', NOW());
```

---

## 6. Date and Time Functions Recap

| Function           | Returns         | Example Output          |
|-------------------|----------------|------------------------|
| CURRENT_DATE       | Date only       | 2025-05-02             |
| CURRENT_TIME       | Time only       | 14:23:45               |
| NOW()              | Date and time   | 2025-05-02 14:23:45    |
| CURRENT_TIMESTAMP  | Date and time   | 2025-05-02 14:23:45    |
| LOCALTIME          | Date and time   | 2025-05-02 14:23:45    |

---

## Best Practices

- Use **CURRENT_TIMESTAMP** for record timestamps.  
- Use **NOW()** in queries to filter records by current time.  
- Prefer **database time** over system time for consistent business logic.
