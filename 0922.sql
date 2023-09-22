select abs(-15) from dual;

select ceil(15.7) from dual;

select substr('ABCDEFG', 3, 4) from dual;

select cos(3.14159) from dual;

select trim(LEADING 0 FROM '00AA00') FROM dual;

select floor(15.7) from dual;

select ascii('A') from dual;

select log(10,100) from dual;

select instr('CORPORATE FLOOR','OR',3,2) FROM DUAL;

select mod(11,4) from dual;

select length('birthday') from dual;

select power(3,2) from dual;

select add_months('14/05/21',1) from dual;

select round(15.7) from dual;

select last_day(SYSDATE) from dual;

select sign(-15) from dual;

select next_day(SYSDATE, 'ȭ') from dual;

select trunc(15.7) from dual;

select round(SYSDATE) from dual;

select chr(67) from dual;

select SYSDATE from dual;

select concat('HAPPY','Birthday') from dual;

select to_char(SYSDATE) from dual;

select lower('birthday') from dual;

select to_char(123) from dual;

select lpad('page 1', 15, '*') from dual;

select to_date('12 05 2041', 'DD MM YYYY') from dual;

select ltrim('page 1','ae') from dual;

select to_number('12.3') from dual;

select replace("JACK","j","BL") from dual;

select decode(1,1,'aa','bb') from dual;

select rpad('page 1','15','*.') from dual;

select rtrim('page 1','ae') from dual;

select nullif(123, 345) from dual;

select NVL(null, 123) from dual;

-- ������ �̸��� ��ȭ��ȣ�� ����Ͻÿ�. (��, ��ȭ��ȣ�� ���� ������ ����ó�������� ���)
select name �̸�, phone ��ȭ��ȣ from customer;
select name �̸�, nvl(phone, '����ó����') ��ȭ��ȣ from customer;

-- ������Ͽ��� ����, ������ȣ, �̸�, ��ȭ��ȣ�� ���� �θ��� ����Ͻÿ�.
select rownum ����, custid, name, phone from Customer;
select rownum ����, custid, name, phone from Customer
where rownum<=2;

-- mybook ���̺� ����
create table mybook(
    bookid number not null primary key,
    price number 
);

-- ������ �� ����
insert into mybook values(1, 10000);
insert into mybook values(2, 20000);
insert into mybook(bookid) values(3);

select * from mybook;

select bookid,NVL(price, 0)
from mybook;

select * from mybook where price is null;

select * from mybook where price=20000;

select bookid,price+100 from mybook;

select sum(price), avg(price), count(*)
from mybook where bookid >= 4;

select count(*),count(price) from mybook;

select sum(price),avg(price) from mybook;

select * from book;

select * from book where rounum <= 5;

select * from book where rownum <=5 order by price;

select * from (select * from book order by price)b where rownum <= 5;

select * from (select * from book where rownum <= 5)b order by price;

select * from (select * from book where rownum <= 5 order by price)b;

-- ����Ǹűݾ� ������ �ֹ��� ���� �ֹ���ȣ�� �ݾ��� ����Ͻÿ�.
select orderid �ֹ���ȣ, saleprice �Ǹűݾ� from orders;

select orderid �ֹ���ȣ, saleprice �Ǹűݾ� from orders
where saleprice <= (select avg(saleprice) from orders);

-- �� ������ ����Ǹűݾ׺��� ū �ݾ��� �ֹ� ���������ؼ��� �ֹ���ȣ, ������ȣ, �Ǹűݾ��� ����Ͻÿ�.
select orderid �ֹ���ȣ, custid ������ȣ, saleprice �Ǹűݾ� from orders;

select orderid �ֹ���ȣ, custid ������ȣ, saleprice �Ǹűݾ� from orders mo
where saleprice > (select avg(saleprice) from orders so where mo.custid=so.custid);

-- ���ѹα��� �����ϴ� �������� �Ǹ��� ������ ���Ǹűݾ��� ����Ͻÿ�.
select sum(saleprice) ���Ǹűݾ� from orders;
-- ���￡ �����ϴ� ����� ������ȣ
select custid from customer 
where address like '%����%';

select sum(saleprice) ���Ǹűݾ� from orders
where custid in(select custid from customer 
where address like '%����%');

select sum(saleprice) ���Ǹűݾ� from orders
where custid not in(select custid from customer 
where address like '%����%');

-- 3�� ������ �ֹ��� ������ �ְ� �ݾ׺��� �� ��� ������ ������ �ֹ��� �ֹ���ȣ�� �ݾ��� ����Ͻÿ�.
select orderid �ֹ���ȣ, saleprice �Ǹűݾ� from orders;

select orderid �ֹ���ȣ, saleprice �Ǹűݾ� from orders
where saleprice > all(select saleprice from orders where custid=3);

select saleprice from orders where custid=3;

-- ���￡ �����ϴ� �������� �Ǹ��� ������ ���Ǹž��� ���Ͻÿ�.
select sum(saleprice) ���Ǹűݾ� from orders mo
where exists(
    select * from customer c 
    where address like '%����%' and mo.custid=c.custid
);

-- ������ �Ǹűݾ��� �հ踦 ����Ͻÿ�.(������ȣ, �Ǹ��հ�)
select custid ������ȣ, sum(saleprice) �Ǹ��հ� from orders
group by custid;

-- ������ �Ǹűݾ��� �հ踦 ����Ͻÿ�. (������, �Ǹ��հ�)
select (select name from customer c 
        where c.custid=o.custid) ��������, sum(saleprice) �Ǹ��հ� from orders o, customer c
group by o.custid;

-- �ֹ���Ͽ� å�̸��� ������ �� �ִ� �÷��� �߰��Ͻÿ�.
alter table orders add bookname varchar2(40);

update orders o set bookname = (select bookname from book b where b.bookid=o.bookid);

-- ������ȣ�� 2������ ������ȣ�� �̸��� ����Ͻÿ�.
select custid ������ȣ, name �̸� from customer
where custid<=2;

-- ������ȣ�� 2������ ������ �Ǹűݾ��� ����Ͻÿ�.(�����̸��� ������ �Ǹž� ���)
select name, sum(saleprice) �Ǹűݾ�
from (select custid, name from customer
where custid<=2) c, orders o 
where c.custid=o.custid
group by name;

select custid,(select address from customer cs where cs.custid = od.custid)"address", sum(saleprice) "total"
from orders od group by od.custid;
