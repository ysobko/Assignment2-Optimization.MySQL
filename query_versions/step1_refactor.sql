USE Assignment2;

WITH TopParentalEducation AS (
    SELECT parental_level_of_education
    FROM study_performance
    GROUP BY parental_level_of_education
    ORDER BY COUNT(*) DESC
    LIMIT 2
),
OverallAvgMath AS (
    SELECT AVG(math_score) AS avg_math_score
    FROM study_performance
),
FilteredStudents AS (
    SELECT *
    FROM study_performance
    WHERE test_preparation_course = 'completed'
      AND parental_level_of_education IN (SELECT parental_level_of_education FROM TopParentalEducation)
)
SELECT 
    gender,
    race_ethnicity,
    AVG(math_score) AS avg_math_score,
    AVG(reading_score) AS avg_reading_score,
    AVG(writing_score) AS avg_writing_score
FROM
    FilteredStudents
GROUP BY
    gender,
    race_ethnicity
HAVING
    AVG(math_score) > (SELECT avg_math_score FROM OverallAvgMath)
ORDER BY
    avg_math_score DESC,
    avg_reading_score DESC;
