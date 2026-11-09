# Library Management System (SQL)

A SQL project that models a library with six tables: branches, employees, books, members, issued books and returns. I wrote queries to manage the data and answer practical business questions, such as which books have not been returned and how much rental income each category earns.

## Database Schema

| Table | Purpose |
|---|---|
| `branch` | Library branches, their managers and contact details |
| `employees` | Staff details, positions, salaries and branch |
| `books` | Book catalogue with category, rental price, availability status, author and publisher |
| `members` | Registered members and their registration dates |
| `issued_status` | Records of books issued to members, and the employee who issued them |
| `return_status` | Records of books returned |

## What This Project Covers

- Creating tables and loading data
- CRUD operations: `INSERT`, `UPDATE`, `DELETE`
- Filtering and grouping with `WHERE`, `GROUP BY` and `HAVING`
- Joins, including `LEFT JOIN` to find books not yet returned
- Self-join to list employees with their branch manager
- `CREATE TABLE AS` (CTAS) to build summary tables, such as book issue counts and high-rent books
- Rental income by category using `SUM` and `COUNT`

## Tasks Completed

1. Create a new book record
2. Update an existing member's address
3. Delete a record from the issued status table
4. Retrieve all books issued by a specific employee
5. List members/employees who have issued more than one book
6. CTAS: create a summary table of issue counts per book
7. Retrieve all books in a specific category
8. Find total rental income by category
9. List members who registered in the last 180 days
10. List employees with their branch manager's name and branch details
11. Create a table of books with rental price above a threshold
12. Retrieve the list of books not yet returned

## Tools Used

- [MySQL / PostgreSQL: write the one you used]
- [MySQL Workbench / pgAdmin: write the one you used]

## How to Run

1. Clone this repository:
   ```
   git clone https://github.com/[your-username]/[your-repo-name].git
   ```
2. Open your SQL client and run `database_setup.sql` to create and populate the tables.
3. Run the queries in `analysis_queries.sql` one task at a time.

## Repository Structure

```
├── README.md
├── database_setup.sql
├── analysis_queries.sql
├── data/            # CSV files for each table
└── images/          # ER diagram and sample outputs
```

## Sample Output

*Add screenshots here, for example:*

```
![Books not yet returned](images/sample_output.png)
```

## Key Learnings

- Using `LEFT JOIN ... IS NULL` to find records with no match
- Combining joins with aggregation to produce business summaries
- Building reusable report tables with CTAS

## Credits

This project follows the structure of a guided SQL project by [najirh](https://github.com/najirh/Library-System-Management---P2). I wrote and ran the queries myself on my own database setup.

## Author

**[Your Name]**
B.Com (Hons), Hansraj College, University of Delhi
[LinkedIn link]
