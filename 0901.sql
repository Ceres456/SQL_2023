select * from book

select * from book
        where bookname like '%�౸%' and price >= 15000;
        
select * from book
        where publisher='����ũ�౸' or publisher='�Ｚ����';
    
select * from book
        where publisher in('����ũ�౸','�Ｚ����');
        
select * from book
        order by bookname;

select * from book
        order by bookid;
        
select * from book
        order by price, bookname;
        
select * from book
        order by price desc, publisher asc;
        
select * from orders;
select sum(saleprice) as ���Ǹűݾ� from orders;

select * from orders;
select sum(saleprice) as �Ѹ��� from orders where custid=2;

select sum(saleprice) as ���Ǹűݾ�,
    avg(saleprice) as �Ǹž����,
    min(saleprice) as ��������,
    max(saleprice) as �ִ밡��
from orders;

select count(*) from orders;

select count(*) from orders where saleprice >= 13000;

select count(*) �ֹ�����, sum(saleprice) �ֹ��Ѿ� 
from orders 
group by custid
order by custid;

select custid, count(*) as �������� from orders
where saleprice >= 8000
group by custid
order by custid;

select custid, count(*) as �������� from orders
where saleprice>= 8000
group by custid
having count(*) >=2;

select bookname from book where bookid=1;

select bookname from book where price > 20000;

select sum(saleprice) as ������
from orders
where custid=1;

select count(*) as ��������
from orders
where custid=1;

select count(*) from orders;

select count(distinct publisher) as ���ǻ� from book;

select name,address from customer;

select orderid from orders
where orderdate BETWEEN '2023-01-04' and '2023-05-10';

select 


 
        

       