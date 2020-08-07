#Ο διαχειριστής της βάσης έχει όλα τα δικαιώματα όμως μόνο
#από το μηχάνημα της βάσης 
CREATE USER 'adminPetDB'@'localhost' IDENTIFIED BY 'adminpass';
GRANT ALL PRIVILEGES ON petaccommodationdb.* TO 'adminPetDB'@'localhost';

#Η γραμματεία του κέντρου φιλοξενίας που μπορεί να επεξεργαστεί τα 
#στοιχεία της βάσης μόνο από το μηχάνημα που βρίσκεται η βάση 
CREATE USER 'assistant'@'localhost' IDENTIFIED BY 'assistantpass';
GRANT SELECT, INSERT, UPDATE, DELETE ON petaccommodationdb.* TO 'assistant'@'localhost';

#Ο ιδιοκτήτης του κατοικιδίου που μπορεί να βλέπει τις υπηρεσίες
#και τα δεδομένα του καθώς και δεδομένα που σχετίζονται με το κατοικίδιο
#και τις δραστηριότητες του,μπορεί όμως να επεξεργαστεί και να εισάγει μόνο 
#τα προσωπικά του στοιχεία,δεν μπορεί να τα διαγράψει.
CREATE USER 'ownerUser'@'localhost' IDENTIFIED BY 'ownerpass';
CREATE USER 'ownerUser'@'%' IDENTIFIED BY 'ownerUser';
GRANT SELECT ON petaccommodationdb.service TO 'ownerUser'@'localhost';
GRANT SELECT ON petaccommodationdb.service TO 'ownerUser'@'%';
GRANT SELECT ON petaccommodationdb.pet TO 'ownerUser'@'localhost';
GRANT SELECT ON petaccommodationdb.pet TO 'ownerUser'@'%';
GRANT SELECT ON petaccommodationdb.doactivity TO 'ownerUser'@'localhost';
GRANT SELECT ON petaccommodationdb.doactivity TO 'ownerUser'@'%';
GRANT SELECT,INSERT,UPDATE ON petaccommodationdb.petowner TO 'ownerUser'@'localhost';
GRANT SELECT,INSERT,UPDATE ON petaccommodationdb.petowner TO 'ownerUser'@'%';

#Ενας απλός χρήστης χωρίς καταχώρηση στοιχείων μπορεί μόνο να δεί τις υπηρεσίες
CREATE USER 'guestuser'@'localhost' IDENTIFIED BY 'guestpass';
CREATE USER 'guestuser'@'%' IDENTIFIED BY 'guestpass';
GRANT SELECT ON  petaccommodationdb.service TO 'guestuser'@'localhost';
GRANT SELECT ON  petaccommodationdb.service TO 'guestuser'@'%';
