-- EDA anlysis on  Netflix Dataset --

--1. Dataset Setup
--Create the Table

DROP TABLE IF EXISTS netflix;
CREATE TABLE netflix
(
    show_id      VARCHAR(5),
    type         VARCHAR(10),
    title        VARCHAR(250),
    director     VARCHAR(550),
    casts        VARCHAR(1050),
    country      VARCHAR(550),
    date_added   VARCHAR(55),
    release_year INT,
    rating       VARCHAR(15),
    duration     VARCHAR(15),
    listed_in    VARCHAR(250),
    description  VARCHAR(550)
);	
-- To Check the data that was imported above --

Select * from Netflix;

--- To Verify if the total Number of rows imnorted match the CSV file

Select  count(*) as tal_rows_imported from Netflix;

--2. Exploratory Data Analysis (EDA)

--2.1 Distinct Content Types (Movies vs TV Shows)

Select Count(Distinct(type)) from netflix;
Select Distinct type from netflix;
Select * from Netflix;

--Lets explore the number of TV shows and Movies that are hosted on netflix accoding to the data set

Select type, 
count(*) as total_number_of_movies_and_tvshows 
from netflix 
group by 1; 

---2.3 Most Common Ratings for Movies and TV Shows
select type, 
rating, 
cnt as highest_count
from 
	(
		Select type, 
		rating,
		count(*) as cnt,
		rank () 
		over (partition by type order by count(*)desc) as ranking
		from netflix
		group by 1,2
	) as t1
where 
	ranking=1;
-- 3. Content-Based Analysis
--3.1 Movies Released in a Specific Year (2020 Example)
Select *  from netflix
where type ='Movie' and release_year = 2020;

-- 3.2 Top 5 Countries with the Most Netflix Content
select 
unnest(STRING_TO_ARRAY(country,',')) as new_country,
count (show_id) as count_number
from netflix
where country is not null
group by 1
order by count_number desc
Limit 5;

-- 3.3 Longest Movies or TV Shows

select type,title, duration
from netflix
where duration is not null
order by duration desc
limit 5;

--4. Time-Based Analysis 
-- 4.1 Content Added in the Last 5 Years
SELECT type, title
FROM netflix
WHERE TO_DATE(date_added, 'Month DD, YYYY') >= CURRENT_DATE - INTERVAL '5 years' ;

-- 4.2 Average Content Released in France
SELECT 
    country,
    release_year,
    COUNT(show_id) AS total_release,
    ROUND(
        COUNT(show_id)::numeric /
        	(
				SELECT COUNT(show_id) 
				FROM netflix 
				WHERE country = 'India')::numeric * 100, 2
    	) AS avg_release
FROM netflix
WHERE country = 'France'
GROUP BY country, release_year
ORDER BY avg_release DESC
LIMIT 5;

-- 5. Director and Cast Analysis
--5.1 Movies/TV Shows by Director ‘Rajiv Chilaka’


Select *
from 
(
select *,
unnest(string_to_array(director,',')) as directors_name
from netflix
) as t
where directors_name ='Rajiv Chilaka';

--5.2 TV Shows with More Than 5 Seasons
Select * from netflix
where type = 'TV Show'
and SPLIT_PART(duration, ' ', 1)::INT > 5;

----Count the Number of Content Items in Each Genre

Select 
UNNEST(STRING_TO_ARRAY(listed_in, ',')) as genre,
count (*) as total_content
from netflix
group by 1;

--5.3 Movies Featuring ‘Salman Khan’ in the Last 10 Years

select *
from (
		select *,
		unnest(string_to_array(casts,',')) as actors
		from netflix
	) as t1
where actors='Salman Khan';

---5.4 Top 10 Actors in USA-Based Movies

select actors,count(*) as number_of_appearnces 
from(
		select *,
		unnest(string_to_array(casts,',')) as actors
		from netflix
	) as t1
where Ncountry='United States'
group by actors
order by 2 desc;

--6. Genre-Based Analysis
--6.1 Count of Content Items in Each Genre
SELECT UNNEST(STRING_TO_ARRAY(listed_in, ',')) AS genre,
       COUNT(*) AS total_content
FROM netflix
GROUP BY genre
ORDER BY total_content DESC;

--6.2 List All Documentaries
Select *
From (
		select *,
		unnest (string_to_array(listed_in,','))as genre
		from netflix
	)as t1
where genre ='Documentaries' and type ='Movie';

--6.3 All Content Without a Director
Select *
from netflix
where director is null;



--7. Additional Insights
--7.1 Content Categorized by Keywords (Kill/Violence)


-- Categorize Content Based on the Presence of 'Kill' and 'Violence' Keywords
Select category,
count (*) as content_count
From (
		select 
		case
		when description ILIKE '%Kill%' or description ILIKE '%violence%' then 'Bad'
		else 'Good'
		end as category
		from netflix
) As category_content
group by category;




