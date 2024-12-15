**# SQL-Netflix-Analysis**
📊 Netflix Movies &amp; TV Shows Analysis A comprehensive analysis of Netflix’s content using SQL to uncover trends, insights, and solutions. Key focus areas include content distribution, popular genres, ratings, and regional patterns. The project addresses business questions to guide content strategy and audience engagement. 🚀


**🎯 Project Objectives**


1.	Content Distribution:
Evaluate the distribution of content types (Movies vs TV Shows) to identify audience consumption trends and inform content acquisition decisions.
	2.	Audience Preferences:
Analyze the most common ratings for Movies and TV Shows to understand audience demographics and optimize content targeting.
	3.	Market Insights:
Assess content availability across release years, countries, and durations to uncover regional strengths and opportunities for content localization.
	4.	Keyword-Based Categorization:
Identify and categorize content based on specific themes (e.g., violence, documentaries) to enhance searchability and personalized recommendations.

**🧩 Business Impact**
	•	Content Strategy:
Insights into top-performing genres, ratings, and durations help prioritize investments in content creation and licensing.
	•	Regional Expansion:
Analysis of country-wise content distribution highlights opportunities for targeted marketing and regional production.
	•	Audience Engagement:
Understanding viewer preferences (e.g., ratings, themes) enables Netflix to enhance user satisfaction and retention through tailored recommendations.
	•	Operational Optimization:
Identifying underutilized content categories and gaps supports data-driven decisions for content placement and curation.

**📂 Dataset**

The data for this project is sourced from the Kaggle Netflix Movies and TV Shows dataset, which provides detailed metadata on Netflix’s content library, including:
	•	Content Type: Movies or TV Shows
	•	Title: Name of the content
	•	Director: Associated directors
	•	Cast: Actors appearing in the content
	•	Country: Origin or primary distribution country
	•	Date Added: Date the content was added to Netflix
	•	Release Year: Year the content was released
	•	Rating: Content maturity ratings (e.g., PG, TV-MA)
	•	Duration: Runtime for movies or number of seasons for TV shows
	•	Genre: Content categorization (e.g., Documentaries, Dramas)
	•	Description: Brief description or summary of the content

Dataset Link:

[Movies Dataset on Kaggle](https://www.kaggle.com/datasets/shivamb/netflix-shows?resource=download)

**Schema**



                DROP TABLE IF EXISTS netflix;
		CREATE TABLE netflix (
		    show_id VARCHAR(10),            -- Unique identifier for each show
		    type VARCHAR(10),               -- Content type: Movie or TV Show
		    title VARCHAR(150),             -- Title of the content
		    director VARCHAR(250),          -- Name(s) of the director(s)
		    casts VARCHAR(1000),            -- Cast members, comma-separated
		    country VARCHAR(150),           -- Country of origin or distribution
		    date_added VARCHAR(50),         -- Date when content was added to Netflix
		    release_year INT,               -- Year of release
		    rating VARCHAR(30),             -- Maturity rating (e.g., PG-13, TV-MA)
		    duration VARCHAR(30),           -- Duration: runtime for movies, seasons for TV shows
		    listed_in VARCHAR(100),         -- Genres/categories of the content
		    description VARCHAR(300)        -- Short description of the content
		);




**🔍 Findings and Conclusions**

**1. Content Distribution**
	•	Netflix’s catalog features a diverse mix of Movies and TV Shows, with Movies dominating the content library.
	•	Content spans multiple genres, durations, and ratings, catering to a wide range of audience preferences.

**2. Common Ratings**
	•	Ratings like TV-MA (Mature Audience) and PG-13 are the most prevalent, indicating a strong focus on content tailored to older teens and adult viewers.
	•	Understanding these ratings provides valuable insights into Netflix’s target audience demographics.

**3. Geographical Insights**
	•	The United States and India lead as top contributors to Netflix’s content library.
	•	Regional analysis highlights content localization opportunities to further engage global markets.
	•	The average content release trends in India and France underscore Netflix’s focus on high-growth regions.

**4. Content Categorization**
	•	Categorizing content based on specific keywords (e.g., violence, documentaries) reveals patterns in content themes, helping to identify user engagement opportunities.
	•	Genres like Documentaries, Dramas, and Comedies are highly represented, reflecting user demand for these categories.

**🎯 Conclusion**

This analysis offers a comprehensive understanding of Netflix’s content strategy, including distribution trends, audience targeting, and regional strengths. The findings can help Netflix:
	1.	Optimize Content Acquisition: Focus on top-performing genres and ratings.
	2.	Enhance Audience Engagement: Personalize recommendations based on content patterns.
	3.	Expand Regional Influence: Localize and prioritize content for high-demand markets like India and the USA.
	4.	Refine Content Themes: Identify opportunities to diversify content based on emerging audience interests.

By leveraging these insights, Netflix can continue to grow its subscriber base, improve content curation, and strengthen its competitive edge in the streaming market. 🚀
