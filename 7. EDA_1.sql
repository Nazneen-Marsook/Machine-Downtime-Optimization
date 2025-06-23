CREATE DATABASE Machine_Downtime_Optimization;

USE Machine_Downtime_Optimization;

CREATE TABLE machine_downtime(
Date DATE,
Machine_ID VARCHAR(50),
Assembly_Line_No VARCHAR(25),
Hydraulic_Pressure DECIMAL(13,9),
Coolant_Pressure DECIMAL(13,10),	
Air_System_Pressure DECIMAL(12,10),
Coolant_Temperature	FLOAT(5,2),
Hydraulic_Oil_Temperature FLOAT(5,2),
Spindle_Bearing_Temperature	FLOAT(5,2),
Spindle_Vibration FLOAT(6,4),
Tool_Vibration FLOAT(7,4),
Spindle_Speed INT,
Voltage INT,
Torque DECIMAL(12,9),
Cutting	FLOAT(5,3),
Downtime VARCHAR(25)
);

-- The dataset is loaded to the table 'machine_downtime'

-- Exploratory Data Analysis 

-- Total Number of records
SELECT count(*) FROM machine_downtime;

-- First ten records 
SELECT * FROM machine_downtime LIMIT 10;


/*         FIRST MOMENT BUSINESS DECISION (Measures of Central Tendency)

Mean.   : The mean is a measure of central tendency that represents the average value of a set of values. 
Median. : The median is another measure of central tendency that represents the middle value in a dataset 
          when the values are arranged in ascending or descending order.
Mode.   : The mode is the value that appears most frequently in a dataset.  
          It is the number that occurs with the highest frequency.
*/


-- 1) MEAN OF NUMERICAL COLUMNS 
 
CREATE OR REPLACE VIEW Mean AS
SELECT 'Hydraulic Pressure' AS Attribute, AVG(Hydraulic_Pressure) AS Mean_Value FROM machine_downtime
UNION ALL
SELECT 'Coolant Pressure', AVG(Coolant_Pressure) FROM machine_downtime
UNION ALL
SELECT 'Air System Pressure', AVG(Air_System_Pressure) FROM machine_downtime
UNION ALL
SELECT 'Coolant Temperature', AVG(Coolant_Temperature) FROM machine_downtime
UNION ALL
SELECT 'Hydraulic Oil Temperature', AVG(Hydraulic_Oil_Temperature) FROM machine_downtime
UNION ALL
SELECT 'Spindle Bearing Temperature', AVG(Spindle_Bearing_Temperature) FROM machine_downtime
UNION ALL
SELECT 'Spindle Vibration', AVG(Spindle_Vibration) FROM machine_downtime
UNION ALL
SELECT 'Tool Vibration', AVG(Tool_Vibration) FROM machine_downtime
UNION ALL
SELECT 'Spindle Speed', AVG(Spindle_Speed) FROM machine_downtime
UNION ALL
SELECT 'Voltage', AVG(Voltage) FROM machine_downtime
UNION ALL
SELECT 'Torque', AVG(Torque) FROM machine_downtime
UNION ALL
SELECT 'Cutting', AVG(Cutting) FROM machine_downtime;

-- The Mean of the values
SELECT * FROM Mean;
 
 
 -- 2) MEDIAN OF NUMERICAL COLUMNS 
 
CREATE OR REPLACE VIEW Median AS

SELECT 'Hydraulic_Pressure' AS Attribute, AVG(Hydraulic_Pressure) AS Median
FROM (
	SELECT Hydraulic_Pressure, 
	ROW_NUMBER() OVER (ORDER BY Hydraulic_Pressure) AS row_num,
	COUNT(Hydraulic_Pressure) OVER () AS total_count
	FROM machine_downtime
	WHERE Hydraulic_Pressure IS NOT NULL
) AS mid_term
WHERE 
    row_num = (total_count + 1) / 2 OR 
    row_num = (total_count + 2) / 2

UNION ALL

SELECT 'Coolant_Pressure' AS Attribute, AVG(Coolant_Pressure) AS Median
FROM (
	SELECT Coolant_Pressure, 
	ROW_NUMBER() OVER (ORDER BY Coolant_Pressure) AS row_num,
	COUNT(Coolant_Pressure) OVER () AS total_count
	FROM machine_downtime
	WHERE Coolant_Pressure IS NOT NULL
) AS mid_term
WHERE 
    row_num = (total_count + 1) / 2 OR 
    row_num = (total_count + 2) / 2
    
UNION ALL

SELECT 'Air System Pressure' AS Attribute, AVG(Air_System_Pressure) AS Median
FROM (
	SELECT Air_System_Pressure, 
	ROW_NUMBER() OVER (ORDER BY Air_System_Pressure) AS row_num,
	COUNT(Air_System_Pressure) OVER () AS total_count
	FROM machine_downtime
	WHERE Air_System_Pressure IS NOT NULL
) AS mid_term
WHERE 
    row_num = (total_count + 1) / 2 OR 
    row_num = (total_count + 2) / 2
    
UNION ALL

SELECT 'Coolant Temperature' AS Attribute, AVG(Coolant_Temperature) AS Median
FROM (
	SELECT Coolant_Temperature, 
	ROW_NUMBER() OVER (ORDER BY Coolant_Temperature) AS row_num,
	COUNT(Coolant_Temperature) OVER () AS total_count
	FROM machine_downtime
	WHERE Coolant_Temperature IS NOT NULL
) AS mid_term
WHERE 
    row_num = (total_count + 1) / 2 OR 
    row_num = (total_count + 2) / 2

UNION ALL

SELECT 'Hydraulic Oil Temperature' AS Attribute, AVG(Hydraulic_Oil_Temperature) AS Median
FROM (
	SELECT Hydraulic_Oil_Temperature, 
	ROW_NUMBER() OVER (ORDER BY Hydraulic_Oil_Temperature) AS row_num,
	COUNT(Hydraulic_Oil_Temperature) OVER () AS total_count
	FROM machine_downtime
	WHERE Hydraulic_Oil_Temperature IS NOT NULL
) AS mid_term
WHERE 
    row_num = (total_count + 1) / 2 OR 
    row_num = (total_count + 2) / 2

UNION ALL

SELECT 'Spindle Bearing Temperature' AS Attribute, AVG(Spindle_Bearing_Temperature) AS Median
FROM (
	SELECT Spindle_Bearing_Temperature, 
	ROW_NUMBER() OVER (ORDER BY Spindle_Bearing_Temperature) AS row_num,
	COUNT(Spindle_Bearing_Temperature) OVER () AS total_count
	FROM machine_downtime
	WHERE Spindle_Bearing_Temperature IS NOT NULL
) AS mid_term
WHERE 
    row_num = (total_count + 1) / 2 OR 
    row_num = (total_count + 2) / 2

UNION ALL

SELECT 'Spindle Vibration' AS Attribute, AVG(Spindle_Vibration) AS Median
FROM (
	SELECT Spindle_Vibration, 
	ROW_NUMBER() OVER (ORDER BY Spindle_Vibration) AS row_num,
	COUNT(Spindle_Vibration) OVER () AS total_count
	FROM machine_downtime
	WHERE Spindle_Vibration IS NOT NULL
) AS mid_term
WHERE 
    row_num = (total_count + 1) / 2 OR 
    row_num = (total_count + 2) / 2

UNION ALL

SELECT 'Tool Vibration' AS Attribute, AVG(Tool_Vibration) AS Median
FROM (
	SELECT Tool_Vibration, 
	ROW_NUMBER() OVER (ORDER BY Tool_Vibration) AS row_num,
	COUNT(Tool_Vibration) OVER () AS total_count
	FROM machine_downtime
	WHERE Tool_Vibration IS NOT NULL
) AS mid_term
WHERE 
    row_num = (total_count + 1) / 2 OR 
    row_num = (total_count + 2) / 2

UNION ALL

SELECT 'Spindle Speed' AS Attribute, AVG(Spindle_Speed) AS Median
FROM (
	SELECT Spindle_Speed, 
	ROW_NUMBER() OVER (ORDER BY Spindle_Speed) AS row_num,
	COUNT(Spindle_Speed) OVER () AS total_count
	FROM machine_downtime
	WHERE Spindle_Speed IS NOT NULL
) AS mid_term
WHERE 
    row_num = (total_count + 1) / 2 OR 
    row_num = (total_count + 2) / 2

UNION ALL

SELECT 'Voltage' AS Attribute, AVG(Voltage) AS Median
FROM (
	SELECT Voltage, 
	ROW_NUMBER() OVER (ORDER BY Voltage) AS row_num,
	COUNT(Voltage) OVER () AS total_count
	FROM machine_downtime
	WHERE Voltage IS NOT NULL
) AS mid_term
WHERE 
    row_num = (total_count + 1) / 2 OR 
    row_num = (total_count + 2) / 2

UNION ALL

SELECT 'Torque' AS Attribute, AVG(Torque) AS Median
FROM (
	SELECT Torque, 
	ROW_NUMBER() OVER (ORDER BY Torque) AS row_num,
	COUNT(Torque) OVER () AS total_count
	FROM machine_downtime
	WHERE Torque IS NOT NULL
) AS mid_term
WHERE 
    row_num = (total_count + 1) / 2 OR 
    row_num = (total_count + 2) / 2

UNION ALL

SELECT 'Cutting' AS Attribute, AVG(Cutting) AS Median
FROM (
	SELECT Cutting, 
	ROW_NUMBER() OVER (ORDER BY Cutting) AS row_num,
	COUNT(Cutting) OVER () AS total_count
	FROM machine_downtime
	WHERE Cutting IS NOT NULL
) AS mid_term
WHERE 
    row_num = (total_count + 1) / 2 OR 
    row_num = (total_count + 2) / 2;

-- The Median of the values
SELECT * FROM Median;


 -- 3) MODE OF NUMERICAL COLUMNS 

CREATE OR REPLACE VIEW Mode_Values AS

SELECT 'Date' AS Attribute, Date AS Value, COUNT(*) AS Mode_Count
FROM machine_downtime
WHERE Date IS NOT NULL
GROUP BY Date
HAVING COUNT(*) = (
	SELECT MAX(Mode_Count)
	FROM (
	SELECT COUNT(*) AS Mode_Count
	FROM machine_downtime
	WHERE Date IS NOT NULL
	GROUP BY Date
) AS Frequency
)

UNION ALL

SELECT 'Machine ID' AS Attribute, Machine_ID AS Value, COUNT(*) AS Mode_Count
FROM machine_downtime
WHERE Machine_ID IS NOT NULL
GROUP BY Machine_ID
HAVING COUNT(*) = (
	SELECT MAX(Mode_Count)
	FROM (
	SELECT COUNT(*) AS Mode_Count
	FROM machine_downtime
	WHERE Machine_ID IS NOT NULL 
	GROUP BY Machine_ID
) AS Frequency
)

UNION ALL

SELECT 'Assembly Line Number' AS Attribute, Assembly_Line_No AS Value, COUNT(*) AS Mode_Count
FROM machine_downtime
WHERE Assembly_Line_No IS NOT NULL
GROUP BY Assembly_Line_No
HAVING COUNT(*) = (
	SELECT MAX(Mode_Count)
	FROM (
	SELECT COUNT(*) AS Mode_Count
	FROM machine_downtime
	WHERE Assembly_Line_No IS NOT NULL
	GROUP BY Assembly_Line_No
) AS Frequency
)

UNION ALL

SELECT 'Hydraulic Pressure' AS Attribute, Hydraulic_Pressure AS Value, COUNT(*) AS Mode_Count
FROM machine_downtime
WHERE Hydraulic_Pressure IS NOT NULL
GROUP BY Hydraulic_Pressure
HAVING COUNT(*) = (
	SELECT MAX(Mode_Count)
	FROM (
	SELECT COUNT(*) AS Mode_Count
	FROM machine_downtime
	WHERE Hydraulic_Pressure IS NOT NULL
	GROUP BY Hydraulic_Pressure
) AS Frequency
)

UNION ALL

SELECT 'Coolant Pressure' AS Attribute, Coolant_Pressure AS Value, COUNT(*) AS Mode_Count
FROM machine_downtime
WHERE Coolant_Pressure IS NOT NULL
GROUP BY Coolant_Pressure
HAVING COUNT(*) = (
	SELECT MAX(Mode_Count)
	FROM (
	SELECT COUNT(*) AS Mode_Count
	FROM machine_downtime
	WHERE Coolant_Pressure IS NOT NULL
	GROUP BY Coolant_Pressure
) AS Frequency
)

UNION ALL

SELECT 'Air System Pressure' AS Attribute, Air_System_Pressure AS Value, COUNT(*) AS Mode_Count
FROM machine_downtime
WHERE Air_System_Pressure IS NOT NULL
GROUP BY Air_System_Pressure
HAVING COUNT(*) = (
	SELECT MAX(Mode_Count)
	FROM (
	SELECT COUNT(*) AS Mode_Count
	FROM machine_downtime
	WHERE Air_System_Pressure IS NOT NULL
	GROUP BY Air_System_Pressure
) AS Frequency
)

UNION ALL

SELECT 'Coolant Temperature' AS Attribute, Coolant_Temperature AS Value, COUNT(*) AS Mode_Count
FROM machine_downtime
WHERE Coolant_Temperature IS NOT NULL
GROUP BY Coolant_Temperature
HAVING COUNT(*) = (
	SELECT MAX(Mode_Count)
	FROM (
	SELECT COUNT(*) AS Mode_Count
	FROM machine_downtime
	WHERE Coolant_Temperature IS NOT NULL
	GROUP BY Coolant_Temperature
) AS Frequency
)

UNION ALL

SELECT 'Hydraulic Oil Temperature' AS Attribute, Hydraulic_Oil_Temperature AS Value, COUNT(*) AS Mode_Count
FROM machine_downtime
WHERE Hydraulic_Oil_Temperature IS NOT NULL
GROUP BY Hydraulic_Oil_Temperature
HAVING COUNT(*) = (
	SELECT MAX(Mode_Count)
	FROM (
	SELECT COUNT(*) AS Mode_Count
	FROM machine_downtime
	WHERE Hydraulic_Oil_Temperature IS NOT NULL
	GROUP BY Hydraulic_Oil_Temperature
) AS Frequency
)

UNION ALL

SELECT 'Spindle Bearing Temperature' AS Attribute, Spindle_Bearing_Temperature AS Value, COUNT(*) AS Mode_Count
FROM machine_downtime
WHERE Spindle_Bearing_Temperature IS NOT NULL
GROUP BY Spindle_Bearing_Temperature
HAVING COUNT(*) = (
	SELECT MAX(Mode_Count)
	FROM (
	SELECT COUNT(*) AS Mode_Count
	FROM machine_downtime
	WHERE Spindle_Bearing_Temperature IS NOT NULL
	GROUP BY Spindle_Bearing_Temperature
) AS Frequency
)

UNION ALL

SELECT 'Spindle Vibration' AS Attribute, Spindle_Vibration AS Value, COUNT(*) AS Mode_Count
FROM machine_downtime
WHERE Spindle_Vibration IS NOT NULL
GROUP BY Spindle_Vibration
HAVING COUNT(*) = (
	SELECT MAX(Mode_Count)
	FROM (
	SELECT COUNT(*) AS Mode_Count
	FROM machine_downtime
	WHERE Spindle_Vibration IS NOT NULL
	GROUP BY Spindle_Vibration
) AS Frequency
)

UNION ALL

SELECT 'Tool Vibration' AS Attribute, Tool_Vibration AS Value, COUNT(*) AS Mode_Count
FROM machine_downtime
WHERE Tool_Vibration IS NOT NULL
GROUP BY Tool_Vibration
HAVING COUNT(*) = (
	SELECT MAX(Mode_Count)
	FROM (
	SELECT COUNT(*) AS Mode_Count
	FROM machine_downtime
	WHERE Tool_Vibration IS NOT NULL
	GROUP BY Tool_Vibration
) AS Frequency
)

UNION ALL

SELECT 'Spindle Speed' AS Attribute, Spindle_Speed AS Value, COUNT(*) AS Mode_Count
FROM machine_downtime
WHERE Spindle_Speed IS NOT NULL
GROUP BY Spindle_Speed
HAVING COUNT(*) = (
	SELECT MAX(Mode_Count)
	FROM (
	SELECT COUNT(*) AS Mode_Count
	FROM machine_downtime
	WHERE Spindle_Speed IS NOT NULL
	GROUP BY Spindle_Speed
) AS Frequency
)

UNION ALL

SELECT 'Voltage' AS Attribute, Voltage AS Value, COUNT(*) AS Mode_Count
FROM machine_downtime
WHERE Voltage IS NOT NULL
GROUP BY Voltage
HAVING COUNT(*) = (
	SELECT MAX(Mode_Count)
	FROM (
	SELECT COUNT(*) AS Mode_Count
	FROM machine_downtime
	WHERE Voltage IS NOT NULL
	GROUP BY Voltage
) AS Frequency
)

UNION ALL

SELECT 'Torque' AS Attribute, Torque AS Value, COUNT(*) AS Mode_Count
FROM machine_downtime
WHERE Torque IS NOT NULL
GROUP BY Torque
HAVING COUNT(*) = (
	SELECT MAX(Mode_Count)
	FROM (
	SELECT COUNT(*) AS Mode_Count
	FROM machine_downtime
	WHERE Torque IS NOT NULL
	GROUP BY Torque
) AS Frequency
)

UNION ALL

SELECT 'Cutting' AS Attribute, Cutting AS Value, COUNT(*) AS Mode_Count
FROM machine_downtime
WHERE Cutting IS NOT NULL
GROUP BY Cutting
HAVING COUNT(*) = (
	SELECT MAX(Mode_Count)
	FROM (
	SELECT COUNT(*) AS Mode_Count
	FROM machine_downtime
	WHERE Cutting IS NOT NULL
	GROUP BY Cutting
) AS Frequency
)

UNION ALL

SELECT 'Downtime' AS Attribute, Downtime AS Value, COUNT(*) AS Mode_Count
FROM machine_downtime
WHERE Downtime IS NOT NULL
GROUP BY Downtime
HAVING COUNT(*) = (
	SELECT MAX(Mode_Count)
	FROM (
	SELECT COUNT(*) AS Mode_Count
	FROM machine_downtime
	WHERE Downtime IS NOT NULL
	GROUP BY Downtime
) AS Frequency
);

-- The Mode of the values
SELECT * FROM Mode_Values;


/*         SECOND MOMENT BUSINESS DECISION (Measure of Dispersion)

1) Variance     : It is a statistical measure that quantifies the spread or dispersion of a set of data points in a dataset. 
                  It provides insight into how much individual data points deviate from the mean (average) of the dataset.
2) Standard deviation : It is the square root of the variance. 
                        It provides a measure of the spread of data in the same units as the original data.
3) Range        : It is the difference between maximum and minimum values.
 */

-- 1) Variance of the values
 
CREATE OR REPLACE VIEW Variance_Values AS

SELECT 'Hydraulic Pressure' AS Attribute, VARIANCE(Hydraulic_Pressure) AS Variance
FROM machine_downtime
WHERE Hydraulic_Pressure IS NOT NULL

UNION ALL

SELECT 'Coolant Pressure' AS Attribute, VARIANCE(Coolant_Pressure) AS Variance
FROM machine_downtime
WHERE Coolant_Pressure IS NOT NULL

UNION ALL

SELECT 'Air System Pressure' AS Attribute, VARIANCE(Air_System_Pressure) AS Variance
FROM machine_downtime
WHERE Air_System_Pressure IS NOT NULL

UNION ALL

SELECT 'Coolant Temperature' AS Attribute, VARIANCE(Coolant_Temperature) AS Variance
FROM machine_downtime
WHERE Coolant_Temperature IS NOT NULL

UNION ALL

SELECT 'Hydraulic Oil Temperature' AS Attribute, VARIANCE(Hydraulic_Oil_Temperature) AS Variance
FROM machine_downtime
WHERE Hydraulic_Oil_Temperature IS NOT NULL

UNION ALL

SELECT 'Spindle Bearing Temperature' AS Attribute, VARIANCE(Spindle_Bearing_Temperature) AS Variance
FROM machine_downtime
WHERE Spindle_Bearing_Temperature IS NOT NULL

UNION ALL

SELECT 'Spindle Vibration' AS Attribute, VARIANCE(Spindle_Vibration) AS Variance
FROM machine_downtime
WHERE Spindle_Vibration IS NOT NULL

UNION ALL

SELECT 'Tool Vibration' AS Attribute, VARIANCE(Tool_Vibration) AS Variance
FROM machine_downtime
WHERE Tool_Vibration IS NOT NULL

UNION ALL

SELECT 'Spindle Speed' AS Attribute, VARIANCE(Spindle_Speed) AS Variance
FROM machine_downtime
WHERE Spindle_Speed IS NOT NULL

UNION ALL

SELECT 'Voltage' AS Attribute, VARIANCE(Voltage) AS Variance
FROM machine_downtime
WHERE Voltage IS NOT NULL

UNION ALL

SELECT 'Torque' AS Attribute, VARIANCE(Torque) AS Variance
FROM machine_downtime
WHERE Torque IS NOT NULL

UNION ALL

SELECT 'Cutting' AS Attribute, VARIANCE(Cutting) AS Variance
FROM machine_downtime
WHERE Cutting IS NOT NULL;

-- The Variance of the values
SELECT * FROM Variance_Values;


-- 2) Standard Deviation of the values
 
CREATE OR REPLACE VIEW Standard_Deviation AS

SELECT 'Hydraulic Pressure' AS Attribute, STDDEV(Hydraulic_Pressure) AS Std_Deviation
FROM machine_downtime
WHERE Hydraulic_Pressure IS NOT NULL

UNION ALL

SELECT 'Coolant Pressure' AS Attribute, STDDEV(Coolant_Pressure) AS Std_Deviation
FROM machine_downtime
WHERE Coolant_Pressure IS NOT NULL

UNION ALL

SELECT 'Air System Pressure' AS Attribute, STDDEV(Air_System_Pressure) AS Std_Deviation
FROM machine_downtime
WHERE Air_System_Pressure IS NOT NULL

UNION ALL

SELECT 'Coolant Temperature' AS Attribute, STDDEV(Coolant_Temperature) AS Std_Deviation
FROM machine_downtime
WHERE Coolant_Temperature IS NOT NULL

UNION ALL

SELECT 'Hydraulic Oil Temperature' AS Attribute, STDDEV(Hydraulic_Oil_Temperature) AS Std_Deviation
FROM machine_downtime
WHERE Hydraulic_Oil_Temperature IS NOT NULL

UNION ALL

SELECT 'Spindle Bearing Temperature' AS Attribute, STDDEV(Spindle_Bearing_Temperature) AS Std_Deviation
FROM machine_downtime
WHERE Spindle_Bearing_Temperature IS NOT NULL

UNION ALL

SELECT 'Spindle Vibration' AS Attribute, STDDEV(Spindle_Vibration) AS Std_Deviation
FROM machine_downtime
WHERE Spindle_Vibration IS NOT NULL

UNION ALL

SELECT 'Tool Vibration' AS Attribute, STDDEV(Tool_Vibration) AS Std_Deviation
FROM machine_downtime
WHERE Tool_Vibration IS NOT NULL

UNION ALL

SELECT 'Spindle Speed' AS Attribute, STDDEV(Spindle_Speed) AS Std_Deviation
FROM machine_downtime
WHERE Spindle_Speed IS NOT NULL

UNION ALL

SELECT 'Voltage' AS Attribute, STDDEV(Voltage) AS Std_Deviation
FROM machine_downtime
WHERE Voltage IS NOT NULL

UNION ALL

SELECT 'Torque' AS Attribute, STDDEV(Torque) AS Std_Deviation
FROM machine_downtime
WHERE Torque IS NOT NULL

UNION ALL

SELECT 'Cutting' AS Attribute, STDDEV(Cutting) AS Std_Deviation
FROM machine_downtime
WHERE Cutting IS NOT NULL;

-- The Standard Deviation of the values
SELECT * FROM Standard_Deviation;


-- 3) Range of the values

CREATE OR REPLACE VIEW Range_ AS
SELECT 'Hydraulic Pressure' AS Attribute, MAX(Hydraulic_Pressure) - MIN(Hydraulic_Pressure) AS Range_ FROM machine_downtime
UNION ALL
SELECT 'Coolant Pressure'AS Attribute, MAX(Coolant_Pressure) - MIN(Coolant_Pressure) AS Range_ FROM machine_downtime
UNION ALL
SELECT 'Air System Pressure', MAX(Air_System_Pressure) - MIN(Air_System_Pressure) FROM machine_downtime
UNION ALL
SELECT 'Coolant Temperature', MAX(Coolant_Temperature) - MIN(Coolant_Temperature) FROM machine_downtime
UNION ALL
SELECT 'Hydraulic Oil Temperature', MAX(Hydraulic_Oil_Temperature) - MIN(Hydraulic_Oil_Temperature) FROM machine_downtime
UNION ALL
SELECT 'Spindle Bearing Temperature', MAX(Spindle_Bearing_Temperature) - MIN(Spindle_Bearing_Temperature) FROM machine_downtime
UNION ALL
SELECT 'Spindle Vibration', MAX(Spindle_Vibration) - MIN(Spindle_Vibration) FROM machine_downtime
UNION ALL
SELECT 'Tool Vibration', MAX(Tool_Vibration) - MIN(Tool_Vibration) FROM machine_downtime
UNION ALL
SELECT 'Spindle Speed', MAX(Spindle_Speed) - MIN(Spindle_Speed) FROM machine_downtime
UNION ALL
SELECT 'Voltage', MAX(Voltage) - MIN(Voltage) FROM machine_downtime
UNION ALL
SELECT 'Torque', MAX(Torque) - MIN(Torque) FROM machine_downtime
UNION ALL
SELECT 'Cutting', MAX(Cutting) - MIN(Cutting) FROM machine_downtime;

-- The Range of the values
SELECT * FROM Range_;


/*        THIRD MOMENT BUSINESS DECISION

1) Skewness     : It measures the asymmetry in the data.It helps us understand the shape of a distribution.
*/

-- 1) Skewness of the values

CREATE OR REPLACE VIEW Skewness AS

SELECT 'Hydraulic Pressure' AS Attribute,  (COUNT(*) / (COUNT(*) - 1) / (COUNT(*) - 2)) 
     * (SUM(POW(Hydraulic_Pressure - (SELECT AVG(Hydraulic_Pressure) FROM machine_downtime), 3))  
     / POW(STDDEV(Hydraulic_Pressure), 3)) AS Skewness
FROM machine_downtime
WHERE Hydraulic_Pressure IS NOT NULL

UNION ALL

SELECT 'Coolant Pressure'AS Attribute, (COUNT(Coolant_Pressure) / (COUNT(Coolant_Pressure) - 1) / (COUNT(Coolant_Pressure) - 2)) 
     * (SUM(POW(Coolant_Pressure - (SELECT AVG(Coolant_Pressure) FROM machine_downtime), 3))  
     / POW(STDDEV(Coolant_Pressure), 3)) AS Skewness
FROM machine_downtime

UNION ALL

SELECT 'Air System Pressure', (COUNT(Air_System_Pressure) / (COUNT(Air_System_Pressure) - 1) / (COUNT(Air_System_Pressure) - 2)) 
     * (SUM(POW(Air_System_Pressure - (SELECT AVG(Air_System_Pressure) FROM machine_downtime), 3))  
     / POW(STDDEV(Air_System_Pressure), 3)) AS Skewness
FROM machine_downtime

UNION ALL

SELECT 'Coolant Temperature', (COUNT(Coolant_Temperature) / (COUNT(Coolant_Temperature) - 1) / (COUNT(Coolant_Temperature) - 2)) 
     * (SUM(POW(Coolant_Temperature - (SELECT AVG(Coolant_Temperature) FROM machine_downtime), 3))  
     / POW(STDDEV(Coolant_Temperature), 3)) AS Skewness
     FROM machine_downtime
     
UNION ALL

SELECT 'Hydraulic Oil Temperature',  (COUNT(Hydraulic_Oil_Temperature) / (COUNT(Hydraulic_Oil_Temperature) - 1) / (COUNT(Hydraulic_Oil_Temperature) - 2)) 
     * (SUM(POW(Hydraulic_Oil_Temperature - (SELECT AVG(Hydraulic_Oil_Temperature) FROM machine_downtime), 3))  
     / POW(STDDEV(Hydraulic_Oil_Temperature), 3)) AS Skewness
     FROM machine_downtime
     
UNION ALL

SELECT 'Spindle Bearing Temperature',  (COUNT(Spindle_Bearing_Temperature) / (COUNT(Spindle_Bearing_Temperature) - 1) / (COUNT(Spindle_Bearing_Temperature) - 2)) 
     * (SUM(POW(Spindle_Bearing_Temperature - (SELECT AVG(Spindle_Bearing_Temperature) FROM machine_downtime), 3))  
     / POW(STDDEV(Spindle_Bearing_Temperature), 3)) AS Skewness
     FROM machine_downtime
     
UNION ALL

SELECT 'Spindle Vibration',  (COUNT(Spindle_Vibration) / (COUNT(Spindle_Vibration) - 1) / (COUNT(Spindle_Vibration) - 2)) 
     * (SUM(POW(Spindle_Vibration - (SELECT AVG(Spindle_Vibration) FROM machine_downtime), 3))  
     / POW(STDDEV(Spindle_Vibration), 3)) AS Skewness
     FROM machine_downtime
     
UNION ALL

SELECT 'Tool Vibration',  (COUNT(Tool_Vibration) / (COUNT(Tool_Vibration) - 1) / (COUNT(Tool_Vibration) - 2)) 
     * (SUM(POW(Tool_Vibration - (SELECT AVG(Tool_Vibration) FROM machine_downtime), 3))  
     / POW(STDDEV(Tool_Vibration), 3)) AS Skewness
     FROM machine_downtime
     
UNION ALL

SELECT 'Spindle Speed',  (COUNT(Spindle_Speed) / (COUNT(Spindle_Speed) - 1) / (COUNT(Spindle_Speed) - 2)) 
     * (SUM(POW(Spindle_Speed - (SELECT AVG(Spindle_Speed) FROM machine_downtime), 3))  
     / POW(STDDEV(Spindle_Speed), 3)) AS Skewness
     FROM machine_downtime
     
UNION ALL

SELECT 'Voltage',  (COUNT(Voltage) / (COUNT(Voltage) - 1) / (COUNT(Voltage) - 2)) 
     * (SUM(POW(Voltage - (SELECT AVG(Voltage) FROM machine_downtime), 3))  
     / POW(STDDEV(Voltage), 3)) AS Skewness
     FROM machine_downtime
     
UNION ALL

SELECT 'Torque',  (COUNT(Torque) / (COUNT(Torque) - 1) / (COUNT(Torque) - 2)) 
     * (SUM(POW(Torque - (SELECT AVG(Torque) FROM machine_downtime), 3))  
     / POW(STDDEV(Torque), 3)) AS Skewness
     FROM machine_downtime
     
UNION ALL

SELECT 'Cutting',  (COUNT(Cutting) / (COUNT(Cutting) - 1) / (COUNT(Cutting) - 2)) 
     * (SUM(POW(Cutting - (SELECT AVG(Cutting) FROM machine_downtime), 3))  
     / POW(STDDEV(Cutting), 3)) AS Skewness
     FROM machine_downtime;

-- The Skewness of the values
SELECT * FROM Skewness;


/*        FOURTH MOMENT BUSINESS DECISION

1) Kurtosis  : Kurtosis is a statistical measure that quantitates the degree of peakedness of tail.
*/

CREATE OR REPLACE VIEW Kurtosis AS 

SELECT 
    'Hydraulic Pressure' AS Attribute,
    (COUNT(*) * (COUNT(*) + 1) * SUM(POW(Hydraulic_Pressure - (SELECT AVG(Hydraulic_Pressure) FROM machine_downtime), 4))) / 
    ((COUNT(*) - 1) * (COUNT(*) - 2) * (COUNT(*) - 3) * POW(STDDEV(Hydraulic_Pressure), 4))
    - (3 * POW(COUNT(*) - 1, 2)) / ((COUNT(*) - 2) * (COUNT(*) - 3)) AS Kurtosis
FROM machine_downtime
WHERE Hydraulic_Pressure IS NOT NULL

UNION ALL

SELECT 
    'Coolant Pressure' AS Attribute,
    (COUNT(*) * (COUNT(*) + 1) * SUM(POW(Coolant_Pressure - (SELECT AVG(Coolant_Pressure) FROM machine_downtime), 4))) / 
    ((COUNT(*) - 1) * (COUNT(*) - 2) * (COUNT(*) - 3) * POW(STDDEV(Coolant_Pressure), 4)) 
    - (3 * POW(COUNT(*) - 1, 2)) / ((COUNT(*) - 2) * (COUNT(*) - 3)) AS Kurtosis
FROM machine_downtime
WHERE Coolant_Pressure IS NOT NULL

UNION ALL 

SELECT 'Air System Pressure', 
    (COUNT(*) * (COUNT(*) + 1) * SUM(POW(Air_System_Pressure - (SELECT AVG(Air_System_Pressure) FROM machine_downtime), 4))) / 
    ((COUNT(*) - 1) * (COUNT(*) - 2) * (COUNT(*) - 3) * POW(STDDEV(Air_System_Pressure), 4))
    - (3 * POW(COUNT(*) - 1, 2)) / ((COUNT(*) - 2) * (COUNT(*) - 3)) AS Kurtosis
FROM machine_downtime
WHERE Air_System_Pressure IS NOT NULL

UNION ALL

SELECT 'Coolant Temperature', 
(COUNT(*) * (COUNT(*) + 1) * SUM(POW(Coolant_Temperature - (SELECT AVG(Coolant_Temperature) FROM machine_downtime), 4))) / 
    ((COUNT(*) - 1) * (COUNT(*) - 2) * (COUNT(*) - 3) * POW(STDDEV(Coolant_Temperature), 4))
    - (3 * POW(COUNT(*) - 1, 2)) / ((COUNT(*) - 2) * (COUNT(*) - 3)) AS Kurtosis
FROM machine_downtime
WHERE Coolant_Temperature IS NOT NULL
     
UNION ALL

SELECT 'Hydraulic Oil Temperature',  (COUNT(*) / (COUNT(*) - 1) / (COUNT(*) - 2)) 
     * (SUM(POW(Hydraulic_Oil_Temperature - (SELECT AVG(Hydraulic_Oil_Temperature) FROM machine_downtime), 3))  
     / POW(STDDEV(Hydraulic_Oil_Temperature), 3)) AS Skewness
FROM machine_downtime
WHERE Hydraulic_Oil_Temperature IS NOT NULL
     
UNION ALL

SELECT 'Spindle Bearing Temperature',  (COUNT(*) / (COUNT(*) - 1) / (COUNT(*) - 2)) 
     * (SUM(POW(Spindle_Bearing_Temperature - (SELECT AVG(Spindle_Bearing_Temperature) FROM machine_downtime), 3))  
     / POW(STDDEV(Spindle_Bearing_Temperature), 3)) AS Skewness
FROM machine_downtime
WHERE Spindle_Bearing_Temperature IS NOT NULL
     
UNION ALL

SELECT 'Spindle Vibration',  (COUNT(*) / (COUNT(*) - 1) / (COUNT(*) - 2)) 
     * (SUM(POW(Spindle_Vibration - (SELECT AVG(Spindle_Vibration) FROM machine_downtime), 3))  
     / POW(STDDEV(Spindle_Vibration), 3)) AS Skewness
FROM machine_downtime
WHERE Spindle_Vibration IS NOT NULL
     
UNION ALL

SELECT 'Tool Vibration',  (COUNT(*) / (COUNT(*) - 1) / (COUNT(*) - 2)) 
     * (SUM(POW(Tool_Vibration - (SELECT AVG(Tool_Vibration) FROM machine_downtime), 3))  
     / POW(STDDEV(Tool_Vibration), 3)) AS Skewness
FROM machine_downtime
WHERE Tool_Vibration IS NOT NULL
     
UNION ALL

SELECT 'Spindle Speed',  (COUNT(*) / (COUNT(*) - 1) / (COUNT(*) - 2)) 
     * (SUM(POW(Spindle_Speed - (SELECT AVG(Spindle_Speed) FROM machine_downtime), 3))  
     / POW(STDDEV(Spindle_Speed), 3)) AS Skewness
FROM machine_downtime
WHERE Spindle_Speed IS NOT NULL
     
UNION ALL

SELECT 'Voltage',  (COUNT(*) / (COUNT(*) - 1) / (COUNT(*) - 2)) 
     * (SUM(POW(Voltage - (SELECT AVG(Voltage) FROM machine_downtime), 3))  
     / POW(STDDEV(Voltage), 3)) AS Skewness
FROM machine_downtime
WHERE Voltage IS NOT NULL
     
UNION ALL

SELECT 'Torque',  (COUNT(*) / (COUNT(*) - 1) / (COUNT(*) - 2)) 
     * (SUM(POW(Torque - (SELECT AVG(Torque) FROM machine_downtime), 3))  
     / POW(STDDEV(Torque), 3)) AS Skewness
FROM machine_downtime
WHERE Torque IS NOT NULL
     
UNION ALL

SELECT 'Cutting',  (COUNT(*) / (COUNT(*) - 1) / (COUNT(*) - 2)) 
     * (SUM(POW(Cutting - (SELECT AVG(Cutting) FROM machine_downtime), 3))  
     / POW(STDDEV(Cutting), 3)) AS Skewness
FROM machine_downtime
WHERE Cutting IS NOT NULL;
	
    
-- The Kurtosis of the values
SELECT * FROM Kurtosis;