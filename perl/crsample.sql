conn scott/tiger
alter session set events = '10046 trace name context forever, level 12';
alter session set optimizer_mode = rule;
variable empno number
variable ename varchar2(10)
variable job varchar2(10)

begin
   :empno := 7900;
   :ename := 'JAMES';
   :job   := 'CLERK';
end;
/

select sal, grade from emp, salgrade where empno = :empno and ename = :ename and job = :job
and ename = :ename and job = :job
and sal between losal and hisal;

exit
