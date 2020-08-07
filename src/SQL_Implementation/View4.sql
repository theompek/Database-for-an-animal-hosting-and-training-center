#Μια όψη για τα διαθέσιμα κρεβάτια

CREATE VIEW `EmptyBeds` AS
SELECT idRoom, RoomName, id_bed, petSpecies
FROM
   (SELECT bedsandrooms.*,ID_Pet
    FROM bedsandrooms
		LEFT JOIN
        pet
        ON bedsandrooms.ID_bed = pet.ID_Bed ) AS t1
WHERE ID_Pet IS NULL
ORDER BY idRoom ASC, id_bed ASC 
       
