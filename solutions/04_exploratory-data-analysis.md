
# Analyzing Electric Vehicle Charging Habits Using SQL

## Project Overview

This project uses the `VEHICLES.CHARGING_SESSIONS` table in Google BigQuery to help apartment building managers understand tenants' electric vehicle (EV) charging habits at shared charging stations.

The analysis focuses on three questions:

1. How many unique individuals use each garage's shared charging stations?
2. What are the ten most popular shared charging start times by weekday and hour?
3. Which users have an average shared charging duration longer than 10 hours?

---

## 1. Unique Users per Garage

### Objective

Find the number of unique individuals using shared charging stations in each garage.

### SQL Query

```sql
-- unique_users_per_garage

SELECT
    garage_id,
    COUNT(DISTINCT user_id) AS num_unique_users
FROM VEHICLES.CHARGING_SESSIONS
WHERE user_type = 'Shared'
GROUP BY garage_id
ORDER BY num_unique_users DESC;
```

### Results

| Garage ID | Unique Users |
|---|---:|
| Bl2 | 18 |
| AsO2 | 17 |
| UT9 | 16 |
| AdO3 | 3 |
| SR2 | 2 |
| MS1 | 2 |
| AdA1 | 1 |
| Ris | 1 |

### Interpretation

- **Bl2 has the highest number of unique users**, with 18 individuals using its shared charging stations.
- AsO2 and UT9 follow closely, with 17 and 16 unique users respectively.
- AdO3 has 3 unique users, while SR2 and MS1 each have 2.
- AdA1 and Ris have the lowest number of unique users, with only 1 each.

### Business Insights

- Bl2, AsO2 and UT9 may experience greater demand for shared charging facilities because they serve more unique users.
- Building managers should consider monitoring charging station availability in these garages.
- Garages with fewer unique users may have lower demand. However, the number of available charging ports is also needed before determining whether capacity is sufficient.

**Key finding:** Bl2 has the highest number of unique shared charging station users, with 18 individuals.

---

## 2. Most Popular Shared Charging Start Times

### Objective

Find the ten most popular combinations of weekdays and starting hours for shared charging sessions.

### SQL Query

```sql
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
```

### Results

| Weekday | Start Hour | Charging Sessions |
|---|---:|---:|
| Sunday | 17:00 | 30 |
| Friday | 15:00 | 28 |
| Thursday | 16:00 | 26 |
| Thursday | 19:00 | 26 |
| Sunday | 15:00 | 25 |
| Wednesday | 19:00 | 25 |
| Sunday | 18:00 | 25 |
| Monday | 15:00 | 24 |
| Friday | 16:00 | 24 |
| Saturday | 17:00 | 23 |

### Interpretation

- **Sunday at 17:00 is the most popular charging start time**, recording 30 sessions.
- Friday at 15:00 ranks second, with 28 sessions.
- Thursday has two popular starting periods, at 16:00 and 19:00, with 26 sessions each.
- Sunday appears three times in the top ten, suggesting that it is an active day for shared charging.
- Popular starting hours range from 15:00 to 19:00.

### Business Insights

- Sunday afternoon and evening may require closer monitoring because of the concentration of charging activity.
- Building managers could consider providing additional charging capacity or introducing scheduling arrangements during popular periods.
- These findings can help managers anticipate when tenants are more likely to need shared charging facilities.

**Key finding:** Sunday at 17:00 is the busiest individual starting period, with 30 charging sessions.

**Note:** This query ranks weekday-and-hour combinations. It does not calculate the total number of sessions for each weekday. A separate aggregation would be needed to identify the busiest weekday overall.

---

## 3. Users with Long Shared Charging Durations

### Objective

Find users whose average charging duration is longer than 10 hours when using shared charging stations.

### SQL Query

```sql
-- long_duration_shared_users

SELECT
    user_id,
    AVG(duration_hours) AS avg_charging_duration
FROM VEHICLES.CHARGING_SESSIONS
WHERE user_type = 'Shared'
GROUP BY user_id
HAVING AVG(duration_hours) > 10
ORDER BY AVG(duration_hours) DESC;
```

### Results

| User ID | Average Charging Duration (Hours) |
|---|---:|
| Share-9 | 16.85 |
| Share-17 | 12.89 |
| Share-25 | 12.21 |
| Share-18 | 12.09 |
| Share-8 | 11.55 |
| AdO3-1 | 10.37 |

*Average durations are rounded to two decimal places.*

### Interpretation

- **Share-9 has the longest average charging duration**, at approximately 16.85 hours.
- Share-17 follows with an average of 12.89 hours.
- Share-25 and Share-18 have similar averages of approximately 12.21 and 12.09 hours.
- Share-8 averages 11.55 hours.
- AdO3-1 has the lowest average among the qualifying users, at approximately 10.37 hours.

All six users have average charging durations exceeding the 10-hour threshold.

### Business Insights

- Share-9 has a particularly long average charging duration compared with the other qualifying users.
- Long charging sessions may reduce the availability of shared charging ports for other tenants.
- Building managers could investigate whether charging sessions are longer than necessary and consider measures such as charging time limits or idle fees.

However, a long charging duration does not necessarily mean that a user is occupying a port unnecessarily. Additional information, such as actual charging time compared with total plug-in time, would help confirm this.

**Key finding:** Six users have average shared charging durations exceeding 10 hours. Share-9 has the highest average, at approximately 16.85 hours.

---

## 4. Overall Project Findings

| Question | Main Finding | Business Implication |
|---|---|---|
| Unique users per garage | Bl2 has 18 unique users. | Monitor demand in garages with more shared charging users. |
| Popular charging start times | Sunday at 17:00 has 30 sessions. | Monitor peak weekday-and-hour periods. |
| Long charging durations | Share-9 averages 16.85 hours. | Investigate extended charging sessions and their effect on port availability. |

---

## 5. SQL Concepts Practised

| SQL Concept | Purpose | Applied In |
|---|---|---|
| `SELECT` | Selects the columns to retrieve. | All questions |
| `FROM` | Specifies the source table. | All questions |
| `WHERE` | Filters individual records. | All questions |
| `COUNT(DISTINCT)` | Counts unique values. | Question 1 |
| `COUNT(*)` | Counts records in each group. | Question 2 |
| `AVG()` | Calculates an average value. | Question 3 |
| `GROUP BY` | Groups records for aggregation. | All questions |
| `HAVING` | Filters grouped results using an aggregate condition. | Question 3 |
| `ORDER BY` | Sorts query results. | All questions |
| `DESC` | Sorts results in descending order. | All questions |
| `LIMIT` | Restricts the number of returned rows. | Question 2 |

### Important: WHERE vs HAVING

- `WHERE` filters individual rows before aggregation. For example, `WHERE user_type = 'Shared'` keeps only shared charging sessions.
- `HAVING` filters grouped results after aggregation. For example, `HAVING AVG(duration_hours) > 10` keeps users whose average charging duration exceeds 10 hours.

---

## 6. Conclusion

This project used SQL to analyse shared EV charging behaviour across apartment garages. The analysis identified which garages had the most unique users, the most popular weekday-and-hour charging periods, and users whose average charging durations exceeded 10 hours.

The results can help apartment building managers better understand demand patterns and consider ways to improve shared charging station availability.

Further analysis using the number of charging ports, total daily usage, and actual charging time could provide a more complete picture of charging station utilisation.
```

**Suggested filename:** `ev_charging_habits_sql_analysis.md`

You can save it using VS Code, Jupyter Notebook, or any text editor.
