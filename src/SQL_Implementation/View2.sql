#Μία όψη που περιέχει το ID και το είδος του κρεβατιού, καθώς και
#το ID και το όνομα του χώρου που βρίσκεται το κρεβάτι.

#Εκτελούμε πρώτα προβολή με μετά JOIN για να 
#μειώσουμε την υπολογιστική πολυπλοκότητα

CREATE VIEW `bedsandrooms` AS
    SELECT 
		t1.ID_Room AS idRoom,
        t2.RoomName AS RoomName,
        t1.ID_Bed AS id_bed,
        t1.Species AS petSpecies            
    FROM
        ((SELECT 
            bed.Species AS Species,
			bed.ID_Bed AS ID_Bed,
			bed.ID_Room AS ID_Room
        FROM
            bed) t1
        JOIN (SELECT 
            room.ID_Room AS ID_Room,
			room.RoomName AS RoomName
        FROM
            room) t2 ON ((t1.ID_Room = t2.ID_Room)))
            ORDER BY t1.ID_Room