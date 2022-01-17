create database book_manager;
use book_manager;
create table Book (
id int auto_increment primary key,
nameBook varchar(50) not null,
price double not null,
quantity int,
typeBook varchar(50) not null,
author varchar(50) not null,
datePublic varchar(50)
);
-- tạo dữ liệu với 10 bản ghi
INSERT INTO Book (nameBook, price, quantity, typeBook, author, datePublic)
VALUES ('Harry Potter 1', 100, 12, 'tiểu thuyết', 'JK Rowling', '1/1/2022');
INSERT INTO Book (nameBook, price, quantity, typeBook, author, datePublic)
VALUES ('Harry Potter 2', 100, 10, 'tiểu thuyết', 'JK Rowling', '1/2/2022');
INSERT INTO Book (nameBook, price, quantity, typeBook, author, datePublic)
VALUES ('Harry Potter 3', 100, 10, 'tiểu thuyết', 'JK Rowling', '2/1/2022');
INSERT INTO Book (nameBook, price, quantity, typeBook, author, datePublic)
VALUES ('Bố già', 200, 10, 'tiểu thuyết', 'Mario Puzo', '1/3/2022');
INSERT INTO Book (nameBook, price, quantity, typeBook, author, datePublic)
VALUES ('Payback Time', 200, 10, 'kinh doanh', 'Phil Town', '1/5/2022');
INSERT INTO Book (nameBook, price, quantity, typeBook, author, datePublic)
VALUES ('Lược sử thời gian', 130, 10, 'khoa học', 'Stephen Hawking', '1/3/2022');
INSERT INTO Book (nameBook, price, quantity, typeBook, author, datePublic)
VALUES ('Từ tốt đến vĩ đại', 230, 10, 'kinh doanh', 'Jim Collins', '1/7/2022');
INSERT INTO Book (nameBook, price, quantity, typeBook, author, datePublic)
VALUES ('DevUp', 115, 10, 'lập trình', 'Nguyễn Hiền', '1/6/2022');
INSERT INTO Book (nameBook, price, quantity, typeBook, author, datePublic)
VALUES ('Harry Potter và đứa trẻ bị nguyền rủa', 150, 12, 'tiểu thuyết', 'JK Rowling', '10/1/2022');
INSERT INTO Book (nameBook, price, quantity, typeBook, author, datePublic)
VALUES ('Sinh vật huyền bí và nơi tìm ra chúng', 200000, 15, 'khoa học', 'JK Rowling', '1/9/2022');

-- hiển thị tất cả sách 
SELECT * FROM Book; 

-- tính tổng giá tiền
select sum(price * quantity) as 'total' from Book;

-- hiển thị quyển sách có giá cao nhất
select * from Book 
where price = (select max(price) from Book);

--  Tạo phương thức tìm quyển sách có giá tiền thấp nhất
select * from Book 
where price = (select min(price) from Book);

-- Tạo phương thức tính đơn giá trung bình của sách khoa học
select avg(price) as 'trung bình giá' from Book where typeBook = 'khoa học';

-- Tạo phương thức trả về tất cả các quyển sách của tác giả 
select * from Book where author = 'JK Rowling';

-- Tạo phương thức trả về tất cả các quyển sách trong khoảng giá
select * from Book where price between 110 and 170;

-- Tạo phương thức trả về tất cả các quyển sách thuộc 1 thể loại
select * from Book where typeBook = 'kinh doanh';

-- Tạo phương thức trả về tất cả các quyển sách theo giá tiền
select * from Book where price = 200;

-- Tạo phương thức trả về tất cả các quyển sách theo ngày
select * from Book where datePublic > '1/7/2022';

-- Tạo phương thức trả về tất cả các quyển sách theo khoảng ngày
select * from Book where datePublic between '1/5/2022' and '1/9/2022';

