CREATE DATABASE Assignment2;
USE Assignment2;

study_performance
SELECT 
    t1.gender,
    t1.race_ethnicity,
    AVG(t1.math_score) AS avg_math_score,
    AVG(t1.reading_score) AS avg_reading_score,
    AVG(t1.writing_score) AS avg_writing_score
FROM
    study_performance t1
JOIN
    (
        SELECT parental_level_of_education
        FROM study_performance
        GROUP BY parental_level_of_education
        ORDER BY COUNT(*) DESC
        LIMIT 2
    ) t2 ON t1.parental_level_of_education = t2.parental_level_of_education
WHERE
    t1.test_preparation_course = 'completed'
GROUP BY
    t1.gender,
    t1.race_ethnicity
HAVING
    AVG(t1.math_score) > (
        SELECT AVG(math_score)
        FROM study_performance
    )
ORDER BY
    avg_math_score DESC,
    avg_reading_score DESC;
