conn scott/tiger
alter session set events = '10046 trace name context forever, level 12';
alter session set optimizer_mode = rule;

select ename, grade from emp, salgrade where sal between losal and hisal;

select ename from emp where empno = 7900;

alter index pk_emp invisible;

select ename from emp where empno = 7900;

alter session set events = '10046 trace name context off';
alter index pk_emp visible;

exit
