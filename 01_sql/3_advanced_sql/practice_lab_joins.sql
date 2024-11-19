-- Original version (a bit messy, but correct)
SELECT
  COALESCE(ad.user_id, da.user_id) as user_id,
CASE
    WHEN paid > 0 and ad.status = 'CHURN' then 'RESURRECT'
    WHEN paid > 0 and ad.status IS NULL then 'NEW'
    WHEN paid > 0 and ad.status = 'NEW' then 'EXISTING'
    WHEN paid > 0 and ad.status = 'RESURRECT' then 'EXISTING'
    WHEN paid > 0 and ad.status = 'EXISTING' then 'EXISTING'
    when paid is null then 'CHURN'
    END as new_status
FROM advertiser as ad
FULL OUTER JOIN daily_pay as da
on ad.user_id=da.user_id
ORDER BY user_id;


-- Reviewed version (cleaner CASE statement)
SELECT
  COALESCE(ad.user_id, da.user_id) as user_id,
CASE
    WHEN paid IS NULL THEN 'CHURN'
    WHEN paid IS NOT NULL AND ad.status IN ('NEW','EXISTING','RESURRECT') THEN 'EXISTING'
    WHEN paid IS NOT NULL AND ad.status = 'CHURN' THEN 'RESURRECT'
    WHEN paid IS NOT NULL AND ad.status IS NULL THEN 'NEW'
    END as new_status
FROM advertiser as ad
FULL OUTER JOIN daily_pay as da
on ad.user_id=da.user_id
ORDER BY user_id;
