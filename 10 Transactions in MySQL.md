# Transactions in MySQL

In this section, we explore how MySQL handles transactions using **AUTOCOMMIT**, **COMMIT**, and **ROLLBACK** statements.  
Transactions are essential for maintaining **data integrity**, especially during complex data operations.

---

## What is a Transaction?

A transaction is a sequence of one or more SQL statements executed as a **single unit**.  

A transaction has four key properties (**ACID**):

- **Atomicity:** All or nothing.  
- **Consistency:** Database remains in a valid state before and after.  
- **Isolation:** Transactions do not interfere with each other.  
- **Durability:** Changes persist after commit.

---

## AUTOCOMMIT

By default, MySQL runs in **autocommit mode**: each SQL statement is automatically committed after execution.

**Check Autocommit Status**
```sql
SELECT @@autocommit;
```

**Disable Autocommit**
```sql
SET autocommit = 0;
```
> This allows you to manually group multiple statements into a single transaction.

**Enable Autocommit**
```sql
SET autocommit = 1;
```

---

## COMMIT

The **COMMIT** statement permanently saves all changes made in the current transaction.

**Example:**
```sql
START TRANSACTION;

UPDATE accounts SET balance = balance - 100 WHERE id = 1;
UPDATE accounts SET balance = balance + 100 WHERE id = 2;

COMMIT;
```

- Once committed, changes are visible to other sessions and stored permanently.

---

## ROLLBACK

The **ROLLBACK** statement undoes changes made in the current transaction.  
Useful if an error occurs or a condition is not met.

**Example:**
```sql
START TRANSACTION;

UPDATE accounts SET balance = balance - 100 WHERE id = 1;

-- An error or condition check fails here
ROLLBACK;
```

- After a rollback, all changes since the start of the transaction are discarded.

---

## Summary Table

| Statement              | Description                                  |
|------------------------|----------------------------------------------|
| AUTOCOMMIT             | Automatically commits every query            |
| SET autocommit = 0     | Disables autocommit mode                      |
| COMMIT                 | Saves all changes in a transaction           |
| ROLLBACK               | Reverts all changes in a transaction         |

---

## Best Practices

- Always use transactions when performing multiple related operations.  
- Disable autocommit for critical data updates.  
- Rollback if any step in the transaction fails.  
- Test transactions thoroughly before running on production data.
