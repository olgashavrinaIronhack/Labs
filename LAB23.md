select * from crime_scene_report where date='20180115' and type='murder';
select id,name,license_id, max(address_number) from person where address_street_name='Northwestern Dr'; 
select * from person where address_street_name='Franklin Ave';            
select * from get_fit_now_member where person_id='16371';
select * from interview where person_id='14887';
select * from get_fit_now_check_in where check_in_date='20180109' and membership_id like '%48Z%';
select * from get_fit_now_member where id like '%48Z%';
select * from drivers_license where plate_number like '%H42W%';
select * from person where license_id='423327';
select * from interview where person_id='67318';  
select person_id,license_id,event_name,eye_color, hair_color, gender, height, car_model, car_make from facebook_event_checkin
left outer join person on facebook_event_checkin.person_id=person.id 
left join drivers_license on person.license_id=drivers_license.id where event_name='SQL Symphony Concert' and car_make='Tesla';


Murder is Jeremy Bowers / Brain behind Miranda Priestly
