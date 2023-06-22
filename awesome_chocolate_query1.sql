 -- select all columns from sales table
select *
from sales;

-- select some few columns from sales table
select GeoID, SaleDate, Amount, Boxes
from sales;

-- adding calculated column to a table
select PID, SaleDate, Amount, Boxes, Amount/Boxes
from sales;

-- Naming a column using As
select PID, SaleDate, Amount, Boxes, Amount/Boxes as 'Amount per Box'
from sales;

-- Using Where Clause and Order by to show data that have >500 customers and amount >10000
select *
from sales
where Customers > 500 and Amount > 10000
Order by Amount desc;

-- showing sales data where geography is g1 orderby productId and amount in descending order
select *
from sales
where GeoID='G1'
order by PID, Amount desc;

-- working with date
select *
from sales
where Amount> 10000 and saledate >= '2022-01-01';

-- Using Year() function to select information from a particular year
select SaleDate, Amount
from sales
where Amount > 10000 and year(saledate) = 2021
order by Amount desc;

-- selecting data between ranges using the <&> operator
select *
from sales
where Boxes >0 & Boxes <=500;

-- Using between operator
select *
from sales
where Boxes between 0 and 500;

-- Using Weekday() to return data from wednesdays
select SaleDate, Amount, Boxes, weekday(saledate) as ' Day of Week', dayname(saledate)
from sales
where weekday(saledate) = 2; -- note week in mysql start from 0 = monday

-- Using dayname() to return name of the week
select SaleDate, Amount, Boxes, weekday(saledate) as ' Day of Week', dayname(saledate) as 'Day Name'
from sales
where weekday(saledate) = 2; -- note week in mysql start from 0 = monday

-- Working on the People table
select *
from people;

-- Using the OR function to return data containing specific Teams
select *
from people
where Team = 'Yummies' or Team = 'Delish';

-- Using the IN operator to return data containing two or specified Teams
select *
from people
where Team in ('Yummies', 'Delish');

-- Using Like operator
select *
from people
where Salesperson like 'g%';

-- Using Like operator
select *
from people
where Salesperson like '%B%';

select * from sales;
-- using CASE to create branching logic
select SaleDate, amount,
	case
		when amount <1000 then 'under 1k'
		when amount <5000 then 'under 5k'
        when Amount <10000 then 'under 10k'
        else '10k and more'
	end as 'Amount category'
from sales;
	
-- Using Group by function
select spid, sum(Amount) 'Total Amount', sum(boxes) 'Total Boxes'
from sales
group by SPID;