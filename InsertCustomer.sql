create or replace PROCEDURE INSERTCUSTOMER(
    myCustId in number,
    myName in varchar2,
    myAddress in varchar2,
    myPhone in varchar2)
AS 
BEGIN
  insert into customer(custid, name, address, phone)
  values(myCustId, myName, myAddress, myPhone);
END;

exec insertcustomer(6, '������', '����� ��걸 �ѳ���', '010-1233-7653');
select * from customer;