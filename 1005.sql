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
select bookname, name
from highorders

-- 


