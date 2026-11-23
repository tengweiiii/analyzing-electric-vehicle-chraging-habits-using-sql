-- Business question:
-- How many different individuals use the shared charging stations in each garage?

-- Understand the expexted output
-- We want two columns: garage_id, num_unique_users

-- Understand the SQL Concepts:
-- We need three important SQL clauses/functions
-- 1. COUNT(DISTINCT) counts the number of unique values
-- 2. GROUP BY groups records that share the same garage ID
-- 3. ORDER BY sorts the results

-- unique_user_per_garage
SELECT
  garage_id,
  COUNT(DISTINCT user_id) AS num_unique_users
FROM VEHICLES.CHARGING_SESSIONS
WHERE user_type = 'Shared'
GROUP BY garage_id
ORDER BY num_unique_users DESC;

-- Think of the query as a sequence of steps:
-- 1. FROM: Retrieve data from the charging sessions table.
-- 2. WHERE: Keep only Shared charging sessions.
-- 3. GROUP BY: Group the records by garage.
-- 4. COUNT(DISTINCT user_id): Count unique users in each garage.
-- 5. ORDER BY: Rank garages from the highest number of unique users to the lowest.
