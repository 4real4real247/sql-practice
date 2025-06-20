--A crime has taken place and the detective needs your help. The detective gave you the crime scene report, 
 -- but you somehow lost it. You vaguely remember that the crime was a ​murder​ that occurred sometime on ​Jan.15, 2018​ 
  --and that it took place in ​SQL City​.
SELECT name 
  FROM sqlite_master
 where type = 'table'
  Result
name, crime_scene_report, drivers_license, facebook_event_checkin, interview, get_fit_now_member, 
  get_fit_now_check_in, solution, income, person

there is 9 tables 
1. CREATE TABLE drivers_license ( 
  id integer PRIMARY KEY, 
  age integer, 
  height integer, 
  eye_color text, 
  hair_color text, 
  gender text, 
  plate_number text, 
  car_make text, 
  car_model text )

2.CREATE TABLE crime_scene_report ( 
  date integer, 
  type text, 
  description text, 
  city text )

3.CREATE TABLE facebook_event_checkin ( 
  person_id integer, 
  event_id integer, 
  event_name text,
  date integer,
  FOREIGN KEY (person_id) 
  REFERENCES person(id) )

4.CREATE TABLE interview ( 
  person_id integer, 
  transcript text, 
  FOREIGN KEY (person_id) 
  REFERENCES person(id) )

5.CREATE TABLE get_fit_now_member ( 
  id text PRIMARY KEY, 
  person_id integer, name text, 
  membership_start_date integer,
  membership_status text, 
  FOREIGN KEY (person_id) 
  REFERENCES person(id) )

6.CREATE TABLE get_fit_now_check_in (
  membership_id text, 
  check_in_date integer, 
  check_in_time integer, 
  check_out_time integer, 
  FOREIGN KEY (membership_id)
  REFERENCES get_fit_now_member(id) )

7.CREATE TABLE solution ( 
  user integer,
  value text )

8.CREATE TABLE income (
  ssn CHAR PRIMARY KEY,
  annual_income integer)

9.CREATE TABLE person (
  id integer PRIMARY KEY, 
  name text,
  license_id integer, 
  address_number integer,
  address_street_name text,
  ssn CHAR REFERENCES income (ssn), 
  FOREIGN KEY (license_id) 
  REFERENCES drivers_license (id))
/////////////////////////////////////////
SELECT description
FROM crime_scene_report
WHERE date = '20180115' AND city = 'SQL City' AND type = 'murder'
--description
--Security footage shows that there were 2 witnesses. 
--The first witness lives at the last house on "Northwestern Dr". 
--The second witness, named Annabel, lives somewhere on "Franklin Ave".

SELECT *
FROM person
WHERE name LIKE 'Annabel%' AND address_street_name = 'Franklin Ave';
--RESULT
--id	name	license_id	address_number	address_street_name	ssn
--*****16371	Annabel Miller	490173	103	Franklin Ave	318771143********

SELECT *
FROM person
WHERE address_street_name = 'Northwestern Dr'
ORDER BY address_number DESC
LIMIT 3
--RESULT
--id	    name	            license_id	address_number	 address_street_name	   ssn
--***14887	 Morty Schapiro	  118009	  4919	          Northwestern Dr	    111564949*****
--17729	Lasonya Wildey	   439686	   3824	         Northwestern Dr	    917817122
--53890	Sophie Tiberio	   957671	   3755         	Northwestern Dr	    442830147

 SELECT transcript
FROM interview
WHERE person_id = '16371'
--RESULTS
--I saw the murder happen, and I recognized the killer from my gym when I was working 
-- out last week on January the 9th.

SELECT transcript
FROM interview
WHERE person_id = '14887'
--RESULTS
--I heard a gunshot and then saw a man run out. He had a "Get Fit Now Gym" bag. The membership number 
-- on the bag started with "48Z". Only gold members have those bags. The man got into a car with a 
-- plate that included "H42W".

SELECT membership_id
FROM get_fit_now_check_in
WHERE membership_id LIKE '48z%' AND check_in_date = '20180109'
--RESULTS
--membership_id
--48Z7A
--48Z55

SELECT * 
FROM get_fit_now_member
WHERE id = '48Z7A' OR id = '48Z55'
--RESULts
--id	person_id	name	membership_start_date	membership_status
--48Z55	67318	Jeremy Bowers	20160101	gold
--48Z7A	28819	Joe Germuska	20160305	gold

SELECT p.name, d.plate_number 
FROM person AS p
JOIN drivers_license AS d 
ON p.license_id = d.id
WHERE p.name = 'Joe Germuska' or p.name = 'Jeremy Bowers'
--RESULTS
--name	plate_number
--Jeremy Bowers	0H42W2

INSERT INTO solution VALUES (1, 'Jeremy Bowers');
        
        SELECT value FROM solution;
--value
Congrats, you found the murderer! But wait, there's more... If you think you're up 
for a challenge, try querying the interview transcript of the murderer to find the real 
villain behind this crime. If you feel especially confident in your SQL skills, try to 
complete this final step with no more than 2 queries. Use this same INSERT statement with
your new suspect to check your answer.



-- Record your SQL detective process here!  Write down: 
  -- 1. The SQL queries you ran
  -- 2. Any notes or insights as SQL comments
  -- 3. Your final conclusion: who did it?
