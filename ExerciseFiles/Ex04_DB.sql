CREATE TABLE program (
    id int PRIMARY KEY AUTO_INCREMENT,
    name varchar(30),
    description varchar(100)
);

CREATE TABLE course (
    code char(8) PRIMARY KEY,
    name varchar(40),
    credits int,
    programid int REFERENCES program(id)
);

INSERT INTO program (name, description)
VALUES
('English', 'English language.'),
('Math', 'Mathematics.'),
('Science', 'Physics, chemistry and biology.');

INSERT INTO course (code, name, credits, programid)
VALUES
('ENGL1001', 'Intro to English', 1, 1),
('ENGL1002', 'Intermediate English', 1, 1),
('ENGL1003', 'Expert English', 2, 1),
('MATH1001', 'Intro to Math', 1, 1),
('SCIB1001', 'Intro to Biology', 1, 1),
('SCIC1001', 'Intro to Chemistry', 1, 1);