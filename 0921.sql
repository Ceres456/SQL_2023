--�������� ������ ������ ���ǻ�� ���� ���ǻ翡�� ������ ������ ���� �̸�

-- �������� ������ ������ ���ǻ��̸��� ����Ͻÿ�
select publisher from customer cs, orders os, book bs
where cs.custid = os.custid and os.bookid = bs.bookid
and name like '������';

select name from customer cs, orders os, book bs
where cs.custid = os.custid and os.bookid = bs.bookid
and name not like '������' and publisher in(select publisher from customer cs, orders os, book bs
where cs.custid = os.custid and os.bookid = bs.bookid
and name like '������');

-- �� �� �̻��� ���� �ٸ� ���ǻ翡�� ������ ������ ���� �̸�
select name from customer c
where (select count(distinct publisher)from customer c, orders o, book b
where c.custid = o.custid and o.bookid = b.bookid
and name like c.name) >=2;

-- ���� 30% �̻��� ������ �������� ����Ͻÿ�

select bookname from book bm
where (select count(b.bookid) from book b, orders o
        where b.bookid = o.bookid and b.bookid = bm.bookid)
        >= (select count(*) from customer)*0.3;
        
-- ���ο�� ('������ ����', '���ѹ̵��', 10000��)�� ���缭���� �԰�Ǿ���
-- ������ ���� �߰��Ͻÿ�.
-- ���� ������ ���� �ʴ´ٸ� ������ �����Ͱ� �ִ��� Ȯ���� ����.
insert into book values(11,'������ ����', '���ѹ̵��', 10000��);

delete from book
where publisher like '�س�';

update book set publisher='�������ǻ�'
where publisher like '�౸�����';

-- abs: ���밪���ϴ� �Լ�
select abs(-33), abs(33) from dual;

-- 5.657�� �Ҽ� ù°�ڸ����� �ݿ����� ���� ���Ͻÿ�.
select round(5.657, 1) from dual;

-- ���� ��� �ֹ��ݾ��� ��� ������ �ݿø��� ���� ���Ͻÿ�.
select custid "����ȣ", round(avg(saleprice), -2) "��ձݾ�" from orders
group by custid;

-- ������ '����'�� ���Ե� ������ '����'���� �����Ͽ� ����Ͻÿ�.
-- ���� book���̺��� ���������͸� �����ϸ� �ȵ˴ϴ�.
select bookid, replace(bookname, '����', '����') bookname, publisher, price from book;

-- ���ǻ簡 '�س�'�� �������� ���ڼ��� ����Ʈ���� ����Ͻÿ�
select bookname "������", length(bookname) ���ڼ�, length(bookname) ����Ʈ�� from book
where publisher like '�س�';

-- ���߿��� ���� ������ ���� ����� ������� ���ú��� �ο����� ����Ͻÿ�
select substr(name, 1, 1) "����", count(*) "�ο���" from customer
group by substr(name, 1, 1);

-- ������ �ֹ�Ȯ������ �ֹ��Ϸκ��� 10�����̴�. �ֹ���ȣ, �ֹ���, �ֹ�Ȯ������ ����Ͻÿ�.
select orderid �ֹ���ȣ, orderdate �ֹ���, orderdate+10 �ֹ�Ȯ���� from orders order by orderid; 

-- 2023�� 8�� 28�Ͽ� �ֹ����� �ֹ���ȣ, �ֹ���, ����ȣ, ������ȣ�� ��� ����Ͻÿ�.
-- ��, �ֹ����� "yyyy�� mm�� dd��"�� ���� format���� ǥ���Ͻÿ�.
select orderid �ֹ���ȣ,to_char(orderdate, 'yyyy-mm-dd') �ֹ���,custid ����ȣ, bookid ������ȣ from orders 
where orderdate = to_date('20230828', 'yyyymmdd');

select orderid �ֹ���ȣ,to_char(orderdate, 'yyyy-mm-dd') �ֹ���,name ����, bookname ������ 
from orders o, customer c, book b 
where c.custid = o.custid and o.bookid = b.bookid
and orderdate = to_date('20230828', 'yyyymmdd');

-- DB ������ ������ ��¥�� �ð� ������ ����Ͻÿ�.
-- ���� ��ȯ�� ��¥�� ������ ������(�⵵ 4�ڸ�/�� 2�ڸ�/��¥ 2�ڸ� ������ ����, ��:��:��) ��¥�� �ð� 2������ ��� ����Ͻÿ�.
select sysdate ������ȯ�Ȱ�, to_char(sysdate, 'yyyy/mm/dd dy hh24:mi:ss') �������ĳ�¥�׽ð� from dual;


