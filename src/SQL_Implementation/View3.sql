#Όψη που περιέχει όλες τις δραστηριότητες που πρέπει να εκτελέσει κάθε κατοικίδιο και 
#με τον τύπο των εργαζόμενων και τον χώρο που θα εκτελεστεί η δραστηριότητα. Τα γνωρίσματα
#που επιλέγουμε να προβάλουμε είναι το Όνομα και Είδος και Ράτσα για το κατοικίδιο, 
#το όνομα και το είδος του Χώρου, Τύπος και Ημερομηνία για την Δραστηριότητα και τέλος 
#ιδιότητα και επώνυμο για τον εργαζόμενο.

CREATE VIEW `petActivitiesEmployee` AS
SELECT pet.Name AS petName, pet.species AS petSpecies, Pet.Breed AS petBreed,
room.RoomName , room.SpaceType, doactivity.type AS ActType, doactivity.date AS ActDate,
employee.job AS employeeJob, employee.LastName AS EmplName 
FROM Pet
JOIN doactivity ON Pet.id_pet = doactivity.id_pet 
JOIN room ON room.id_room = doactivity.id_room 
JOIN employee ON employee.ATEmployee = doactivity.ATEmployee