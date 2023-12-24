create database Hospital

go

use Hospital 

create table Medic 
(
/*Номер врача*/
Medic_id int identity primary key,
/*Имя врача*/
Medic_Name nvarchar(100) not null,
/*Специальность врача*/
kind nvarchar(100) not null,
/*Стоимость приёма врача*/
cost smallint default 5000 not null,
/*Отчисление для ЗП врача*/
deduction TinyInt default 10 Check (deduction <= 100) not null
)
create table Patient
(
/*Номер пациента*/
Patient_id int identity primary key,
/*Имя пациента*/
Patient_Name nvarchar(100) not null,
/*Адрес проживания пациента*/
[address] nvarchar(100) not null,
/*Дата рождения пациента*/
birthday date not null
)

create table Appointments
(
/*Номер приёма*/
Receipt_id int identity primary key,
/*Имя пациента*/
Patient_Name int not null References Patient(Patient_id) on update cascade on delete cascade,
/*Имя врача*/
Medic_Name int not null References Medic(Medic_id) on update cascade on delete cascade,
/*Дата приёма*/
date_of_appointment date not null,
/*Стоимость приёма*/
cost_of_appointment smallint not null
)
