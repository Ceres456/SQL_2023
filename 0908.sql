-- ���տ�����: ������(UNION), ������(MINUS), ������(INTERSECT)
-- ������ ������ ���
-- ������ �ֹ����� ���� ���� �̸��� ���ÿ�
select name from customer;

select distinct custid from orders;

select name from customer
where custid in (select distinct custid from orders);

--������
select name from customer
minus
select name from customer
where custid in (select distinct custid from orders);

--������ ������ ������� ���� ���
select name from customer
where custid not in (select distinct custid from orders);

-- EXISTS: ���������� ����� �����ϴ� ��쿡 True
-- �ֹ��� �ִ� ���� �̸��� �ּҸ� ����Ͻÿ� 
-- in������ ����� ���
select name, address from customer
where custid in(select distinct custid from orders);
-- �������ΰ� �ߺ��� ����
select name, address from customer c, orders o
where c.custid = o.custid;
-- Exists ����� ���
select name, address from customer c
where exists(select * from orders o
                        where c.custid = o.custid);
                        
-- �������� ������ ������ ���ǻ� ��
SELECT COUNT(DISTINCT publisher)
FROM customer, orders, book
WHERE customer.custid = orders.custid 
AND orders.bookid = book.bookid
AND customer.custid = 1;

-- �������� ������ ������ �̸�, ����, ������ �ǸŰ����� ����
select bookname, price, price-saleprice from book, orders, customer
where book.bookid = orders.bookid 
and customer.custid = orders.custid 
and customer.custid
= 1;
-- �������� �������� ���� ������ �̸�


--create table/alter table/drop table
-- ���̺� ���� ���� 1
create table newbook1(
    bookid number,
    bookname varchar2(20),
    publisher varchar2(20),
    price number
);
-- ���̺� ���� ����2
-- primary key ���� ��� 1
create table newbook2(
    bookid number,
    bookname varchar2(20),
    publisher varchar2(20),
    price number,
    primary key (bookid)
);
 
-- primary key ���� ��� 2
create table newbook3(
    bookid number primary key,
    bookname varchar2(20),
    publisher varchar2(20),
    price number
);

-- bookname Į��: null�� ���� �� ����
-- publisher �÷�: ������ ���� ���� �� ����
-- price �÷�: ������ �ԷµǾ� ���� ������ �⺻���� 10000�����ϰ� �Էµ� ���� 1000�ʰ��� ��
-- bookname, publisher �÷��� ����Ű�� ����

create table newbook4(
    bookname varchar2(20) not null,
    publisher varchar2(20) unique,
    price number default 10000 check(price > 1000),
    primary key(bookname, publisher)
);
























































