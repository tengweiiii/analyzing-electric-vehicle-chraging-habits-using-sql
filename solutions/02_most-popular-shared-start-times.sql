-- Business question:
-- On which weekdays and at what hours do tenants most frequently start charging their EVs?

-- Understand the expected output
-- We want three columnc: weekday_plugin, start_plugin_hour, num_charging_sessions

-- Understand the SQL concepts
-- 1. COUNT(*) counts the number of records in each group
-- 2. GROUP BY multiple columns
-- 3. LIMIT 10: We only want the ten most popular combinations.

-- most_popular_shared_start_times
SELECT
  weekdays_plugin,
  start_plugin_hour,
  COUNT(*) AS num_charging_sessions
FROM VEHICLES.CHARGING_SESSIONS
WHERE user_type = 'Shared'
GROUP BY
    weekdays_plugin,
    start_plugin_hour
ORDER BY num_charging_sessions DESC
LIMIT 10;

-- Understand the query execution
-- 1. FROM: Retrieve the charging session records.
-- 2. WHERE: Filter for Shared charging stations.
-- 3. GROUP BY: Group by weekday and starting hour.
-- 4. COUNT(*): Count the number of sessions in each group.
-- 5. ORDER BY: Sort from the most frequent to the least frequent.
-- 6. LIMIT 10: Return only the top ten results.
