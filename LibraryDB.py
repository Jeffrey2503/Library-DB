import mysql.connector

mydb = mysql.connector.connect(host = "localhost",
                       user = "root",
                       password="Epicperson250@!",            
                       database="library"
)
mycursor = mydb.cursor();

#Borrowed Books by Active students function JEFFREY LI
query = ('''Select b.Title, b.Author, bor.Loan_Date,bor.Expiration_Date,m.Name, m.Occupation
From Borrowed bor ,Book b, Member m, BookCopy bc
Where bor.ssn = m.ssn AND b.ISBN = bc.ISBN AND b.ISBN = bor.isbn AND bc.copy_number = bor.copynumber AND m.Occupation = 'student' AND bor.Status = 'borrowed'
''')




mycursor.execute(query)
results = mycursor.fetchall()


print("Borrowed Books of active student in the order: Book, Loan Date(Year, Day, Month), Expiration Date(Same setup), Name of Student: \n")
for result in results:
    print(result)


mycursor.close

mycursor = mydb.cursor();
# (FURQAN) AUTHORS OF BORROWED BOOKS THAT BEGINS WITH R (this can be changed to any letter)
a = ('''
SELECT b.Author, b.ISBN
FROM Borrowed bor, Book b
WHERE bor.ISBN = b.ISBN AND b.Author LIKE 'R%'
''')
mycursor.execute(a)
result2 = mycursor.fetchall()
print("Authors of borrowed books that begin with a R: \n")
for result in result2:
    print(result)
mycursor.close

# (FURQAN) How many overdue books do all Professors combined have
mycursor = mydb.cursor();
b = ('''
SELECT m.Occupation, COUNT(b.Borrow_ID) 
FROM Borrowed b, Member m
WHERE b.SSN = m.SSN AND b.Status = "Overdue" AND m.Occupation = "Professor"
''')
mycursor.execute(b)
result3 = mycursor.fetchall()
print("Overdue books and the amount:\n")
for result in result3:
    print(result)
mycursor.close();


mycursor = mydb.cursor();
# (FURQAN) Only Professor with overdue books with name beginning with letter J but have a overdue book in a week
c = ('''
SELECT m.Name, b.status
FROM Member m, Borrowed b
WHERE m.Name LIKE 'J%' AND b.SSN = m.SSN AND b.Status = "Overdue" AND m.Occupation = "Professor" AND 
DATEDIFF(CAST(NOW() AS DATE),CAST(b.Expiration_date AS DATE))>=7 


''')
mycursor.execute(c)
result6 = mycursor.fetchall()
print("Professor with no Overdue books with name that starts with J in a week: \n")
for result in result6:
    print(result)
mycursor.close();










mycursor = mydb.cursor();
# (FURQAN) All books past expiration date ordered by occupation
d = ('''
SELECT m.Occupation, COUNT(b.Borrow_ID)
FROM Member m, Borrowed b
WHERE b.SSN = m.SSN AND b.Status = "Overdue"
GROUP BY m.Occupation
''')


mycursor.execute(d)
result4 = mycursor.fetchall()
print("Expired Books ordered by occupation:")
for result in result4:
    print(result)

mycursor.close

mycursor = mydb.cursor();
# (Furqan) List all books and amount of copy #'s they have
e = ('''
Select b.title,b.ISBN, COUNT(bc.Copy_Number)
FROM Book b, BookCopy bc
WHERE b.ISBN = bc.isbn
GROUP BY b.ISBN
''')
mycursor.execute(e)
result5 = mycursor.fetchall()
print("All Books and their copies:\n")
for result in result5:
    print(result)
