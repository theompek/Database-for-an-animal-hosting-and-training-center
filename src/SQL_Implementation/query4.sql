
#Ποιά κατοικίδια που κοιμούνται στους χώρους “SensitiveSoul” δεν είναι στειρωμένα;

set @dwmatio := 'SensitiveSoul';
set @isNotSterilize := 0;

SELECT id_Pet,Name AS petName, Species, Breed
FROM pet
JOIN(
	SELECT id_bed 
	FROM bed 
	JOIN
		(
		SELECT id_room 
		FROM Room 
		WHERE room.RoomName = @dwmatio
		) AS t1
	ON t1.id_room = bed.id_Room
    ) AS t2
ON t2.id_bed = pet.ID_Bed
WHERE pet.Sterilization = @isNotSterilize