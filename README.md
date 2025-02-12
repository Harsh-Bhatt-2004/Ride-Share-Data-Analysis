# Ride-Share Data Analysis

## Project Overview
In this project we analyze the ride-share data using SQL and performing data management, processing and using in-depth analysis 
find meaningful information for improving company's services and reputation from rating given by their customers. Normally, the 
data about highly preferred pickup location, average distance of rides and rating to drivers based on services....

## Tools and Technologies
- **SQL**: Structured Query Language(SQL) was used for querying and managing the database.
- **DBeaver**: An open-source database management tool provide comprehensive interface for executing SQL queries, database schema
and managing database connections.
- **MySQL Server**: The project utilized with MySQL server created on MySQL Workbench, known for its scalability, performance 
and advanced security features.

## Dataset Overview
The dataset consisted of following tables:
- **Drivers**: Contains the information about the drivers like name, rating, total rides, earnings etc. Which is associated with rides.
- **Passengers**: Details about passengers some when the login with system like name, age, gender, contact no. etc. And some additional
information associated with their rides like total rides, spent and rating based on given service.
- **Rides**: The table about all the rides taken by passenger and ride by drivers contain combined info. about above both tables
like id's of passenger, driver and ride, pickup and dropoff location, fare and duration of ride and payment method choosed by passenger.

## Process
1. **Importing and Stroing The Data**
   - **Database Creation**: A database was created to act as a container for storing data.
   - **Importing CSV Files**: Imported three CSV files (rides, passenger, driver) into the database.
   - **Execution of Queries**: After successful data import, moved on to execute the main SQL queries. 

2. **Data Analysis with SQL**
   - **SQL Queries**: Used SQL queries to extract insights from the database tables.
   - **Key Extracted Insights**:
       - Calculated the average duration of rides.
       - Identified the most frequent pickup or drop-off locations preferred by passengers.
       - Determined the average amount spent on rides by passengers.
       - Retrieved driver details with the highest number of ratings.
       - Analyzed monthly earnings and average ratings achieved by the company based on user ride experience.

3. **Database Operation to Manipulate Database**
   - **Indexes** are used to speed up the retrieval of rows from a database table, which improves the performance of query execution.
   - **Views** are virtual tables that simplify complex queries and create reusable queries for easy data access.
   - **Stored procedures** and functions encapsulate complex logic into reusable code, enabling efficient and consistent execution of database operations.

## Results
  - The output of analyzing Uber ride details is to find useful information where we found that there are **50K+** rides booked. The average duration of any ride is around **32 minutes**, and the most common pickup location is **Ghaziabad**, booked by more than **350** passengers.
  - Among all the rides, some passengers also booked more than **1K+** rides over a year, with an average spend of **1.5K-2K**. Additionally, the driver named **Nirvi Golla** has driven the highest number of rides, and more than 10 drivers received a **5-star** rating.
  - Overall analysis shows that the company is running at a profit, with an increase in profit percentage of **6-8%** over a year.  
