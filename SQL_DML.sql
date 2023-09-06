# DML (데이터 조작어)
# 실제 데이터를 삽입, 선택, 수정, 삭제하는데 사용됨

# INSERT
# 데이터를 테이블에 삽일할 때 사용
#  1. 전체 컬럼에 대하여 삽입
#  INSERT INTO 테이블명 VALUES(값1, 값2....);

#  전체 컬럼에 대한 삽입 작업은 컬럼의 순서와 삽입하고하는데이터의 순서와 일치 해야함
# INSERT INTO employee VALUES('202307311001', '홍길동', 31);

# 전체 컬럼에 대한 삽입 작업은 컬럼의 갯수 와 삽입하고하는 데이터의 개수가 일치 해야함
# INSERT INTO employee VALUES('2023071022','홀길동'); 

#  2. 특정 컬럼을 지정하여 삽입
#  INSERT INTO 테이블명(컬럼명1, 컬럼명2, 컬럼명3....) 
#  VALUES(값1, 값2, 값3,...);
INSERT INTO employee( employee_number, name, age) VALUES('20230731002','김철수',20);
# 컬럼을 지정하여 삽입 작업을 할 때 지정하는 컬럼에는 순서가 없음
# INSERT INTO employee( age ,employee_number, name ) VALUES(25,'20230731003','김사또');

# 지정한 컬럼의 순서과 값의 순서는 일치해야함
# INSERT INTO employee( age ,employee_number, name )
#	VALUES('김사또','20230731003',25);

# INSERT INTO employee( age ,employee_number )
#	VALUES('김사또','20230731003',25);

INSERT INTO employee( name ,age ,employee_number  )
	VALUES('김사또',25 ,'null');

# NULL :  값이 지정  안 됨

SELECT * FROM employee;

SELECT * FROM e;
CREATE TABLE e SELECT * FROM employee;

# UPDATE
# 테이블에 존재하는 데이터를 수정할 때 사용
# UPDATE 테이블명  SET 컬럼1 = 값1[, 컬럼2 = 값2 ...] 
# [WHERE 조건]; 
UPDATE employee  SET age = 10;
UPDATE employee  SET age = 15, name = '세종대왕'  ;
UPDATE employee  SET employee_number = '20230731003'  
    WHERE  employee_number IS NULL  ;
    

# DELETE
# 테이블에서의 데이터를 삭제할 때 사용
# DELETE FROM 테이블명 [WHERE 조건];
DELETE  FROM employee WHERE employee_number = '20230731003';
DELETE  FROM employee ;

# DROP[DDL] /  DELETE[DML]  / TRUNCATE[DDL]

CREATE TABLE sample(
	num1 INT AUTO_INCREMENT PRIMARY KEY,
    comment1 TEXT 
);

INSERT INTO sample(comment1) VALUES ('예시');  

SELECT * FROM sample;

DROP TABLE sample;

DELETE FROM sample;

# 테이블 생성 시점으로 초기화
TRUNCATE TABLE sample;
TRUNCATE TABLE employee;

INSERT INTO employee VALUES('202307311001', '홍길동', 30);
INSERT INTO employee VALUES('202307311002', '김철수', 32);
INSERT INTO employee VALUES('202307311003', '이영자', 22);
INSERT INTO employee VALUES('202307311004', '배철수', null);

INSERT INTO employee VALUES('202307311001', '뉴진스', 30);
INSERT INTO employee VALUES('202307311002', '르세라핌', 32);
INSERT INTO employee VALUES('202307311003', '권상우', 22);
INSERT INTO employee VALUES('202307311004', '고창석', null);


DELETE  from employee where name = '길깅동';

# SELECT 
# 테이블에서 데이터를 조회할 때 사용
# 1. 전체 컬럼 및 데이터 조회
# SELECT * FROM 테이블명;
SELECT * FROM employee;

# 2. 특정 컬럼 조회
SELECT age, name FROM employee;

# 3. 특정 로우 조회
SELECT *  FROM employee WHERE age = 22;

# 4.DISTINCT
# SELECT 문에서 검색 결과의 중복을 제거
# SELECT DISTINCT 컬럼명 FROM 테이블명[WHERE 조건]; 

SELECT * FROM employee;
SELECT DISTINCT employee_number FROM employee;

SELECT employee_number, name FROM employee;
SELECT DISTINCT employee_number, name FROM employee;


SELECT employee_number, age FROM employee;
SELECT DISTINCT employee_number, age FROM employee;


# ORDER BY
# 검색 결과를 정렬할 때 사용
# SELECT 컬럼 FROM 테이블명  WHERE 조건  ORDER BY 컬럼명 ASC | DSC,...;
#ASC : 오름차순 DESC : 내림차순
# ORDER BY COL1 DESC OR ASC COL2 DESC OR ASC;
SELECT * FROM employee ORDER BY employee_number;

# WHERE 절에 사용한 컬럼명을 왼쪽 부터 작성
SELECT * FROM employee ORDER BY employee_number  DESC, NAME ASC;

# 연산자(비교, 논리)
SELECT * FROM bbq;
SELECT DISTINCT 업소명 FROM bbq;
SELECT * FROM bbq ORDER BY 업소명 ;

# =  : 좌항이 우항과 같으면 true 
# != / <>: 좌항이 우항과 다르면  true
# > , >=: 좌항이 우항보다  크거나 같으면  TRUE
# < ,<=  : 우항이 좌항보다 작거나 같으면 TRUE
#  
SELECT * FROM bbq WHERE 업소명 = '교촌치킨';
SELECT * FROM bbq WHERE 업소명 <> '비비큐';

SELECT * FROM bbq WHERE 경도  > 35.1 ;
SELECT * FROM bbq WHERE 업소명  > '닭썸' ORDER BY 업소명;

SELECT * FROM bbq;
UPDATE bbq SET 업소명 = NULL  WHERE  업소명 = '비비큐';

# <=>: 좌항과 우항이 모두null 일 때 TRUE 반환
SELECT * FROM bbq WHERE 업소명 <=> null;

# IS : 좌항이 우항과 같으면  true 반환(true,false, unknown, null)
# ISNULL : 좌항이  NULL이면 true 반환
SELECT * FROM bbq where 업소명 IS NULL;
SELECT * FROM bbq where 업소명 IS FALSE ORDER BY 업소명;
SELECT * FROM bbq where 업소명 IS TRUE ORDER BY 업소명;

#IS NOT : 좌항이 우항과 다르면 TRUE 반환(true,false, unknown, null)
#IS NOT NULL: 좌항이 NULL이 아니면 TRUE 반환

SELECT * FROM bbq WHERE 업소명 IS NOT NULL;

# BETWEEN MIN AND MAX: MIN 보다 크거나 같으면서 MAX보다 작거나 같으면 TRUE 반환
# NOT BETWEEN MIN AND MAX: MIN 보다 작거나  MAX보다 크면  TRUE 반환
SELECT * FROM bbq where 위도 BETWEEN 129.027 and 129.028;
SELECT * FROM bbq where 위도 not BETWEEN 129.027 and 129.028;


# IN() : 좌항이 인수로 전달받은 값중 하나라도 존재하면 true
# NOT IN():좌항이 인수로 전달받은 값중 하나라도 존재하지 않으면 true

SELECT * FROM bbq WHERE 업소명 IN('BBQ개금점', 'BBQ반여점', '교촌치킨');
SELECT * FROM bbq WHERE 업소명 not IN('BBQ개금점', 'BBQ반여점', '교촌치킨');