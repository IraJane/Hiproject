# Hiproject<br>ㅙ





<h1>main jsp 부분 수정 </h1>


<hr>


<hr>
drop sequence member_seq;
create sequence member_seq
start with 0
minvalue 0
increment by 1
nocache;

drop table members;
create table members (
m_num number primary key,
m_email varchar2(50) not null unique,
m_password varchar2(50) not null,
m_nickname varchar2(20) not null,
m_name varchar2(20) not null,
m_phone varchar2(20) not null
);

drop sequence seller_seq;
create sequence seller_seq
start with 0
minvalue 0
increment by 1
nocache;

drop table sellers;
create table sellers (
s_num number primary key,
s_email varchar2(50) not null unique,
s_password varchar2(50) not null,
s_phone varchar2(20) not null,
s_name varchar2(20) not null,
s_comnumber varchar2(20) not null
);

drop sequence hotel_seq;
create sequence hotel_seq
start with 0
minvalue 0
increment by 1
nocache;


drop table hotel;
create table hotel ( 
h_num number primary key,
s_num number REFERENCES sellers (s_num),
h_name varchar2(50),
h_nation varchar2(50),
h_address1 varchar2(50),
h_address2 varchar2(50),
h_type varchar2(50),
h_phone varchar2(50),
h_room_num number,
h_facilities varchar2(300),
h_internet varchar2(50),
h_animal varchar2(50),
h_parking varchar2(50), 
h_smoke varchar2(50),
h_language varchar2(50), 
h_image varchar2(300), 
h_hotel_url varchar2(50),
h_comment varchar2(300),
h_grade varchar2(20)
);

drop sequence room_seq;
create sequence room_seq 
start with 0
minvalue 0
increment by 1 
nocache;


drop table rooms;
create table rooms(
r_num number primary key,
h_num number REFERENCES hotel (h_num),
r_type varchar2(20),
r_price number, 
r_person number,
r_breakfast varchar2(10),
r_stock number
);

drop sequence o_seq;
create sequence o_seq
start with 0
minvalue 0
increment by 1
nocache;

drop table mainorder;
create table mainorder(
o_num number primary key,
m_num number REFERENCES members (m_num),
o_orderdate date default sysdate,
o_checkin date,
o_checkout date,
o_totalpeople NUMBER,
o_comment varchar2(2000),
o_checker varchar2(20),
o_engname varchar2(30)
);

drop sequence od_seq;
create sequence od_seq
start with 0
minvalue 0
increment by 1
nocache;

drop table orderdetail;
create table orderdetail(
od_num number primary key,
r_num number REFERENCES rooms (r_num),
o_count number,
o_num number REFERENCES mainorder (o_num)
);

drop sequence c_seq;
create sequence c_seq
start with 0
minvalue 0
increment by 1
nocache;

drop table review;
create table review(
r_num number primary key,
m_num number REFERENCES members (m_num),
o_num number REFERENCES mainorder (o_num),
r_comment varchar2(500),
r_star number
);

drop sequence qa_seq;
create sequence qa_seq
start with 0
minvalue 0
increment by 1
nocache;

drop table qa;
create table qa(
q_num number primary key,
m_num number REFERENCES members (m_num),
q_title varchar2(50),
q_comment varchar2(2000),
q_regDate date,
q_checked number
);
<hr>

