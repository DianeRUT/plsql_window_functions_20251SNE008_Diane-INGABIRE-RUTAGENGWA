-- Ranking room types by total revenue
SELECT
    r.room_type,
    SUM(b.total_amount) AS total_revenue,
    RANK() OVER (ORDER BY SUM(b.total_amount) DESC) AS revenue_rank
FROM bookings b
JOIN rooms r ON b.room_id = r.room_id
GROUP BY r.room_type;

-- Running total revenue over time
SELECT
    booking_date,
    total_amount,
    SUM(total_amount) OVER (
        ORDER BY booking_date
        ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
    ) AS running_total_revenue
FROM bookings
ORDER BY booking_date;

-- Month-over-month revenue comparison
SELECT
    booking_date,
    total_amount,
    LAG(total_amount) OVER (ORDER BY booking_date) AS previous_amount,
    total_amount - LAG(total_amount) OVER (ORDER BY booking_date) AS revenue_change
FROM bookings
ORDER BY booking_date;

-- Customer segmentation using NTILE
SELECT
    c.customer_id,
    c.full_name,
    SUM(b.total_amount) AS total_spent,
    NTILE(4) OVER (ORDER BY SUM(b.total_amount) DESC) AS customer_quartile
FROM customers c
JOIN bookings b ON c.customer_id = b.customer_id
GROUP BY c.customer_id, c.full_name;


