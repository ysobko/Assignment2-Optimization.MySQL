CREATE INDEX idx_test_prep ON study_performance(test_preparation_course);
CREATE INDEX idx_parental_education ON study_performance(parental_level_of_education);
CREATE INDEX idx_gender_race ON study_performance(gender, race_ethnicity);
CREATE INDEX idx_math_score ON study_performance(math_score);
