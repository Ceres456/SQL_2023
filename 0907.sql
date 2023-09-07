-- ��������(Equi Join)
-- �������� ���̺��� �����Ҷ� Ư�� �÷��� ���� ���� ��鸸 �˻��� �� ���

-- ���� ���� �ֹ��� ���� �����͸� ��� ����Ͻÿ�
select * from customer, orders
where customer.custid = orders.custid;

-- ���� ���� �ֹ��� ���� �����͸� ��� ����ȣ������ ����Ͻÿ�
select * from customer, orders
where customer.custid = orders.custid
order by customer.custid desc;

--���� �̸�, �ֹ��� ���� �ǸŰ����� �˻��Ͻÿ�.
SELECT name, saleprice from customer c ,orders o
where c.custid = o.custid;

-- ������ �ֹ��� ��� ������ ���Ǹž��� ���ϰ� ���̸������� �����Ͻÿ�.
SELECT name, sum(saleprice) from customer, orders
where customer.custid = orders.custid
group by name 
order by name;

-- ���� �̸��� �ֹ��� ������ �̸� ���Ͻÿ�.
-- 3���� ���̺� ���� ��������
select name, bookname from customer c, book b, orders o
where c.custid = o.custid and o.bookid = b.bookid
order by name;

--���������� 20000���� ������ �ֹ��� ���̸��� �����̸��� ����Ͻÿ�.
select name, bookname from customer c, book b, orders o
where c.custid = o.custid and o.bookid = b.bookid and b .price = 20000;

-- �ܺ�����(Outer Join)
-- ���������� �ϰԵǸ� ���� �������� ���� ���� ���õ����� 
-- �ܺ������� �ϰԵǸ� ������ �Ǵ� ���̺��� �������� ���� ������ �൵ �����ؼ� ������ش�.

-- ������ �������� ���� ���� �����Ͽ� ���̸��� �ֹ��� ������ �ǸŰ����� ����Ͻþ�.
select name, saleprice 
from customer c left outer join orders o
                on c.custid = o.custid;
                
-- Sub Query(�μ� ����)
-- Main Query ���� �ִ� Query

-- ���������� ���� ��� ����
SELECT max(price) from book;
-- �����̸�
select bookname from book;
-- ���������� ���� ��� �����̸��� ����Ͻÿ�.
select bookname from book
where price = (SELECT max(price) from book);

-- ���������� ���� �� ������ �̸��� ������ ����Ͻÿ�.
select bookname, price from book
where price = (SELECT min(price) from book);

-- ������ ������ ���� �ִ� ���� �̸��� �˻��Ͻÿ�.
select name from customer
where custid in (select distinct custid from orders);
-- sub query: �ֹ��� ���� �ִ� ����ȣ��
select distinct custid from orders;

-- ����ũ�౸���� ������ ������ ������ ���� �̸��� ����Ͻÿ�
select name from customer
where custid in(select custid from orders 
where bookid in(select bookid from book where publisher = '����ũ�౸'));

select name
from customer c, orders o, book b
where o.bookid = b.bookid and c.custid = o.custid and b.publisher = '����ũ�౸';
