DROP TABLE IF EXISTS roles CASCADE;

CREATE TABLE IF NOT EXISTS users
(
    id       BIGINT GENERATED BY DEFAULT AS IDENTITY NOT NULL,
    email    VARCHAR(255)                            NOT NULL,
    password VARCHAR(255)                            NOT NULL,
    username VARCHAR(255)                            NOT NULL,
    CONSTRAINT pk_user PRIMARY KEY (id),
    CONSTRAINT UQ_USER_EMAIL UNIQUE (email)
);

CREATE TABLE IF NOT EXISTS roles
(
    id   BIGINT GENERATED BY DEFAULT AS IDENTITY NOT NULL,
    name VARCHAR(255)                            NOT NULL,
    CONSTRAINT pk_role PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS users_roles
(
    user_id BIGINT NOT NULL,
    role_id BIGINT NOT NULL,
    CONSTRAINT fk_user_to_role FOREIGN KEY (user_id) REFERENCES users (id) ON DELETE CASCADE,
    CONSTRAINT fk_role_to_user FOREIGN KEY (role_id) REFERENCES roles (id) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS authors
(
    id      BIGINT GENERATED BY DEFAULT AS IDENTITY NOT NULL,
    name    VARCHAR(255)                            NOT NULL,
    email   VARCHAR(255)                            NOT NULL,
    user_id BIGINT                                  NOT NULL,
    CONSTRAINT pk_author PRIMARY KEY (id),
    CONSTRAINT fk_author_to_user FOREIGN KEY (user_id) REFERENCES users (id) ON DELETE CASCADE,
    CONSTRAINT UQ_EMAIL UNIQUE (email)
);

CREATE TABLE IF NOT EXISTS posts
(
    id        BIGINT GENERATED BY DEFAULT AS IDENTITY NOT NULL,
    header    VARCHAR(512)                            NOT NULL,
    text      VARCHAR(2000)                           NOT NULL,
    created   TIMESTAMP WITHOUT TIME ZONE             NOT NULL,
    views     INTEGER,
    author_id BIGINT,
    CONSTRAINT fk_post_to_author FOREIGN KEY (author_id) REFERENCES authors (id)
);