--trigger set property payment_id in connected with this payment rental
create or replace trigger update_payment_id
after insert on Payment
for each row
begin
    update Rental SET Payment_id= :new.Id where Id = :new.Rental_Id;
end;
--------------------------------------------------------------------------------------------------------------------
--trigger update property end_date with current date when rental is closing
create or replace trigger change_rental_status_after_add_end_Date
before update on Rental
for each row
when(new.state = 'closed' AND old.state = 'active')
begin
    :new.end_date := SYSDATE;
end;
--------------------------------------------------------------------------------------------------------------------
--trigger delete salary and experience when employee leaves
create or replace trigger delete_employee_redundant_data_after_leave
before update on Employee
for each row
when(new.availability = 'leave' AND old.availability != 'leave')
begin
    :new.salary := null;
    :new.experience := null;
end;
----------------------------------------------------------------------------------------------------------------------
--trigger fill property add_date with current date
create or replace trigger fill_customer_add_date
before insert on Customer
for each row
begin
    :new.add_date := SYSDATE;
end;
-- it has to be dropped while using generators
drop trigger fill_customer_add_date;
----------------------------------------------------------------------------------------------------------------------
--trigger fill property date  with current date 
create or replace trigger fill_opinion_date
before insert on Opinion
for each row
begin
    :new."Date" := SYSDATE;
end;
-- it has to be dropped while using generators
drop trigger fill_opinion_date;
----------------------------------------------------------------------------------------------------------------------




