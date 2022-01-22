use sinh_vien;
CREATE TABLE quan_ly_hoc_vien
(ID int not null,
TEN varchar(50) not null,
TUOI int not null,
KHOAHOC TEXT,
SOTIEN decimal);
insert into quan_ly_hoc_vien(ID, TEN, TUOI, KHOAHOC, SOTIEN) VALUES (5,'Huong',20,'TCNH',200000);
select * from quan_ly_hoc_vien;
select * from quan_ly_hoc_vien where TEN = 'Huong';
select TEN, sum(SOTIEN) as tongHP from quan_ly_hoc_vien where TEN='Huong';
select TEN from quan_ly_hoc_vien group by TEN;