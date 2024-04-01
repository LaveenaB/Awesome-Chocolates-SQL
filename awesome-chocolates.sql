select * from sales;
show tables;
desc sales;
select SaleDate, Amount, Customers from sales;
select SaleDate, Amount, Boxes, Amount/boxes 'price_per_box' from sales;
select * from sales
where Amount > 10000
order by PID, Amount desc;

select * from sales
where Amount > 2000 and Boxes < 100;

select count(SPID) from sales
where month(SaleDate) = 'January' and year(SaleDate) = '2022'
order by SPID;

select p.Salesperson, count(*) as shipment_count
from people p
join
sales s
on 
p.SPID = s.SPID
where SaleDate BETWEEN '2022-1-1' and '2022-1-31'
group by p.Salesperson;

#//which product sells more boxes? milk bars or eclairs/#


select * from products;
select * from sales;

select p.Product, sum(Boxes) from sales s
join products p
on p.PID = s.PID
where p.Product IN ('Milk Bars', 'Eclairs')
group by p.Product
order by p.Product;

#/ 4. Which product sold more boxes in the first 7 days of February 2022? Milk Bars or Eclairs??#

select p.Product, sum(Boxes) 'Total_Boxes' from sales s
join products p
on p.PID = s.PID
where p.Product in ('Milk Bars' , 'Eclairs') 
and s.SaleDate Between '2022-2-1' and '2022-2-7'
group by p.Product;

#/Which shipments had under 100 customers & under 100 boxes? Did any of them occur on Wednesday?/#

select count(Customers) 'customer', sum(Boxes) 'boxes' from sales
 Having customer <= 100 and boxes <= 100
and weekday(SaleDate) = 'Wednesday';

select *,
	case when weekday(SaleDate)=2 then ‘Wednesday_Shipment’
	else ”
	end as ‘W_Shipment’
from sales
where Customers < 100 and Boxes < 100;



