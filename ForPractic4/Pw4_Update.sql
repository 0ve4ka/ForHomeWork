use Hospital

/*Для таблицы Patient*/
update Patient 
set  [address] = N'Зеленодольск'
where [address] = 'Non'
/*Для таблицы Medic*/
update Medic 
set kind = N'окулист'
where kind = N'офтальмолог'
/*Для таблицы Appointments*/
update Appointments 
set cost_of_appointment = 32000
where cost_of_appointment = 25000