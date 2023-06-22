-- Get data from sales table with the sales person's name from the people table
select *
from sales;

select * 
from people;

select s.SaleDate, s.Amount, p.Salesperson, s.SPID
from sales s
join people p on p.SPID = s.SPID;

-- Get the Product names of shipment using Left join
select s.SaleDate, s.amount, s.Boxes, pr.Product
from sales s
left join products pr on pr.PID = s.PID
order by pr.Product desc;

-- joining Multiple tables sales, salesperson and Product name
select s.SaleDate, s.amount, s.Boxes, pr.Product,p.Salesperson, p.Team
from sales s
join products pr on pr.PID = s.PID
join people p on p.spid = s.spid;

-- adding condition to the Join
select s.SaleDate, s.amount, s.Boxes, pr.Product,p.Salesperson, p.Team
from sales s
join products pr on pr.PID = s.PID
join people p on p.spid = s.spid
where s.Boxes > 100
and p.Team in ('Yummies', 'Delish');

-- extract information of people that do not belong to a team
select s.SaleDate, s.amount, s.Boxes, pr.Product,p.Salesperson, p.Team
from sales s
join products pr on pr.PID = s.PID
join people p on p.spid = s.spid
where p.Team = "";

-- Get information of people that do not belong to a team where Geo is India or New Zealand
select * from geo;

select s.SaleDate, s.Amount, pr.Product, p.Salesperson, p.Team, g.Geo
from sales s
join geo g on g.geoid = s.geoid
join products pr on pr.pid = s.PID
join people p on p.SPID = s.SPID
where s.Boxes > 100
and p.Team = ""
and (g.Geo = 'India' or g.Geo = 'New Zealand')
order by SaleDate;

-- Using Group by on joins
select sum(s.Amount) 'Total Amount', sum(s.Boxes) 'Total Boxes', sum(s.Customers) 'Total customers', p.Salesperson
from sales s
join people p on p.SPID = s.SPID
group by p.Salesperson
order by sum(s.Amount) desc;

select pr.Category, p.team, sum(s.Amount) 'Total Amount', sum(s.Boxes) 'Total Boxes'
from sales s
join people p on p.SPID = s.SPID
join products pr on pr.PID = s.PID
group by pr.Category, p.Team
order by pr.Category, p.Team;

-- Show Top 10 products by Total amount
select pr.Product, sum(s.Amount) 'Total Amount'
from sales s
join products pr on pr.pid = s.PID
group by pr.product
order by sum(s.Amount) desc
limit 10;

select *
from sales s
join products pr on pr.pid = s.PID;