CREATE TABLE IF NOT exists test (id SERIAL PRIMARY KEY, content VARCHAR(200));
INSERT INTO
    test (id, content)
VALUES
    (DEFAULT, 'sekret 1'),
    (DEFAULT, 'sekret 2')