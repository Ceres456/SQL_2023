insert into orders values (1, 1, 1, 6000, TO_DATE('2023-01-10','yyyy-mm-dd'));
insert into orders values (2, 1, 3, 21000, TO_DATE('2023-03-15','yyyy-mm-dd'));
insert into orders values (3, 2, 5, 13000, TO_DATE('2022-11-07','yyyy-mm-dd'));
insert into orders values (4, 3, 6, 9000, TO_DATE('2023-07-12','yyyy-mm-dd'));
insert into orders values (5, 4, 7, 2000, TO_DATE('2023-07-07','yyyy-mm-dd'));
insert into orders values (6, 1, 2, 32000, TO_DATE('2022-11-14','yyyy-mm-dd'));
insert into orders values (7, 4, 8, 54000, TO_DATE('2023-08-28','yyyy-mm-dd'));
insert into orders values (8, 3, 9, 13600, TO_DATE('2023-08-04','yyyy-mm-dd'));
insert into orders values (9, 2, 10, 52000, TO_DATE('2023-10-29','yyyy-mm-dd'));
insert into orders values (10, 2, 10, 10000, TO_DATE('2022-10-04','yyyy-mm-dd'));

insert into imported_book values(21, 'zen Golf', 'person', 12000);
insert into imported_book values(22, 'Soccer Skills', 'Human Kinetics', 15000);


SELECT publisher, price FROM book
                        where bookname like 'Ãà±¸ÀÇ ¿ª»ç';
                        
SELECT phone
From customer
WHERE name='±è¿¬¾Æ';

select * from customer 
where name = '±è¿¬¾Æ';

SELECT bookname, price FROM Book;

SELECT price, bookname FROM Book;

SELECT bookid, bookname, publisher, price FROM Book;
SELECT * from book;

select publisher From book;

select distinct publisher from book;

select * from book 
where price < 15000;

select * from book
where price BETWEEN 10000 and 16000;

select * from book
where price >= 10000 and price <= 16000;

SELECT * FROM book
where publisher IN ('¶óÀÌÅ©Ãà±¸', '»ï¼ºÀüÀå');

SELECT * from book
where publisher = '±Â½ºÆ÷Ã÷' or publisher='ÇØ³¿';

select * from book 
where bookname like '%Ãà±¸%';

select * from book 
where bookname like '%°úÇÐ%';