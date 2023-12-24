create database Hospital

go

use Hospital 

create table Medic 
(
/*����� �����*/
Medic_id int identity primary key,
/*��� �����*/
Medic_Name nvarchar(100) not null,
/*������������� �����*/
kind nvarchar(100) not null,
/*��������� ����� �����*/
cost smallint default 5000 not null,
/*���������� ��� �� �����*/
deduction TinyInt default 10 Check (deduction <= 100) not null
)
create table Patient
(
/*����� ��������*/
Patient_id int identity primary key,
/*��� ��������*/
Patient_Name nvarchar(100) not null,
/*����� ���������� ��������*/
[address] nvarchar(100) not null,
/*���� �������� ��������*/
birthday date not null
)

create table Appointments
(
/*����� �����*/
Receipt_id int identity primary key,
/*��� ��������*/
Patient_Name int not null References Patient(Patient_id) on update cascade on delete cascade,
/*��� �����*/
Medic_Name int not null References Medic(Medic_id) on update cascade on delete cascade,
/*���� �����*/
date_of_appointment date not null,
/*��������� �����*/
cost_of_appointment smallint not null
)
