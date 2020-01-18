
#https://mystery.knightlab.com/

select date,type,description,city
from crime_scene_report 
where date =20180115 and city='SQL City' and type='murder';

select name,address_street_name,address_number from person where address_street_name='Northwestern Dr' order by address_number desc;
# last house of Northwester DR
# witness 1 -  14887, Morty Schapiro Northwester DR 4919
#I heard a gunshot and then saw a man run out. He had a "Get Fit Now Gym" bag. The membership number on the bag started with "48Z". Only gold members have those bags. The man got into a car with a plate that included "H42W".

# Annabel, lives somewhere on "Franklin Ave".
 # 16371, Annabel Miller -"Franklin Ave" 103
 # I saw the murder happen, and I recognized the killer from my gym when I was working out last week on January the 9th
 
select * from interview where person_id = 16371 or person_id =14887

select * from get_fit_now_check_in where check_in_date = 20180109

select * from get_fit_now_member where id='48Z7A'
#28819	Joe Germuska
select * from get_fit_now_member where id='48Z55' 
#67318	Jeremy Bowers

select p.name, p.id, dl.plate_number from person as p inner join drivers_license as dl on p.license_id=dl.id where CHARINDEX('H42W',dl.plate_number)>0 ;
  

select * from interview where person_id=67318; 
#I was hired by a woman with a lot of money. I don't know her name but I know she's around 5'5" (65") or 5'7" (67"). She has red hair and she drives a Tesla Model S. I know that she attended the SQL Symphony Concert 3 times in December 2017.

select * from drivers_license where CHARINDEX('Tesla',car_make)>0  and CHARINDEX('Model S',car_model)>0 and gender='female' and hair_color='red'

select *
from person as p
inner join drivers_license as dl on p.license_id=dl.id
inner join facebook_event_checkin as fb on p.id=fb.person_id
where CHARINDEX('Tesla',car_make)>0  and CHARINDEX('Model S',car_model)>0 and gender='female' and hair_color='red'

