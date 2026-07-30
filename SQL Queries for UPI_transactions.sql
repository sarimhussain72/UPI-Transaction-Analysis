

-- 1. Total Number of Transactions : 

SELECT COUNT(*) AS Total_Transactions
FROM phonepay_raw_data;

-- 2. Total Transaction Amount :

SELECT SUM(Amount_INR) AS Total_Amount
FROM phonepay_raw_data;

-- 3. Average Transaction Amount :

SELECT AVG(Amount_INR) AS Average_Amount
FROM phonepay_raw_data;

-- 4. Maximum Transaction Amount :

SELECT MAX(Amount_INR) AS Highest_Transaction
FROM phonepay_raw_data;

-- 5. Minimum Transaction Amount :

SELECT MIN(Amount_INR) AS Lowest_Transaction
FROM phonepay_raw_data;

--  6. Successful Transactions :

 SELECT COUNT(*) AS Successful_Transactions
 FROM phonepay_raw_data
 WHERE Status='SUCCESS';

-- 7. Failed Transactions :

 SELECT COUNT(*) AS Failed_Transactions
 FROM phonepay_raw_data
 WHERE Status='FAILED';

-- 8. Success Rate :

 SELECT
 ROUND(
 SUM(CASE WHEN Status='SUCCESS' THEN 1 ELSE 0 END)
 *100/COUNT(*),2) AS Success_Rate
 FROM phonepay_raw_data;

--  9. Total Cashback :

 SELECT SUM(Cashback_INR) AS Total_Cashback
 FROM phonepay_raw_data;

-- 10. Average Cashback :

 SELECT AVG(Cashback_INR) AS Average_Cashback
 FROM phonepay_raw_data;

-- 11. Transactions by Payment Method :

 SELECT
     Payment_Mode,
     COUNT(*) AS Total_Transactions
 FROM phonepay_raw_data
 GROUP BY Payment_Mode
 ORDER BY Total_Transactions DESC;

-- 12. Transactions by Bank :

 SELECT Bank_Name,
 COUNT(*) AS Transactions
 FROM phonepay_raw_data
 GROUP BY Bank_Name
 ORDER BY Transactions DESC;

-- 13. Transaction Amount by Bank :

 SELECT Bank_Name,
 SUM(Amount_INR) AS Total_Amount
 FROM phonepay_raw_data
 GROUP BY Bank_Name
 ORDER BY Total_Amount DESC;

-- 14. Transactions by State :

 SELECT State,
 COUNT(*) AS Transactions
FROM phonepay_raw_data
GROUP BY State
ORDER BY Transactions DESC;

-- 15. Transaction Amount by State :

SELECT State,
SUM(Amount_INR) AS Total_Amount
FROM phonepay_raw_data
GROUP BY State
ORDER BY Total_Amount DESC;

-- 16. Transactions by Merchant :

SELECT Merchant_Name,
COUNT(*) AS Transactions
FROM phonepay_raw_data
GROUP BY Merchant_Name
ORDER BY Transactions DESC;

-- 17. Top 10 Merchants by Revenue :

SELECT Merchant_Name,
SUM(Amount_INR) AS Revenue
FROM phonepay_raw_data
GROUP BY Merchant_Name
ORDER BY Revenue DESC
LIMIT 10;

-- 18. Hourly Transaction Amount :

SELECT HOUR(Transaction_Date) AS Hour,
SUM(Amount_INR) AS Amount
FROM phonepay_raw_data
GROUP BY Hour
ORDER BY Hour;

-- 19. Hourly Transaction Count :

SELECT HOUR(Transaction_Date) AS Hour,
COUNT(*) AS Transactions
FROM phonepay_raw_data
GROUP BY Hour
ORDER BY Hour;

-- 20. Daily Transactions :

SELECT DATE(Transaction_Date) AS Date,
COUNT(*) AS Transactions
FROM phonepay_raw_data
GROUP BY Date
ORDER BY Date;

-- 21. Monthly Transaction Amount :

SELECT MONTHNAME(Transaction_Date) AS Month,
SUM(Amount_INR) AS Amount
FROM phonepay_raw_data
GROUP BY MONTH(Transaction_Date),MONTHNAME(Transaction_Date)
ORDER BY MONTH(Transaction_Date);

-- 22. Weekday Analysis :

SELECT DAYNAME(Transaction_Date) AS Day,
COUNT(*) AS Transactions
FROM phonepay_raw_data
GROUP BY DAYOFWEEK(Transaction_Date),DAYNAME(Transaction_Date)
ORDER BY DAYOFWEEK(Transaction_Date);

-- 23. Average Amount by Transaction Type :

SELECT Transaction_Type,
AVG(Amount_INR) AS Avg_Amount
FROM phonepay_raw_data
GROUP BY Transaction_Type;

-- 24. Total Amount by Transaction Type :

SELECT Transaction_Type,
SUM(Amount_INR) AS Total_Amount
FROM phonepay_raw_data
GROUP BY Transaction_Type;

-- 25. Fraud Analysis :

SELECT Is_Suspected_Fraud,
COUNT(*) AS Transactions
FROM phonepay_raw_data
GROUP BY Is_Suspected_Fraud;

-- 26. Fraud Percentage :

SELECT
ROUND(
SUM(CASE WHEN Is_Suspected_Fraud='Yes' THEN 1 ELSE 0 END)
*100/COUNT(*),2) AS Fraud_Percentage
FROM phonepay_raw_data;

-- 27. Fraud Amount :

SELECT
SUM(Amount_INR) AS Fraud_Amount
FROM phonepay_raw_data
WHERE Is_Suspected_Fraud='Yes';

-- 28. Top 10 Highest Transactions :

SELECT *
FROM phonepay_raw_data
ORDER BY Amount_INR DESC
LIMIT 10;

-- 29. Rank Transactions :

SELECT
Transaction_ID,
Amount_INR,
RANK() OVER(ORDER BY Amount_INR DESC) AS Transaction_Rank
FROM phonepay_raw_data;

-- 30. Running Total :

SELECT
Transaction_Date,
Amount_INR,
SUM(Amount_INR)
OVER(ORDER BY Transaction_Date) AS Running_Total
FROM phonepay_raw_data;

-- 31. Cumulative Daily Amount :

SELECT
DATE(Transaction_Date) AS Date,
SUM(Amount_INR) AS Daily_Amount,
SUM(SUM(Amount_INR))
OVER(ORDER BY DATE(Transaction_Date)) AS Running_Total
FROM phonepay_raw_data

-- 32. Top 5 States by Transaction Amount :

SELECT State,
SUM(Amount_INR) AS Amount
FROM phonepay_raw_data
GROUP BY State
ORDER BY Amount DESC
LIMIT 5;
GROUP BY DATE(Transaction_Date);

-- 33. Top 5 Banks by Transactions :

SELECT Bank_Name,
COUNT(*) AS Transactions
FROM phonepay_raw_data
GROUP BY Bank_Name
ORDER BY Transactions DESC
LIMIT 5;

-- 34. Failed Transactions by Bank :

SELECT Bank_Name,
COUNT(*) AS Failed_Transactions
FROM phonepay_raw_data
WHERE Status='FAILED'
GROUP BY Bank_Name
ORDER BY Failed_Transactions DESC; 

-- 35. Bank-wise Success Rate :

SELECT
Bank_Name,
ROUND(
SUM(CASE WHEN Status='SUCCESS' THEN 1 ELSE 0 END)
*100/COUNT(*),2) AS Success_Rate
FROM phonepay_raw_data
GROUP BY Bank_Name
ORDER BY Success_Rate DESC;




