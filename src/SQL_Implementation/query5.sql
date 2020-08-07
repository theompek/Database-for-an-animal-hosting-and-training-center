#Ποιοι από τους εργαζόμενου που είναι εκπαιδευτές έχουν εμπειρία 10 χρόνια και πάνω

SELECT FirstName,LastName,ATEmployee,YearsOfExperience,Specialization 
FROM Employee
WHERE employee.YearsOfExperience >= 10 AND employee.Job = 'Animal Trainer'