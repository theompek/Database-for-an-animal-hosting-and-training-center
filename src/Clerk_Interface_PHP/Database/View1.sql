#Μια όψη που περιέχει τα ονόματα και τα ID όλων των κατοικίδιων που υπάρχουν στο σύστημα 
#και το όνομα των Ιδιοκτητών τους μαζί με τον αριθμό ταυτότητάς τους φαίνεται παρακάτω:

CREATE VIEW `petWithOwner` AS
SELECT Pet.ID_Pet AS idpet, Pet.Name AS petName, PetOwner.ATOwner AS ATOwner,PetOwner.FirstName AS FName,PetOwner.LastName AS LName 
FROM
Pet JOIN PetOwner ON Pet.ATOwner = PetOwner.ATOwner