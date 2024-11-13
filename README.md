# Dimensional_Model_For_Sales_Analysis

This project showcases a dimensional model built for analyzing sales and service transactions in the automotive industry


## Project Overview

The model is designed to support reporting and data analysis on sales revenue, parts usage, customer behavior, and service performance across different locations. Using SQL for data structure creation and querying, this project demonstrates a practical approach to building a data warehouse-style solution that supports a range of business insights. The goal is to extract meaningful insights using SQL and generate reports that can help the business optimize its operations, improve customer satisfaction, and increase profitability.


# Purpose 

The objective of this project is to provide a comprehensive view of automotive sales and service data, enabling stakeholders to:
- Track and analyze sales performance by customer, vehicle, and location
- Gain insights into customer and location-specific sales patterns
- Monitor parts usage and inventory management
- Understand revenue trends for parts and services


# Data Source

The data source for this analysis is gotten from a sample sales invoice containing information recorded for auto service. From this sample invoice, we are going to infer a dimensional data model.

[<img width="569" alt="salesreceipt" src="https://github.com/user-attachments/assets/3d941d18-5cb3-44c9-8050-74be668b1f93">](https://github.com/NStanley0524/Dimensional_Model_For_Sales_Analysis/blob/main/Images/Sales_Invoice/salesreceipt.png)


# Technical Details

- SQL, MYSQL
- Power BI
- Data Modelling : Dimensional modeling (star schema) with fact and dimension tables optimized for analysis and reporting.
  

# Steps To Create the Dimensional Model

- Understanding the business requirement
- Identifying the types of analysis the business might need
- Understanding the facts and dimensions
- Designing the Fact table
- Designing the Dimensional table
- Creating an ER Diagram in MYSQL Workbench



# Understanding the Business Requirement

From the sample invoice above, several key pieces of information can be extracted. This information is deemed relevant for sales analysis.
These key pieces of information are:



## Customer Information

1. Name: Jennifer Robinson
2. Company Name: ABC Power Tools
3. Address: 6 Nairn Ave, Winnipeg, MB, R3J 3C4
4. Phon Number: 204-771-0784



## Vehicle Information

1. Make: BMW
2. Model: X5
3. Year: 2012
4. Color: Black
5. VIN: CVS123456789123-115Z
6. Registration #: BMW123
7. Mileage: 16495



## Invoice Details

1. Invoice number: INV-00-12345
2. Due: September 10, 2023
3. Due Date: October 10, 2023

   

## Job Performed and Labour Charges

1. Diagnose front wheel vibration: 0.5 hours at $125.00/hour = $62.50
2. Replace front CV Axel: 3.5 hours at $125.00/hour = $437.50
3. Balance tires: 1 hour at $125.00/hour = $125.00



## Parts and Materials Used

1. CV Axel (Part #23435): 1 unit at $876.87
2. Shop Materials (Part #7777): 1 unit at $45.00
3. Wheel Weights (Part #W187): 4 units at $12.00 each = $48.00



## Financial Totals
   
1. Total Labor: $625.00
2. Total Parts: $969.87
3. Subtotal: $1,594.87
4. Sales Tax Rate: 13%
5. Sales Tax Amount: $207.33
6. Total Amount Due: $1,802.20




# Type of Analysis the Business Might Need


## Sales Performance Analysis

1. Monthly, quarterly, and annual sales revenue.
2. Breakdown of revenue by service type (labor vs. parts)
3. Top-performing services and parts.


## Customer Analysis

1. Repeat customers vs. new customers.
2. Average spend per customer.
3. Customer demographics and geographical distribution.


## Inventory Analysis

1. Inventory turnover rates for parts.
2. Stock levels vs. sales trends.
3. Identifying slow-moving or obsolete inventory.


## Financial Analysis
1. Gross profit margins (labor vs. parts).
2. Net profit analysis
3. Cost analysis (labor costs, parts costs, overhead)

 
## Operational Efficiency Analysis

1. Average time taken for different types of services.
2. Labor efficiency and productivity.
3. Service scheduling and resource utilization.


## Tax Compliance and Reporting

1. Accurate calculation and reporting of sales tax.
2. Ensuring timely payments and filings to avoid penalties.





# Identifying Facts and Dimensions


## FACTS
The following are the facts derived from the invoice sample that is needed to analyze:


### Service Charge
This represents the cost of labor for the services performed. This fact is critical as it helps analyze the revenue generated from the labor component of the services provided. By tracking service charges, the business can determine which services are most profitable, identify trends in labor costs, and optimize labor pricing strategies.
From the invoice:
1. Diagnose front wheel vibration: $62.50
2. Replace front CV Axel: $437.50
3. Balance tires: $125.00


### Part Charge
This represents the cost of parts used for the services. This fact provides insight into the revenue generated from the sale of parts. It helps the business understand which parts are in high demand, manage inventory more effectively, and negotiate better pricing with suppliers.
From the invoice:
1. CV Axel: $876.87
2. Shop Materials: $45.00
3. Wheel Weights: $48.00


### Total Sales
This is the total amount billed to the customer, which is the sum of service charges and parts charges. This overall metric combines both service and parts charges, providing a comprehensive view of the total revenue generated from each invoice. Analyzing total sales helps the business measure overall performance, track revenue growth, and set financial targets.
From the Invoice:
1. Subtotal: $969.87
2. Sales Tax: $207.33
3. Total: $1,802.20


### Sales Tax
The tax applied to the total amount. Tracking sales tax is important for compliance and financial reporting. It ensures that the business is accurately calculating and collecting the appropriate amount of tax, which is essential for legal and regulatory purposes.
From the invoice:
1. Sales Tax Rate: 13%
2. Sales Tax Amount: $207.33


## Dimensions

The following are the dimensions gotten from the invoice sample:

1. Customer Information
2. Vehicle Information
3. Service Information
4. Parts Information
5. Location Information
6. Date Information


### Customer Information

**Customer ID**: A unique identifier for each customer

**Name**: The name of the customer (e.g Jenniffer Robinson)

**Address**: The customer's address (e.g., 126 Nairn Ave, Winnipeg, MB, R3J 3C4).

**Phone number**: The customer's contact number (e.g., 204-771-0784).


### Vehicle Information

**Vehicle ID**: A unique identifier for each vehicle.

**Make**: The make of the vehicle (e.g., BMW).

**Model**: The model of the vehicle (e.g., X5).

**Year**: The year of manufacture (e.g., 2012).

**Color**: The color of the vehicle (e.g., Black).

**VIN**: Vehicle Identification Number (e.g., CVS123456789123-115Z).

**Registration Number**: The vehicle's registration number (e.g., BMW 123). 



### Service Information

**Service ID**: A unique identifier for each service performed.

**Job Description**: Description of the job performed (e.g., Diagnose front wheel vibration, Replace front CV Axel, Balance tires).

**Hours**: The number of hours spent on each job (e.g., 0.5, 3.5, 1).

**Rate**: The hourly rate charged for the service (e.g., $125.00).



### Part Information

**Part ID**: A unique identifier for each part used.

**Part Name**: The name of the part (e.g., CV Axel, Shop Materials, Wheel Weights).

**Quantity**: The quantity of parts used (e.g., 1, 1, 4).

**Unit Price**: The unit price of each part (e.g., $876.87, $45.00, $12.00)



### Location Information

**Location ID**: A unique identifier for each shop location.

**Shop Name**: The name of the shop (e.g., Latino Garage Winnipeg North).

**Address**: The address of the shop (e.g., 111 McPhillips, Winnipeg, Manitoba, MB, R3J 1X7)



### Date Information

**Date**: The date of the transaction (e.g., September 10, 2023).

**Due Date**: The due date for payment (e.g., October 10, 2023).

**Day of the Week**: The day of the week for the transaction date.

**Month**: The month of the transaction.

**Year**: The year of the transaction.




# Facts Table

[![image](https://github.com/user-attachments/assets/13f97d42-98a0-4909-b7f1-cfc0dcc8359b)](https://github.com/NStanley0524/Dimensional_Model_For_Sales_Analysis/blob/main/Images/Facts_and_Dimensions/Facts.png)


**Primary key**: **Sales ID**

**Foreign keys**: 
- Customer ID References Customer Dim table(Customer ID)
- Vehicle ID References Vehicle Dim Table(Vehicle ID)
- Service ID References Service Dim Table(Service ID)
- Part ID References Part Dim Table(Part ID)
- Location ID References Location Dim Table(Location ID)
- Date References Date Dim Table(Date)

**Relationship Between Facts Table and Dimension Table** : **Many–To–One Relationship.**

The full code for the Fact script can be found [Here](https://github.com/NStanley0524/Dimensional_Model_For_Sales_Analysis/blob/main/Code_Scripts/Fact%20script.sql)


# Dimensions Table

### Customer Dimension Table

![image](https://github.com/user-attachments/assets/38795f2e-d73d-45c6-bd73-2937ca6723a2)


**Primary Key**: **Customer ID**

**Relationship Between Customer and Facts Table** : **One-To-Many Relationship**

**Logical explanations for my decision**
The Customer Dimension table is essential for evaluating customer behavior, segmenting them for targeted marketing, and analyzing their spending patterns. Each row represents a distinct consumer, allowing you to monitor their interactions and purchases.

**Customer Id Code snippet**
````sql
CREATE TABLE IF NOT EXISTS `DA-NStanley24`.`Customer_Dim` (
  `Customer_ID` INT NOT NULL,
  `Name` VARCHAR(100) NULL,
  `Address` VARCHAR(100) NULL,
  `Company` VARCHAR(100) NULL,
  `Phone` VARCHAR(100) NULL,
  PRIMARY KEY (`Customer_ID`))
````

### Vehicle Dimension Table

![image](https://github.com/user-attachments/assets/4796c12b-c9ac-4f7d-ac70-ab4dfa1a3b96)


**Primary Key** : **Vehicle ID**

**Relationship Between Vehicle and Facts Table** : **One-To-Many Relationship**

**Logical Explanation**
The Vehicle Dimension table facilitates assessing vehicle types, identifying maintenance patterns, and connecting vehicle-specific data to customer information. This dimension enables a detailed analysis of vehicle-related trends.

**Vehicle Dimension Code Snippet**
````sql
CREATE TABLE IF NOT EXISTS `DA-NStanley24`.`Vehicle_Dim` (
  `Vehicle_ID` INT NOT NULL,
  `Make` VARCHAR(45) NULL,
  `Model` VARCHAR(45) NULL,
  `Year` INT NULL,
  `Color` VARCHAR(45) NULL,
  `VIN` VARCHAR(45) NULL,
  `Registration_no` VARCHAR(45) NULL,
  `Mileage` INT NULL,
  PRIMARY KEY (`Vehicle_ID`))
````


# Service Dimension Table

![image](https://github.com/user-attachments/assets/d67bec0a-df5c-4252-bb1a-f420b7d38b94)


**Primary Key**: **Service ID**

**Relationship between Service and Facts Table** : **One-To-Many Relationship**

**Logical Explanation**
The Service Dimension table offers specific information about service transactions, including labor costs, frequency, and revenue. It enhances comprehension of the business's service-related features.

Service Dimension Code Snippet
````sql
CREATE TABLE IF NOT EXISTS `DA-NStanley24`.`Service_Dim` (
  `Service_ID` INT NOT NULL,
  `Job_Description` VARCHAR(100) NULL,
  `Hours` DECIMAL(10,2) NULL,
  `Rate` DECIMAL(10,2) NULL,
  `Amount` INT NULL,
  PRIMARY KEY (`Service_ID`))
````


# Parts Dimension Table

![image](https://github.com/user-attachments/assets/57fe6fa6-4689-4016-a8ae-486ee303208a)


**Primary Key**: **Part ID**

**Relationship between Parts and Facts Table** : **One-To-Many Relationship**

**Logical Explanation**
The Part Dimension table helps maintain inventories, understand pricing, and identify frequently used parts. It enables inventory management and cost analysis.

**Parts dimension code snippet**
````sql
CREATE TABLE IF NOT EXISTS `DA-NStanley24`.`Parts_Dim` (
  `Part_ID` INT NOT NULL,
  `Part_name` VARCHAR(100) NULL,
  `Quantity` INT NULL,
  `Unit_price` DECIMAL(10,2) NULL,
  `Total_price` DECIMAL(10,2) NULL,
  PRIMARY KEY (`Part_ID`))
````


# Location Dimension Table

![image](https://github.com/user-attachments/assets/adf14a3b-0098-46af-926e-3487bc41f730)


**Primary Key**: **Location ID**

**Relationship between Location and Facts Table** : **One-To-Many Relationship**

**Logical Explanation**
The Location Dimension table provides information about various repair shop locations and allows for analysis. 
- Location Performance: Sales and service performance based on location. 
- Analyze regional trends in revenue and service demand.

**Location dimension code snippet**
````sql
CREATE TABLE IF NOT EXISTS `DA-NStanley24`.`Location_Dim` (
  `Location_ID` INT NOT NULL,
  `Shop_name` VARCHAR(100) NULL,
  `Address` VARCHAR(100) NULL,
  PRIMARY KEY (`Location_ID`))
````


# Date Dimension Table

![image](https://github.com/user-attachments/assets/3134da05-95d2-4458-9061-e495c35f11c5)


**Primary Key**: **Date**

**Relationship between Date and Facts Table** : **One-To-Many Relationship**

**Logical Explanation**
The Date Dimension table provides comprehensive financial information depending on transaction time.


**Date dimension code snippet**
````sql
CREATE TABLE IF NOT EXISTS `DA-NStanley24`.`Date_Dim` (
  `Date` DATE NOT NULL,
  `Due_date` DATE NULL,
  `Day_of_the_week` VARCHAR(45) NULL,
  `Month` INT NULL,
  `Year` INT NULL,
  PRIMARY KEY (`Date`))
````



# E-R Diagram Representing Facts and Dimensions Table

![E-R Diagram](https://github.com/user-attachments/assets/28e7368d-dd7b-452d-8be3-b98310ee7920)



# E-R Diagram Showing the Relationship Between Primary Keys and Foreign Keys

![image](https://github.com/user-attachments/assets/4bf8c158-aa5d-41a7-ab7a-e39b8809ef8c)




# Loading Data Into Tables

Tables were created to be able to answer various business questions and data was loaded into the tables, ensuring tables are indexed for efficient querrying and foreign keys are linked correctly.


To see the full scipt for creating the tables and indexing, See [here](Code_Scripts/Table_creation_script.sql)

Data for these tables were gotten from an extended data of the sales receipt that can be accessed [here](https://github.com/NStanley0524/Dimensional_Model_For_Sales_Analysis/tree/main/Sample_Data)


Example of loading data into the tables:

![image](https://github.com/user-attachments/assets/acd5fc9b-cc54-4753-af6e-32e591f1e3da)


# E-R Diagram Showing The Relationships Between The Tables

![image](https://github.com/user-attachments/assets/d2d2da1b-cda2-42e6-a9ad-d5eb7a42e210)



# Business Questions

1. IDENTIFY THE TOP 5 CUSTOMERS WHO HAVE SPENT THE MOST ON VEHICLE REPAIRS AND PARTS
````sql
select Customer_name, Total
from Customer join Invoice
on Customer.Customer_id = Invoice.Customer_id
order by Total desc
limit 5;
````
**Visual**

![image](https://github.com/user-attachments/assets/fe6cec34-fca0-4e6d-9c20-a90e85798dc0)



2. DETERMINE THE AVERAGE SPEND OF CUSTOMERS ON REPAIRS AND PARTS
````sql
select Customer_name, round(avg(Total), 2) as Average_spending from Customer join Invoice
on Customer.Customer_id = Invoice.Customer_id
group by Customer_name;
````

3. ANALYZE THE FREQUENCY OF CUSTOMER VISITS AND IDENTIFY ANY PATTERNS
````sql
select Customer_name, count(invoice_date) as Frequency, year(invoice_date) as Year, monthname(invoice_date) as Month, day(invoice_date) as Day
from Customer join Invoice
on Customer.Customer_id = Invoice.Customer_id
group by Customer_name, Year,Month,Day;
````

4. CALCULATE THE AVERAGE MILEAGE OF VEHICLES SERVICED
````sql
select round(avg(Mileage), 2) as Average_Mileage from Vehicle;
````

5. ANALYZE THE MOST COMMON VEHICLE MODELS AND MAKES BROUGHT IN FOR SERVICE
````sql
select Make, Model, Vehicle.VIN, Count(Job.VIN) as Most_common
from Vehicle join Job
on Vehicle.Vehicle_id = Job.Vehicle_id
group by Make, Model, Vehicle.VIN
order by Most_common desc
limit 1;
````

6. ANALYZE THE DISTRIBUTION OF VEHICLE AGES AND IDENTIFY ANY TRENDS
````sql
select Year, count(J.Vehicle_ID) as frequency
from vehicle join jobs
on V.Vehicle_ID = J.Vehicle_ID
group by Year
order by frequency;
````

7. DETERMINE THE MOST COMMON TYPES OF JOBS PERFORMED AND THEIR FREQUENCY
````sql
select count(Description) as Frequency, Description as Job_type, Job.JobID
from Job
group by Description, Job.JobID
order by frequency desc
limit 1;
````

8. CALCULATE THE TOTAL REVENUE GENERATED FOR EACH TYPE PF JOB
````sql
select Job.JobID, Description as Job_type, sum(Amount) as Total revenue
from Job 
group by Job.JobID, Description
order by Total_revenue desc;
````

**Visual**

![image](https://github.com/user-attachments/assets/a2c8ef54-1fa0-4b1d-bade-11926b21dcd7)



9. IDENTIFY THE JOB WITH THE HIGHEST AND LOWEST AVERAGE COST
````sql
select Job.JobID, Description, round(avg(Job.Amount), 2) as Average_cost
from Job 
group by JobID, Description
order by Average_cost desc;
````

10. LIST THE TOP 5 MOST FREQUENTLY USED PART AND THEIR TOTAL USAGE
````sql
select part_name, sum(Quantity) as Frequency
from parts
group by part_name
order by Frequency desc
limit 5;
````

**Visual**

![image](https://github.com/user-attachments/assets/437017b2-e75b-4de8-8dca-05007aa2a135)



11. CALCULATE THE AVERAGE COST OF PARTS USED FOR REPAIRS
````sql
select round(avg(Amount), 2) as Average_Cost from Parts;
````

12. DETERMINE THE TOTAL REVENUE GENERATED FROM PART SALES
````sql
select sum(Amount) as Total_revenue from Parts;
````

13. CALCULATE THE TOTAL REVENUE GENERATED FROM LABOR AND PARTS FOR EACH MONTH
````sql
select sum(Total_labour) as Labour_revenue, sum(Total_parts) as part_revenue, year(invoice_date) as Year,monthname(invoice_date) as Month
from invoice
group by Year,Month;
````

**Visual**

![image](https://github.com/user-attachments/assets/d75cacd8-b962-4322-9e3b-50185757a76f)


14. DETERMINE THE OVERALL PROFITABILITY OF THE REPAR SHOP
````sql
select sum(Sales_tax) + sum(Total_labour) + sum(Total_parts) as Overall_profitability
from Invoice;
````

15. ANALYZE THE IMOACT OF SALES TAX ON TOTAL REVENUE
````sql
select sum(Total * (1 + Sales_tax_rate)) - sum(Total) as Total_sales_tax from Invoice;
````


````
