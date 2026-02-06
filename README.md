# SQL JOINs and Window Functions Project

## 1. Business Problem Definition

### Business Context

The business operates in the hospitality industry as a hotel management company. The analysis focuses on the reservations and sales department, which is responsible for managing customer bookings, room allocation, and revenue tracking across different room types.

### Data Challenge

The hotel generates a large volume of booking data across multiple room types and time periods. Management lacks clear visibility into booking trends, revenue performance over time, and customer booking behavior, making it difficult to identify top-performing rooms and periods with low occupancy.

### Expected Outcome

The analysis aims to provide insights into room performance, customer booking patterns, and revenue trends over time to support data-driven decisions on pricing strategies, promotions, and occupancy optimization.

## 2. Success Criteria
The success of this project will be measured using the following criteria:
1. Identify the top 5 room types based on total revenue per month using ranking window functions such as RANK() and DENSE_RANK().
2. Calculate running total booking revenue over time to analyze cumulative revenue trends using SUM() OVER().
3. Measure month-over-month revenue changes to identify booking growth or decline using LAG().
4. Segment customers into four quartiles based on their total booking value using NTILE(4) for customer classification.
5. Calculate a three-month moving average of booking revenue to detect seasonal trends using AVG() OVER().


## 3. Database Schema Design
### Tables Description

### Entity Relationship Diagram (ERD)
The ER diagram below illustrates the relationships between customers, rooms, and bookings.
![ER Diagram](er_diagram.png)

## 4. Part A: SQL JOINs Implementation
### 4.1 INNER JOIN
This query retrieves bookings that have valid customer and room records.

![INNER JOIN Result](screenshots/inner_join.png)

**Business Interpretation:**  
The result shows only confirmed bookings linked to existing customers and rooms, helping management analyze valid revenue-generating transactions.

## 5. Part B: SQL Window Functions Implementation
### 5.1 Ranking Functions

## 6. Results Analysis
### Descriptive Analysis

### Diagnostic Analysis
### Prescriptive Analysis

## 7. References

## 8. Integrity Statement
All sources were properly cited. Implementations and analysis represent original work. No AI-generated content was copied without attribution or adaptation.



