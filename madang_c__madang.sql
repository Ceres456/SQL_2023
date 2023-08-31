-- �������� Book ���̺�
create table Book(
    bookid NUMBER(2) primary key,
    bookname VARCHAR2(40),
    publisher VARCHAR2(40),
    price NUMBER(8)
);

--���Ե������� Imported_Book ���̺�
create table Imported_Book(
    bookid NUMBER(2),  
    bookname VARCHAR2(40),
    publisher VARCHAR2(40),
    price NUMBER(8)
);

-- ������ Customer ���̺�
create table Customer(
    custid NUMBER(2) primary key,
    name VARCHAR2(40),
    address VARCHAR2(50),
    phone VARCHAR2(20)
);
-- �ֹ����� Orders ���̺�
create table Orders(
    orderid number(2) primary key,
    custid NUMBER(2) REFERENCES Customer(custid),
    bookid NUMBER(2) REFERENCES Book(bookid),
    saleprice NUMBER(8),
    orderdate DATE
);

--Book ���̺� 10���� ���� ������ �߰��ϼ���
insert into Book VALUES(1, '�౸�� ����', '�½�����', 7000);
insert into Book VALUES(2, '�������� ���Ͽ�', '����ũ�౸', 20000);
insert into Book VALUES(3, '����ο� ���Ͽ�', '����ũ�౸', 16004);
insert into Book VALUES(4, '�౸�� ����', '�౸�����', 5000);
insert into Book VALUES(5, '���ͳݰ˻��ϱ�', '�ø���˻�', 7800);
insert into Book VALUES(6, '� ���Ͽ�', '�Ｚ����', 13000);
insert into Book VALUES(7, '���� ���ô� ��', '�Ƹ���', 23000);
insert into Book VALUES(8, '������ ���Ͽ�', '�Ｚ����', 23232);
insert into Book VALUES(9, '�ΰ��� ����', '����24', 12412);
insert into Book VALUES(10, '�޽��ϴ¹�', '�ݾ���', 25232);

--Customer ���̺� ������ 5�� �߰�
insert into Customer VALUES(1, '������', '��ü����', '010-0000-0000');
insert into Customer VALUES(2, '�迬��', '���� ���۱� �漮��', '010-6141-7323');
insert into Customer VALUES(3, '�߽ż�', '��õ������ ������', '010-1232-4523');
insert into Customer VALUES(4, '��̶�', '���� ��걸 ������', '010-0000-0000');
insert into Customer VALUES(5, '�ڼ���', '���������� ������', '010-5324-0423');