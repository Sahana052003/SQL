create database hospital;
use hospital;



create table Doctors (
    doctor_id   char(10) primary key,         
    first_name  varchar(20) not null,
    last_name   varchar(10) not null,
    specialty   varchar(15),
    phone       char(10),
    email       varchar(25) unique not null,
    hire_date   date not null,                
    experience_years int,                      
    rating      float,                                          
    status      varchar(20) check (status in ('Active','Inactive'))
);

desc Doctors;

insert into doctors values
('d001','john','miller','cardiology','5551001','john.miller@hospital.com','2015-01-10',10,4.8,'active'),
('d002','sarah','wilson','neurology','5551002','sarah.wilson@hospital.com','2017-03-15',7,4.6,'inactive'),
('d003','michael','brown','orthopedics','5551003','m.brown@hospital.com','2012-06-20',12,4.9,'active'),
('d004','emily','clark','dermatology','5551004','e.clark@hospital.com','2019-11-11',4,4.3,'active'),
('d005','david','white','general medicine','5551005','d.white@hospital.com','2014-02-14',9,4.7,'inactive'),
('d006','linda','adams','pediatrics','5551006','linda.adams@hospital.com','2016-07-22',8,4.5,'active'),
('d007','daniel','lee','urology','5551007','daniel.lee@hospital.com','2020-09-01',3,4.1,'inactive'),
('d008','kate','turner','oncology','5551008','kate.turner@hospital.com','2011-05-05',14,4.9,'active'),
('d009','robert','hall','psychiatry','5551009','robert.hall@hospital.com','2018-12-12',5,4.4,'inactive'),
('d010','olivia','king','ent','5551010','olivia.king@hospital.com','2021-04-18',2,4.0,'active');
select * from doctors;


update doctors set status='inactive' where doctor_id='d001';
update doctors set phone='5551011' where doctor_id='d002';
update doctors set specialty='general medicine' where doctor_id='d003';
update doctors set rating=4.9 where doctor_id='d004';
select * from doctors;

delete from doctors where doctor_id='d010';
delete from doctors where doctor_id='d007';
delete from doctors where doctor_id='d009';


select * from doctors;

create table patients_data (
    patient_id        char(10) primary key,
    first_name        varchar(20) not null,
    last_name         varchar(15) not null,
    birth_date        date,
    phone             char(10),
    email_id             varchar(35),
    blood_type        varchar(5),
    emergency_contact varchar(15),
    status            varchar(20)
        check (status in ('admitted','discharged','outpatient'))
);

insert into patients values
('p001','adam','jones','1990-04-10','5552001','adamjones@gmail.com','o+','mary jones','admitted'),
('p002','bella','smith','1988-02-15','5552002','bellasmith@gmail.com','a+','john smith','outpatient'),
('p003','chris','white','1995-07-20','5552003','chriswhite@gmail.com','b+','helen white','admitted'),
('p004','diana','morgan','2000-09-05','5552004','diamorgan@gmail.com','ab+','mike morgan','discharged'),
('p005','eric','brown','1983-01-12','5552005','ericb@gmail.com','o-','susan brown','outpatient'),
('p006','fiona','walker','1977-11-30','5552006','fiawalker@gmail.com','a-','rob walker','admitted'),
('p007','george','thomas','1999-03-18','5552007','gegethomas@gmail.com','b-','emma thomas','discharged'),
('p008','hannah','clark','1992-12-25','5552008','haahclark@gmail.com','o+','sam clark','outpatient'),
('p009','ian','martin','1986-06-22','5552009','ianmartin@gmail.com','ab-','kate martin','admitted'),
('p010','julia','carter','1993-08-14','5552010','julicarter@gmail.com','a+','joe carter','admitted');

select * from patients;



update patients set phone='5552011' where patient_id='p001';
update patients set email='bella.new@gmail.com' where patient_id='p002';
update patients set status='discharged' where patient_id='p003';
update patients set blood_type='b+' where patient_id='p004';


delete from patients where patient_id='p010';
delete from patients where patient_id='p006';
delete from patients where patient_id='p008';


create table appointments (
    appointment_id   char(10) primary key,
    patient_id       char(10) not null,
    doctor_id        char(10) not null,
    appointment_date date not null,
    appointment_time char(10) not null,
    reason           varchar(200),
    status           varchar(20)
        check (status in ('scheduled','completed','cancelled')),
    room_number      varchar(10)
);

insert into appointments values
('a001','p001','d001','2024-01-10','10:00','heart checkup','scheduled','101'),
('a002','p002','d002','2024-01-12','11:00','migraine','completed','102'),
('a003','p003','d003','2024-01-14','09:30','leg pain','scheduled','103'),
('a004','p004','d004','2024-01-16','13:00','skin rash','completed','104'),
('a005','p005','d005','2024-01-18','15:00','general checkup','scheduled','105'),
('a006','p006','d006','2024-01-20','10:45','child fever','scheduled','106'),
('a007','p007','d007','2024-01-22','08:30','urine infection','completed','107'),
('a008','p008','d008','2024-01-25','12:00','cancer consultation','scheduled','108'),
('a009','p009','d009','2024-01-27','11:20','anxiety','cancelled','109'),
('a010','p010','d010','2024-01-29','14:00','ear pain','scheduled','110');

select * from appointments;


update appointments set status='completed' where appointment_id='a001';
update appointments set room_number='201' where appointment_id='a002';
update appointments set reason='updated reason' where appointment_id='a003';
update appointments set appointment_time='14:30' where appointment_id='a004';


delete from appointments where appointment_id='a010';
delete from appointments where appointment_id='a007';
delete from appointments where appointment_id='a004';



create table medicine_data (
    medicine_id     char(10) primary key,
    medicine_name   varchar(25) not null,
    category        varchar(12),
    manufacturer    varchar(18),
    price           float check (price > 0),
    stock_qty       int check (stock_qty >= 0),
    expiry_date     date,
    is_prescription varchar(5)
        check (is_prescription in ('yes','no'))
);

insert into medicines values
('m001','parcetamol','tablet','pharma inc',2.5,200,'2026-05-01','no'),
('m002','ibuprofen','tablet','medicare',3.5,150,'2025-11-10','no'),
('m003','amoxicilin','capsule','health corp',12.0,100,'2025-08-20','yes'),
('m004','cetirizine','tablet','wellness labs',2.0,180,'2026-01-15','no'),
('m005','azihroycin','tablet','pharmaline',15.0,90,'2025-06-18','yes'),
('m006','omeprazole','capsule','acidfree',10.0,120,'2027-02-01','no'),
('m007','metformin','tablet','lifecare',5.0,140,'2027-10-10','yes'),
('m008','atorvtatin','tablet','cholest labs',8.0,160,'2027-11-20','yes'),
('m009','insulin','injection','bio-pharm',25.0,80,'2024-12-30','yes'),
('m010','vitamin c','tablet','nutrihealth',4.0,250,'2026-03-25','no');
select * from medicines;



update medicines set price=6.0 where medicine_id='m001';
update medicines set stock_qty=stock_qty-20 where medicine_id='m002';
update medicines set is_prescription='no' where medicine_id='m003';
update medicines set manufacturer='megahealth' where medicine_id='m004';


delete from medicines where medicine_id='m010';
delete from medicines where medicine_id='m009';
delete from medicines where medicine_id='m007';




create table billings (
    bill_id      char(10) primary key,
    bill_date    date not null,
    service_type varchar(21),
    amount       float check (amount > 0),
    tax          float check (tax >= 0),
    discount     float check (discount >= 0),
    total_amount float check (total_amount >= 0)
);

insert into billings values
('b001','2024-01-10','consultation',100,5,10,95),
('b002','2024-01-12','neurology test',400,20,0,420),
('b003','2024-01-14','x-ray',150,8,5,153),
('b004','2024-01-16','dermatology',120,6,10,116),
('b005','2024-01-18','general checkup',80,4,0,84),
('b006','2024-01-20','pediatric visit',90,5,5,90),
('b007','2024-01-22','urology test',250,12,10,252),
('b008','2024-01-25','oncology test',500,25,20,505),
('b009','2024-01-27','psychiatry session',200,10,0,210),
('b010','2024-01-29','ent visit',110,5,0,115);
select * from billings;



update billing set discount=15 where bill_id='b001';
update billing set total_amount=450 where bill_id='b002';
update billing set service_type='updated service' where bill_id='b003';
update billing set tax=12 where bill_id='b004';


delete from billing where bill_id='b010';
delete from billing where bill_id='b007';
delete from billing where bill_id='b005';





create table labtest_data (
    test_id    char(10) primary key,
    test_name  varchar(10) not null,
    test_date  date not null,
    result     varchar(20),
    doctor_id  char(10) not null,
    status     varchar(20)
        check (status in ('pending','completed')),
    cost       float check (cost >= 0)
);

insert into labtest_data values
('t001','blood test','2024-01-10','normal','d001','completed',100),
('t002','mri scan','2024-01-12','normal','d002','completed',800),
('t003','x-ray','2024-01-14','fracture','d003','completed',120),
('t004','skinbiopsy','2024-01-16','benign','d004','completed',300),
('t005','cbc','2024-01-18','normal','d005','completed',90),
('t006','thyroid','2024-01-20','high','d006','completed',140),
('t007','urine test','2024-01-22','infection','d007','completed',60),
('t008','ct scan','2024-01-25','abnormal','d008','completed',900),
('t009','mentalevo','2024-01-27','moderate','d009','completed',200),
('t010','ear test','2024-01-29','normal','d010','completed',70);

select * from labtest_data;


update labtests set status='completed' where test_id='t006';
update labtests set cost=150 where test_id='t003';
update labtests set result='updated result' where test_id='t005';
update labtests set test_name='advanced test' where test_id='t008';


delete from labtests where test_id='t010';
delete from labtests where test_id='t004';
delete from labtests where test_id='t009';





create table rooms (
    room_id      char(10) primary key,
    room_number  varchar(10) unique not null,
    room_type    varchar(20),
    is_available varchar(5)
        check (is_available in ('yes','no')),
    floor_number int,
    daily_rate   float check (daily_rate > 0),
    capacity     int check (capacity > 0),
    last_cleaned date
);

insert into rooms values
('r001','101','general','yes',1,1200,1,'2024-01-01'),
('r002','102','icu','no',1,3000,1,'2024-01-03'),
('r003','103','private','yes',1,2000,2,'2024-01-02'),
('r004','104','semi-private','yes',2,1500,2,'2024-01-05'),
('r005','105','general','no',2,1200,1,'2024-01-04'),
('r006','201','icu','yes',2,3000,1,'2024-01-06'),
('r007','202','private','yes',2,2000,2,'2024-01-07'),
('r008','203','general','yes',2,1200,1,'2024-01-08'),
('r009','204','semi-private','no',2,1500,2,'2024-01-09'),
('r010','205','private','yes',2,2000,1,'2024-01-10');
select * from rooms;




update rooms set is_available='no' where room_id='r001';
update rooms set daily_rate=3200 where room_id='r002';
update rooms set room_type='vip' where room_id='r003';
update rooms set last_cleaned='2024-02-01' where room_id='r004';


delete from rooms where room_id='r010';
delete from rooms where room_id='r007';
delete from rooms where room_id='r005';






create table nurses (
    nurse_id   char(10) primary key,
    first_name varchar(15) not null,
    last_name  varchar(19) not null,
    phone      char(15),
    hire_date  date not null,
    shift      varchar(20)
        check (shift in ('day','night')),
    department varchar(10),
    status     varchar(20)
        check (status in ('active','inactive'))
);

insert into nurses values
('n0011','sophia','miller','5553001','2020-01-01','day','ic','active'),
('n0012','emma','jones','5553002','2019-02-12','night','general','active'),
('n0013','mia','brown','5553003','2018-03-14','day','pediatrics','active'),
('n0014','ava','davis','5553004','2021-04-10','night','emergen','inactive'),
('n0015','isabella','martin','5553005','2017-05-20','day','surgery','active'),
('n0016','amelia','clark','5553006','2016-06-25','night','icu','active'),
('n0017','harper','king','5553007','2015-07-30','day','general','active'),
('n0018','evelyn','white','5553008','2022-02-02','night','pediatrics','active'),
('n0019','ella','hall','5553009','2023-03-11','day','emergency','active'),
('n020','grace','young','5553010','2021-11-22','night','surgery','active');

select * from nurses;


update nurses set status='inactive' where nurse_id='n0011';
update nurses set phone='5553011' where nurse_id='n0012';
update nurses set shift='day' where nurse_id='n0013';
update nurses set department='updated dept' where nurse_id='n0014';


delete from nurses where nurse_id='n0016';
delete from nurses where nurse_id='n0018';
delete from nurses where nurse_id='n0019';








set autocommit=0;


insert into doctors values('d013','lily','anderson','cardiology','5551013','lily.anderson@hospital.com','2023-03-01',1,4.1,'active');
insert into doctors values('d014','jack','thomas','neurology','5551014','jack.thomas@hospital.com','2023-03-05',1,4.0,'active');

update doctors set phone='5551113', rating=4.3 where doctor_id='d013';


rollback;
commit;
select * from doctors;

set autocommit=0;
insert into patients values('p013','oliver','brown','1992-04-15','5552013','olirbrown@gmail.com','o+','emma brown','admitted');
insert into patients values('p014','amelia','smith','1990-09-10','5552014','ameasmith@gmail.com','a+','lucas smith','outpatient');

update patients set status='discharged', phone='5552114' where patient_id='p013';

rollback;
commit;

select * from patients;



set autocommit=0;
insert into appointments values('a011','p013','d013','2024-02-10','10:00','general checkup','scheduled','111');
insert into appointments values('a012','p014','d014','2024-02-12','11:30','neurology consultation','scheduled','112');

update appointments set status='completed', room_number='120' where appointment_id='a011';


rollback;
commit;
select * from appointments;

set autocommit=0;
insert into medicines values('m011','paracetal','tablet','pharma new',2.5,200,'2026-06-01','no');
insert into medicines values('m012','ibupron','tablet','medicare',3.5,150,'2025-12-10','no');

update medicines set price=3.0 where medicine_id='m011';

rollback;
commit;

select * from medicines;

set autocommit=0;
insert into billing values('b011','p013','2024-02-10','consultation',120,5,10,115);
insert into billing values('b012','p014','2024-02-12','neurology test',450,20,0,470);

update billing set total_amount=125 where bill_id='b011';


rollback;
commit;


select * from billing;

set autocommit=0;
insert into labtest_data values('t011','bloodtest','2024-02-10','normal','d013','pending',100);
insert into labtest_data values('t012','mriscan','2024-02-12','normal','d014','pending',800);

update labtest_data set status='completed', cost=110 where test_id='t011';

rollback;
commit;

select * from labtest_data;

set autocommit=0;
insert into rooms values('r011','206','private','yes',2,2000,1,'2024-02-01');
insert into rooms values('r012','207','general','yes',2,1200,1,'2024-02-02');

update rooms set is_available='no' where room_id='r011';


rollback;
commit;

select * from rooms;

set autocommit=0;
insert into nurses values('n011','sophia','lee','5553011','2022-03-01','day','icu','active');
insert into nurses values('n012','liam','miller','5553012','2022-03-05','night','general','active');

update nurses set status='inactive', shift='night' where nurse_id='n011';

rollback;
commit;

select * from nurses;






