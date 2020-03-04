DROP DATABASE IF EXISTS school;
DROP USER IF EXISTS school_user;

USE mysql;
CREATE DATABASE school DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;
CREATE USER 'school_user'@'%' IDENTIFIED BY 'pass';
GRANT ALL ON school.* TO 'school_user'@'%';
FLUSH PRIVILEGES;

CREATE TABLE school.students
(
    id         MEDIUMINT NOT NULL AUTO_INCREMENT,
    first_name CHAR(100) NOT NULL,
    last_name  CHAR(100) NOT NULL,
    birthdate  DATE      NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE school.teachers
(
    id         MEDIUMINT NOT NULL AUTO_INCREMENT,
    first_name CHAR(100) NOT NULL,
    last_name  CHAR(100) NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE school.school_classes
(
    id           MEDIUMINT NOT NULL AUTO_INCREMENT,
    name         CHAR(200) NOT NULL,
    teacher_id   MEDIUMINT NOT NULL REFERENCES school.teachers (id),
    description  LONGTEXT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (teacher_id) REFERENCES school.teachers (id) ON DELETE RESTRICT
);

CREATE TABLE school.school_class_students
(
    school_class_id MEDIUMINT NOT NULL,
    student_id      MEDIUMINT NOT NULL REFERENCES school.students (id),
    PRIMARY KEY (school_class_id, student_id),
    FOREIGN KEY (school_class_id) REFERENCES school.school_classes (id) ON DELETE RESTRICT,
    FOREIGN KEY (student_id) REFERENCES school.students (id) ON DELETE RESTRICT
);

CREATE TABLE school.student_notes
(
    id              MEDIUMINT NOT NULL AUTO_INCREMENT,
    school_class_id MEDIUMINT NOT NULL,
    student_id      MEDIUMINT NOT NULL REFERENCES school.students (id),
    value           SMALLINT  NOT NULL,
    received_at     DATETIME  NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (school_class_id) REFERENCES school.school_classes (id) ON DELETE RESTRICT,
    FOREIGN KEY (student_id) REFERENCES school.students (id) ON DELETE RESTRICT
);


USE school;

INSERT INTO students(id, first_name, last_name, birthdate) VALUES (1, 'Szymon', 'Kowalski', '1999-02-03');
INSERT INTO students(id, first_name, last_name, birthdate) VALUES (2, 'Krystian', 'Nowak', '1999-02-03');
INSERT INTO students(id, first_name, last_name, birthdate) VALUES (3, 'Krystyna', 'Kowal', '1996-03-11');
INSERT INTO students(id, first_name, last_name, birthdate) VALUES (4, 'Błażej', 'Rudnicki', '1998-12-03');
INSERT INTO students(id, first_name, last_name, birthdate) VALUES (5, 'Katarzyna', 'Jaworecka', '1995-11-03');
INSERT INTO students(id, first_name, last_name, birthdate) VALUES (6, 'Wiktor', 'Karczmarz', '1995-11-03');

INSERT INTO teachers(id, first_name, last_name) VALUES (1, 'Damian', 'Lewandowski');
INSERT INTO teachers(id, first_name, last_name) VALUES (2, 'Beata', 'Woźniak');
INSERT INTO teachers(id, first_name, last_name) VALUES (3, 'Artur', 'Wójcik');
INSERT INTO teachers(id, first_name, last_name) VALUES (4, 'Zbigniew', 'Wójcik');
INSERT INTO teachers(id, first_name, last_name) VALUES (5, 'Błażej', 'Kokot');
INSERT INTO teachers(id, first_name, last_name) VALUES (6, 'Krystian', 'Karczmarz');

INSERT INTO school_classes(id, teacher_id, name, description) VALUES(1, 1, 'Matematyka', 'Matematyka to nauka dostarczająca narzędzi do otrzymywania ścisłych wniosków z przyjętych założeń.');
INSERT INTO school_classes(id, teacher_id, name) VALUES(2, 2, 'Fizyka');
INSERT INTO school_classes(id, teacher_id, name) VALUES(3, 3, 'Chemia');
INSERT INTO school_classes(id, teacher_id, name, description) VALUES(4, 4, 'WOS', 'Wiedza o społeczeństwie to przedmiot humanistyczny obejmujący zagadnienia społeczne, polityczne i ekonomiczne.');

INSERT INTO school_class_students(school_class_id, student_id) VALUES (1, 1);
INSERT INTO school_class_students(school_class_id, student_id) VALUES (2, 1);
INSERT INTO school_class_students(school_class_id, student_id) VALUES (2, 2);
INSERT INTO school_class_students(school_class_id, student_id) VALUES (3, 3);
INSERT INTO school_class_students(school_class_id, student_id) VALUES (3, 4);
INSERT INTO school_class_students(school_class_id, student_id) VALUES (4, 4);
INSERT INTO school_class_students(school_class_id, student_id) VALUES (1, 5);
INSERT INTO school_class_students(school_class_id, student_id) VALUES (2, 5);
INSERT INTO school_class_students(school_class_id, student_id) VALUES (3, 5);

INSERT INTO student_notes(id, school_class_id, student_id, value, received_at) VALUES(1, 2, 3, 4, '2019-08-16T2:32:00');
INSERT INTO student_notes(id, school_class_id, student_id, value, received_at) VALUES(2, 4, 5, 2, '2019-01-13T18:34:00');
INSERT INTO student_notes(id, school_class_id, student_id, value, received_at) VALUES(3, 1, 2, 5, '2019-04-11T2:22:00');
INSERT INTO student_notes(id, school_class_id, student_id, value, received_at) VALUES(4, 4, 4, 4, '2019-04-12T12:49:00');
INSERT INTO student_notes(id, school_class_id, student_id, value, received_at) VALUES(5, 3, 2, 3, '2019-06-14T15:20:00');
INSERT INTO student_notes(id, school_class_id, student_id, value, received_at) VALUES(6, 2, 1, 2, '2019-02-10T5:45:00');
INSERT INTO student_notes(id, school_class_id, student_id, value, received_at) VALUES(7, 3, 4, 6, '2019-01-6T20:21:00');
INSERT INTO student_notes(id, school_class_id, student_id, value, received_at) VALUES(8, 3, 1, 6, '2019-03-1T23:14:00');
INSERT INTO student_notes(id, school_class_id, student_id, value, received_at) VALUES(9, 3, 1, 3, '2019-05-22T11:45:00');
INSERT INTO student_notes(id, school_class_id, student_id, value, received_at) VALUES(10, 3, 3, 2, '2019-02-18T12:13:00');
INSERT INTO student_notes(id, school_class_id, student_id, value, received_at) VALUES(11, 4, 4, 1, '2019-01-16T2:10:00');
INSERT INTO student_notes(id, school_class_id, student_id, value, received_at) VALUES(12, 2, 2, 5, '2019-02-4T10:59:00');
INSERT INTO student_notes(id, school_class_id, student_id, value, received_at) VALUES(13, 2, 3, 4, '2019-01-13T7:15:00');
INSERT INTO student_notes(id, school_class_id, student_id, value, received_at) VALUES(14, 4, 5, 3, '2019-05-19T8:44:00');
INSERT INTO student_notes(id, school_class_id, student_id, value, received_at) VALUES(15, 4, 1, 3, '2019-05-15T16:28:00');
INSERT INTO student_notes(id, school_class_id, student_id, value, received_at) VALUES(16, 2, 4, 4, '2019-06-18T09:29:00');
INSERT INTO student_notes(id, school_class_id, student_id, value, received_at) VALUES(17, 3, 1, 5, '2019-06-14T6:59:00');
INSERT INTO student_notes(id, school_class_id, student_id, value, received_at) VALUES(18, 3, 5, 1, '2019-08-16T5:44:00');
INSERT INTO student_notes(id, school_class_id, student_id, value, received_at) VALUES(19, 2, 5, 5, '2019-08-7T8:27:00');
INSERT INTO student_notes(id, school_class_id, student_id, value, received_at) VALUES(20, 2, 4, 4, '2019-04-7T20:52:00');
INSERT INTO student_notes(id, school_class_id, student_id, value, received_at) VALUES(21, 3, 4, 4, '2019-05-6T9:13:00');
INSERT INTO student_notes(id, school_class_id, student_id, value, received_at) VALUES(22, 2, 2, 4, '2019-04-24T20:41:00');
INSERT INTO student_notes(id, school_class_id, student_id, value, received_at) VALUES(23, 1, 1, 3, '2019-03-5T12:13:00');
INSERT INTO student_notes(id, school_class_id, student_id, value, received_at) VALUES(24, 3, 5, 3, '2019-01-15T7:20:00');
INSERT INTO student_notes(id, school_class_id, student_id, value, received_at) VALUES(25, 2, 1, 4, '2019-02-2T9:25:00');
INSERT INTO student_notes(id, school_class_id, student_id, value, received_at) VALUES(26, 1, 1, 5, '2019-05-12T9:4:00');
INSERT INTO student_notes(id, school_class_id, student_id, value, received_at) VALUES(27, 4, 5, 4, '2019-04-21T23:54:00');
INSERT INTO student_notes(id, school_class_id, student_id, value, received_at) VALUES(28, 1, 5, 3, '2019-01-24T21:18:00');
INSERT INTO student_notes(id, school_class_id, student_id, value, received_at) VALUES(29, 3, 1, 2, '2019-07-6T18:12:00');
INSERT INTO student_notes(id, school_class_id, student_id, value, received_at) VALUES(30, 3, 5, 4, '2019-01-12T13:45:00');
INSERT INTO student_notes(id, school_class_id, student_id, value, received_at) VALUES(31, 4, 1, 2, '2019-03-19T12:38:00');
INSERT INTO student_notes(id, school_class_id, student_id, value, received_at) VALUES(32, 2, 3, 4, '2019-05-13T8:2:00');
INSERT INTO student_notes(id, school_class_id, student_id, value, received_at) VALUES(33, 2, 2, 3, '2019-06-7T13:51:00');
INSERT INTO student_notes(id, school_class_id, student_id, value, received_at) VALUES(34, 3, 2, 2, '2019-01-10T11:17:00');
INSERT INTO student_notes(id, school_class_id, student_id, value, received_at) VALUES(35, 2, 5, 1, '2019-03-12T4:14:00');
INSERT INTO student_notes(id, school_class_id, student_id, value, received_at) VALUES(36, 4, 3, 4, '2019-05-3T19:30:00');
INSERT INTO student_notes(id, school_class_id, student_id, value, received_at) VALUES(37, 2, 1, 2, '2019-03-2T5:38:00');
INSERT INTO student_notes(id, school_class_id, student_id, value, received_at) VALUES(38, 4, 5, 3, '2019-05-4T7:32:00');
INSERT INTO student_notes(id, school_class_id, student_id, value, received_at) VALUES(39, 2, 1, 1, '2019-04-12T11:22:00');
INSERT INTO student_notes(id, school_class_id, student_id, value, received_at) VALUES(40, 2, 4, 3, '2019-05-7T8:40:00');
INSERT INTO student_notes(id, school_class_id, student_id, value, received_at) VALUES(41, 2, 3, 3, '2019-04-10T20:29:00');
INSERT INTO student_notes(id, school_class_id, student_id, value, received_at) VALUES(42, 1, 5, 4, '2019-11-13T9:59:00');
INSERT INTO student_notes(id, school_class_id, student_id, value, received_at) VALUES(43, 3, 1, 6, '2019-03-17T10:39:00');
INSERT INTO student_notes(id, school_class_id, student_id, value, received_at) VALUES(44, 2, 2, 5, '2019-06-5T9:31:00');
INSERT INTO student_notes(id, school_class_id, student_id, value, received_at) VALUES(45, 4, 2, 1, '2019-04-12T14:2:00');
INSERT INTO student_notes(id, school_class_id, student_id, value, received_at) VALUES(46, 4, 3, 1, '2019-03-19T5:42:00');
INSERT INTO student_notes(id, school_class_id, student_id, value, received_at) VALUES(47, 3, 4, 6, '2019-05-14T5:21:00');
INSERT INTO student_notes(id, school_class_id, student_id, value, received_at) VALUES(48, 4, 3, 5, '2019-07-18T17:58:00');
INSERT INTO student_notes(id, school_class_id, student_id, value, received_at) VALUES(49, 2, 1, 6, '2019-05-5T12:32:00');
INSERT INTO student_notes(id, school_class_id, student_id, value, received_at) VALUES(50, 2, 4, 1, '2019-05-10T22:14:00');
INSERT INTO student_notes(id, school_class_id, student_id, value, received_at) VALUES(51, 3, 2, 3, '2019-03-10T22:14:00');
