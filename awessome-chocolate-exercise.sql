-- print sales data where amounts are > 2,000 and boxes are <100
select *
from sales
where Amount > 2000 
and Boxes < 100;

-- How many shipments (sales) each of the sales persons had in the month of January 2022?
select p.Salesperson, count(*) as 'Shipments'
from sales s
join people p on s.SPID = p.SPID
where saledate between '2022-1-1' and '2022-1-31'
group by p.Salesperson;

-- Which product sells more boxes between Milk Bars and Eclairs?
select pr.product, sum(s.Boxes) 'Total boxes'
from sales s
join products pr on pr.pid = s.pid
where pr.Product in ('Milk Bars', 'Eclairs')
group by pr.product;

-- Which product sold more boxes in the first 7 days of February 2022? Milk Bars or Eclairs
select pr.product, sum(s.Boxes) 'Total boxes'
from sales s
join products pr on pr.pid = s.pid
where pr.Product in ('Milk Bars', 'Eclairs')
and SaleDate between '2022-02-01' and '2022-02-07'
group by pr.product;

-- Which shipments had under 100 customers & under 100 boxes? Did any of them occur on Wednesday?
select *
from sales
where weekday(saledate) = 2 and Amount < 100 
and Boxes < 100;

-- What are the names of salespersons who had at least one shipment (sale) in the first 7 days of January 2022?
select p.Salesperson, count(*) 'shipment'
from sales s
join people p on s.SPID = p.SPID
where saledate between '2022-1-1' and '2022-1-07'
group by p.Salesperson;

select distinct(p.Salesperson)
from sales s
join people p on s.SPID = p.SPID
where s.saledate between '2022-1-1' and '2022-1-07';

-- Which salespersons did not make any shipments in the first 7 days of January 2022?
select p.salesperson
from people p
where p.spid not in
(select distinct s.spid from sales s where s.SaleDate between '2022-01-01' and '2022-01-07');

--  How many times we shipped more than 1,000 boxes in each month?
select year(SaleDate) 'Year', month(saledate) 'Month', count(*) 'Times we shipped > 1k boxes'
from sales
where Boxes > 1000
group by year(SaleDate), month(saledate)
order by year(SaleDate), month(saledate);

-- 