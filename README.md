# Dimensional_Model_For_Sales_Analysis

This project showcases a dimensional model built for analyzing sales and service transactions in the automotive industry


# Project Overview

The model is designed to support reporting and data analysis on sales revenue, parts usage, customer behavior, and service performance across different locations. Using SQL for data structure creation and querying, this project demonstrates a practical approach to building a data warehouse-style solution that supports a range of business insights. The goal is to extract meaningful insights using SQL and generate reports that can help the business optimize its operations, improve customer satisfaction, and increase profitability.


# Purpose 

The objective of this project is to provide a comprehensive view of automotive sales and service data, enabling stakeholders to:
- Track and analyze sales performance by customer, vehicle, and location
- Gain insights into customer and location-specific sales patterns
- Monitor parts usage and inventory management
- Understand revenue trends for parts and services


# Data Source

The data source for this analysis is gotten from a sample sales invoice containing information recorded for auto service. From this sample invoice, we are going to infer a dimensional data model.

<img width="569" alt="salesreceipt" src="https://github.com/user-attachments/assets/3d941d18-5cb3-44c9-8050-74be668b1f93">


# Technical Details

- SQL, MYSQL
- Power BI
- Data Modelling : Dimensional modeling (star schema) with fact and dimension tables optimized for analysis and reporting.
- 

# Steps To Create the Dimensional Model

- Understanding the business requirement
- Identifying the types of analysis the business might need
- Understanding the facts and dimensions
- Designing the Fact table
- Designing the Dimensional table
- Creating an ER Diagram in MYSQL Workbench



# Understanding the business requirement

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

![image](https://github.com/user-attachments/assets/13f97d42-98a0-4909-b7f1-cfc0dcc8359b)


**Primary key**: **Sales ID**

**Foreign keys**: 
- Customer ID References Customer Dim table(Customer ID)
- Vehicle ID References Vehicle Dim Table(Vehicle ID)
- Service ID References Service Dim Table(Service ID)
- Part ID References Part Dim Table(Part ID)
- Location ID References Location Dim Table(Location ID)
- Date References Date Dim Table(Date)

**Relationship Between Facts Table and Dimension Table** : **Many–To–One Relationship.**

