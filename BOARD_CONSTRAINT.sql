CREATE DATABASE sample_board_2;
USE sample_board_2;

CREATE TABLE user (
	email VARCHAR(50) PRIMARY KEY,
    password VARCHAR(255) NOT NULL,
    nickname VARCHAR(20) NOT NULL UNIQUE,
    tel_number VARCHAR(15)  NOT NULL UNIQUE ,
    address TEXT NOT NULL,
    address_detail TEXT,
    agreed_personal BOOLEAN NOT NULL CHECK(agreed_personal IS TRUE),
    profile_image VARCHAR(500) NOT NULL DEFAULT 'https://www.google.com/imgres?imgurl=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2Fbj4oa7%2FbtqLJWFLMgd%2Fwu4GV8PKbXdICuyW0me0zk%2Fimg.jpg&tbnid=YN9QvmSblWDAmM&vet=12ahUKEwiSqKGs4LyAAxX_mFYBHQRmDBkQMygLegUIARDpAQ..i&imgrefurl=https%3A%2F%2Fohioohio.tistory.com%2F24&docid=W6jH9hrxYvnlVM&w=960&h=953&q=%EC%82%AC%EB%9E%8C%20%ED%94%84%EB%A1%9C%ED%95%84%20%EC%82%AC%EC%A7%84&ved=2ahUKEwiSqKGs4LyAAxX_mFYBHQRmDBkQMygLegUIARDpAQ' 
);

CREATE TABLE board (
	board_number INT PRIMARY KEY AUTO_INCREMENT,
    title TEXT NOT NULL,
    contents TEXT NOT NULL,
    write_datetime DATETIME NOT NULL DEFAULT NOW(), 
    writer_email VARCHAR(50) NOT NULL,
    view_count INT NOT NULL DEFAULT 0,
    FOREIGN KEY (writer_email) REFERENCES user (email)
);

CREATE TABLE favorite (
	board_number INT NOT NULL,
    user_email VARCHAR(50) NOT NULL,
    UNIQUE (board_number, user_email),
    FOREIGN KEY (board_number) REFERENCES board (board_number),
    FOREIGN KEY (user_email) REFERENCES user (email)
);

CREATE TABLE comment (
	board_number INT NOT NULL,
    user_email VARCHAR(50) NOT NULL,
    content TEXT NOT NULL,
    write_datetime DATETIME NOT NULL DEFAULT NOW(),
    FOREIGN KEY (board_number) REFERENCES board (board_number),
    FOREIGN KEY (user_email) REFERENCES user (email)
);




