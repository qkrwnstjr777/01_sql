-- SQL day 03: 
-- WHERE ������ 

-- * SQL SELECT ������ �۵� ���� :
-- >> ���̺�(FROM ���� ������)�� �� ���� �⺻ ������ �����Ѵ�.
-- >> ���̺� ���� ������ŭ �ݺ� �����Ѵ�.
-- ���� ������ ���� ������ �����Ѵٸ� ����� ��� �ɱ�
SELECT 'HELLO, SQL~'  -- �÷����� �ƴ� ������ ���� ��ȸ�ϸ� ��� �ǳ�
FROM emp
;
/*
'HELLO,SQL~'
-------------
HELLO, SQL~
HELLO, SQL~
HELLO, SQL~
HELLO, SQL~
HELLO, SQL~
HELLO, SQL~
HELLO, SQL~
HELLO, SQL~
HELLO, SQL~
HELLO, SQL~
HELLO, SQL~
HELLO, SQL~
*/
-- 16) 

SELECT 'HELLO, SQL~'  AS greeting 
    ,empno
    ,ename
FROM emp
;
/*
'HELLO,SQL~', EMPNO, ENAME
----------------------------
HELLO, SQL~	7369	SMITH
HELLO, SQL~	7499	ALLEN
HELLO, SQL~	7521	WARD
HELLO, SQL~	7566	JONES
HELLO, SQL~	7654	MARTIN
HELLO, SQL~	7698	BLAKE
HELLO, SQL~	7782	CLARK
HELLO, SQL~	7839	KING
HELLO, SQL~	7844	TURNER
HELLO, SQL~	7900	JAMES
HELLO, SQL~	7902	FORD
HELLO, SQL~	7934	MILLER
*/
/*
GREETING, EMPNO, ENAME
---------------------------
HELLO, SQL~	7369	SMITH
HELLO, SQL~	7499	ALLEN
HELLO, SQL~	7521	WARD
HELLO, SQL~	7566	JONES
HELLO, SQL~	7654	MARTIN
HELLO, SQL~	7698	BLAKE
HELLO, SQL~	7782	CLARK
HELLO, SQL~	7839	KING
HELLO, SQL~	7844	TURNER
HELLO, SQL~	7900	JAMES
HELLO, SQL~	7902	FORD
HELLO, SQL~	7934	MILLER
*/

-- WHERE ������
-- 16) emp ���̺����� empno �� 7900�� �����
-- ���,�̸�,����,�Ի���,�޿�,�μ���ȣ�� ��ȸ 

SELECT EMPNO
     e,ENAME
     e,JOB
    e,HIREDATE
    e,SAL
    e,DEPTNO
FROM emp e
WHERE e.empno = 7900
;

--17) emp ���̺����� empno �� 7900 �̰ų� deptno �� 20�� ������
-- ���,�̸�,����,�Ի���,�޿�,�μ���ȣ�� ��ȸ�Ͻÿ�
SELECT e.empno
    ,e.ename
    ,e.job
    ,e.hiredate
    ,e.sal
    ,e.deptno
  FROM emp e
WHERE e.empno = 7900
OR e.deptno = 20
;
/*
EMPNO, ENAME, JOB, HIREDATE, SAL, DEPTNO
----------------------------------------
7900	JAMES	CLERK	81/12/03	950	30
*/
/*
EMPNO, ENAME,   JOB, HIREDATE, SAL, DEPTNO
----------------------------------------
7369	SMITH	CLERK	80/12/17	800	    20
7566	JONES	MANAGER	81/04/02	2975	20
7900	JAMES	CLERK	81/12/03	950	    30
7902	FORD	ANALYST	81/12/03	3000	20
*/

-- 18) 17���� ��ȸ ����(empno �� 7900, deptno�� 20)�� and�� ����
-- ��ȸ�غ���.
-- EMP ���̺����� EMPNO�� 7900�̰� DEPTNO�� 20�� ������ 
-- ���,�̸�,����,�Ի���,�޿�,�μ���ȣ�� ��ȸ�Ͻÿ�.

SELECT empno
    ,e.ename
    ,e.job
    ,e.hiredate
    ,e.sal
    ,e.deptno
    FROM emp e
WHERE e.EMPNO = 7900
    AND e.DEPTNO = 20
;
-- ����� ��� �� : 0
-- >> WHERE ���� ���� �����ϴ� ���� emp ���̺��� �������� �����Ƿ�
-- ��ȸ�� ���� 1�ǵ� ������ �ǹ�. ���� ����� �ƴԿ� ����
-- ���� SELECT ���� ������ �÷����� �����ϴ� ����� Ȯ��

-- 19) job�� 'CLERK' �̸鼭 deptno �� 10�� ������
-- ���,�̸�,����,�μ���ȣ�� ��ȸ�Ͻÿ�.
-- ���ǿ� ���ڿ� �񱳰� ���� ����
SELECT e.empno
     ,e.ename   
     ,e.job
     ,e.deptno
FROM emp e
WHERE  e.job = 'CLERK'  -- ���ڰ� �񱳽ÿ��� �ݵ�� �� ���ڸ� ''�� ���Ѵ�
  AND e.deptno = 10  -- ���ڰ� �񱳽ÿ��� ����ǥ ��� ����
;
/*
EMPNO, ENAME,   JOB,   HIREDATE
---------------------------------
7934	MILLER	CLERK	82/01/23
*/
SELECT e.empno
     ,e.ename   
     ,e.job
     ,e.deptno
FROM emp e
WHERE  e.job = 'CLERK'  -- ���ڰ� �񱳽ÿ��� �ݵ�� �� ���ڸ� ''�� ���Ѵ�
  AND e.deptno = 10  -- ���ڰ� �񱳽ÿ��� ����ǥ ��� ����
;

-- ����� ��� ��: 0
-- >> CLERK �̶�� ���� �����Ϳ� �������� �����Ƿ�
-- CLERK ���� �����ϴ� �����Ϳ� ��ҹ��ڰ� ��ġ���� ������
-- �ٸ� ������ ó���Ѵ�.

-- (6) ������ : 1.��������� 
-- (21) EMP ���̺�����
-- ���,�̸�,�޿��� ��ȸ�ϰ�
-- �޿��� 3.3% �� �ش��ϴ� ��õ¡�� ������ ����Ͽ� ��ȸ�Ͻÿ�.

-- ���� ���ɾ׿� �ش��ϴ� 96.7%�� �޿��� ����Ͽ� ��ȸ

SELECT e.empno
       ,e.ename
       ,e.sal
       ,e.sal * 0.033 tax 
       ,e.sal * 0.967 "REAL SAL"
FROM emp e
;
/*
EMPNO, ENAME,    SAL,      TAX,    REAL SAL
-------------------------------------
7369	SMITH	800	    26.4	773.6
7499	ALLEN	1600	52.8	1547.2
7521	WARD	1250	41.25	1208.75
7566	JONES	2975	98.175	2876.825
7654	MARTIN	1250	41.25	1208.75
7698	BLAKE	2850	94.05	2755.95
7782	CLARK	2450	80.85	2369.15
7839	KING	5000	165	    4835
7844	TURNER	1500	49.5	1450.5
7900	JAMES	950	    31.35	918.65
7902	FORD	3000	99	    2901
7934	MILLER	1300	42.9	1257.1
*/








