select * from book

select * from book
        where bookname like '%축구%' and price >= 15000;
        
select * from book
        where publisher='라이크축구' or publisher='삼성전장';
    
select * from book
        where publisher in('라이크축구','삼성전장');
        
select * from book
        order by bookname;

select * from book
        order by bookid;
        
select * from book
        order by price, bookname;
        
select * from book
        order by price desc, publisher asc;
        
select * from orders;
select sum(saleprice) as 총판매금액 from orders;

select * from orders;
select sum(saleprice) as 총매출 from orders where custid=2;

select sum(saleprice) as 총판매금액,
    avg(saleprice) as 판매액평균,
    min(saleprice) as 최저가격,
    max(saleprice) as 최대가격
from orders;

select count(*) from orders;

select count(*) from orders where saleprice >= 13000;

select count(*) 주문수량, sum(saleprice) 주문총액 
from orders 
group by custid
order by custid;

select custid, count(*) as 도서수량 from orders
where saleprice >= 8000
group by custid
order by custid;

select custid, count(*) as 도서수량 from orders
where saleprice>= 8000
group by custid
having count(*) >=2;

select bookname from book where bookid=1;

select bookname from book where price > 20000;

select sum(saleprice) as 박지성
from orders
where custid=1;

select count(*) as 도서수량
from orders
where custid=1;

select count(*) from orders;

select count(distinct publisher) as 출판사 from book;

select name,address from customer;

select orderid from orders
where orderdate BETWEEN '2023-01-04' and '2023-05-10';

select 


 
        

       