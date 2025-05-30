CREATE TABLE FamilyMembers ( member_id INT PRIMARY KEY, status VARCHAR(20), member_name varchar(50), birthdate DATE);
select * from FamilyMembers;
create table Payments ( payment_id int primary key, good_name varchar(20) not null, amount decimal(10,2), date_ date not null);
select * from payments;
create table FamilyFriends (friend_id int primary key, friend_name varchar(50), member_name varchar(50), friend_age int);
select * from FamilyFriends;