//Book ���̺��� bookname ���� ������� �ε���ix_BooK�������Ͻÿ�.
create index ix_Book on Book(bookname);

//Book ���̺��� publisher,price ���� ������� �ε��� ix_Book2�� �����Ͻÿ�
create index ix_Book2 on Book(publisher,price);

//Q.�ֹ����� ���� ���� �̸�(�μ����� ���)
select c.name from customer c
    where name not in (select name
                from orders o, customer c
                where o.custid = c.custid);
select * from customer;
select * from orders;

//Q.�ֹ� �ݾ��� �Ѿװ� �ֹ��� ��� �ݾ�
select sum(saleprice), avg(saleprice) from orders;

//Q.���� �̸��� ���� ���ž�
select name, sum(saleprice)
from customer,orders
where customer.custid = orders.custid
group by name;

//Q.���� �̸��� ���� ������ ���� ���
select name, bookname from customer, orders, book
where customer.custid = orders.custid
    and orders.bookid = book.bookid;

//Q.������ ����(Book ���̺�)�� �ǸŰ���(Orders ���̺�)�� ���̰� ���� ���� �ֹ�
select * from book, orders
where book.bookid = orders.bookid
and price-saleprice = (select max(price - saleprice)
                            from book, orders
                            where book.bookid = orders.bookid);

//Q.������ �Ǹž� ��պ��� �ڽ��� ���ž� ����� �� ���� ���� �̸�
select name, avg(saleprice) from customer, orders
    where customer.custid = orders.custid
    group by name
    having avg(saleprice) > (select avg(saleprice) from orders);

//Q.�������� ������ ������ ���ǻ�� ���� ���ǻ翡�� ������ ������ ���� �̸�        
select c.name from customer c, orders o, book b
    where c.custid = o.custid and o.bookid = b.bookid
    and c.name not like '������'
    and publisher in
    (select b.publisher from customer c, orders o, book b
    where c.custid = o.custid and o.bookid = b.bookid
    and name like '������');
    
    SELECT * FROM ORDERS;
