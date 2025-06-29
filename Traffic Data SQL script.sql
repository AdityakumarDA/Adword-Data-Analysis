CREATE DATABASE IF NOT EXISTS Traffic_project;

USE Traffic_project;

CREATE TABLE Keyword_table (
    title VARCHAR(250) NOT NULL,
    keyword VARCHAR(250) NOT NULL,
    keyword_ID INT NOT NULL,
    keyword_ID INT NOT NULL,
    positions INT NOT NULL,
    previous_positions INT NOT NULL,
	last_seen DATE NOT NULL,
    Search_Volume INT NOT NULL,
    CPC decimal(10,2) NOT NULL,
    Traffic INT NOT NULL,
    Traffic_Percent decimal(10,2) NOT NULL,
    Traffic_Cost int NOT NULL,
    Traffic_Cost_Percent decimal(10,2) NOT NULL,
    Competition decimal(10,2) NOT NULL,
    Number_of_Results INT NOT NULL,
    Keyword_difficulty INT NOT NULL);

SELECT * FROM keyword;
SELECT * FROM keyword_difficulty;
SELECT * FROM website_traffic_data;
SELECT * FROM search_volume;

