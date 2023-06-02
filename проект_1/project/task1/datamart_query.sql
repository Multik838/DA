CREATE TABLE analysis.dm_rfm_segments as
SELECT r.user_id,
r.recency as r_score,
f.frequency as f_score,
m.monetary_value as m_score,
CONCAT(r.recency, f.frequency, m.monetary_value) as rfm_segment
FROM analysis.tmp_rfm_recency r
INNER JOIN analysis.tmp_rfm_frequency f ON r.user_id = f.user_id
INNER JOIN analysis.tmp_rfm_monetary_value m ON r.user_id = m.user_id
ORDER BY r.user_id;

-- первые десять строк отсортированные по user_id
SELECT user_id, r_score, f_score, m_score, rfm_segment
FROM analysis.dm_rfm_segments
ORDER BY user_id
LIMIT 10;





