# analyzing-electric-vehicle-chraging-habits-using-sql
As electronic vehicles (EVs) become more popular, there is an increasing need for access to charging stations.  In this introductory project, you will use a dataset containing information on station usage to help apartment building managers better understand their tenants’ EV charging habits.

## Case Study
As electronic vehicles (EVs) become more popular, there is an increasing need for access to charging stations, also known as ports. To that end, many modern apartment buildings have begun retrofitting their parking garages to include shared charging stations. A charging station is shared if it is accessible by anyone in the building.

But with increasing demand comes competition for these ports — nothing is more frustrating than coming home to find no charging stations available! In this project, you will use a dataset to help apartment building managers better understand their tenants’ EV charging habits.

The data has been loaded into a Google BigQuery database, containing a schema called `VEHICLES` and a single table named `CHARGING_SESSIONS` with the following columns:

## VEHICLES.CHARGING_SESSIONS

| Column | Definition | Data type |
|-|-|-|
|`garage_id`| Identifier for the garage/building|`STRING`|
|`user_id` | Identifier for the individual user|`STRING`|
|`user_type`|Indicating whether the station is `Shared` or `Private`| `STRING` |
|`start_plugin`|The date and time the session started |`TIMESTAMP`|
|`start_plugin_hour`|The hour (in military time) that the session started | `NUMERIC`|
|`end_plugout`|The date and time the session ended | `TIMESTAMP` |
|`end_plugout_hour`|The hour (in military time) that the session ended | `NUMERIC`|
|`duration_hours`| The length of the session, in hours|`NUMERIC`|
|`el_kwh`| Amount of electricity used (in Kilowatt hours)|`NUMERIC`|
|`month_plugin`| The month that the session started |`STRING`|
|`weekdays_plugin`| The day of the week that the session started|`STRING`|

Let’s get started!

#### Sources
- **Data**: [CC BY 4.0](https://creativecommons.org/licenses/by/4.0), via [Kaggle](https://www.kaggle.com/datasets/anshtanwar/residential-ev-chargingfrom-apartment-buildings),

Write three SQL queries to answer the following questions:

1. Find the number of unique individuals that use each garage’s **shared** charging stations. The output should contain two columns: `garage_id` and `num_unique_users`. Sort your results by the number of unique users from highest to lowest. Save the result as `unique_users_per_garage`.
   
  ```sql
  -- unique_users_per_garage
  -- Modify the code below
  SELECT *
  FROM VEHICLES.CHARGING_SESSIONS
  LIMIT 5;
  ```

2. Find the top 10 most popular charging start times (by weekday and start hour) for sessions that use **shared** charging stations. Your result should contain three columns: `weekdays_plugin`, `start_plugin_hour`, and a column named `num_charging_sessions` containing the number of plugins on that weekday at that hour. Sort your results from the most to the least number of sessions. Save the result as `most_popular_shared_start_times`.
  ```sql
  -- most_popular_shared_start_times
  
  ```

3. Find the users whose average charging duration last longer than 10 hours when using **shared** charging stations. Your result should contain two columns: `user_id` and `avg_charging_duration`. Sort your result from highest to lowest average charging duration. Save the result as `long_duration_shared_users`.
  ```sql
  -- long_duration_shared_users
  
  ```

Three SQL cells have been created for you in the workbook. To access the data, you will need to select data using the syntax `FROM VEHICLES.CHARGING_SESSIONS` - **the schema and table names are case-sensitive, so please only use capital letters**.
