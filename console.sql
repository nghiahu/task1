create database managementCourse_Student;
use managementCourse_Student;

create table Admin(
  id int primary key auto_increment,
  username varchar(50) not null unique,
  password varchar(255) not null
);

create table Student(
    id int primary key auto_increment,
    name varchar(100) not null,
    dob date not null,
    email varchar(100) not null unique,
    sex bit not null,
    phone varchar(20) null,
    password varchar(255) not null,
    create_at date default(now())
);

create table Course(
   id int primary key auto_increment,
   name varchar(100) not null,
   duration int not null,
   instructor varchar(100) not null,
   create_at date default(now())
);

create table enrollment(
   id int primary key auto_increment,
   student_id int not null,
   course_id int not null,
   registered_at date default(current_timestamp()),
   status enum('WAITING','DENIED','CANCER','CONFIRM'),
   foreign key(student_id) references Student(id),
   foreign key(course_id) references Course(id)
);