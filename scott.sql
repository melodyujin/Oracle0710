0707
//scott 계정에서 사용 가능한 데이터 사전 살펴보기
select * from dict;

//dual table은 모든 오라클 데이터베이스 설치본에 기본으로 존재하는
//한열로 이루어진 임시테이블이다
select * from dual;

//scott 계정이 소유한 인덱스 정보 알아보기
select * from user_indexes;

//뷰 생성하기(토드)
create view vw_emp20
    as(select empno, ename, job, deptno
        from emp
        where deptno=20);
//생성한 뷰 확인하기(토드)
select * from user_views;
//생성한 뷰 내용 확인하기(scott계정으로 접속했을 때)
select view_name, text_length, text
    from user_views;
    
//생성한 뷰 조회하기
select * from vw_emp20;

//부서 번호가 30인 사원의 모든 열을 출력하는 vm_emp30all뷰를 작성하는 sql문
create view vm_emp30all
    as (select *
        from emp
        where deptno=30);
select * from vm_emp30all;

//인라인 뷰를 사용한 TOP-N SAL문
//ROWNUM을 추가로 조회하기
select rownum, e.*
    from emp e;
    
//인라인 뷰(서브쿼리 사용)
select rownum, e.*
    FROM (SELECT *
            FROM EMP E
            ORDER BY SAL DESC) E;
//인라인 뷰(WITH절 사용)
WITH E AS (SELECT * FROM EMP ORDER BY SAL DESC)
SELECT ROWNUM, E.*
    FROM E;
    
//DEPT 테이블을 사용하여 DEPT_SEQUENCE 테이블 생성하기
CREATE TABLE DEPT_SEQUENCE
    AS SELECT *
        FROM DEPT
        WHERE 1 <>1;
        
SELECT * FROM DEPT_SEQUENCE;

//시퀀스 생성하기
CREATE SEQUENCE SEQ_DEPT_SEQUENCE
    INCREMENT BY 10
    START WITH 10
    MAXVALUE 90
    MINVALUE 0
    NOCYCLE
    CACHE 2;

//생성한 시퀀스 확인하기
SELECT * FROM USER_SEQUENCES;

//시퀀스에서 생성한 순번을 사용한 INSERT문 실행하기
INSERT INTO DEPT_SEQUENCE (DEPTNO, DNAME, LOC)
VALUES (SEQ_DEPT_SEQUENCE.NEXTVAL, 'DATABASE', 'SEOUL');

SELECT * FROM DEPT_SEQUENCE ORDER BY DEPTNO;

//가장 마지막으로 생성된 시퀀스 확인하기
SELECT SEQ_DEPT_SEQUENCE.CURRVAL
    FROM DUAL;
    
//시퀀스에서 생성한 순번을 반복 사용하여 INSERT문 실행하기
INSERT INTO DEPT_SEQUENCE (DEPTNO, DNAME, LOC)
VALUES (SEQ_DEPT_SEQUENCE.NEXTVAL, 'DATABASE', 'SEOUL');

SELECT * FROM DEPT_SEQUENCE ORDER BY DEPTNO;

0710

INSERT INTO EMP(EMPNO, ENAME, JOB,MGR,HIREDATE)
VALUES((SELECT NVL(MAX(EMPNO),0)+1 FROM EMP),
    'GENT', 'CLERK', 7839, TRUNC(SYSDATE));
    
SELECT * FROM EMP;

CREATE SEQUENCE EMP_SEQ
    INCREMENT BY 1
    START WITH 1
    MINVALUE 1
    MAXVALUE 9999
    NOCYCLE
    NOCACHE
    NOORDER;
    
INSERT INTO EMP
    VALUES (EMP_SEQ.NEXTVAL
        ,'TIGER'
        ,'ANALYST'
        ,7566
        ,TRUNC(SYSDATE)
        ,3000
        ,NULL
        ,20);
    
INSERT INTO EMP
    VALUES (EMP_SEQ.NEXTVAL
        ,'LION'
        ,'ANALYST'
        ,7566
        ,TRUNC(SYSDATE)
        ,3000
        ,NULL
        ,20);

SELECT EMP_SEQ.NEXTVAL FROM DUAL;

CREATE SEQUENCE EMP_SEQ2
       INCREMENT BY -1
       START WITH 1000
       MINVALUE 1
       MAXVALUE 1000
       NOCYCLE
       NOCACHE
       NOORDER;
       
INSERT INTO EMP
    VALUES (EMP_SEQ2.NEXTVAL
        ,'RABBIT'
        ,'ANALYST'
        ,7566
        ,TRUNC(SYSDATE)
        ,3000
        ,NULL
        ,20);
       
//DEPT 테이블을 사용하여 DEPT_SEQUENCE 테이블 생성하기 
CREATE TABLE DEPT_SEQUENCE
    AS SELECT * FROM DEPT
    WHERE 1 <> 1;

SELECT * FROM DEPT_SEQUENCE;

//생성한 시퀀스 확인하기
CREATE SEQUENCE SEQ_DEPT_SEQUENCE
    INCREMENT BY 10
    START WITH 10
    MAXVALUE 90
    MINVALUE 0
    NOCYCLE
    CACHE 2;
    
//생성한 시퀀스 확인하기
SELECT * FROM USER_SEQUENCES;

//시퀀스에서 생성한 순번을 사용한 INSERT문 실행하기
INSERT INTO DEPT_SEQUENCE (DEPTNO, DNAME, LOC)
VALUES (SEQ_DEPT_SEQUENCE.NEXTVAL, 'DATABASE', 'SEOUL');

SELECT * FROM DEPT_SEQUENCE ORDER BY DEPTNO;

//가장 마지막으로 생성된 시퀀스 확인하기
SELECT SEQ_DEPT_SEQUENCE.CURRVAL 
    FROM DUAL;
    
//시퀀스에서 생성한 순번을 반복 사용하여 INSERT문 실행하기
INSERT INTO DEPT_SEQUENCE (DEPTNO, DNAME, LOC)
VALUES (SEQ_DEPT_SEQUENCE.NEXTVAL, 'DATABASE', 'SEOUL');

SELECT * FROM DEPT_SEQUENCE ORDER BY DEPTNO;

//시퀀스 옵션 수정하기
ALTER SEQUENCE SEQ_DEPT_SEQUENCE
    INCREMENT BY 3
    MAXVALUE 99
    CYCLE;
    
//옵션 수정한 시퀀스 조회하기
SELECT * FROM USER_SEQUENCES;

//수정한 시퀀스를 사용하여 INSERT문 실행하기
INSERT INTO DEPT_SEQUENCE (DEPTNO, DNAME, LOC)
VALUES (SEQ_DEPT_SEQUENCE.NEXTVAL, 'DATABASE', 'SEOUL');

SELECT * FROM DEPT_SEQUENCE ORDER BY DEPTNO;

//CYCLE 옵션을 사용한 시퀀스의 최댓값 도달 후 수행 결과 확인하기
INSERT INTO DEPT_SEQUENCE (DEPTNO, DNAME, LOC)
VALUES (SEQ_DEPT_SEQUENCE.NEXTVAL, 'DATABASE', 'SEOUL');

SELECT * FROM DEPT_SEQUENCE ORDER BY DEPTNO;





