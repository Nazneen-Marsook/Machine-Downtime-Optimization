USE Machine_Downtime_Optimization;
SHOW TABLES;


/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  HANDLING NULL VALUES  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */

SELECT 
SUM(Date IS NULL) AS Date_Null_Count,
SUM(Machine_ID IS NULL) AS Machine_ID_Null_Count,
SUM(Assembly_Line_No IS NULL) AS Assembly_Line_No_Null_Count,
SUM(Hydraulic_Pressure IS NULL) AS Hydraulic_Pressure_Null_Count,
SUM(Coolant_Pressure IS NULL) AS Coolant_Pressure_Null_Count,
SUM(Air_System_Pressure IS NULL) AS Air_System_Pressure_Null_Count,
SUM(Coolant_Temperature IS NULL) AS Coolant_Temperature_Null_Count,
SUM(Hydraulic_Oil_Temperature IS NULL) AS Hydraulic_Oil_Temperature_Null_Count,
SUM(Spindle_Bearing_Temperature IS NULL) AS Spindle_Bearing_Temperature_Null_Count,
SUM(Spindle_Vibration IS NULL) AS Spindle_Vibration_Null_Count,
SUM(Tool_Vibration IS NULL) AS Tool_Vibration_Null_Count,
SUM(Spindle_Speed IS NULL) AS Spindle_Speed_Null_Count,
SUM(Voltage IS NULL) AS Voltage_Null_Count,
SUM(Torque IS NULL) AS Torque_Null_Count,
SUM(Cutting IS NULL) AS Cutting_Null_Count,
SUM(Downtime IS NULL) AS Downtime_Null_Count
FROM machine_downtime;

/* The Columns with Null Values are Hydraulic_Pressure(10), Coolant_Pressure(19), Air_System_Pressure(17), 
Coolant_Temperature(12), Hydraulic_Oil_Temperature(16), Spindle_Bearing_Temperature(7), 
Spindle_Vibration(11), Tool_Vibration(11), Spindle_Speed(6), Voltage(6), 
Torque(21) and Cutting(7). 
 
All are Numerical Columns, so considering their skewness to decide on mean or median imputation.
 
The Inferences of Skewness are - 

Columns that are 'Not Skewed' (Approximately Symmetrical):
Hydraulic Pressure (0.1845)
Coolant Pressure (0.1019)
Coolant Temperature (0.1066)
Spindle Bearing Temperature (-0.3318)
Spindle Vibration is (-0.0058)
Tool Vibration is (-0.080)
Spindle Speed (-0.221)
Voltage (-0.1958)
Torque (0.0076)
Cutting (0.0814)

Column that is 'Moderately Skewed':
Hydraulic Oil Temperature (-0.7293)

Column that is 'Highly Skewed':
Air System Pressure (-1.444)

So, applying mean imputation for normally distributed, columns and median imputation for other columns.

Mean and Median is already calculated.
*/


SET SQL_SAFE_UPDATES = 0;


-- MEAN IMPUTATION

UPDATE machine_downtime
SET Hydraulic_Pressure = 101.3852 -- mean = 101.38520425948192
WHERE Hydraulic_Pressure IS NULL;

UPDATE machine_downtime
SET Coolant_Pressure = 4.9456 -- mean = 4.94559730183515
WHERE Coolant_Pressure IS NULL;

UPDATE machine_downtime
SET Coolant_Temperature = 18.5524 -- mean = 18.55241151197164
WHERE Coolant_Temperature IS NULL;

UPDATE machine_downtime
SET Spindle_Bearing_Temperature = 35.0472 -- mean = 35.04717207433132
WHERE Spindle_Bearing_Temperature IS NULL;

UPDATE machine_downtime
SET Spindle_Vibration = 1.009 -- mean = 1.00900924148756
WHERE Spindle_Vibration IS NULL;

UPDATE machine_downtime
SET Tool_Vibration = 25.4012 -- mean = 25.40123744986056
WHERE Tool_Vibration IS NULL;

UPDATE machine_downtime
SET Spindle_Speed = 20269 -- mean = 20269.664795509
WHERE Spindle_Speed IS NULL;

UPDATE machine_downtime
SET Voltage = 349 -- mean = 348.870489174
WHERE Voltage IS NULL;

UPDATE machine_downtime
SET Torque = 25.2292 -- mean = 25.22923844827753
WHERE Torque IS NULL;

UPDATE machine_downtime
SET Cutting = 2.78182912274532 -- mean = 2.78182912274532
WHERE Cutting IS NULL;


-- MEDIAN IMPUTATION

UPDATE machine_downtime
SET Hydraulic_Oil_Temperature = 47.7 -- median = 47.70000076293945
WHERE Hydraulic_Oil_Temperature IS NULL;

UPDATE machine_downtime
SET Air_System_Pressure = 6.505 -- median = 6.50519140000000
WHERE Air_System_Pressure IS NULL;


SET SQL_SAFE_UPDATES = 1;


/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  HANDLING DUPLICATED VALUES  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */

SELECT *, COUNT(*) AS Duplicates FROM machine_downtime GROUP BY Date, Machine_ID, Assembly_Line_No, 
Hydraulic_Pressure, Coolant_Pressure, Air_System_Pressure, Coolant_Temperature,
Hydraulic_Oil_Temperature, Spindle_Bearing_Temperature, Spindle_Vibration, Tool_Vibration,
Spindle_Speed, Voltage, Torque, Cutting, Downtime HAVING Duplicates > 1;

-- No rows are duplicated.

