-- 1. Tạo bảng students
create table students (
id int auto_increment primary key,
student_name varchar(50) not null,
address varchar(50) not null,
sex int not null default 1,
age int not null,
-- constraint check_age check (age > 18 and age < 25),
email varchar(50) not null unique,
phone varchar(10) not null
);

-- 2. Tạo bảng class
create table classes (
id_class int auto_increment primary key,
class_name varchar(50) not null unique
);

-- 3.4. Thêm cột và ràng buộc khóa ngoại
alter table students
add column classId int,
add constraint foreign key (classId) references classes(id_class);

-- 5. Thêm dữ liệu của bảng class, dạng đơn
insert into classes (`class_name`) value ('C0821H1');
insert into classes (`class_name`) value ('C0821H2');
insert into classes (`class_name`) value ('C0821I1');
insert into classes (`class_name`) value ('C0821I2');
insert into classes (`class_name`) value ('C1021H1');

-- 6.	Thêm 10 sinh viên vào bảng students
insert into `student_management`.`students` (`student_name`, `address`, `sex`, `age`, `email`, `phone`, `classId`) values 
('Như Anh', 'TB', '0', '23', 'nhuanh1@codegym.vn', '0326456727', '1'),
('C Kiều Anh', 'HN', '0', '24', 'kieuanh1@codegym.vn', '0334105727', '3'),
('A Hoàng', 'HN', '0', '19', 'hoang@codegym.vn', '0326876727', '1'),
('Luân', 'HN', '0', '20', 'luan@codegym.vn', '0326198827', '5'),
('Huyen', 'HN', '0', '22', 'huyen@codegym.vn', '0326198727', '1'),
('Cuong', 'HN', '0', '19', 'cuong@codegym.vn', '0326198727', '5'),
('Long', 'HN', '0', '24', 'long@codegym.vn', '0326198727', '1'),
('Tuyen', 'HN', '0', '23', 'tuyen@codegym.vn', '0326198727', '2'),
('Mai', 'HN', '0', '23', 'mai@codegym.vn', '0326198727', '4');

-- 7.	Hiển thị danh sách học viên theo tuổi giảm dần
select * from student_management.students order by age desc;


-- 8.	Hiển thị danh sách học viên theo tuổi tăng dần
select * from student_management.students order by age asc;

-- 9.	Hiển thị tổng số lượng học viên của mỗi lớp
--  		Phân tích: từ khóa mỗi lớp => sử dụng group by
-- 						Số lượng học viên => sử dụng count
SELECT students.classId, classes.class_name, COUNT(students.id) AS 'Số lượng học sinh: '
FROM `student_management`.`students`,`student_management`.`classes`
where students.classId = classes.id_class
group by students.classId, classes.class_name;


-- 10.	Hiển thị lớp có số lượng học viên là đông nhất
SELECT students.classId, classes.class_name, COUNT(*) AS totalStudentsInClass
FROM `student_management`.`students`,`student_management`.`classes`
where students.classId = classes.id_class
group by students.classId, classes.class_name
having totalStudentsInClass = 
(select max(a.totalStudentsInClass) from (
SELECT students.classId, classes.class_name, COUNT(*) AS totalStudentsInClass
FROM `student_management`.`students`,`student_management`.`classes`
where students.classId = classes.id_class
group by students.classId, classes.class_name
) a ) 
;

-- 11.	Hiển thị lớp có số lượng học viên là ít nhất

SELECT students.classId, classes.class_name, COUNT(*) AS totalStudentsInClass
FROM `student_management`.`students`,`student_management`.`classes`
where students.classId = classes.id_class
group by students.classId, classes.class_name
having totalStudentsInClass = 
(select min(a.totalStudentsInClass) from (
SELECT students.classId, classes.class_name, COUNT(*) AS totalStudentsInClass
FROM `student_management`.`students`,`student_management`.`classes`
where students.classId = classes.id_class
group by students.classId, classes.class_name
) a ) 
;

-- 12.	Thống kê số lượng học viên theo địa chỉ
-- Từ khóa: thống kê => sử dụng group by 
-- 		Số lượng học viên => sử dụng count
-- 		Từng địa chỉ => group by theo address
select students.address , count(students.address) as 'so luong hoc sinh'
from `student_management`.`students`
group by students.address;


-- 13.	Hiển thị những lớp có số lượng học viên lớn hơn 5
-- Phân tích: mỗi lớp => group by
-- Số lượng học viên lớn hơn 5 => phải sử dụng having vì phải gom nhóm 	xong mới có số lượng học viên của mỗi lớp
SELECT students.classId, classes.class_name, COUNT(*) AS 'Số lượng học sinh: '
FROM `student_management`.`students`,`student_management`.`classes`
where students.classId = classes.id_class
group by students.classId, classes.class_name
having COUNT(*) >= 5;

-- 14.	Hiển thị những thành phố có số lượng học viên lớn hơn 5
select students.address , count(students.address) as 'so luong hoc sinh'
from `student_management`.`students`
group by students.address
having count(students.address) >= 5;

-- 15.	Hiển thị học viên có tuổi lớn nhất
-- Phân tích: 
-- C1: tìm học viên có tuổi lớn nhất => sẽ cần sử dụng hàm max có sẵn đối 	với cột 	tuổi;
-- C2: Sắp xếp danh sách sinh viên theo tuổi giảm dần và dùng limit 1 để lấy 	1 bản ghi đầu tiên
select students.student_name, students.age from `student_management`.students
where age = (select max(age) from `student_management`.students);

-- 16.	Hiển thị học viên có tuổi nhỏ nhất
select students.student_name, students.age from `student_management`.students
where age = (select min(age) from `student_management`.students);


-- 17.	Xóa tất cả học viên có quê ở TB
delete from  students where  id in (
select * from 
(select id from students where (address like 'TB')) a
);

select * from  `student_management`.`students` where id in (
select * from `student_management`.`students` where (address like 'TB'));

-- 18.	Cập nhật thông tin của học viên có quê ở Hà Nội thành giới tính nữ-- 
-- UPDATE `student_management`.`students` SET `sex` = '0' WHERE id in (
-- select id from `student_management`.`students` where (address like 'HN'));
update `student_management`.`students` set `sex` =  '0' where address = 'HN';

-- 19.	Hiển thị học viên có số tuổi lớn thứ hai
-- Phân tích:
-- o	Tìm tuổi lớn nhất
-- o	Sau đó dùng câu lệnh select max age và cho where age < giá trị lớn nhất => lấy được giá trị lớn thứ 2
-- o	Select * và kết hợp subquery
 
 select students.student_name, students.age 
 from `student_management`.students
  where age = (select max(age)
 from `student_management`.students
 where age < (select max(age) from `student_management`.students));
 


-- 20.	Hiển thị học viện có số tuổi nhỏ thứ hai
 select students.student_name, students.age 
 from `student_management`.students
  where age = (select min(age)
 from `student_management`.students
 where age > (select min(age) from `student_management`.students));