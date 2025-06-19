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


-- Record your SQL detective process here!  Write down: 
  -- 1. The SQL queries you ran
  -- 2. Any notes or insights as SQL comments
  -- 3. Your final conclusion: who did it?
