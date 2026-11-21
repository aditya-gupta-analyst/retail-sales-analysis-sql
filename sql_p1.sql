# data exploration

# how  many sales we have ?
SELECT * FROM retail_sales.sales;

# how many customer we have ?
select  count(distinct(customer_id)) as  total_customer from sales;


# how many category we have ?
select  distinct(category) as  total_customer from sales;




# business key problem
-- Q1. Retrieve all columns for sales made on '2022-11-05'.

select * from sales  
where sale_date ='2022-11-05';

-- Q2. Retrieve all transactions where the category is 'Clothing'
-- and the quantity sold is more than 4 in November 2022.
 
 select * from sales
 where category = 'Clothing' and
 sale_date like '2022-11%' and 
 quantiy >=4;
 
 
 
 -- Q3. Calculate the total sales (total_sale) for each category.
select category,sum(total_sale) as category_total_sales
from sales
group by category;

-- Q4. Find the average age of customers who purchased items
-- from the 'Beauty' category.

select  round(avg(age),2)as 
 Beauty_cus_avg_age  from sales 
 where category='Beauty';
 
 -- Q5. Find all transactions where total_sale is greater than 1000.

select * from sales
where total_sale>=1000;


-- Q6. Find the total number of transactions made by each gender
-- in each category.
SELECT
    category,
    COUNT(CASE WHEN gender = 'Male' THEN transactions_id END) AS male,
    COUNT(CASE WHEN gender = 'Female' THEN transactions_id END) AS female
FROM sales
GROUP BY category;

  -- second method to solve 6
  SELECT
    category,
    gender,
    COUNT(transactions_id) AS total_transactions
FROM sales
GROUP BY category, gender
ORDER BY category, gender ;


-- Q7. Calculate the average sale for each month.
-- Find the best-selling month in each year.
WITH monthly_sales AS (
    -- Step 1: Calculate average sale for each month
    SELECT
        YEAR(sale_date) AS sale_year,
        MONTH(sale_date) AS sale_month,
        ROUND(AVG(total_sale), 2) AS avg_sale
    FROM sales
    GROUP BY
        YEAR(sale_date),
        MONTH(sale_date)
),

ranked_sales AS (
    -- Step 2: Rank months within each year
    SELECT
        sale_year,
        sale_month,
        avg_sale,
        DENSE_RANK() OVER (
            PARTITION BY sale_year
            ORDER BY avg_sale DESC
        ) AS sale_rank
    FROM monthly_sales
)

-- Step 3: Display the best-selling month of each year
SELECT
    sale_year,
    sale_month,
    avg_sale
FROM ranked_sales
WHERE sale_rank = 1
ORDER BY sale_year;
    
     
-- Find the top 5 customers based on their highest total sales.
-- Use the customer_id and total_sale columns from your sales table.

select customer_id,sum(total_sale) 
 as sum_total from sales
group by customer_id
order by sum_total desc 
limit 5;

-- Q9. Find the number of unique customers who purchased items
-- from each category.
	
    select category,COUNT(DISTINCT customer_id) AS CUS_COUNT from sales 
    group by category;
    
-- Q10. Create shifts and calculate the number of orders:
-- Morning <= 12, Afternoon between 12 and 17, Evening > 17.
    
    SELECT
    CASE
        WHEN sale_time <= '12:00:00' THEN 'Morning'
        WHEN sale_time <= '17:00:00' THEN 'Afternoon'
        ELSE 'Evening'
    END AS shift_time,
    COUNT(transactions_id) AS total_num_order
FROM sales
GROUP BY shift_time
ORDER BY total_num_order DESC;






