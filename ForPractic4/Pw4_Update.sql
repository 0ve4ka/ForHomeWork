use Hospital

/*��� ������� Patient*/
update Patient 
set  [address] = N'������������'
where [address] = 'Non'
/*��� ������� Medic*/
update Medic 
set kind = N'�������'
where kind = N'�����������'
/*��� ������� Appointments*/
update Appointments 
set cost_of_appointment = 32000
where cost_of_appointment = 25000