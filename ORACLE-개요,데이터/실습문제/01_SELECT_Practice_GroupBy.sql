-- 1. 이메일 주소가 등록된 직원의 이름과 부서명을 출력하시오.
------WHERE E.DEPT_CODE = D.DEPT_ID 생략 가능
SELECT E.EMP_NAME, D.DEPT_TITLE
FROM EMPLOYEE E, DEPARTMENT D
WHERE E.DEPT_CODE = D.DEPT_ID
AND E.EMAIL IS NOT NULL;

-- 2. 각 부서의 최고 급여를 출력하시오.(최고 급여 순)
SELECT EMP_NAME, MAX(SALARY) ,DEPT_CODE
FROM EMPLOYEE 
GROUP BY DEPT_CODE, EMP_NAME
ORDER BY DEPT_CODE, MAX(SALARY) DESC;

-- 2-1. 각 부서의 최고 급여를 출력하시오.(부서별 최고 급여만 받는 사람 출력)
-----서브쿼리가 추가
SELECT EMP_NAME, SALARY ,DEPT_CODE
FROM EMPLOYEE 
WHERE (DEPT_CODE, SALARY) IN (
	SELECT DEPT_CODE, MAX(SALARY)
	FROM EMPLOYEE
	GROUP BY DEPT_CODE)
ORDER BY DEPT_CODE;

-- 3. 각 급여 등급별 직원 수를 출력하시오.
SELECT SALARY, COUNT(*) AS "직원 수"
FROM EMPLOYEE
GROUP BY SALARY; --급여별로 동일한 급액을 받는 직원 수

-- 4. 부서 이름과 평균 급여를 급여가 높은 순으로 정렬 출력하시오.
SELECT DEPT_TITLE, AVG(SALARY) AS 평균급여
FROM  EMPLOYEE , DEPARTMENT 
/*WHERE EMPLOYEE.DEPT_CODE = DEPARTMENT.DEPT_ID*/
GROUP BY DEPT_TITLE
ORDER BY AVG(SALARY) DESC;

-- 5. 지역별 부서 수를 출력하시오.
---- COUNT(DISTINCT 컬럼명): 특정 컬럼에서 중복값을 제외한 행의 개수 반환
SELECT LOCATION_ID ,COUNT(DISTINCT DEPT_ID) AS 부서수
FROM DEPARTMENT 
GROUP BY LOCATION_ID;

-- 6. 각 부서(DEPT_CODE)별 보너스 비율(BONUS)의 평균을 구하되, 평균 보너스 비율이 높은 순으로 정렬
--- 부서의 평균 급여와 평균 보너스 비율을 계산한 뒤
----- 보너스 평균 값 기준으로 오름차순으로 정렬하는 작업
------ 부서코드       각 부서의 급여 평균 계산			  부서의 보너스 비율 평균 계산
SELECT DEPT_CODE, FLOOR(AVG(SALARY)) AS 평균급여 , AVG(BONUS) AS 평균보너스비율
FROM EMPLOYEE, DEPARTMENT
GROUP BY DEPT_CODE
ORDER BY AVG(BONUS);

-- 7.각 부서(DEPT_CODE)별 평균 급여(SALARY)와 평균 보너스 비율(BONUS)을 조회하되, 부서명(DEPT_TITLE)을 기준으로 오름차순 정렬
SELECT AVG(SALARY) AS 평균급여, AVG(BONUS) AS 평균보너스비율, D.DEPT_TITLE
FROM EMPLOYEE E, DEPARTMENT D
/*WHERE E.DEPT_CODE = D.DEPT_ID*/
GROUP BY D.DEPT_TITLE
ORDER BY D.DEPT_TITLE /*ASC*/;


-- 8. 각 부서별 퇴사자 수를 조회하고, 퇴사자 수가 많은 순으로 정렬
SELECT DEPT_CODE, COUNT(*) AS 퇴사자
FROM EMPLOYEE
WHERE ENT_YN = UPPER('y')
GROUP BY DEPT_CODE
ORDER BY 퇴사자 DESC;

