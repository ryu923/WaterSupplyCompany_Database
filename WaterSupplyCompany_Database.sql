-- 2nd Week : Create Tables using SQL/scripts
-- Customer
CREATE TABLE Customer
( Customer_Number NUMBER(5),
  Rate_Number NUMBER(5),
  Customer_Name VARCHAR2(50),
  Billing_Address VARCHAR2(100),
  Customer_Type VARCHAR2(10),
  Customer_Rate NUMBER(4,2),
  Number_Of_Meters NUMBER(2),
  CONSTRAINT PK_CustomerNo PRIMARY KEY (Customer_Number),
  CONSTRAINT FK_RateNo FOREIGN KEY (Rate_Number) REFERENCES Rates
 );

-- Rates
CREATE TABLE Rates
( Rate_Number NUMBER(5),
  Description VARCHAR2(1000),
  Fixed_Dollar_Amount NUMBER(5),
  Variable_Dollar_Amount NUMBER(5),
  CONSTRAINT PK_RateNo PRIMARY KEY (Rate_Number)
);

-- Water Usage
CREATE TABLE WaterUsage
( Water_Consumption_Level NUMBER(4),
  Customer_Number NUMBER(5),
  CONSTRAINT PK_WCL PRIMARY KEY (Water_Consumption_Level),
  CONSTRAINT FK_CustomerNo FOREIGN KEY (Customer_Number) REFERENCES Customer
);

-- Bills
CREATE TABLE Bills
( Bill_Number NUMBER(5),
  Customer_Number NUMBER(5),
  Meter_Number NUMBER(5),
  Water_Consumption_Level NUMBER(4),
  Preparation_Date DATE,
  Payment_Due_Date Date,
  Date_Range NUMBER(10),
  Water_Consumption_Amount NUMBER(6,2),
  CONSTRAINT PK_BillNo PRIMARY KEY (Bill_Number),
  CONSTRAINT FK_CustomerNo_onBills FOREIGN KEY (Customer_Number) REFERENCES Customer,
  CONSTRAINT FK_MeterNo_OnBills FOREIGN KEY (Meter_Number) REFERENCES Meters,
  CONSTRAINT FK_WCL_OnBills FOREIGN KEY (Water_Consumption_Level) REFERENCES WaterUsage
);

-- Meters
CREATE TABLE Meters
( Meter_Number NUMBER(5),
  Customer_Number NUMBER(5),
  Model_ID VARCHAR2(5),
  CONSTRAINT PK_MeterNo PRIMARY KEY (Meter_Number),
  CONSTRAINT FK_CustomerNo_onMeters FOREIGN KEY (Customer_Number) REFERENCES Customer
);

-- Employee
CREATE TABLE Employee
( Meter_Reading_Number NUMBER(10),
  Meter_Number NUMBER(5),
  Water_Consumption_Level NUMBER(4),
  Reading_Date DATE, 
  Employee_Number NUMBER(5),
  CONSTRAINT PK_MeterReadNo PRIMARY KEY (Meter_Reading_Number),
  CONSTRAINT FK_MeterNo_OnEmployee FOREIGN KEY (Meter_Number) REFERENCES Meters,
  CONSTRAINT FK_WCL_OnEmployee FOREIGN KEY (Water_Consumption_Level) REFERENCES WaterUsage
);


-- 3rd Week : Data Inserts Using SQL/scripts
-- Customer
INSERT INTO Customer (Customer_Number, Rate_Number, Customer_Name, Billing_Address, Customer_Type, Customer_Rate, Number_Of_Meters)
  VALUES (83923, 13579, 'David Ryu', '45 Dunfield Ave.', 'R', 9.23, 2);

INSERT INTO Customer (Customer_Number, Rate_Number, Customer_Name, Billing_Address, Customer_Type, Customer_Rate, Number_Of_Meters)
  VALUES (88516,24680, 'Candice Cho', '411 Duplex Ave.', 'C', 13.50, 1);

-- Rates
INSERT INTO Rates (Rate_Number, Description, Fixed_Dollar_Amount, Variable_Dollar_Amount)
  VALUES (13579,'Customer Type is R(Residential) and rate will be assigned as 9.23%', 30, 40);
  
INSERT INTO Rates (Rate_Number, Description, Fixed_Dollar_Amount, Variable_Dollar_Amount)
  VALUES (24680,'Customer Type is C(Commercial) and rate will be assigned as 13.50%', 50, 75);
  
-- Water Usage
INSERT INTO WaterUsage (Water_Consumption_Level, Customer_Number)
  VALUES (450, 83923);

INSERT INTO WaterUsage (Water_Consumption_Level, Customer_Number)
  VALUES (2300, 88516);
  
-- Bills
INSERT INTO Bills (Bill_Number, Customer_Number, Meter_Number, Water_Consumption_Level, Preparation_Date, Payment_Due_Date, Date_Range, Water_Consumption_Amount)
  VALUES (10293, 83923, 15332, 450, '2017-03-15', '2017-03-31', 30, 450*0.0923);

INSERT INTO Bills (Bill_Number, Customer_Number, Meter_Number, Water_Consumption_Level, Preparation_Date, Payment_Due_Date, Date_Range, Water_Consumption_Amount)
  VALUES (10823, 88516, 28462, 2300, '2017-03-15', '2017-03-31', 30, 2300*0.1350);
  
-- Meters
INSERT INTO Meters (Meter_Number, Customer_Number, Model_ID)
  VALUES (15332, 83923, 'WCM09');

INSERT INTO Meters (Meter_Number, Customer_Number, Model_ID)
  VALUES (28462, 88516, 'WCM23');
  
-- Employee
INSERT INTO Employee (Meter_Reading_Number, Meter_Number, Water_Consumption_Level, Reading_Date, Employee_Number)
  VALUES (2017013001, 15332, 450, '2017-01-30', 17356);

INSERT INTO Employee (Meter_Reading_Number, Meter_Number, Water_Consumption_Level, Reading_Date, Employee_Number)
  VALUES (2017013002, 28462, 2300, '2017-01-30', 17356);