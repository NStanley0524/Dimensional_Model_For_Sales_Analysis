-- CREATIING DATABASE FOR THE PART B 

Create database Part_B_task;

use part_b_task;


#Customer analysis
-- Identify the top 5 customers who have spent the most on vehicle repairs and parts.

select Customer_name, Total
from Customer join Invoice
on Customer.Customer_id = Invoice.Customer_id
order by Total desc
limit 5;
-- Determine the average spending of customers on repairs and parts.

select Customer_name, round(avg(Total), 2) as Average_spending from Customer join Invoice
on Customer.Customer_id = Invoice.Customer_id
group by Customer_name;

-- Analyze the frequency of customer visits and identify any patterns.

select Customer_name, count(invoice_date) as Frequency, year(invoice_date) as Year, monthname(invoice_date) as Month, day(invoice_date) as Day
from Customer join Invoice
on Customer.Customer_id = Invoice.Customer_id
group by Customer_name, Year,Month,Day;

#Vehicle analysis
-- Calculate the average mileage of vehicles serviced.

select round(avg(Mileage), 2) as Average_Mileage from Vehicle;

-- Identify the most common vehicle makes and models brought in for service.

select Make, Model, Vehicle.VIN, Count(Job.VIN) as Most_common
from Vehicle join Job
on Vehicle.Vehicle_id = Job.Vehicle_id
group by Make, Model, Vehicle.VIN
order by Most_common desc
limit 1;

-- Analyze the distribution of vehicle ages and identify any trends in service requirements based on vehicle age.
select Year, count(J.Vehicle_ID) as frequency
from vehicle join jobs
on V.Vehicle_ID = J.Vehicle_ID
group by Year
order by frequency;

#Job performance analysis
-- Determine the most common types of jobs performed and their frequency.

select count(Description) as Frequency, Description as Job_type, Job.JobID
from Job
group by Description, Job.JobID
order by frequency desc
limit 1;

-- Calculate the total revenue generated from each type of job.

select Job.JobID, Description as Job_type, sum(Amount) as Total revenue
from Job 
group by Job.JobID, Description
order by Total_revenue desc;

-- Identify the jobs with the highest and lowest average costs.

select Job.JobID, Description, round(avg(Job.Amount), 2) as Average_cost
from Job 
group by JobID, Description
order by Average_cost desc;

#Part usage analysis
-- List the top 5 most frequently used parts and their total usage.
select part_name, sum(Quantity) as Frequency
from Parts
group by part_name
order by Frequency desc;

-- Calculate the average cost of parts used in repairs.

select round(avg(Amount), 2) as Average_Cost from Parts;


-- Determine the total revenue generated from parts sales.

select sum(Amount) as Total_revenue from Parts;

#Financial analysiis
-- Calculate the total revenue generated from labor and parts for each month.

select sum(Total_labour) as Labour_revenue, sum(Total_parts) as part_revenue, year(invoice_date) as Year,monthname(invoice_date) as Month
from invoice
group by Year,Month;

-- Determine the overall profitability of the repair shop.

select sum(Sales_tax) + sum(Total_labour) + sum(Total_parts) as Overall_profitability
from Invoice;

-- Analyze the impact of sales tax on the total revenue.

select sum(Total * (1 + Sales_tax_rate)) - sum(Total) as Total_sales_tax from Invoice;