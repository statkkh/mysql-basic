CREATE DATABASE human_resource;
USE human_resource;
CREATE TABLE sample_table_1(
	colunm INT,
    not_null_column INT NOT NULL
);

INSERT INTO sample_table_1 VALUES (1, null);
INSERT INTO sample_table_1 (column1) VALUES (1);

UPDATE sample_table_1 SET not_null_column = null;

# FOREIGN KEY : 외래키 제약조건, 해당 컬럼이 외부 테이블의 기본키와 관계가 있음을 나타냄
CREATE TABLE super_table (
	primary_column INT PRIMARY KEY,
    column1 INT
);

CREATE TABLE sub_table (
	column2 INT,
    foreign_column INT,
    CONSTRAINT sub_table_fk
    FOREIGN KEY (foreign_column)
    REFERENCES super_table (primary_column)
    ON UPDATE CASCADE ON DELETE SET NULL
    # ON UPDATE, ON DELETE
    # 수정 및 삭제 작업에 대해서 참조하고있는 데이터가 변경될 때의 작업
    # CASCADE : 참조되어지는 데이터가 변경되면, 참조하는 데이터도 변경되는 것
    # SET NULL : 참조되어지는 데이터가 변경되면, 참조하는 데이터가 null로 변경됨
    # RESTRICT : 참조되어지는 데이터가 변경이 불가능
);

INSERT INTO super_table VALUES (1, 1);
INSERT INTO sub_table VALUES (1, 1);

UPDATE sub_table SET foreign_column = 2;

UPDATE super_table SET primary_column = 2;
DELETE FROM super_table;

SELECT * FROM super_table;
SELECT * FROM sub_table;



