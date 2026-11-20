CREATE DATABASE main;
\c main

CREATE TABLE IF NOT EXISTS users (
    id BIGSERIAL,
    login VARCHAR(30) UNIQUE NOT NULL,
    date TIMESTAMP,
    salt BYTEA,
    password_hash BYTEA,

    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS posts (
    id BIGSERIAL,
    user_id BIGINT,
    name VARCHAR(20) NOT NULL,
    DESCRIPTION VARCHAR(350),
    TEXT TEXT NOT NULL,
    DATE TIMESTAMP,

    PRIMARY KEY (id),
    FOREIGN KEY (user_id) REFERENCES users (id)
);

CREATE TABLE IF NOT EXISTS posts_attachments (
    id BIGSERIAL,
    post_id BIGINT,
    path TEXT

    PRIMARY KEY (id),
    FOREIGN KEY (post_id) REFERENCES posts (id)
);

CREATE TABLE IF NOT EXISTS comments (
    id BIGSERIAL,
    user_id BIGINT,
    post_id BIGINT,
    text TEXT,
    date TIMESTAMP,

    PRIMARY KEY (id),
    FOREIGN KEY (user_id) REFERENCES users (id),
    FOREIGN KEY (post_id) REFERENCES posts (id)
);

CREATE TABLE IF NOT EXISTS comments_attachments (
    id BIGSERIAL,
    comment_id BIGINT,
    path TEXT,

    PRIMARY KEY (id),
    FOREIGN KEY (comment_id) REFERENCES comments (id)
);

CREATE TABLE IF NOT EXISTS hashtags (
    id BIGSERIAL,
    name VARCHAR(64) UNIQUE,

    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS hashtags_and_posts (
    post_id BIGINT,
    hashtag_id BIGINT

    PRIMARY KEY (post_id, hashtag_id),
    FOREIGN KEY (post_id) REFERENCES posts (id),
    FOREIGN KEY (hashtag_id) REFERENCES hashtags (id)
);