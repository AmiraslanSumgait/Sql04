--1. Print all possible pairs of lines of teachers and groups.

SELECT Teachers.[Name] AS TeachersName,Groups.[Name] AS GroupsName FROM Teachers,Groups,GroupsLectures,Lectures
WHERE GroupsLectures.LectureId=Lectures.Id AND GroupsLectures.GroupId=Groups.Id AND Lectures.TeacherId=Teachers.Id

--2. Print names of faculties, where financing fund of departments
--exceeds financing fund of the faculty.

SELECT Faculties.[Name] FROM  Faculties,Departments
WHERE Departments.FacultyId=Faculties.Id AND Departments.Financing>Faculties.Financing

--3. Print names of the group curators and groups names they are
--supervising
SELECT Curators.[Name],Groups.[Name] FROM Curators,Groups,GroupsCurators
WHERE GroupsCurators.CuratorId=Curators.Id  AND GroupsCurators.GroupId=Groups.Id  

--4. Print names of the teachers who deliver lectures in the group
--"P107".
SELECT Teachers.[Name] AS TeachersName FROM Teachers,Groups,GroupsLectures,Lectures
WHERE GroupsLectures.LectureId=Lectures.Id AND GroupsLectures.GroupId=Groups.Id AND Lectures.TeacherId=Teachers.Id AND Groups.[Name]='P107'

--5. Print names of the teachers and names of the faculties where
--they are lecturing.
SELECT Teachers.[Name] AS TeachersName ,Faculties.[Name] AS FacultiesName FROM Teachers,Groups,GroupsLectures,Lectures,Faculties,Departments
WHERE GroupsLectures.LectureId=Lectures.Id AND GroupsLectures.GroupId=Groups.Id AND Lectures.TeacherId=Teachers.Id AND Groups.DepartmentId=Departments.Id AND Departments.FacultyId=Faculties.Id


--6. Print names of the departments and names of the groups that
--relate to them.
SELECT Departments.[Name]AS DepartmentName,Groups.Name FROM Departments,Groups
WHERE Groups.DepartmentId=Departments.Id

--7. Print names of the subjects that the teacher "Samantha Adams"
--teaches.
SELECT Subjects.[Name] FROM Subjects,Lectures,Teachers
WHERE Lectures.TeacherId=Teachers.Id AND Lectures.SubjectId=Subjects.Id AND Teachers.[Name]='Samantha' AND Teachers.Surname='Adams'


--8. Print names of the departments, where "Database Theory"
--is taught.
SELECT Departments.[Name] FROM Departments,Lectures,Subjects,GroupsLectures,Groups
WHERE Lectures.SubjectId=Subjects.Id AND GroupsLectures.GroupId=Groups.Id AND Groups.DepartmentId=Departments.Id AND GroupsLectures.LectureId=Lectures.Id  AND Subjects.[Name]='Database Theory'


--9. Print names of the groups that belong to the "Computer Science" faculty.
SELECT Groups.[Name] FROM Groups,Departments,Faculties
WHERE GROUPS.DepartmentId=Departments.Id AND Departments.FacultyId=Faculties.Id AND Faculties.[Name]='Computer Science'


--10. Print names of the 5th year groups, as well as names of the faculties to which they relate
SELECT Groups.[Name],Faculties.[Name] FROM Groups,Departments,Faculties
WHERE GROUPS.DepartmentId=Departments.Id AND Departments.FacultyId=Faculties.Id AND  Groups.[Year]=5


--11. Print full names of the teachers and lectures they deliver (names
--of subjects and groups), and select only those lectures that are
--delivered in the classroom "B103".
SELECT Teachers.[Name]+' '+Teachers.Surname AS FullName FROM Teachers,Lectures
WHERE Lectures.TeacherId=Teachers.Id AND Lectures.LectureRooM='B103'


