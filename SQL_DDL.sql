# 주석
-- 

# DDL(데이터 정의어)
# 데이터베이스 스키마를 정의할 사용하는 명령어
# 스키마: 데이터 구조를 정의한 것
## CREATE, ALTER,DROP

# CREATE : 스키마를 생성할 때 사용
# CREATE  스키마타입 스키마이름 [....]

# 데이터베이스 생성
CREATE DATABASE human_resource;
# 데이터 베이스 생성 후에 해당 데이터베이스에서 작업을 하기위해서는
# USE 데이터베이스명; 을 해야함

USE human_resource;

# 테이블 생성
# CREATE TABLE 테이블명 (컬럼명 컬럼타입, ...)
CREATE TABLE employee (
	employee_number VARCHAR(20),
    name VARCHAR(20),
    age INT
);

# 데이터베이스의  데이터 타입
CREATE TABLE data_type(
	column1 INT, 		 # 정수형 데이터 타입
    column2 DOUBLE, 	 # 실수형 데이터 타입
    column3 BOOLEAN, 	 # 논리형 데이터 타입(0: FALSE,  1:TRUE)
	column4 VARCHAR(10), # 문자형 데이터 타입(길이를 포함)
	column5 TEXT , 		 # 문자열 데이터 타입(길이 제한을 적지 않음)
    column6	DATE , 		 # 날짜 데이터 타입()
    column7 TIME , 		 # 시간 데이터 타입
    column8 DATETIME	 # 날짜 및 시간 데이터 타입    
);

DROP TABLE data_type;

# 사용자 생성 address
# CREATE USER '계정의 이름'@접근위치' IDENTIFIED BY '비밀번호';
CREATE USER 'developer1'@'localhost'IDENTIFIED BY 'qlalfgjsgh';

USE MYSQL;
SELECT * FROM USER;
# SHOW DATABASEUSER;


# ALTER  : 스키마 정의 수정
# 테이블 수정
# 테이블 컬럼 추가
ALTER TABLE employee ADD address TEXT;

# 테이블 컬럼 삭제
ALTER TABLE employee DROP COLUMN address;

# 테이블 타입 수정
ALTER TABLE employee  modify COLUMN employee_number VARCHAR(10);

# DROP :스키마정의 테이블 삭제
DROP TABLE employee;

# 데이터베이스 삭제
DROP DATABASE human_resource;



