
SELECT e.empno 사번
        ,e.ename 이름
        ,e.sal 급여
FROM emp e
WHERE e.sal > 2000;





SELECT e.empno
       ,e.ename
       ,e.sal
FROM emp e
WHERE e.sal>=1000;




SELECT    e.empno
           ,e.ename
           ,e.sal

FROM emp e
WHERE e.sal>1000 
AND e.sal<2000;



SELECT    e.empno
           ,e.ename
           ,e.sal

FROM emp e
WHERE e.sal>=1000
AND  e.sal<2000;




SELECT    e.empno
           ,e.ename
           ,e.sal

FROM emp e
WHERE e.sal>=1000
AND  e.sal<=2000;



SELECT    e.empno
         ,e.ename
         ,e.sal
         ,e.comm
FROM emp e
WHERE e.comm>0;



SELECT     e.empno
           ,e.ename
           ,e.job
           , e.sal + e.comm "실 수령금"
FROM emp e;


SELECT     e.empno
           ,e.ename
           ,e.job
           ,e.sal
           ,e.comm
           , e.sal + e.comm "실 수령금"
FROM emp e;


SELECT     e.empno
           ,e.ename
           ,e.job
           ,e.sal
           ,e.comm
           , e.sal + e.comm "실 수령금"
FROM emp e
WHERE e.job = 'salesman';


SELECT     e.empno
           ,e.ename
           ,e.job
           ,e.sal
           ,e.comm
           , e.sal + e.comm "실 수령금"
FROM emp e
WHERE e.job = 'SALESMAN';


SELECT e.empno
    ,e.ename
    ,e. sal
FROM emp e
WHERE e.sal >= 2000;


SELECT e.empno
    ,e.ename
    ,e. sal
FROM emp e
WHERE e.sal < 2000;


SELECT     e.empno
           ,e.ename
           ,e.sal

FROM emp e 
WHERE e.sal IN (800,3000,5000);


SELECT     e.empno
           ,e.ename
           ,e.sal

FROM emp e 
WHERE e.sal = 800
OR    e.sal= 3000
OR    e.sal= 5000;

----------------------------------
-- LIKE 연산자 : 유사 값을 검색할때 사용.
-- 정확한 값을 알지 못할때 사용.

-- LIKE 연산자의 패턴 문자 : 유사 값 검색을 위해
-- 연산자와 함께 사용하는 기호
-- %  : 이 기호의 자리에 0자릿수 이상의 모든 문자가 올 수 있음
--_: 이 기호의 자리에 1자리의 모든 문자가 올 수 있음

--26) 이름이 J로 시작하는 직원의
--          사번,이름 조회
SELECT      e.empno
             ,e.ename
             
FROM emp e 
WHERE e.ename LIKE 'J%'
;
/*
EMPNO, ENAME
-------------
7566	JONES
7900	JAMES
*/

-- 이름이 M으로 시작하는 직원의 사번, 이름 조회

SELECT      e.empno
             ,e.ename
             
FROM emp e 
WHERE e.ename LIKE 'M%'
;

/*
EMPNO, ENAME
-------------------
7654	MARTIN
7934	MILLER
*/

-- 이름의 세번째 자리에 M이 들어가는 직원의
-- 사번, 이름을 조회

SELECT   e.empno
         ,e.ename
         
FROM emp e
WHERE e.ename LIKE '__M%'
             -- 패턴인식문자 _를 두번 사용하여
            -- M 앞자리를 2글자로 제한
;                             

/*
EMPNO, ENAME
---------------
7900	JAMES
*/

-- 이름의 둘째자리부터 LA가 들어가는 이름을 가진 직원의
-- 사번, 이름 조회

SELECT   e.empno
         ,e.ename
FROM emp e
WHERE  e.ename LIKE '_LA%'
;
/*
EMPNO, ENAME    
--------------
7698	BLAKE
7782	CLARK
*/
-- 다음의 명령을 실행
INSERT INTO "SCOTT"."EMP" (EMPNO, ENAME, JOB) 
VALUES ('9999', 'J_JAMES', 'CLERK')
;
INSERT INTO "SCOTT"."EMP" (EMPNO, ENAME, JOB) 
VALUES ('8888', 'J%JAMES', 'CLERK')
;

commit;

-- 이름이 j_로 시작하는 직원의 사번, 이름을 조회
-- :조회 하려는 값에 패턴인식문자(%,_)가 들어있는 데이터는
-- 어떻게 조회할 것인가?

SELECT e.empno
        ,e.ename
        FROM emp e
        WHERE e.ename LIKE 'J_%'
        ;
        -- ==> 위처럼 LIKE 조건을 작성하면 J뒤에 적어도 1글자가 있는
        -- 이름을 가진 직원이 모두 검색됨. 원하는 결과가 아니다.
        -- 패턴 인식 문자를 조회하려면 ESCAPE 를 사용해야 한다.
        -- => 패턴 인식 문자를 무효화 하려면 ESCAPE 를 사용해야 한다.

SELECT e.empno
      ,e.ename
      FROM  emp e
      WHERE e.ename LIKE 'J\_%' ESCAPE '\'
      ;
/*
EMPNO, ENAME
------------------
9999	J_JAMES
*/

-- 9999 J_JAMES

-- 이름이 J%로 시작하는 직원의 사번,이름 조회

SELECT  e.empno
         ,e.ename
FROM emp e
WHERE e.ename LIKE 'J\%%' ESCAPE '\'
;
/*
EMPNO, ENAME
----------------
8888	J%JAMES
*/

----- 8888 J%JAMES

-----------------------------------------------
-- NULL에 관련된 연산자 
-- : IS NULL, IS NOT NULL

-- IS NULL: 비교하려 하는 컬럼의 값이 NULL 일때  true(참)
--          비교하려 하는 컬럼의 값이 NULL이 아니면 false (거짓)

-- IS NOT  NULL: 비교하려 하는 컬럼의 값이 NULL 이 아니면   true(참)
--               비교하려 하는 컬럼의 값이 NULL 일때 false (거짓)

-- NULL값을 가진 컬럼은 비교연산자(=,!=,<>) 와 연산이 불가능 하므로
-- NULL값 비교를 위한 연산자가 따로 존재함에 주의

-- col = NULL ==> NULL에 대해서는 = 동일비교 연산자를 사용 못함.
-- COL != NULL
-- COL <> NULL ==> NULL 에 대해서는 
--                      다름을 비교하는 연산자(!=,<>)를 사용 못함

-- 27) 상사(MGR) 가 지정되지 않은 직원의 사번,이름,상사사번(MGR) 조회

SELECT   e.empno
         ,e.ename
         ,e.mgr
FROM emp e
WHERE e.mgr = NULL -- NULL 데이터는 비교연산자로
                    -- 연산할 수 없는 값
;
-- 인출된 모든 행 : 0
-- 구문 실행이 되고, 구문에 오류가 없어도 올바른 결과가 아님
-- 

-- 상사(mgr)가 배정된 직원을 조회
SELECT  e.empno
        ,e.ename
        ,e.mgr
FROM emp e
WHERE e.mgr IS NOT NULL
-- e.mgr !=NULL / e.mgr <>NULL
-- 라고 쓸수 있음 써도 구문 오류는 없고 실행이 되는 것에 주의!
-- 비교 연산자 !=, <> 사용시 실행 결과는
-- 인출된 모든 행 : 0
-- 이런 경우 시행이 되기때문에 오류를 찾기 어렵다
-- NULL 데이터를 다룰 때 항상 주의해야 한다.
;
/*
EMPNO,   ENAME,   MGR
--------------------
7369	SMITH	7902
7499	ALLEN	7698
7521	WARD	7698
7566	JONES	7839
7654	MARTIN	7698
7698	BLAKE	7839
7782	CLARK	7839
7844	TURNER	7698
7900	JAMES	7698
7902	FORD	7566
7934	MILLER	7782
*/

-----------------------------------------------------
-- BETWEEN a AND b : 범위 포함 비교 연산자
-- a <= sal <=b : 이러한 범위 연산과 동일한 결과

-- 28)  급여가 500~ 1200 사이 직원의 
-- 사번,이름,급여 조회

SELECT e.empno
       ,e.ename
       ,e.sal
FROM emp e
WHERE e.sal BETWEEN 500 AND 1200
;
/*
EMPNO, ENAME, SAL
--------------------
7369	SMITH	800
7900	JAMES	950
*/

-- BETWEEN 500 AND 1200 같은 결과를 내는 비교 연산자로 변경

SELECT  e.empno
        ,e.ename
        ,e.sal 
FROM emp e
WHERE    e.sal >= 500 
AND  e.sal <=1200
;

/*
EMPNO, ENAME, SAL
---------------------
7369	SMITH	800
7900	JAMES	950
*/

-------------------------------

-- EXISTS 연산자 : 어떤 쿼리를 실행한 결과가
--                  1행 이상일 때 참으로 판단
--                   인출된 모든 행 : 0인경우  거짓으로 판단
--                    따라서 서브쿼리와 함께 사양됨. 

--29)  급여가 3000이 넘는 직원의 정보를 조회
--     

SELECT  e.empno
      ,e.ename
      ,e.sal
FROM emp e
WHERE e.sal > 3000 
;
--7839	KING	5000
-- 29-(1) 문제의 결과는 1행이 존재 (  EXISTS)

-- (2) 급여가 3000 이 넘는 직원이 1명이라도 있으면
-- 화면에 "급여가 3000이 넘는 직원이 존재합"
-- 이라는 메세지를 출력 하고 싶다.

SELECT '급여가 3000이 넘는 직원이 존재함' AS "시스템 메시지"
FROM dual   -- 1행만 데이터 있는 공용 테이블 
WHERE EXISTS ( SELECT   e.empno
                        ,e.ename
                        ,e.sal
                FROM emp e
                WHERE e.sal > 3000 ) 
;

/*
시스템메세지
-----------------------------
급여가 3000이 넘는 직원이 존재함
*/

-- oracle 에만 존재하는 dual 테이블
-- : 1행 1열의 데이터가 들어있는 공용 테이블
-- 1) dual 테이블의 테이블 구조를 확인

DESC dual;
-- 위의 DESC는 정렬의 키워드가 아닌 오라클의 명령어
-- 테이블의 구조를 확인하는 명령
-- Describe 의 약자 

/*
이름    널? 유형          
----- -- ----------- 
DUMMY    VARCHAR2(1) 
*/

SELECT dummy
FROM dual
;
/*
DUMMY
-----
X
*/

-- 급여가 10000이 넘는 직원이 없으면 
-- 화면에 급여가 10000이 넘는 직원이 존재하지 않음" 이라고 출력
-- 급여가 10000이 넘는 직원의 정보 조회

SELECT  e.empno
      ,e.ename
      ,e.sal
FROM emp e
WHERE e.sal > 10000 
;

--(2) 시스템 메세지를 출력할 수 있도록 쿼리 조합
SELECT '급여가 10000이 넘는 직원이 존재하지 않음' AS "시스템 메세지"
FROM dual 
WHERE NOT EXISTS (SELECT e.empno
                        ,e.ename
                        ,e.sal
                FROM emp e
                WHERE e.sal > 10000)
;
/*
시스템 메세지
---------------------------------
급여가 10000이 넘는 직원이 존재하지 않음
*/

-----------------------------------
-- (6) 연산자 : 결합연산자 (||)
-- 오라클에만 존재 문자열 결합
-- 다른 프로그래밍 언어 에서는
-- or 연산자로 사용되므로 혼동하면 안됨 

SELECT 'Hello~, SQL' AS greeting
FROM dual
;
/*
GREETING
-----------
Hello~, SQL
*/

SELECT '안녕하세요~, SQL' ||' 오라클에서 배우고 있어요!' AS greeting
FROM dual
;
--안녕하세요~, SQL 오라클에서 배우고 있어요!

-- dual 테이블 활용, 오늘의 날짜를 알려주는 문장
-- "오늘의 날짜는 0000입니다." 를 출력
SELECT '오늘의 날짜는'
        || sysdate ||'입니다.' AS "오늘의 날짜"
FROM dual
;

/* 오늘의 날짜
---------------------------
오늘의 날짜는19/05/17입니다.
*/
-- 날짜 출력 형식을 바꾸어 출력

-- 직원의 사번 알리미 만들고 싶다.
-- 직원의 사번을 알려주는 구문을 ||를 사용하여 작성

SELECT '안녕하세요.'  || e.ename  || '씨, 당신의 사번은'
                    || e.empno || '입니다.' AS "사번 알리미"
 FROM emp e
 ;
/*
사번 알리미
--------------------------------------
안녕하세요.SMITH씨, 당신의 사번은7369입니다.
안녕하세요.ALLEN씨, 당신의 사번은7499입니다.
안녕하세요.WARD씨, 당신의 사번은7521입니다.
안녕하세요.JONES씨, 당신의 사번은7566입니다.
안녕하세요.MARTIN씨, 당신의 사번은7654입니다.
안녕하세요.BLAKE씨, 당신의 사번은7698입니다.
안녕하세요.CLARK씨, 당신의 사번은7782입니다.
안녕하세요.KING씨, 당신의 사번은7839입니다.
안녕하세요.TURNER씨, 당신의 사번은7844입니다.
안녕하세요.JAMES씨, 당신의 사번은7900입니다.
안녕하세요.FORD씨, 당신의 사번은7902입니다.
안녕하세요.MILLER씨, 당신의 사번은7934입니다.
안녕하세요.J_JAMES씨, 당신의 사번은9999입니다.
안녕하세요.J%JAMES씨, 당신의 사번은8888입니다.
*/

-----------------------------------------
--(6) 연산자 6. 집합 연산자 
-- 첫번째 쿼리 : 부서테이블의 모든 정보 조회 

-- 1) UNION ALL : 중복허용한 합집합
SELECT d.deptno
      ,d.dname
      ,d.loc
      FROM dept d
      UNION ALL 
SELECT d.deptno
      ,d.dname
      ,d.loc
      FROM dept d
      WHERE d.deptno = 10
      ;
/*
DEPTNO, DNAME, LOC
---------------------------
10	ACCOUNTING	NEW YORK
20	RESEARCH	DALLAS
30	SALES	CHICAGO
40	OPERATIONS	BOSTON
10	ACCOUNTING	NEW YORK
*/

-- 2) UNION : 중복을 제거한 합집합

SELECT d.deptno
      ,d.dname
      ,d.loc
      FROM dept d
      UNION 
SELECT d.deptno
      ,d.dname
      ,d.loc
      FROM dept d
      WHERE d.deptno = 10
      ;
/*
DEPTNO, DNAME, LOC
-------------------------
10	ACCOUNTING	NEW YORK
20	RESEARCH	DALLAS
30	SALES	CHICAGO
40	OPERATIONS	BOSTON
*/


--3 ) INTERSECT : 중복된 데이터만 남김 

SELECT d.deptno
      ,d.dname
      ,d.loc
      FROM dept d
      INTERSECT
SELECT d.deptno
      ,d.dname
      ,d.loc
      FROM dept d
      WHERE d.deptno = 10
      ;
--        DEPTNO, DNAME, LOC
      -------------------------
-- 10	ACCOUNTING	NEW YORK

-- 4) MINUS : 첫번째 쿼리 실행결과에서
--             두번째 쿼리 실행결과를 뺀 차집합

SELECT d.deptno
      ,d.dname
      ,d.loc
      FROM dept d
      MINUS
SELECT d.deptno
      ,d.dname
      ,d.loc
      FROM dept d
      WHERE d.deptno = 10
      ;
/*
DEPTNO, DNAME,      LOC
--------------------------
20	    RESEARCH	DALLAS
30	    SALES	    CHICAGO
40	    OPERATIONS	BOSTON
*/
-- 주의 ! : 두 쿼리의 조회 결과의 컬럼의 갯수, 데이터 타입의 순서가 일치
--1) 오류상황: 첫 쿼리 컬럼 수 : 3
--              둘째쿼리 컬럼 수 :2 
SELECT d.deptno
      ,d.dname
      ,d.loc
      FROM dept d
      UNION ALL 
SELECT d.deptno
      ,d.dname
      
      FROM dept d
      WHERE d.deptno = 10
      ;

/*
ORA-01789: 질의 블록은 부정확한 수의 결과 열을 가지고 있습니다.
01789. 00000 -  "query block has incorrect number of result columns"
*Cause:    
*Action:
*/

-- 2) 오류상황 : 첫 쿼리는 컬럼이 문자, 순사 순서
                둘째 쿼리는 컬럼이 숫자, 문자 순서 

SELECT d.dname      -- 부서명 : 문자
      ,d.deptno         -- 부서번호 : 숫자
      
 FROM dept d
 UNION ALL 
SELECT d.deptno         -- 부서번호 : 숫자
      ,d.dname          -- 부서명 : 문자
FROM dept d
WHERE d.deptno = 10
      ;
/*
ORA-01790: 대응하는 식과 같은 데이터 유형이어야 합니다
01790. 00000 -  "expression must have same datatype as corresponding expression"
*Cause:    
*Action:
608행, 8열에서 오류 발생
*/

-- 집합 연산자는 서로 다른 테이블의 조회 결과도
-- 연산이 가능하다.
-- 첫번째 쿼리 : emp 테이블에서 조회
SELECT   e.empno    -- 숫자
        ,e.name     --문자
        ,e.job      --문자
FROM emp e 
;

-- 두번째 쿼리 : dept 테이블에서 조회
SELECT  d.deptno
        ,d.dname
        ,d.loc
FROM dept d 
;

-- 서로 다른 테이블에서 
-- (1) UNION 
SELECT   e.empno    -- 숫자
        ,e.ename     --문자
        ,e.job      --문자
FROM emp e 
UNION
SELECT  d.deptno     -- 숫자
        ,d.dname    --문자
        ,d.loc      --문자
FROM dept d 
;
/*
EMPNO, ENAME, JOB
-------------------------
7369	SMITH	CLERK
7499	ALLEN	SALESMAN
7521	WARD	SALESMAN
7566	JONES	MANAGER
7654	MARTIN	SALESMAN
7698	BLAKE	MANAGER
7782	CLARK	MANAGER
7839	KING	PRESIDENT
7844	TURNER	SALESMAN
7900	JAMES	CLERK
7902	FORD	ANALYST
7934	MILLER	CLERK
8888	J%JAMES	CLERK
9999	J_JAMES	CLERK
*/


-- (2) MINUS 차집합

SELECT   e.empno    -- 숫자
        ,e.ename     --문자
        ,e.job      --문자
FROM emp e 
    MINUS
SELECT  d.deptno     -- 숫자
        ,d.dname    --문자
        ,d.loc      --문자
FROM dept d 
;

/*
EMPNO, ENAME, JOB
-----------------------
7369	SMITH	CLERK
7499	ALLEN	SALESMAN
7521	WARD	SALESMAN
7566	JONES	MANAGER
7654	MARTIN	SALESMAN
7698	BLAKE	MANAGER
7782	CLARK	MANAGER
7839	KING	PRESIDENT
7844	TURNER	SALESMAN
7900	JAMES	CLERK
7902	FORD	ANALYST
7934	MILLER	CLERK
8888	J%JAMES	CLERK
9999	J_JAMES	CLERK
*/

-- (3) INSERT 차집합
SELECT   e.empno    -- 숫자
        ,e.ename     --문자
        ,e.job      --문자
FROM emp e 
    INTERSECT
SELECT  d.deptno     -- 숫자
        ,d.dname    --문자
        ,d.loc      --문자
FROM dept d 
;

--> 인출된 모든 행 : 0
-- 서로 다른 테이블의 데이터 조회 결과들을 가진 쿼리이므로
-- 중복된 데이터가 없으므로 교집합 결과가 1행도 없다.





