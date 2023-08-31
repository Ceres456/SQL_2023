-- 도서정보 Book 테이블
create table Book(
    bookid NUMBER(2) primary key,
    bookname VARCHAR2(40),
    publisher VARCHAR2(40),
    price NUMBER(8)
);

--수입도서정보 Imported_Book 테이블
create table Imported_Book(
    bookid NUMBER(2),  
    bookname VARCHAR2(40),
    publisher VARCHAR2(40),
    price NUMBER(8)
);

-- 고객정보 Customer 테이블
create table Customer(
    custid NUMBER(2) primary key,
    name VARCHAR2(40),
    address VARCHAR2(50),
    phone VARCHAR2(20)
);
-- 주문정보 Orders 테이블
create table Orders(
    orderid number(2) primary key,
    custid NUMBER(2) REFERENCES Customer(custid),
    bookid NUMBER(2) REFERENCES Book(bookid),
    saleprice NUMBER(8),
    orderdate DATE
);

--Book 테이블에 10권의 도서 정보를 추가하세요
insert into Book VALUES(1, '축구의 역사', '굿스포츠', 7000);
insert into Book VALUES(2, '박지성에 관하여', '라이크축구', 20000);
insert into Book VALUES(3, '손흥민에 관하여', '라이크축구', 16004);
insert into Book VALUES(4, '축구의 기초', '축구이즈굿', 5000);
insert into Book VALUES(5, '인터넷검색하기', '플리즈검색', 7800);
insert into Book VALUES(6, '삶에 관하여', '삼성전장', 13000);
insert into Book VALUES(7, '물을 마시는 법', '아리수', 23000);
insert into Book VALUES(8, '죽음에 관하여', '삼성전장', 23232);
insert into Book VALUES(9, '인간의 역사', '예스24', 12412);
insert into Book VALUES(10, '휴식하는법', '펀앤쿨', 25232);

--Customer 테이블에 고객정보 5명 추가
insert into Customer VALUES(1, '박지성', '맨체스터', '010-0000-0000');
insert into Customer VALUES(2, '김연아', '서울 동작구 흑석동', '010-6141-7323');
insert into Customer VALUES(3, '추신수', '인천광역시 연수구', '010-1232-4523');
insert into Customer VALUES(4, '장미란', '서울 용산구 보광동', '010-0000-0000');
insert into Customer VALUES(5, '박세리', '대전광역시 유성구', '010-5324-0423');