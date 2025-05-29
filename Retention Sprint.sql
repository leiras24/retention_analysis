WITH
  weeks AS (
  SELECT
    DATE_TRUNC(subscription_start, WEEK) AS registration_week,
    DATE_TRUNC(subscription_end, WEEK) AS registration_end,
    user_pseudo_id,
    subscription_start,
    subscription_end
  FROM
    `tc-da-1.turing_data_analytics.subscriptions` )
SELECT
  registration_week,
  COUNT(user_pseudo_id) AS week_0_users,
  SUM(CASE
      WHEN DATE_ADD(registration_week, INTERVAL 1 WEEK) <= DATE '2021-02-07' AND (subscription_end IS NULL OR DATE_ADD(registration_week, INTERVAL 1 WEEK) <= registration_end) THEN 1
      ELSE 0
  END
    ) AS week_1,
  SUM(
    CASE
      WHEN DATE_ADD(registration_week, INTERVAL 2 WEEK) <= DATE '2021-02-07' AND (subscription_end IS NULL OR DATE_ADD(registration_week, INTERVAL 2 WEEK) <= registration_end) THEN 1
      ELSE 0
  END
    ) AS week_2,
  SUM(
    CASE
      WHEN DATE_ADD(registration_week, INTERVAL 3 WEEK) <= DATE '2021-02-07' AND (subscription_end IS NULL OR DATE_ADD(registration_week, INTERVAL 3 WEEK) <= registration_end) THEN 1
      ELSE 0
  END
    ) AS week_3,
  SUM(
    CASE
      WHEN DATE_ADD(registration_week, INTERVAL 4 WEEK) <= DATE '2021-02-07' AND (subscription_end IS NULL OR DATE_ADD(registration_week, INTERVAL 4 WEEK) <= registration_end) THEN 1
      ELSE 0
  END
    ) AS week_4,
  SUM(
    CASE
      WHEN DATE_ADD(registration_week, INTERVAL 5 WEEK) <= DATE '2021-02-07' AND (subscription_end IS NULL OR DATE_ADD(registration_week, INTERVAL 5 WEEK) <= registration_end) THEN 1
      ELSE 0
  END
    ) AS week_5,
  SUM(
    CASE
      WHEN DATE_ADD(registration_week, INTERVAL 6 WEEK) <= DATE '2021-02-07' AND (subscription_end IS NULL OR DATE_ADD(registration_week, INTERVAL 6 WEEK) <= registration_end) THEN 1
      ELSE 0
  END
    ) AS week_6
FROM
  weeks
GROUP BY
  registration_week; 