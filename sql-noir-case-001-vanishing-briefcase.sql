--SELECT * FROM crime_scene;
--Case #001: The Vanishing Briefcase
--Set in the gritty 1980s, a valuable briefcase has disappeared from the Blue Note Lounge. A witness reported that a man in a trench -----coat was seen fleeing the scene. Investigate the crime scene, review the list of suspects, and examine interview transcripts to reveal --the culprit.


SELECT * FROM crime_scene  WHERE location = 'Blue Note Lounge';
--76	19851120	theft	Blue Note Lounge	A briefcase containing sensitive documents vanished. A witness reported a man in a trench coat with a scar on his left cheek fleeing the scene.

SELECT * FROM suspects WHERE scar = 'left cheek';
--3	Frankie Lombardi	trench coat	left cheek
--183	Vincent Malone	trench coat	left cheek

SELECT * FROM interviews;

--183	I wasn’t going to steal it, but I did.;




-- Record your SQL detective process here!  Write down: 
  -- 1. The SQL queries you ran
  -- 2. Any notes or insights as SQL comments
  -- 3. Your final conclusion: who did it?
