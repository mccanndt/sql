use sdb;
-- Join
SELECT concat(s.firstName, " ", s.lastName) as 'Student Name',
	   c.number as 'Class Number',
       c.name as 'Class Name',
       concat(i.firstName, " ", i.lastName) as 'Instructor',
       e.grade as 'Grade'
	FROM enrollment e
		JOIN student s ON e.studentID = s.ID
        JOIN course c ON e.courseID = c.ID
        JOIN instructor i ON i.courseID = c.ID
	ORDER BY s.ID;

-- Update
UPDATE instructor
	SET firstName = 'Bruce',
		lastName = 'Lee'
    WHERE courseID = 6;
    
UPDATE instructor
	SET firstName = 'Jackie',
		lastName = 'Chan'
    WHERE courseID = 6;
    

-- Delete
INSERT INTO course VALUES (8, 999, 'TEST', 'NAME');
DELETE FROM course WHERE ID = 8;