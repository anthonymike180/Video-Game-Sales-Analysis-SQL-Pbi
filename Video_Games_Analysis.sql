-- Data cleaning by Anthony Michael 

------------------------------------------
-- Identify Null Values: PS4_GamesSales
SELECT 
    SUM(CASE WHEN Game IS NULL THEN 1 ELSE 0 END) AS null_count_game,
    SUM(CASE WHEN Year IS NULL THEN 1 ELSE 0 END) AS null_count_year,
    SUM(CASE WHEN Genre IS NULL THEN 1 ELSE 0 END) AS null_count_genre,
    SUM(CASE WHEN Publisher IS NULL THEN 1 ELSE 0 END) AS null_count_publisher,
    SUM(CASE WHEN `North America` IS NULL THEN 1 ELSE 0 END) AS null_count_NA,
    SUM(CASE WHEN Europe IS NULL THEN 1 ELSE 0 END) AS null_count_Europe,
    SUM(CASE WHEN Japan IS NULL THEN 1 ELSE 0 END) AS null_count_Japan,
    SUM(CASE WHEN `Rest of World` IS NULL THEN 1 ELSE 0 END) AS null_count_Rest_of_World,
    SUM(CASE WHEN Global IS NULL THEN 1 ELSE 0 END) AS null_count_Global
FROM ps4_gamessales;

------------------------------------------
-- Identify Null Values: XboxOne_GameSales
SELECT 
    SUM(CASE WHEN Game IS NULL THEN 1 ELSE 0 END) AS null_count_game,
    SUM(CASE WHEN Year IS NULL THEN 1 ELSE 0 END) AS null_count_year, 
    SUM(CASE WHEN Genre IS NULL THEN 1 ELSE 0 END) AS null_count_genre,
    SUM(CASE WHEN Publisher IS NULL THEN 1 ELSE 0 END) AS null_count_publisher,
    SUM(CASE WHEN `North America` IS NULL THEN 1 ELSE 0 END) AS null_count_NA,
    SUM(CASE WHEN Europe IS NULL THEN 1 ELSE 0 END) AS null_count_Europe,
    SUM(CASE WHEN Japan IS NULL THEN 1 ELSE 0 END) AS null_count_Japan,
    SUM(CASE WHEN `Rest of World` IS NULL THEN 1 ELSE 0 END) AS null_count_Rest_of_World,
    SUM(CASE WHEN Global IS NULL THEN 1 ELSE 0 END) AS null_count_Global
FROM xboxone_gamesales;

------------------------------------------
-- Identify Null Values: Video_Games_Sales_Analysis
SELECT 
    SUM(CASE WHEN Name IS NULL THEN 1 ELSE 0 END) AS null_count_name,
    SUM(CASE WHEN Platform IS NULL THEN 1 ELSE 0 END) AS null_count_platform, 
    SUM(CASE WHEN Genre IS NULL THEN 1 ELSE 0 END) AS null_count_genre,
    SUM(CASE WHEN Year_of_Release IS NULL THEN 1 ELSE 0 END) AS null_count_release_year,
    SUM(CASE WHEN Na_Sales IS NULL THEN 1 ELSE 0 END) AS null_count_NA,
    SUM(CASE WHEN EU_Sales IS NULL THEN 1 ELSE 0 END) AS null_count_EU,
    SUM(CASE WHEN JP_Sales IS NULL THEN 1 ELSE 0 END) AS null_count_Japan, 
    SUM(CASE WHEN Other_Sales IS NULL THEN 1 ELSE 0 END) AS null_count_Other_Sales, 
    SUM(CASE WHEN Global_Sales IS NULL THEN 1 ELSE 0 END) AS null_count_Global,
    SUM(CASE WHEN Critic_Score IS NULL THEN 1 ELSE 0 END) AS null_count_Critic_Score,
    SUM(CASE WHEN Critic_Count IS NULL THEN 1 ELSE 0 END) AS null_count_Critic_Count,
    SUM(CASE WHEN User_Score IS NULL THEN 1 ELSE 0 END) AS null_count_User_Score,
    SUM(CASE WHEN User_Count IS NULL THEN 1 ELSE 0 END) AS null_count_User_Count,
    SUM(CASE WHEN Developer IS NULL THEN 1 ELSE 0 END) AS null_count_Developer,
    SUM(CASE WHEN Rating IS NULL THEN 1 ELSE 0 END) AS null_count_Rating
FROM video_games_sales_analysis;

------------------------------------------
-- Data Cleaning: ALTER TABLE 
ALTER TABLE ps4_gamessales
MODIFY `North America` FLOAT,
MODIFY Europe FLOAT,
MODIFY Japan FLOAT,
MODIFY `Rest of World` FLOAT,
MODIFY Global FLOAT;

ALTER TABLE xboxone_gamesales
MODIFY `North America` FLOAT,
MODIFY Europe FLOAT,
MODIFY Japan FLOAT,
MODIFY `Rest of World` FLOAT,
MODIFY Global FLOAT;

------------------------------------------
-- PS4 Analysis
-- Highest Grossing Game
SELECT Game, ROUND(Global,2) AS Total_Revenue
FROM ps4_gamessales
ORDER BY Global DESC
LIMIT 1;

-- Highest Grossing Genre
SELECT Genre, ROUND(SUM(Global),2) AS Total_Revenue
FROM ps4_gamessales
GROUP BY Genre
ORDER BY SUM(Global) DESC
LIMIT 1;

-- Revenue by Region
SELECT 
    ROUND(SUM(`North America`),2) AS Revenue_in_NA,
    ROUND(SUM(Europe),2) AS Revenue_in_EU,
    ROUND(SUM(Japan),2) AS Revenue_in_JP,
    ROUND(SUM(`Rest of World`),2) AS Revenue_in_Other,
    ROUND(SUM(Global),2) AS Global_Revenue
FROM ps4_gamessales;

-- Top Publishers
SELECT Publisher, COUNT(Publisher) AS Total_Publishes
FROM ps4_gamessales
GROUP BY Publisher
ORDER BY Total_Publishes DESC;

-- Games by Genre
SELECT Genre, COUNT(Genre) AS N_of_Games
FROM ps4_gamessales
GROUP BY Genre
ORDER BY N_of_Games DESC;

-- Games by Year
SELECT Year, COUNT(Game) AS N_Games
FROM ps4_gamessales
GROUP BY Year
ORDER BY Year;

-- Genre Revenue and Game Count
SELECT Genre, ROUND(SUM(Global),2) AS Total_Revenue, COUNT(Game) AS N_Games
FROM ps4_gamessales
GROUP BY Genre
ORDER BY Total_Revenue DESC;

------------------------------------------
-- Xbox Analysis
-- Highest Grossing Game
SELECT Game, ROUND(Global,2) AS Total_Revenue
FROM xboxone_gamesales
ORDER BY Global DESC
LIMIT 1;

-- Highest Grossing Genre
SELECT Genre, ROUND(SUM(Global),2) AS Total_Revenue
FROM xboxone_gamesales
GROUP BY Genre
ORDER BY Total_Revenue DESC
LIMIT 1;

-- Revenue by Region
SELECT 
    ROUND(SUM(`North America`),2) AS Revenue_in_NA,
    ROUND(SUM(Europe),2) AS Revenue_in_EU,
    ROUND(SUM(Japan),2) AS Revenue_in_JP,
    ROUND(SUM(`Rest of World`),2) AS Revenue_in_Other,
    ROUND(SUM(Global),2) AS Global_Revenue
FROM xboxone_gamesales;

-- Top Publishers
SELECT Publisher, COUNT(Publisher) AS Total_Publishes
FROM xboxone_gamesales
GROUP BY Publisher
ORDER BY Total_Publishes DESC;

-- Games by Genre
SELECT Genre, COUNT(Genre) AS N_of_Genres
FROM xboxone_gamesales
GROUP BY Genre
ORDER BY N_of_Genres DESC;

-- Games by Year
SELECT Year, COUNT(Game) AS N_Games
FROM xboxone_gamesales
GROUP BY Year
ORDER BY Year;

-- Genre Revenue and Game Count
SELECT Genre, ROUND(SUM(Global),2) AS Total_Revenue, COUNT(Game) AS N_Games
FROM xboxone_gamesales
GROUP BY Genre
ORDER BY Total_Revenue DESC;

------------------------------------------
-- Video Games Analysis
SELECT * FROM video_games_sales_analysis;

-- Top Game
SELECT Name, Global_Sales AS Total_Revenue
FROM video_games_sales_analysis
ORDER BY Global_Sales DESC
LIMIT 1;

-- Top Genre
SELECT Genre, ROUND(SUM(Global_Sales),2) AS Total_Revenue
FROM video_games_sales_analysis
GROUP BY Genre
ORDER BY Total_Revenue DESC
LIMIT 1;

-- Revenue by Region
SELECT 
    ROUND(SUM(NA_Sales),2) AS Revenue_in_NA,
    ROUND(SUM(EU_Sales),2) AS Revenue_in_EU,
    ROUND(SUM(JP_Sales),2) AS Revenue_in_JP,
    ROUND(SUM(Other_Sales),2) AS Revenue_in_Other,
    ROUND(SUM(Global_Sales),2) AS Global_Revenue
FROM video_games_sales_analysis;

-- Genre Metrics
SELECT 
    Genre,
    COUNT(Genre) AS N_Games,
    COUNT(User_Count) AS Total_Users,
    ROUND(SUM(Global_Sales),2) AS Total_Revenue,
    ROUND(AVG(User_Score),2) AS Average_User_Score
FROM video_games_sales_analysis
GROUP BY Genre
ORDER BY N_Games DESC;

-- Year Metrics
SELECT 
    Year_of_Release,
    COUNT(Name) AS N_Games,
    COUNT(User_Count) AS Total_Users,
    ROUND(SUM(Global_Sales),2) AS Total_Revenue
FROM video_games_sales_analysis
GROUP BY Year_of_Release
ORDER BY Year_of_Release;

-- Platform Metrics
SELECT 
    Platform,
    COUNT(Name) AS N_Games,
    COUNT(User_Count) AS Total_Users,
    ROUND(AVG(User_Score),2) AS Average_Score
FROM video_games_sales_analysis
GROUP BY Platform
ORDER BY N_Games DESC;
