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
             
-- 고객번호가 3보다 작은 고객의 판매금액의 합계를 구하시오

select * from book;

-- 책이름에 축구이라는 단어가 포함된 결과행ㅇ을 출력하시오
select * from book
where bookname like '%축구%';

create view v_book
as select * from book
where bookname like '%축구%';

select * from customer;
--주소에 서울이라는 단어가 포함된 뷰를 생성하시오
select * from customer
where address like '%서울%';  

create view vw_customer 
as select * from customer
where address like '%서울%';  

select * from vw_customer;

-- 주문테이블에서 고객이름, 도서이름을 바로 확인할 수 있는 뷰를 생성한 후,
--김연아 고객이 구입한 도서의 주문번호, 도서명, 주문액을 출력하시오.

create view vw_orders(orderid, name,custid , bookid, bookname, saleprice, orderdate)
as select o.orderid,c.name, o.custid,  o.bookid, b.bookname, o.saleprice, o.orderdate
    from orders o, customer c, book b
    where o.custid=c.custid and o.bookid=b.bookid;
    
select * from vw_orders;

select orderid, bookname, saleprice
from vw_orders
where name = '김연아';

-- 기존의 뷰를 수정한다.

create or replace view vw_customer(custid, name, address)
as select custid, name, address
from customer
where address like '%맨체스터%';

select * from customer;

select * from vw_customer;

--뷰 삭제
drop view vw_customer;

-- 판매가격이 20000원 이상인 도서의 도서번호, 도서이름, 고객이름, 출판사, 판매가격을 보여주는 highorders 뷰를 생성하시오
create view highorders(bookid, bookname, name, publisher, saleprice)
as select o.bookid, b.bookname, c.name, b.publisher, o.saleprice
from orders o, customer c, book b
    where o.custid=c.custid and o.bookid=b.bookid and saleprice >= 20000;
    
-- 생성한 뷰를 이용하여 판매된 도서의 이름과 고객의 이름을 출력하는 SQL문을 작성하시오
select bookname, name
from highorders

-- 


