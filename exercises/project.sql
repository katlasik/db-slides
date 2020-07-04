DROP DATABASE IF EXISTS tasks;

CREATE DATABASE tasks;

USE tasks;

CREATE TABLE category
(
    id   INT          NOT NULL PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(250) NOT NULL UNIQUE
);

CREATE TABLE task
(
    id           INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    description  VARCHAR(500),
    deadline     DATETIME,
    category_id  INT REFERENCES category (id),
    created_on   DATETIME DEFAULT NOW(),
    updated_on   DATETIME,
    cancelled_on DATETIME
);

CREATE TABLE tag
(
    id   INT          NOT NULL PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(250) NOT NULL UNIQUE
);

CREATE TABLE task_x_tag
(
    task_id INT REFERENCES task (id),
    tag_id  INT REFERENCES tag (id),
    PRIMARY KEY (tag_id, task_id)
);

CREATE TABLE status
(
    id   INT          NOT NULL PRIMARY KEY,
    name VARCHAR(250) NOT NULL UNIQUE
);

INSERT INTO status(id, name)
VALUES (1, 'Zakończone');
INSERT INTO status(id, name)
VALUES (2, 'W trakcie');
INSERT INTO status(id, name)
VALUES (3, 'Planowane');

CREATE TABLE status_x_task
(
    task_id    INT REFERENCES task (id),
    status_id  INT REFERENCES status (id),
    created_on DATETIME DEFAULT NOW(),
    PRIMARY KEY (task_id, status_id)
);


CREATE VIEW active_task AS
(
SELECT task.*
FROM task
         JOIN status_x_task ON status_x_task.task_id = task.id AND status_id IN (2, 3)
WHERE cancelled_on IS NULL
    );

CREATE INDEX task_description_idx ON task (description) ;
