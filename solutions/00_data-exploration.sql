-- 1.0 Data Exploration
-- 1.1 Preview the data
SELECT * 
  FROM VEHICLE.CHARGING_SESSIONS
LIMIT 5;

-- 1.2: Understand the important columns
-- - garage_id: Identifies the apartment building.
-- - user_id: Identifies the individual EV owner.
-- - user_type: Identifies whether the charging station is Shared or Private.
-- - start_plugin_hour: Records the hour when charging begins.
-- - weekdays_plugin: Records the day when charging begins.
-- - duration_hours: Records how long the charging session lasts.
-- Important: All three questions specifically focus on Shared charging stations.
-- Therefore, we will use this condition: 
--     WHERE user_type = 'Shared'  
