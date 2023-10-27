/*
Skills used: Joins, Union, Having Clause,Case Statements, Alising 


*/
-- Combine both tables for one output 

SELECT ID, Transit_Score, Commute_Time
FROM UsCities.commutetime;
UNION
SELECT ID, City, Population
FROM UsCities.costofliving
ORDER BY ID

-- What city & state has the highest rent in the US? 

SELECT Max(Avg_Rent)
FROM USCities.costofliving
WHERE Avg_Rent is not null

SELECT City, State
FROM USCities.costofliving 
WHERE AVG_Rent = 3422

-- Total Avg_Income VS Cost_Of_Living in different cities/states 
-- Shows the diffrence of the cost of living and Average income in each state 

SELECT Max(Avg_Income), Max(Cost_of_Living)
FROM USCities.costofliving
WHERE City like '%State%'

SELECT City, State
FROM USCities.costofliving 
WHERE Avg_Income = 54994 OR Cost_of_Living = 9.88

SELECT Min(Avg_Income), Min(Cost_of_Living)
FROM USCities.costofliving 
WHERE Avg_Income 
-- Fetch the Average of all of the States AVG Income 
SELECT AVG(Avg_Income)
FROM USCities.costofliving
WHERE Avg_Income
-- Fetch the city and population more than 100000
SELECT City, Population
FROM USCities.costofliving 
WHERE Population >100000
--  Join cost of living and commute time tables based on the ID of each table 

Select *
 FROM UsCities.costofliving
 Join USCities.commutetime
 ON USCities.costofliving.ID = commutetime.ID
 
 -- Show the records obtained from the right of the tables. 
 SELECT * 
 FROM USCities.costofliving 
 Right Outer Join USCities.commutetime
 ON USCities.costofliving.ID = commutetime.ID
 
 -- Show the records obtained from the left of the tables what results are present. 
 
 SELECT *
 FROM USCities.costofliving 
 Left Outer Join USCities.commutetime
 On USCities.costofliving.ID = commutetime.ID
 
 -- What does a Transit Score of 5.5 represent within records?
 
 SELECT Latitude,Longitude,Commute_Time, Transit_Score
 FROM USCities.costofliving 
  Join USCities.commutetime
 ON costofliving.ID = commutetime.ID
 WHERE Transit_Score = 5.5
-- Provide a list of cities categorized as 'Large' and 'Small' based on their population size? What are some examples of each category?
SELECT State, City, Population,
  CASE
    WHEN Population < 100000 THEN 'Small'
    WHEN Population BETWEEN 1000000 AND 30000000 THEN 'Populous'
    ELSE 'Large'
  END AS CitySize
FROM USCities.costofliving
WHERE Population IS NOT NULL
ORDER BY Population;

-- What is the average transit score for cities with similar commute times? Are there noticeable trends or patterns in transit scores based on commute time?
SELECT Commute_Time, AVG(Transit_Score)
FROM UsCities.costofliving
JOIN UsCities.commutetime
ON UsCities.costofliving.ID = UsCities.commutetime.ID
GROUP BY Commute_Time
HAVING COUNT(*) > 1;
-- Aliasing to clean up/ keep order 
SELECT COF.ID, CT. Commute_Time
FROM USCities.costofliving AS COF 
JOIN USCities.commutetime AS CT
ON COF.ID = CT.ID 
-- This is the completed data based on the question completed 





 
 
 
 









