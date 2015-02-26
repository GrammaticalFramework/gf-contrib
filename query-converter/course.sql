CREATE TABLE Courses (
  code VARCHAR(8), 
  name VARCHAR(64)
) ;

CREATE TABLE Teachers (
  name VARCHAR(32),
  title VARCHAR(16)
) ;

CREATE TABLE TaughtCourses (
  course VARCHAR(8),
  period INT,
  teacher VARCHAR(32),
  numberOfStudents INT
) ;

INSERT INTO Courses VALUES ('TDA357','Databases') ;
INSERT INTO Courses VALUES ('DAT151','Programming Language Technology') ;
INSERT INTO Courses VALUES ('COMPS','Computational Syntax') ;

INSERT INTO Teachers VALUES ('Kemp','professor') ;
INSERT INTO Teachers VALUES ('Ranta','professor') ;
INSERT INTO Teachers VALUES ('Abel','associate professor') ;

INSERT INTO TaughtCourses VALUES ('TDA357',2,'Kemp',130) ;
INSERT INTO TaughtCourses VALUES ('TDA357',3,'Ranta',150) ;
INSERT INTO TaughtCourses VALUES ('DAT151',2,'Abel',140) ;
INSERT INTO TaughtCourses VALUES ('COMPS',4,'Ranta',20) ;

SELECT * FROM Courses, TaughtCourses ;

SELECT * FROM Courses, TaughtCourses WHERE course = code ;

SELECT name FROM Teachers WHERE title LIKE '%professor' ;

SELECT * FROM Courses, Teachers ;

SELECT code, title FROM Courses, Teachers ;

SELECT name, teacher FROM Courses, TaughtCourses WHERE code = course ;

SELECT T.name, C.name FROM Teachers AS T, Courses AS C ;

SELECT T.name, C.name 
FROM Teachers T, Courses C, TaughtCourses T 
WHERE T.course = C.code AND T.teacher = T.name ;

SELECT * FROM Courses, Teachers ORDER BY code ;

SELECT * FROM Courses, Teachers AS T ORDER BY T.name ;

SELECT DISTINCT course FROM TaughtCourses ;

SELECT Count(code) AS codes FROM Courses ;

SELECT period+5 FROM TaughtCourses ;

SELECT SUM(numberOfStudents) AS sumper FROM TaughtCourses ;

SELECT AVG(numberOfStudents) FROM TaughtCourses ;

SELECT SUM(period) FROM (SELECT * FROM TaughtCourses WHERE teacher = 'Kemp') ;

SELECT teacher, SUM(numberOfStudents) FROM TaughtCourses GROUP BY teacher ;

SELECT teacher, COUNT(period) AS numper FROM TaughtCourses GROUP BY teacher ;

SELECT teacher, SUM(numberOfStudents) AS totalNumberOfStudents FROM TaughtCourses GROUP BY teacher HAVING totalNumberOfStudents > 100 ;

SELECT COUNT(*) FROM Courses ;

SELECT COUNT(*) AS numberOfCourses FROM Courses ;

SELECT COUNT(*) AS squareOfCourses FROM Courses, Courses ;




