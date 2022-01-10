create table tblJava (
    id varchar2(30) primary key,
    name varchar2(30) not null,
    age number not null,
    regdate date default sysdate not null
);

insert into tblJava(id, name, age, regdate) values ('hong', '홍길동', 20, default);

select * from tblJava;

commit;