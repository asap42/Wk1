SHOW TABLES;

SELECT * 
FROM AIRLINES A,
     AIRPORTS R,
     FLIGHTS F,
     PLANES P,
     WEATHER W;
     
-- Q1:     
SELECT DEST, MAX(DISTANCE) 
FROM FLIGHTS 
GROUP BY DEST, DISTANCE
ORDER BY DISTANCE DESC
LIMIT 1;

-- Q2
SELECT DISTINCT MANUFACTURER, MAX(SEATS) 
FROM PLANES
GROUP BY MANUFACTURER
ORDER BY 2 DESC
LIMIT 1;

-- Q3
SELECT DISTINCT COUNT(*) 
FROM FLIGHTS;

-- Q4
SELECT COUNT(*) AS "NO_FLIGHTS",
	   CARRIER 
FROM FLIGHTS
GROUP BY CARRIER
HAVING COUNT(*) > 1
ORDER BY CARRIER ASC;

-- Q5
SELECT COUNT(*) AS "NO_FLIGHTS",
	   CARRIER 
FROM FLIGHTS
GROUP BY CARRIER
HAVING COUNT(*) > 1
ORDER BY 1 DESC;

-- Q6
SELECT COUNT(*) AS "NO_FLIGHTS",
	   CARRIER 
FROM FLIGHTS
GROUP BY CARRIER
HAVING COUNT(*) > 1
ORDER BY 1 DESC
LIMIT 5;

-- Q7
SELECT COUNT(*) AS "NO_FLIGHTS",
	   CARRIER 
FROM FLIGHTS
WHERE DISTANCE > 1000
GROUP BY CARRIER
HAVING COUNT(*) > 1
ORDER BY 1 DESC
LIMIT 5;

-- Q8
/* FIND WHEN THE 2 HOTTIEST FLIGHTS TOOK PLACE SHOWING FLIGHT NUMBERS AND AIRLINES */

SELECT CONCAT(F.MONTH,"-",F.DAY,"-",F.YEAR) AS "DATE",
		F.FLIGHT,
        F.ORIGIN,
        A.NAME AS "AIRLINE",
        MAX(W.TEMP)
FROM FLIGHTS F,
     WEATHER W,
     AIRLINES A
WHERE F.YEAR = W.YEAR
  AND F.MONTH = W.MONTH
  AND F.DAY = W.DAY
  AND F.ORIGIN = W.ORIGIN
  AND F.CARRIER = A.CARRIER
  AND W.TEMP > 100
GROUP BY 1,
		F.FLIGHT,
        F.ORIGIN,
        A.NAME,
        W.TEMP
ORDER BY W.TEMP DESC
LIMIT 2;
  
