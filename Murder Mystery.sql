--MYSTERY MURDER UNCOVER 
--So in this project, I was given a few table like crime_scene_report, drivers_license, facecrime_scene_report, 
--getget_fit_now_member,get_fit_now_check_in, person, interview and income table to uncover a murder.
--I swong straight into action by first running a query with the clue given a date that states 2018015 
SELECT*
FROM crime_scene_report
WHERE date = 20180115 and type='murder' 
--After running the query i got an output of three rows based on the filter i stated in the query above. 
--I got a clue that says "Security footage shows that there were 2 witnesses. The first witness lives at the last house on "Northwestern Dr". 
--The second witness, named Annabel, lives somewhere on "Franklin Ave"."
SELECT*
from person
where name like 'Annabel%' and address_street_name = 'Franklin Ave'
--I ran a query on the table named person in order to profile the witness by name Annabel who lives somewhere in Franklin Ave. So i got her id.


SELECT*
from get_fit_now_member
where person_id =16371
--I ran a query to check if she's a member of GetfitnowGym and it appears she's a Gold member of the Gym.

SELECT* 
from interview
where transcript like '%murder%'
--I ran a query on the interview table using the keyword 'Murder' and got the row on the table that testifies
--"I saw the murder happen, and I recognized the killer from my gym when I was working out last week on January the 9th." with testifer's id: 16371 

se
select*
from interview
where transcript like '%get fit now%'
--I ran a query on the interview table and got this response "I heard a gunshot and then saw a man run out. He had a "Get Fit Now Gym" bag. The membership number on the bag started with "48Z". 
--Only gold members have those bags. The man got into a car with a plate that included "H42W"." Which happens to be a witness with id:14887

SELECT*
from interview
where transcript like '%gun%'



select*
from drivers_license
where plate_number like '%H42W%' 
--This led me to pulling out data from the drivers_license table based on the witness' testimony. 
--I got a three row table with matching license plate, two male and a female.

--create TEMPORARY table gfnm AS
SELECT*
from get_fit_now_member
where membership_status='gold' and id like '48z%'

CREATE TEMPORARY TABLE gfnc AS
SELECT* 
FROM get_fit_now_check_in

CREATE TEMPORARY TABLE Matching487 AS
select*
from gfnm 
join gfnc 
on gfnm.id=gfnc.membership_id
where membership_status='gold'

SELECT*
from drivers_license
where id=664760

SELECT*
FROM drivers_license
where id=423327


SELECT*
from person
WHERE license_id=664760


SELECT*
from get_fit_now_member
where person_id =51739

SELECT*
from get_fit_now_member
where person_id In (67318, 51739)
-- In connclusion Jeremy Bowers is the killer. He is the only
-- one with whose license plate matches the witness's description of being a gold member of the gym and getting away in a car license plate that has 48z in it.


