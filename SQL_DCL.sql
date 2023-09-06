# DCL (데이터 제어어)
# 데이터 접근에 대한 권한을 관리하는 언어

# GRANT
# 사용자에게 권한을 부여하는 쿼리
# GRANT 권한, ... ON 데이터베이스명.테이블명 TO 유저명@접근위치;
GRANT SELECT ON human_resource.bbq TO 'developer1'@'localhost';

# REVOKE
# 사용자로부터 권한을 회수하는 쿼리
# REVOKE 권한, ... ON 데이터베이스명.테이블명 FROM 유저명@접근위치;
REVOKE SELECT ON human_resource.bbq FROM 'developer1'@'localhost';



