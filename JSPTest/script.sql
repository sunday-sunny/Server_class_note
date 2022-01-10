create table tblJava (
    id varchar2(30) primary key,
    name varchar2(30) not null,
    age number not null,
    regdate date default sysdate not null
);

insert into tblJava(id, name, age, regdate) values ('hong', '홍길동', 20, default);

select * from tblJava;

commit;



-- 주소록
create table tblAddress (
    seq number primary key,
    name varchar2(30) not null,
    age number(3) not null,
    tel varchar2(15) not null,
    address varchar2(300) not null
);

create sequence seqAddress;

insert into tblAddress(seq, name, age, tel, address) 
                        values (seqAddress.nextVal, '홍길동', 20, '010-1234-5678', '서울시 강남구 역삼동');

insert into tblAddress(seq, name, age, tel, address) 
                        values (seqAddress.nextVal, '아무개', 25, '010-2222-2222', '서울시 강서구 화곡동');
                        
insert into tblAddress(seq, name, age, tel, address) 
                        values (seqAddress.nextVal, '호호호', 27, '010-3333-3333', '서울시 강동구 천호동');

update tbladdress 
set name = '호호호', age = 27, tel = '010-1111-2222', address = '서울시 서대문구 불광동'
where seq = 3;

delete from tblAddress where seq = 2;

select * from tbladdress;

commit;

