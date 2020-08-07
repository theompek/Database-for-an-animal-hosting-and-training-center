#Μια όψη για τα διαθέσιμα κρεβάτια

CREATE VIEW `RoomsAndPetsAndBeds` AS
SELECT bedsandrooms.*,ID_Pet
FROM bedsandrooms
	LEFT JOIN
	pet
	ON bedsandrooms.ID_bed = pet.ID_Bed;


CREATE VIEW `EmptyBeds` AS
SELECT idRoom, RoomName, id_bed, petSpecies
FROM
	RoomsAndPetsAndBeds   
	WHERE ID_Pet IS NULL
	ORDER BY idRoom ASC, id_bed ASC ;
       
