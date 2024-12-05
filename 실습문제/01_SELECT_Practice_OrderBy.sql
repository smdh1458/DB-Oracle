SELECT * FROM EMPLOYEE E;

SELECT emp_name, SALARY*12 AS 연봉 
FROM EMPLOYEE
ORDER BY 연봉 ASC;

SELECT emp_name 
FROM EMPLOYEE
ORDER BY EMP_NAME DESC

-- EMPLOYEE 테이블에서 사원들의 급여를 오름차순으로 정렬
--- select emp_id, emp_name, salary
SELECT emp_id, emp_name, SALARY
FROM EMPLOYEE
ORDER BY SALARY /*ASC*/;

-- EMPLOYEE 테이블에서 사원들의 입사일을 내림차순 정렬
--- select emp_id, emp_name, hire_date
SELECT emp_id, emp_name, hire_date
FROM EMPLOYEE
ORDER BY hire_date DESC;

-- DEPARTMENT 테이블의 부서명을 오름차순 출력
--- select DEPT_ID, DEPT_TITLE
SELECT DEPT_ID, DEPT_TITLE
FROM DEPARTMENT 
ORDER BY DEPT_TITLE;

-- EMPLOYEE 테이블에서 부서 코드가 없는 사원들의 이름을 내림차순 출력
--- select EMP_ID, EMP_NAME
---- where절 사용
SELECT EMP_ID, EMP_NAME , DEPT_CODE
FROM EMPLOYEE
WHERE DEPT_CODE IS NULL
ORDER BY EMP_NAME DESC;

--5. 급여가 EMPLOYEE 테이블에서 3000000원 이상인 사원들의 급여 등급(salary_lebel)
---내림차순 정렬
----select emp_id, emp_name, sal_level
SELECT emp_id, emp_name, sal_level,SALARY
FROM EMPLOYEE
WHERE SALARY >= 3000000
ORDER BY sal_level DESC;


-- EMPLOYEE 테이블에서 오름차순 + NULLS FIRST (NULL값을 제일 위에 배치)
SELECT emp_name, phone
FROM EMPLOYEE
ORDER BY PHONE NULLS FIRST;

-- EMPLOYEE 테이블에서 오름차순 + NULLS LAST (NULL값을 제일 아래에 배치)
SELECT emp_name, phone
FROM EMPLOYEE
ORDER BY PHONE /*ASC NULLS LAST*/;


-- EMPLOYEE 테이블에서 내림차순 + NULLS 를 가장 위로 배치
--- emp_name, phone
SELECT emp_name, phone
FROM EMPLOYEE
ORDER BY PHONE DESC NULLS FIRST;
