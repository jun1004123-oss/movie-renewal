drop table gc_giftcode;
drop sequence gc_giftcode_seq;
create sequence gc_giftcode_seq;

create table gc_giftcode(
code_id number(10) not null primary key,
store_id number(10) not null,
supply number(1) not null,
code_name varchar2(1000 CHAR) not null,
startdate date not null,
enddate date not null
);

insert into gc_giftcode VALUES(gc_giftcode_seq.nextval,36,5,'gift-1234567891011121314151617181920',TO_DATE(SYSDATE,'yyyy-mm-dd'),TO_DATE(ADD_MONTHS(SYSDATE,6),'yyyy-mm-dd'));
commit;
select s.title, s.subtitle,g.SUPPLY, s.content, s.img_file, g.code_name, g.startdate, g.enddate 
from gc_store s inner join gc_giftcode g
on s.store_id = g.store_id;
select * from gc_giftcode;