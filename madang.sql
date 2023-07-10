//Book 테이블의 bookname 열을 대상으로 인덱스ix_BooK을생성하시오.
create index ix_Book on Book(bookname);

//Book 테이블의 publisher,price 열을 대상으로 인덱스 ix_Book2를 생성하시오
create index ix_Book2 on Book(publisher,price);

//Q.주문하지 않은 고객의 이름(부속질의 사용)
select c.name from customer c
    where name not in (select name
                from orders o, customer c
                where o.custid = c.custid);
select * from customer;
select * from orders;

//Q.주문 금액의 총액과 주문의 평균 금액
select sum(saleprice), avg(saleprice) from orders;

//Q.고객의 이름과 고객별 구매액
select name, sum(saleprice)
from customer,orders
where customer.custid = orders.custid
group by name;

//Q.고객의 이름과 고객이 구매한 도서 목록
select name, bookname from customer, orders, book
where customer.custid = orders.custid
    and orders.bookid = book.bookid;

//Q.도서의 가격(Book 테이블)과 판매가격(Orders 테이블)의 차이가 가장 많은 주문
select * from book, orders
where book.bookid = orders.bookid
and price-saleprice = (select max(price - saleprice)
                            from book, orders
                            where book.bookid = orders.bookid);

//Q.도서의 판매액 평균보다 자신의 구매액 평균이 더 높은 고객의 이름
select name, avg(saleprice) from customer, orders
    where customer.custid = orders.custid
    group by name
    having avg(saleprice) > (select avg(saleprice) from orders);

//Q.박지성이 구매한 도서의 출판사와 같은 출판사에서 도서를 구매한 고객의 이름        
select c.name from customer c, orders o, book b
    where c.custid = o.custid and o.bookid = b.bookid
    and c.name not like '박지성'
    and publisher in
    (select b.publisher from customer c, orders o, book b
    where c.custid = o.custid and o.bookid = b.bookid
    and name like '박지성');
    
    SELECT * FROM ORDERS;
