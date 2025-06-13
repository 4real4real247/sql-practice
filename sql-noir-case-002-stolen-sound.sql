--in the neon glow of 1980s Los Angeles, the West Hollywood Records store was rocked by a daring theft. A prized vinyl record, worth over $10,000, vanished during a busy evening, leaving the store owner desperate for answers. Vaguely recalling the details, you know the incident occurred on July 15, 1983, at this famous store. Your task is to track down the thief and 

--SELECT COUNT(*) FROM crime_scene;
--SELECT DISTINCT location 
--FROM crime_scene; 
--gave all 

--SELECT clue FROM witnesses
--WHERE crime_scene_id = (SELECT id
 -- FROM crime_scene WHERE location LIKE 'West%');
--clue I saw a man wearing a red bandana rushing out of the store.
--The main thing I remember is that he had a distinctive gold watch on his wrist.

--SELECT COUNT (*) FROM crime_scene WHERE location LIKE 'West%';
--COUNT (*) 1


--SELECT id, name 
--FROM suspects
--WHERE bandana_color = 'red'
--AND accessory = 'gold watch'; 
--Results
--id	name
--35	Tony Ramirez
--44	Mickey Rivera
--97	Rico Delgado


--SELECT transcript 
--FROM interviews
--WHERE suspect_id IN (SELECT id FROM suspects WHERE ---bandana_color = 'red'
--AND accessory = 'gold watch');

SELECT suspects.name, interviews.transcript
FROM interviews
  INNER JOIN suspects ON interviews.suspect_id = suspects.id
WHERE suspects.bandana_color = 'red' AND suspects.accessory = 'gold watch';

--Results
--name	transcript
--Tony Ramirez	I wasn't anywhere near West Hollywood Records that night.
--Mickey Rivera	I was busy with my music career; I have nothing to do with this theft.

he did it 
Rico Delgado	I couldn't help it. I snapped and took the record.


-- Record your SQL detective process here!  Write down: 
  -- 1. The SQL queries you ran
  -- 2. Any notes or insights as SQL comments
  -- 3. Your final conclusion: who did it?
