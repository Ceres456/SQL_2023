SELECT custid,(Select address
                From customer cs
                where cs.custid = od.custid)"address",
                      Sum(saleprice)"total"
from orders od
Group by od.custid;

Select cs.name,s
from (Select custid, AVG(saleprice)s from orders group by custid)
od, customer cs where cs.custid = od.custid;

select sum(saleprice) "total"
from orders od
where Exists(select *
             from customer cs
             where custid <= 3 and cs.custid = od.custid);
             
-- ����ȣ�� 3���� ���� ���� �Ǹűݾ��� �հ踦 ���Ͻÿ�

select * from book;

-- å�̸��� �౸�̶�� �ܾ ���Ե� ����ष�� ����Ͻÿ�
select * from book
where bookname like '%�౸%';

create view v_book
as select * from book
where bookname like '%�౸%';

select * from customer;
--�ּҿ� �����̶�� �ܾ ���Ե� �並 �����Ͻÿ�
select * from customer
where address like '%����%';  

create view vw_customer 
as select * from customer
where address like '%����%';  

select * from vw_customer;

-- �ֹ����̺��� ���̸�, �����̸��� �ٷ� Ȯ���� �� �ִ� �並 ������ ��,
--�迬�� ���� ������ ������ �ֹ���ȣ, ������, �ֹ����� ����Ͻÿ�.

create view vw_orders(orderid, name,custid , bookid, bookname, saleprice, orderdate)
as select o.orderid,c.name, o.custid,  o.bookid, b.bookname, o.saleprice, o.orderdate
    from orders o, customer c, book b
    where o.custid=c.custid and o.bookid=b.bookid;
    
select * from vw_orders;

select orderid, bookname, saleprice
from vw_orders
where name = '�迬��';

-- ������ �並 �����Ѵ�.

create or replace view vw_customer(custid, name, address)
as select custid, name, address
from customer
where address like '%��ü����%';

select * from customer;

select * from vw_customer;

--�� ����
drop view vw_customer;

-- �ǸŰ����� 20000�� �̻��� ������ ������ȣ, �����̸�, ���̸�, ���ǻ�, �ǸŰ����� �����ִ� highorders �並 �����Ͻÿ�
create view highorders(bookid, bookname, name, publisher, saleprice)
as select o.bookid, b.bookname, c.name, b.publisher, o.saleprice
from orders o, customer c, book b
    where o.custid=c.custid and o.bookid=b.bookid and saleprice >= 20000;
    
-- ������ �並 �̿��Ͽ� �Ǹŵ� ������ �̸��� ���� �̸��� ����ϴ� SQL���� �ۼ��Ͻÿ�


-- insertbook ���ν��� ����
exec insertbook(15, '����������','������м���', 25000);

select * from book;

exec insertorupdate(16, '������ ��ſ�', '������м���', 30000);

exec insertorupdate(16, '������ ��ſ�', '������м���', 20000);

set SERVEROUTPUT on;
declare 
    averageVal number;
begin
    averagePrice(averageVal);
    dbms_output.put_line('������հ���: '||averageVal);
end;

create or replace PROCEDURE AVERAGEPRICE(
averageVal out number)
AS 
BEGIN
  select avg(price) into averageVal from book
  where price is not null;
END AVERAGEPRICE;

create or replace PROCEDURE INSERTBOOK(
    myBookId in number,
    myBookName in varchar2,
    myPublisher in varchar2,
    myPrice in number)
AS 
BEGIN
  insert into book(bookid, bookname, publisher, price)
  values(myBookId, myBookName, MyPublisher, Myprice);
END INSERTBOOK;

create or replace PROCEDURE INSERTORUPDATE(
    myBookId number,
    myBookName varchar2,
    myPublisher varchar2,
    myPrice int
)
AS 
    myCount number;
BEGIN
    select count(*) into myCount from book
    where bookname like myBookName;
  
    if myCount != 0 then
        update book set price=myPrice
        where bookname like myBookName;
    else
        insert into book(bookid, bookname, publisher, price)
        values(myBookId, myBookName, myPublisher, myPrice);
    end if;
END INSERTORUPDATE;
