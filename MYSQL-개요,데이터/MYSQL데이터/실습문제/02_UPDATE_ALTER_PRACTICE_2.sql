USE KHTSHOPPING;

SELECT * 
FROM PRODUCT;

SELECT * FROM `ORDER`;

SELECT * FROM REVIEW;

SELECT * FROM ORDER_ITEM;

/*
PENDING -> 대기
SHIPPED -> 배송 중
DELIVERED -> 배송 완료
CANCELLED -> 취소

1) SAFE_UPDATE = 0;
2) ALTER STATUS 변경
3) UPDATE 작성
*/

SET SQL_SAFE_UPDATES= 0;

ALTER TABLE `ORDER` modify column STATUS ENUM('PENDING','SHIPPED','DELIVERED','CANCELLED',
'대기','배송 중','배송 완료','취소');

UPDATE `ORDER` SET STATUS = '대기'
WHERE STATUS = 'PENDING';

UPDATE `ORDER` SET STATUS = '배송 중'
WHERE STATUS = 'SHIPPED';

UPDATE `ORDER` SET STATUS = '배송 완료'
WHERE STATUS = 'DELIVERED';

UPDATE `ORDER` SET STATUS = '취소'
WHERE STATUS = 'CANCELLED';

ALTER TABLE `ORDER` modify column STATUS ENUM('대기','배송 중','배송 완료','취소') DEFAULT '대기';

SET SQL_SAFE_UPDATES = 1;

COMMIT;
SELECT * FROM `ORDER`;

USE KHTUSER;
SELECT * FROM USER;

-- 이메일 주소 도메인이 example.com -> kht.co.kr 변경
-- CONCAT SUBSTRING SUBSTRING INDEX 이용해서 변경
-- LIKE로 일치하는지 확인 후 변경

SELECT CONCAT('Hello',' ','World','!'); -- CONCAT으로 이어붙여 출력되는지 확인

SELECT SUBSTRING_INDEX('user@example.com','@',1);

SELECT SUBSTRING_INDEX('user@example.com','@',-1);

SELECT CONCAT(SUBSTRING_INDEX('user@example.com','@',1),'@ kht.com');



/*
ERROR CODE: 1241 잘못된 문법으로 문자열 처리를 시도했기 때문에 발생한 에러코드
ERROR CODE: 1175 SAFE UPDATE MODE 비활성화
	-> 1번 EDIT -> Prefernces -> SQL Editor -> 맨 밑에 Safe Updates(reject Update and Delete ~~~) 비활성화
		또는
       2번 SET SQL_SAFE_UPDATES = 0; 
*/

SET SQL_SAFE_UPDATES = 0;
UPDATE USER
SET EMAIL= CONCAT(SUBSTRING_INDEX(EMAIL,'@',1),'@kht.com');

-- USER 테이블에서 전화번호 앞에 +82) 를 붙여주기
-- 최종 PHONE +82)010-xxxx-xxxx

/*
ERROR CODE : 1406 컬럼이 VARCAR(20) 또는 그보다 작은 길이로 정의된 경우 새로운 값이 길이 제한을 넘어서기 때문에 발생하는 에러
컬럼의 길이 늘리기

*/
ALTER TABLE USER MODIFY column PHONE VARCHAR(20);

UPDATE USER
SET PHONE = CONCAT('+082)',PHONE);

SELECT * FROM USER;

-- +082) 지우기
-- CONCAT 이용하고 ) 기준으로 지우기
-- SAVEPOINT "SP1";
-- KOR) 010-XXXX-XXXX 이런식으로 맨 앞에 KOR) 붙이기
-- ROLLBACK 이용해서 "SP1"되돌리기
UPDATE USER SET PHONE = SUBSTRING_INDEX(PHONE,')',-1);
SAVEPOINT SP1;
UPDATE USER
SET PHONE = CONCAT('KOR)',PHONE);
SELECT * FROM USER;
UPDATE USER
SET PHONE = CONCAT('KOR)',SUBSTRING_INDEX(PHONE,')',-1));








UPDATE USER
SET EMAIL= CONCAT(SUBSTRING_INDEX(EMAIL,'@',1),'@kht.com');


/*데이터 수정*/
UPDATE USER SET EMAIL = 'choi@example.com' where USERNAME = '최수지';
/*
('홍길동', 'hong@example.com', 'hashed_password_1', '', 'ACTIVE'),
('김영희', 'kim@example.com', 'hashed_password_2', '010-2345-6789', 'ACTIVE'),
('이철수', 'lee@example.com', 'hashed_password_3', '010-3456-7890', 'INACTIVE'),
('박민수', 'park@example.com', 'hashed_password_4', '010-4567-8901', 'ACTIVE'),
('최수지', 'choi@example.com', 'hashed_password_5', '010-5678-9012', 'ACTIVE');
*/
SELECT * FROM USER;


COMMIT;






