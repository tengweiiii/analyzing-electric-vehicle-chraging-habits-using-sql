-- Business question:
-- Which users have an average charging duration longer than 10 hours when using shared charging stations?

-- Understand the expected output
-- We want two columns: user_id, avg_charging_duration

-- Understand the SQL concepts
-- 1. AVG() calculates the average value
-- 2. GROUP BY groups charging sessions by individual user
-- 3. HAVING filters grouped results based on an aggregate calculation

-- long_duration_shared_users
SELECT
  user_id,
  AVG(duration_hours) AS avg_charging_duration
FROM VEHICLES.CHARGING_SESSIONS
WHERE user_type = 'Shared'
GROUP BY user_id
HAVING AVG(duration_hours) > 10
ORDER BY AVG(duration_hours) DESC;  

-- Understand the query execution
-- 1. FROM: Retrieve the charging session records.
-- 2. WHERE: Keep only Shared charging sessions.
-- 3. GROUP BY: Group records by user.
-- 4. AVG(): Calculate each user's average charging duration.
-- 5. HAVING: Keep users whose average exceeds 10 hours.
-- 6. ORDER BY: Sort users from the longest average duration to the shortest.
