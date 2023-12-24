use Hospital
/*Для таблицы Patient*/
delete Patient
where [address] = N'Зеленодольск'

/*Для таблицы Medic*/
delete Medic
where kind = N'хирург'

/*Для таблицы Appointments*/
delete Appointments
where date_of_appointment <= '20291231'
