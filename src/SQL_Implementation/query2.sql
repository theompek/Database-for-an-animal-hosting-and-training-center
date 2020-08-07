#Το query παίρνει ως "είσοδο" τον αριθμο ταυτότητας του πελάτη,μεταβλητή  @atowner,
#και επιστέφει αναλυτικά τις υπηρεσίες που έχει επιλέξει, το κόστος για κάθες υπηρεσία 
#τις μέρες που έχει επιλέξει για κάθε υπηρεσία καθώς και το συνολικό κόστος για κάθε υπηρεσία.
#Επιπλέον εμφανίζονται και πληροφορίες σχετικά με την υπηρεσία και τις εκπτώσεις για μέλη.
#Να σημειωθεί ότι αν μία υπηρεσία ξεκινάει και τελειώνει την ίδια μέρα τότε η χρέωση γίνεται
#θεωρώντας ότι ήταν υπηρεσία μίας μέρα και έτσι γίνεται costperday * 1 .

#Orizoume ton ari8mo tautothtas tou idiokthth se mia metablhth
set @atowner := 'EP658023';

SELECT ServiceName,SerciveInformations,ID_Service,days,costperday,
	   days * costperday AS TotalNoMember, memberDiscount,
       days*costperday - days*costperday*(memberDiscount/100) AS TotalForMembers
FROM Service 
 JOIN
	(
    SELECT if( TIMESTAMPDIFF(DAY,FromDay,ToDay) = 0 , 1 , TIMESTAMPDIFF(DAY,FromDay,ToDay) ) AS days, 
    id_service AS idofservice
	FROM BUY
	WHERE BUY.ATOWNER = @atowner
	) AS daysAndIds
 ON service.ID_Service = daysAndIds.idofservice
 


