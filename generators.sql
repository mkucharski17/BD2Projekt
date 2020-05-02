select * from location
select * from company
select * from agency
select * from car
select * from brand
select * from Employee
select * from customer
select * from rental
select * from payment
select * from opinion

-- generate main company
exec generate_company();
-- generate given number of customers
exec generate_customers(200000);
-- generate agenciecs generate_agencies(a,b,c,d)
-- where a = number of agencies, b = number of employyes working in each agency, c - number of cars belong to each agency, d - number of rentals for each car
exec generate_agencies(50,20,200,10);
-- generate given number of op
exec generate_opinions(5000);






