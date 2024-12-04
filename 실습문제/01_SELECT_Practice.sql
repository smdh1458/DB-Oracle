/*범위 주석 ctrl + shift + /*/
-- 한 줄 주석 ctrl + /

/*

asterisk (*) : 모든, 포함하다 를 나타내는 기호 (ALL)


SQL 1개 실행 : CTRL + Enter
SQL 2개 이상 실행: (블럭 드래그 후) ALT + X
단축키 ctrl + space 나머지 (컬럼명, 테이블명 등) 자동완성

SELECT FROM과 같은 SQL 구문은 대문자로 작성하는 것이 개발자들간의 구분 규칙
컬럼명이나 테이블명 과 같이 개발자가 조회를 원하는 단어나 기능은 소문자로 작성해주는 것이 좋음
*/

/* SELECT (조회)
    - 지정된 테이블에서 원하는 데이터를 선택해서 조회하는 sql
    - 작성된 구문에 맞는 행, 열 데이터가 조회됨
    -> 조회된 결과 행의 집합 == RESULT SET(결과 집합)
    
    - 결과는 0행 이상이 포함될 수 있다.
    -> 왜냐하면 조건에 맞는 행이 없을 수 있기 때문

*/


/*SELECT 작성하는 방법
1. SELECT                     *                           FROM                              테이블이름;
    조회하다           모든 내용을           어디서 조회할 것인가?        조회할테이블이름;


*/
SELECT * FROM department; --department라는 테이블에 있는 모든 내용 조회하기

--QUIZ1      LOCATION 테이블 모두 조회하기
SELECT * FROM LOCATION;

--QUIZ2      JOB 테이블 모두 조회하기
SELECT * FROM JOB;

--QUIZ3     NATIONAL 테이블 모두 조회하기
SELECT * FROM NATIONAL;

--QUIZ4     SAL_GRADE 테이블 모두 조회하기
SELECT * FROM sal_grade;

/*
2. SELCET 컬럼명, 컬럼명, ... FROM 테이블이름;
테이블 내부에 있는 모든 컬럼을 조회하는 것이 아니라 조회하고 싶은 컬럼명만 선택해서 조회
*/

 -- EMPLOYEE 테이블에서 사번(EMP_ID)   이름(EMP_NAME)    급여(SALARY)조회
 SELECT emp_id, emp_name, salary FROM employee;
 
 -- EMPLOYEE 테이블에서 이름(emp_name) 조회
 SELECT emp_name FROM employee;
 
 -- Employee 테이블에서 emp_name hire_date 조회
 SELECT emp_name, hire_date FROM employee;
 
 -- DEPARTMENT 테이블에서 부서코드 부서명 조회(DEPT_ID, DEPT_TITLE)
 SELECT dept_id, dept_title FROM DEPARTMENT;
 
 --DEPARTMENT 테이블에서 모든 데이터 조회
 SELECT * FROM DEPARTMENT;
 
 /* 컬럼 값 산술 연산 */
 -- 컬럼 값 : 행과 열이 교차되는 테이블의 한 칸에 작성된 값
 -- select 문 작성 시 컬럼명에 산술 연산을 직접 작성하면 조회결과에 연산결과가 반영되어 조회된다.
 
 -- EMPLOYEE 테이블에서 모든 사원의 이름, 급여, 급여 *12 를 해서 연봉 조회
 SELECT EMP_ID, EMP_NAME, SALARY*12 FROM employee;
 
  SELECT EMP_ID, EMP_NAME, SALARY, SALARY*12 FROM employee;

-- SALAY * 12에 별칭을 붙여서 연봉이라 표기하기
-- 별명을 붙여 컬럼명이 조회되길 원한다면 AS 별명을 작성해주면 된다.
-- AS : Alias = 별명 = 별칭

 SELECT EMP_ID, EMP_NAME, SALARY, SALARY*12 AS 연봉 FROM employee;
 
 --employee 테이블에서 EMP_ID AS 직원아이디, EMP_NAME = 직원이름, SALARY = 월급 으로 표기해서 출력
 SELECT EMP_ID AS 직원아이디, EMP_NAME AS 직원이름, SALARY AS 월급 FROM employee;
 
 /* SYSDATE / SYSTIMESTAMP*/
 -- (시스템이 나타내고 있는) 현재 시간
 
 --SYSDATE               : 현재 시간 (년, 월, 일, 시, 분, 초) 조회
 --SYSTIMESTAMP     : 현재 시간 (년, 월, 일, 시, 분, 초, ms + 지역(local)) 조회
 
 /* DUAL (DUmmy tAbLe) 가짜 테이블*/
 -- 기능이나 단순 데이터 조회를 위해 sql에서 제공하는 존재하지 않는 가짜 테이블
 
 --가짜 테이블을 이용해서 시간 기능 조회하기
 SELECT SYSDATE FROM DUAL;              --24/12/04
 
 SELECT SYSTIMESTAMP FROM DUAL;    --24/12/04 14:29:29.020000000 +09:00
 
 /*
 날짜 데이터 연산하기 ( + , - 만 가능)
 --> +1 == 1일 추가
 --> -1 == 1일 감소
 --> 일 단위로 계산
 */

-- 가짜 테이블을 이용해서 [   ] AS 어제, [   ] AS 오늘,  [   ] AS 내일,  [   ] AS 모레 조회
SELECT SYSDATE-1 AS 어제, SYSDATE AS 오늘, SYSDATE +1 AS 내일, SYSDATE+2 AS 모레 FROM DUAL;

/*
-- 현재시간              한 시간 후,                        1분 후,                                     10초 후 조회
    SYSDATE          SYSDATE + 1/24          SYSDATE + 1/24/60                   SYSDATE + 1/24/60/60 *10
                         24시간 중 1시간 후       24시간에서 60분 중 1분 후       24시간 중 60분 60초 중에 (1 * 10)초후
*/

-- TO_DATE('문자열', '패턴');
-- 문자열을 패턴 형태로 해석해서 DATE 타입으로 변경하는 함수

SELECT '2024-12-04', TO_DATE('2024-12-04','YYYY-MM-DD') FROM DUAL;


-- EMPLOYEE 에서 모든 사원의 이름, 입사일, 근무일수 (SYSDATE - 입사일) 조회
SELECT emp_name AS 이름, hire_date AS 입사일, SYSDATE - hire_date AS 근무일수 FROM employee;

/*
3. SELECT 특정 기준에 부합한 컬럼을 조회

SELECT 조회할 컬럼명
FROM 테이블명
WHERE 조건작성;

WHERE에서 존재 유무 확인 IS NOT NULL = 빈 값이 아닌 칸
ex) 이름이 비어있지 않은 사원 조회      
        SELECT emp_name 
        from employee 
        where emp_name is not null;

*/

 -- 퇴사 여부가 Y인 사원의 이름과 퇴사일 조회
 SELECT EMP_NAME, ENT_DATE  -- 무엇을 조회할 것인가
 FROM EMPLOYEE                      --어디서 조회할 것인가
WHERE ENT_YN = 'Y';                   --어떤 조건을 걸 것인가

-- 보너스가 있는 사원의 이름과 보너스 금액 조회  WHERE BONUS IS NOT NULL;
SELECT EMP_NAME, BONUS
FROM EMPLOYEE
WHERE BONUS IS NOT NULL;

-- 급여가 300만원 이상인 사원의 이름과 급여를 조회
-- 급여 >= 3000000

SELECT emp_name, salary
FROM employee
WHERE salary >= 3000000;

-- DEPARTMENT 테이블에서 LOCATION_ID가 'L1' 지역에 위치한 부서의 모든 정보 조회
SELECT *
FROM department
WHERE location_id = 'L1';

--EMPLOYEE 테이블에서 이메일 주소가 없는 사원의 이름 조회
SELECT EMP_NAME
FROM employee
WHERE email is null;
--> 이메일 주소가 모두 존재하기 때문에 아무것도 안 나오는게 맞음

-- EMPLOYEE 테이블에서 관리자가 없는 사원의 정보 조회
SELECT *
FROM employee
WHERE manager_id is null;

-- EMPLOYEE 테이블에서 모든 사원의 이름, 입사일, 근무일수(현재시간 - 입사일) 조회
SELECT EMP_NAME, HIRE_DATE, SYSDATE - HIRE_DATE
FROM employee;

-- 포멧팅을 활용해서 보기좋게 정리 
-- FLOOR(소수점 아래 모두 버리기)이용해서 정리
-- CEIL (모두 올림 처리)
-- ROUND(반올림 처리) 

SELECT EMP_NAME, HIRE_DATE, FLOOR(SYSDATE - HIRE_DATE)
FROM EMPLOYEE;
--FLOOR(SYSDATE - HIRE_DATE) 입사일로부터 현재까지의 차이를 계산하고 소수점 아래에는 모두 버려 정수로 나타냄
-- 소수점 아래를 버림하는 이유는 반올림을 할 경우 입사일이 하루 추가되므로 현재 입사해서 근무한 일자에 어긋남

-- EMPLOYEE 테이블에서 부서 코드가 D9부서가 아닌 사원들만 컬럼을 모두 조회
SELECT *
FROM employee
WHERE dept_code != 'D9';

-- 1. EMPLOYEE 테이블에서 연봉이 5000만원 이하인 사원의 사번, 이름, 연봉 조회
-- EMP_ID EMP_NAME SALARY * 12 AS 연봉
-- QUIZ WHERE 절 요구사항에 맞게 작성
SELECT EMP_ID, EMP_NAME, SALARY * 12 AS 연봉
FROM employee
WHERE SALARY * 12 <= 50000000;

--2. EMPLOYEE 테이블에서 부서코드가 D6이 아닌 사원의 이름 부서코드 전화번호 조회
SELECT EMP_NAME, DEPT_CODE, PHONE
FROM EMPLOYEE
WHERE DEPT_CODE != 'D6';

-- EMPLOYEE 테이블에서 부서코드가 D1, D3 이 아닌 사원의 이름 부서코드 조회

SELECT EMP_NAME, DEPT_CODE
FROM employee
WHERE DEPT_CODE != 'D3'
AND DEPT_CODE != 'D1';


 -- EMPLOYEE 테이블에서 구속코드가 D1 D3가 아닌 사원 조회
 SELECT EMP_NAME, DEPT_CODE
 FROM EMPLOYEE
 WHERE DEPT_CODE NOT IN('D1','D3');
-- 위랑 같은 코드

/*
WHERE 절에서 특정값의 기준을 설정할 때 특정 값의 범위나 조건을 설정

AND = 여러 조건을 동시에 만족하는 경우로 AND로 작성한 조건이 모두 TRUE 이어야 함
OR = 하나의 조건만 TRUE이어도 해당 행이 선택

IN () = 조건의 여러값을 지정할 때 사용 값의 목록 중 하나와 일치하는 행을 선택
          OR의 간결한 표현 방법
NOT IN () = IN과 반대로, 조건에서 지정한 목록에 포함되지 않는 값만 선택
                 값의 목록와 일치하지 않는 행만 선택
*/






