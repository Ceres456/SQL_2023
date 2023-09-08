-- 집합연산자: 합집합(UNION), 차집합(MINUS), 교집합(INTERSECT)
-- 차집합 연산자 사용
-- 도서를 주문하지 않은 고객의 이름을 쓰시오
select name from customer;

select distinct custid from orders;

select name from customer
where custid in (select distinct custid from orders);

--차집합
select name from customer
minus
select name from customer
where custid in (select distinct custid from orders);

--집합자 연산자 사용하지 않은 경우
select name from customer
where custid not in (select distinct custid from orders);

-- EXISTS: 서브쿼리의 결과가 존재하는 경우에 True
-- 주문이 있는 고객의 이름과 주소를 출력하시오 
-- in연산자 사용한 경우
select name, address from customer
where custid in(select distinct custid from orders);
-- 동등조인과 중복행 제거
select name, address from customer c, orders o
where c.custid = o.custid;
-- Exists 사용한 경웅
select name, address from customer c
where exists(select * from orders o
                        where c.custid = o.custid);
                        
-- 박지성이 구매한 도서의 출판사 수
SELECT COUNT(DISTINCT publisher)
FROM customer, orders, book
WHERE customer.custid = orders.custid 
AND orders.bookid = book.bookid
AND customer.custid = 1;

-- 박지성이 구매한 도서의 이름, 가격, 정가와 판매가격의 차이
select bookname, price, price-saleprice from book, orders, customer
where book.bookid = orders.bookid 
and customer.custid = orders.custid 
and customer.custid
= 1;
-- 박지성이 구매하지 않은 도서의 이름


--create table/alter table/drop table
-- 테이블 생성 연습 1
create table newbook1(
    bookid number,
    bookname varchar2(20),
    publisher varchar2(20),
    price number
);
-- 테이블 생성 연습2
-- primary key 설정 방법 1
create table newbook2(
    bookid number,
    bookname varchar2(20),
    publisher varchar2(20),
    price number,
    primary key (bookid)
);
 
-- primary key 설정 방법 2
create table newbook3(
    bookid number primary key,
    bookname varchar2(20),
    publisher varchar2(20),
    price number
);

-- bookname 칼럼: null값 가질 수 없음
-- publisher 컬럼: 동일한 값을 가질 수 없음
-- price 컬럼: 가격이 입력되어 있지 않으면 기본값을 10000으로하고 입력될 때는 1000초과로 함
-- bookname, publisher 컬럼을 복합키로 설정

create table newbook4(
    bookname varchar2(20) not null,
    publisher varchar2(20) unique,
    price number default 10000 check(price > 1000),
    primary key(bookname, publisher)
);
























































