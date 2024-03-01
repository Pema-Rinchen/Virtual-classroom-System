CREATE DATABASE virtual_classroom;
use virtual_classroom;
CREATE TABLE roles (
	roleid TINYINT PRIMARY KEY,
    rolename VARCHAR(255) NOT NULL
);
insert into roles value(1,"Admin"),(2,"Proffessor"),(3,"Student");
CREATE TABLE users (
    name VARCHAR(255) NOT NULL,
    Username VARCHAR(255) NOT NULL,
    Password VARCHAR(255) NOT NULL,
    roleid TINYINT,
    FOREIGN KEY (roleid) REFERENCES roles(roleid)
);

create table Courses(
	CourseID int primary key,
    title varchar(255) not null,
    credict tinyint not null,
    CO varchar(255) not null,
    po varchar(255) not null,
    InstructorID int, 
    foreign key(InstructorID) references user(userid)
);
create table Enrollment(
	UserID int,
    CourseID int,
    marks int not null,
    foreign key(userid) references user(userid),
    foreign key(courseid) references Courses(CourseID)
    );
select * from roles;

 
