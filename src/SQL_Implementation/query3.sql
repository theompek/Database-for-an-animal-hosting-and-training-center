#Επιστέφει το συνολικό κόστος για έναν πελάτη για τις υπηρεσίες που έχει επιλέξει και 
#είναι επέκταση του query2. Στην ουσια αντιστοιχεί στην παραγόμενη μεταβλητή συνολικού 
#κόστους για τον πελάτη το οποίο κόστος προκύπτει ανάλογα με το αν ο πελάτης ειναι member ή όχι.

#Orizoume ton ari8mo tautothtas tou idiokthth se mia metablhth
set @atowner := 'HO542814';
set @YesMemberShip := 1 ;

SELECT IF( (SELECT Member FROM petOwner WHERE petOwner.atowner = @atowner) = @YesMemberShip ,
		   sum(t.days*t.costperday - t.days*t.costperday*(t.memberDiscount/100)), sum(t.days*t.costperday) ) AS TotalCost,
	   IF((SELECT Member FROM petOwner WHERE petOwner.atowner = @atowner) = @YesMemberShip,'YES','NO') AS MemberShip
FROM(
	SELECT days, costperday,memberDiscount
	FROM Service 
	 JOIN
		(
		SELECT if( TIMESTAMPDIFF(DAY,FromDay,ToDay) = 0 , 1 , TIMESTAMPDIFF(DAY,FromDay,ToDay) ) AS days, 
		id_service AS idofservice
		FROM BUY
		WHERE BUY.ATOWNER = @atowner
		) AS daysAndIds
	 ON service.ID_Service = daysAndIds.idofservice
 ) As t
 


