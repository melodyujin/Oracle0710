0707
//scott �������� ��� ������ ������ ���� ���캸��
select * from dict;

//dual table�� ��� ����Ŭ �����ͺ��̽� ��ġ���� �⺻���� �����ϴ�
//�ѿ��� �̷���� �ӽ����̺��̴�
select * from dual;

//scott ������ ������ �ε��� ���� �˾ƺ���
select * from user_indexes;

//�� �����ϱ�(���)
create view vw_emp20
    as(select empno, ename, job, deptno
        from emp
        where deptno=20);
//������ �� Ȯ���ϱ�(���)
select * from user_views;
//������ �� ���� Ȯ���ϱ�(scott�������� �������� ��)
select view_name, text_length, text
    from user_views;
    
//������ �� ��ȸ�ϱ�
select * from vw_emp20;

//�μ� ��ȣ�� 30�� ����� ��� ���� ����ϴ� vm_emp30all�並 �ۼ��ϴ� sql��
create view vm_emp30all
    as (select *
        from emp
        where deptno=30);
select * from vm_emp30all;

//�ζ��� �並 ����� TOP-N SAL��
//ROWNUM�� �߰��� ��ȸ�ϱ�
select rownum, e.*
    from emp e;
    
//�ζ��� ��(�������� ���)
select rownum, e.*
    FROM (SELECT *
            FROM EMP E
            ORDER BY SAL DESC) E;
//�ζ��� ��(WITH�� ���)
WITH E AS (SELECT * FROM EMP ORDER BY SAL DESC)
SELECT ROWNUM, E.*
    FROM E;
    
//DEPT ���̺��� ����Ͽ� DEPT_SEQUENCE ���̺� �����ϱ�
CREATE TABLE DEPT_SEQUENCE
    AS SELECT *
        FROM DEPT
        WHERE 1 <>1;
        
SELECT * FROM DEPT_SEQUENCE;

//������ �����ϱ�
CREATE SEQUENCE SEQ_DEPT_SEQUENCE
    INCREMENT BY 10
    START WITH 10
    MAXVALUE 90
    MINVALUE 0
    NOCYCLE
    CACHE 2;

//������ ������ Ȯ���ϱ�
SELECT * FROM USER_SEQUENCES;

//���������� ������ ������ ����� INSERT�� �����ϱ�
INSERT INTO DEPT_SEQUENCE (DEPTNO, DNAME, LOC)
VALUES (SEQ_DEPT_SEQUENCE.NEXTVAL, 'DATABASE', 'SEOUL');

SELECT * FROM DEPT_SEQUENCE ORDER BY DEPTNO;

//���� ���������� ������ ������ Ȯ���ϱ�
SELECT SEQ_DEPT_SEQUENCE.CURRVAL
    FROM DUAL;
    
//���������� ������ ������ �ݺ� ����Ͽ� INSERT�� �����ϱ�
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
       
//DEPT ���̺��� ����Ͽ� DEPT_SEQUENCE ���̺� �����ϱ� 
CREATE TABLE DEPT_SEQUENCE
    AS SELECT * FROM DEPT
    WHERE 1 <> 1;

SELECT * FROM DEPT_SEQUENCE;

//������ ������ Ȯ���ϱ�
CREATE SEQUENCE SEQ_DEPT_SEQUENCE
    INCREMENT BY 10
    START WITH 10
    MAXVALUE 90
    MINVALUE 0
    NOCYCLE
    CACHE 2;
    
//������ ������ Ȯ���ϱ�
SELECT * FROM USER_SEQUENCES;

//���������� ������ ������ ����� INSERT�� �����ϱ�
INSERT INTO DEPT_SEQUENCE (DEPTNO, DNAME, LOC)
VALUES (SEQ_DEPT_SEQUENCE.NEXTVAL, 'DATABASE', 'SEOUL');

SELECT * FROM DEPT_SEQUENCE ORDER BY DEPTNO;

//���� ���������� ������ ������ Ȯ���ϱ�
SELECT SEQ_DEPT_SEQUENCE.CURRVAL 
    FROM DUAL;
    
//���������� ������ ������ �ݺ� ����Ͽ� INSERT�� �����ϱ�
INSERT INTO DEPT_SEQUENCE (DEPTNO, DNAME, LOC)
VALUES (SEQ_DEPT_SEQUENCE.NEXTVAL, 'DATABASE', 'SEOUL');

SELECT * FROM DEPT_SEQUENCE ORDER BY DEPTNO;

//������ �ɼ� �����ϱ�
ALTER SEQUENCE SEQ_DEPT_SEQUENCE
    INCREMENT BY 3
    MAXVALUE 99
    CYCLE;
    
//�ɼ� ������ ������ ��ȸ�ϱ�
SELECT * FROM USER_SEQUENCES;

//������ �������� ����Ͽ� INSERT�� �����ϱ�
INSERT INTO DEPT_SEQUENCE (DEPTNO, DNAME, LOC)
VALUES (SEQ_DEPT_SEQUENCE.NEXTVAL, 'DATABASE', 'SEOUL');

SELECT * FROM DEPT_SEQUENCE ORDER BY DEPTNO;

//CYCLE �ɼ��� ����� �������� �ִ� ���� �� ���� ��� Ȯ���ϱ�
INSERT INTO DEPT_SEQUENCE (DEPTNO, DNAME, LOC)
VALUES (SEQ_DEPT_SEQUENCE.NEXTVAL, 'DATABASE', 'SEOUL');

SELECT * FROM DEPT_SEQUENCE ORDER BY DEPTNO;





