use Hospital
/*��� ������� Patient*/
delete Patient
where [address] = N'������������'

/*��� ������� Medic*/
delete Medic
where kind = N'������'

/*��� ������� Appointments*/
delete Appointments
where date_of_appointment <= '20291231'
