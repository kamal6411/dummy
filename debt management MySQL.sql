-- Firstly create a database for international debt analysis. 
create database international_debt;
use international_debt;
-- Secondly, we have to create table 
create table international_debt(country_name varchar(50) NOT NULL, country_code varchar(20), 
indicator_name varchar(250), indicator_code varchar(100), debt float);

# insert records in table 
insert into international_debt values("Afghanistan", "AFG", "Disbursements on external debt, long-term (DIS, current US$)", "DT.DIS.DLXF.CD", 72894453.700000003),
                                     ("Bangladesh", "BGD", "Average interest on new external debt commitments (%)", "DT.INR.DPPG", 39107845),
                                     ("Brazil", "BRA", "PPG, multilateral (INT, current US$)","DT.INT.MLAT.CD", 61739336.899999999),
                                     ("China", "CHN", "External debt stocks, long-term (DOD, current US$)","DT.DOD.DLXF.CD", 23779724.300000001),
                                     ("Colombia","COL", "Average maturity on new external debt commitments","DT.MAT.OFFT", 39107845),
                                     ("India", "IND", "Debt service on external debt, long-term (TDS, current US$)", "DT.TDS.DLXF.CD", 15248000),
                                     ("Nepal", "NPL", "Net financial flows, bilateral (NFL, current US$)", "DT.NFL.BLAT.CD", 23779724.30000000),
                                     ("Nigeria", "NGA", "External debt stocks, total (DOD, current US$)", "DT.DOD.DECT.CD", 72894453.700000003),
                                     ("Pakistan","PAK", "IMF repurchases (AMT, current US$)", "DT.AMT.DIMF.CD", "28400000"),
                                     ("Russian Federation", "RUS", "PPG, IDA (INT, current US$)", "DT.INT.MIDA.CD", 899999999);
                                     
-- 1. Lets's first select all the columns from table limit 5 rows.
select * from international_debt limit 5; 

-- 2. Finding the number of distinct countries.
select COUNT(DISTINCT country_name) total_distinct_countries from international_debt;

-- 3. Finding out the distinct debt indicators.
SELECT DISTINCT indicator_code AS distinct_debt_indicator FROM INTERNATIONAL_DEBT ORDER BY distinct_debt_indicator;

-- 4. Totaling the amount of debt owed by the countries.
select ROUND(SUM(debt), 2) AS total_debt from international_debt;

-- 5. Country with the highest debt.
SELECT country_name, sum(debt) as total_debt from international_debt group by country_name order by total_debt desc limit 1;

-- 6.  Average amount of debt across indicators.
SELECT  indicator_code as debt_indicator, indicator_name, avg(debt) as average_debt 
from international_debt group by 1,2 order by 3;

-- 7.The most common debt indicator
select indicator_code, count(indicator_code) as indicator_count from international_debt 
group by indicator_code  order by indicator_count desc, indicator_code desc;

-- 8. Countries with Debt Under a Certain Threshold:-- Which countries owe less than $100 million in total debt?
select country_name,sum(debt) as total_debt from international_debt group by country_name having total_debt<100000000;

-- 9. What is the total debt for a country "Brazil"?
select country_name, sum(debt) as total_debt from international_debt WHERE country_name ="Brazil"; 

 


  
                                    