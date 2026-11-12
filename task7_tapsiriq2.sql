USE UniversityDB;
GO

IF OBJECT_ID('Grades', 'U') IS NOT NULL DROP TABLE Grades;
IF OBJECT_ID('Students', 'U') IS NOT NULL DROP TABLE Students;
IF OBJECT_ID('Faculties', 'U') IS NOT NULL DROP TABLE Faculties;
GO

CREATE TABLE Faculties (
    FacultyId INT PRIMARY KEY IDENTITY(1,1),
    FacultyName NVARCHAR(100) NOT NULL
);

CREATE TABLE Students (
    StudentId INT PRIMARY KEY IDENTITY(1,1),
    FirstName NVARCHAR(50) NOT NULL,
    LastName NVARCHAR(50) NOT NULL,
    Email NVARCHAR(100) NULL,
    Age INT NOT NULL,
    FacultyId INT NULL,
    CONSTRAINT FK_Students_Faculties FOREIGN KEY (FacultyId) REFERENCES Faculties(FacultyId)
);

INSERT INTO Faculties (FacultyName) VALUES
(N'İnformasiya Texnologiyaları'),
(N'İqtisadiyyat və İdarəetmə'),
(N'Mühəndislik'),
(N'Hüquq');

INSERT INTO Students (FirstName, LastName, Email, Age, FacultyId) VALUES
('Elvin', 'Mammadov', 'elvin.mammadov@bmu.edu.az', 20, 1),
('Aysel', 'Aliyeva', 'aysel.aliyeva@bmu.edu.az', 19, 2),
('Orxan', 'Hasanov', 'orxan.hasanov@bmu.edu.az', 22, 1),
('Murad', 'Musayev', 'murad.musayev@bmu.edu.az', 21, 2),
('Nigar', 'Mustafayeva', 'nigar.mustafayeva@bmu.edu.az', 18, 3),
('Fərid', 'Quliyev', 'farid.guliyev@bmu.edu.az', 20, NULL);
GO

SELECT 
    s.FirstName AS Ad,
    s.LastName AS Soyad,
    f.FacultyName AS FakulteAdi
FROM Students s
INNER JOIN Faculties f ON s.FacultyId = f.FacultyId;

SELECT 
    s.FirstName AS Ad,
    s.LastName AS Soyad,
    f.FacultyName AS FakulteAdi
FROM Students s
LEFT JOIN Faculties f ON s.FacultyId = f.FacultyId;

SELECT 
    f.FacultyId,
    f.FacultyName AS FakulteAdi,
    COUNT(s.StudentId) AS TelebeSayi
FROM Faculties f
LEFT JOIN Students s ON f.FacultyId = s.FacultyId
GROUP BY f.FacultyId, f.FacultyName;
GO