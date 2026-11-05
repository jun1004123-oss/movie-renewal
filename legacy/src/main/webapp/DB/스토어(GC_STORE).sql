drop sequence gc_store_seq;
drop table gc_store;

create sequence gc_store_seq;
/*스토어 테이블 생성*/
create table gc_store(
store_id number(10) not null primary key,
type VARCHAR2(50) not null,
title varchar2(50) not null,
subtitle varchar2(100),
content varchar2(1000),
img_file varchar2(100),
price number(10) not null
);
/*팝콘*/
insert into gc_store values(gc_store_seq.nextval,'popcorn','팝콘','오리지널(대)','고소팝콘(대)
달콤한 맛이 부담스러운 분들께는 제격인 맛!
연인과 함께 넉넉하게 즐기는 사이즈!
2인~4인 온가족까지도 즐길수 있는 사이즈!','Popcorn_L.png',6000);
insert into gc_store values(gc_store_seq.nextval,'popcorn','팝콘','어니언(대)','쉐이크 팝콘 어이언맛(대)
새로운 맛을 찾고 있는 분들에게 강력 추천!
오직 가온시네마에서만 즐길 수 있는 어디에도 없는 팝콘!','Popcorn_L2.png',7000);
insert into gc_store values(gc_store_seq.nextval,'popcorn','팝콘','베이컨(대)','쉐이크 팝콘 베이컨맛(대)
새로운 맛을 찾고 있는 분들에게 강력 추천!
오직 가온시네마에서만 즐길 수 있는 어디에도 없는 팝콘!','Popcorn_L3.png',7000);
insert into gc_store values(gc_store_seq.nextval,'popcorn','팝콘','치즈(대)','
쉐이크 팝콘 체다치즈맛(대)
새로운 맛을 찾고 있는 분들에게 강력 추천!
오직 가온시네마에서만 즐길 수 있는 어디에도 없는 팝콘!','Popcorn_L4.png',7500);
insert into gc_store values(gc_store_seq.nextval,'popcorn','팝콘','매운카레(대)','쉐이크 팝콘 핫커리맛(대)
새로운 맛을 찾고 있는 분들에게 강력 추천!
오직 가온시네마에서만 즐길 수 있는 어디에도 없는 팝콘!','Popcorn_L5.png',6500);
insert into gc_store values(gc_store_seq.nextval,'popcorn','팝콘','캬라멜(대)','캬라멜팝콘(대)
입에서 사르르 녹는 달콤한 시럽의 맛과 팝콘의 고소한 맛을 입안에서 동시에 즐길 수 있습니다.
2~4인까지 즐길 수 있는 넉넉한 사이즈!','Popcorn_L6.png',8000);
insert into gc_store values(gc_store_seq.nextval,'popcorn','팝콘','오리지널(중)','고소팝콘(중)
달콤한 맛이 부담스러운 분들께는 제격인 맛!
온라인 매점에서 구매하고 현장에서 바로 받아보실 수 있습니다. 영화를 보는 내내 고소한 맛을 즐길 수 있습니다!!','Popcorn_L7.png',4000);
commit;
/*음료*/
insert into gc_store values(gc_store_seq.nextval,'drink','콜라','(대)','온라인 매점 음료 - 콜라
큰 사이즈로 2인 이상 충분히 즐길 수 있는 양입니다.
고소한 팝콘과 함께 즐기면 훨씬 즐겁겠죠?','coke_L.png',2500);
insert into gc_store values(gc_store_seq.nextval,'drink','스프라이트','(대)','온라인 매점 음료 - 사이다
큰 사이즈로 2인 이상 충분히 즐길 수 있는 양입니다.
달콤+고소 트윈 팝콘과 함께 즐기면 훨씬 즐겁겠죠?','cider_L.png',2500);
insert into gc_store values(gc_store_seq.nextval,'drink','포도환타','(대)','온라인 매점 음료 - 포도환타
큰 사이즈로 2인 이상 충분히 즐길 수 있는 양입니다.
고소한 팝콘과 함께 즐겨 보세요, 포도향이 입안에서 팝콘과 잘 어울립니다.','Fanta_Grape_L.png',2500);
insert into gc_store values(gc_store_seq.nextval,'drink','오렌지환타','(대)','온라인 매점 음료 - 오렌지환타
큰 사이즈로 2인 이상 충분히 즐길 수 있는 양입니다.
라이스 팝과 함께 즐겨 보세요, 오렌지 환타를 더 맛있게 즐길 수 있습니다.','Fanta_orange_L.png',2500);
insert into gc_store values(gc_store_seq.nextval,'drink','콜라제로','(대)','온라인 매점 음료 - 콜라제로
큰 사이즈로 2인 이상 충분히 즐길 수 있는 양입니다.
다이어트 콜라! 칼로리 제로!','coke_zero_L.png',2500);
insert into gc_store values(gc_store_seq.nextval,'drink','자몽 에이드','(대)','온라인 매점 음료 - 자몽 에이드
중간 사이즈로 혼자 찾는 관객에게는 제격!
달콤 팝콘, 맛밤, 나쵸와 함께 즐겨보세요','ade2.png',2500);
insert into gc_store values(gc_store_seq.nextval,'drink','오렌지 에이드','(대)','온라인 매점 음료 - 오렌지 에이드
중간 사이즈로 혼자 찾는 관객에게는 제격!
달콤 팝콘, 맛밤, 나쵸와 함께 즐겨보세요','ade2.png',2500);

insert into gc_store values(gc_store_seq.nextval,'drink','콜라','(중)','온라인 매점 음료 - 콜라
중간 사이즈로 혼자 찾는 관객에게는 제격!
나쵸, 맛밤, 핫도그와 함께 즐겨보세요','coke_M.png',2500);
insert into gc_store values(gc_store_seq.nextval,'drink','스프라이트','(중)','온라인 매점 음료 - 사이다
중간 사이즈로 혼자 찾는 관객에게는 제격!
나쵸, 맛밤, 핫도그와 함께 즐겨보세요','cider_M.png',2500);
insert into gc_store values(gc_store_seq.nextval,'drink','포도환타','(중)','온라인 매점 음료 - 사이다
중간 사이즈로 혼자 찾는 관객에게는 제격!
나쵸, 맛밤, 핫도그와 함께 즐겨보세요','Fanta_Grape_M.png',2500);
insert into gc_store values(gc_store_seq.nextval,'drink','오렌지환타','(중)','온라인 매점 음료 - 사이다
중간 사이즈로 혼자 찾는 관객에게는 제격!
나쵸, 맛밤, 핫도그와 함께 즐겨보세요','Fanta_orange_M.png',2500);
insert into gc_store values(gc_store_seq.nextval,'drink','콜라제로','(중)','온라인 매점 음료 - 사이다
중간 사이즈로 혼자 찾는 관객에게는 제격!
나쵸, 맛밤, 핫도그와 함께 즐겨보세요','coke_zero_M.png',2500);
commit;
/*스낵*/
insert into gc_store values(gc_store_seq.nextval,'snack','핫도그','기본','핫도그
따뜻하고 부드러운 빵사이에 있는 소시지와 머스타드 소스와 캐첩의 어울림!
한끼 식사로 충분합니다.','hotdog_basic.png',3500);
insert into gc_store values(gc_store_seq.nextval,'snack','오징어','오징어','땅콩 버터 오징어
땅콩의 고소함과 버터향이 어울리는 건조 오징어.
영화를 보며 입이 심심할때는 오징어만한 것이 없습니다!
콜라 음료와 즐겨보세요!!','ojing.png',3000);
insert into gc_store values(gc_store_seq.nextval,'snack','즉석버터구이오징어','(몸통)','즉석버터구이오징어(몸통)','ojing2.png',4000);
insert into gc_store values(gc_store_seq.nextval,'snack','즉석버터구이오징어','(다리)','즉석버터구이오징어(다리) 
콜라 음료와 즐겨보세요!!','ojing3.png',4000);
insert into gc_store values(gc_store_seq.nextval,'snack','칠리치즈나쵸','소스 2개','칠리치즈나쵸
나쵸와 칠리치즈 소스의 환상 궁합을 느껴보세요!','nacho.png',4000);
insert into gc_store values(gc_store_seq.nextval,'snack','맛밤','기본','이미 시중에 인기중인 CJ 맛밤
온라인 매점에서도 선 구매가 가능하며 극장 매장에서 수령하실 수 있습니다.
한 입에 하나씩 쏙쏙!! 고소한 맛을 느껴보세요','bam.png',3000);
commit;
/*콤보세트*/
insert into gc_store values(gc_store_seq.nextval,'combo','쉐이크콤보','팝콘(대)1 음료(중)2 시즈닝 4가지 중 택1','콤보 구성 : 팝콘(대)1 음료(중)2 시즈닝 4가지 중 택1 ( 체다치즈, 핫커리, 어니언, 베이컨) 7가지 시즈닝으로 내 취향에 맞게 선택해서 흔들 어먹는 CGV만의 신개념 팝콘','combo1.png',8500);
insert into gc_store values(gc_store_seq.nextval,'combo','Gaon 콤보','팝콘(대)1 + 음료(중)2','
콤보 구성 : 팝콘(대)1 + 음료(중) 2
콤보 중의 베스트셀러 상품 CGV콤보!
온라인매점에서 500원 더 저렴하게~!','combo2.png',8000);
insert into gc_store values(gc_store_seq.nextval,'combo','즉석버터구이콤보','팝콘(대)1 + 음료(중)2 + 즉석버터구이오징어','
콤보 구성 : 팝콘(대)1+음료(중)2+즉석버터구이오징어
온라인매점에서 500원 더 저렴하게~!','combo3.png',10500);
insert into gc_store values(gc_store_seq.nextval,'combo','오징어콤보','팝콘(대)1 + 음료(중)2 + 오징어(완제품)','콤보 구성 : 팝콘(대)1+음료(중)2+오징어(완제품)
온라인매점에서 500원 더 저렴하게~!','combo4.png',9500);
insert into gc_store values(gc_store_seq.nextval,'combo','칠리치즈나쵸콤보','팝콘(대)1+음료(중)2+칠리치즈나쵸','콤보 구성 : 팝콘(대)1+음료(중)2+칠리치즈나쵸
온라인 매점에서 500원 더 저렴하게~!','combo5.png',8000);
insert into gc_store values(gc_store_seq.nextval,'combo','패밀리콤보','팝콘(중)2+음료(중)2+칠리치즈나쵸+오징어(완제품)','콤보 구성 : 팝콘(중)2+음료(중)2+칠리치즈나쵸+오징어(완제품)
온라인 매점에서 500원 더 저렴하게~!','combo6.png',14000);
insert into gc_store values(gc_store_seq.nextval,'combo','핫도그콤보','팝콘(중)1+음료(중)2+핫도그','콤보 구성 : 팝콘(중)1+음료(중)2+핫도그
온라인 매점에서 500원 더 저렴하게~!','combo7.png',10000);
insert into gc_store values(gc_store_seq.nextval,'combo','에이드 콤보','팝콘(대)1 + 에이드(중)2','콤보 구성 : 팝콘(대)1 + 에이드(중)2','combo8.png',9000);
commit;
/*영화관람권*/
insert into gc_store values(gc_store_seq.nextval,'gift','Gaon 영화관람권','기프트콘','영화관람권이 MMS 기프트콘으로 전송이 됩니다.
수령하신 MMS는 온라인으로 예매하거나, 극장 매표소에서 사용하실 수 있습니다.','gift1.png',9000);
insert into gc_store values(gc_store_seq.nextval,'gift','Gaon 3D관람권','기프트콘','영화관람권이 MMS 기프트콘으로 전송이 됩니다.
수령하신 MMS는 온라인으로 예매하거나, 극장 매표소에서 사용하실 수 있습니다.
전국 Gaon 일반상영관에서 상영하는 3D 영화 중 1편을 선택하여 관람하실 수 있습니다.','gift2.png',12000);
insert into gc_store values(gc_store_seq.nextval,'gift','Gaon IMAX관람권','기프트콘','영화관람권이 MMS 기프트콘으로 전송이 됩니다.
수령하신 MMS는 온라인으로 예매하거나, 극장 매표소에서 사용하실 수 있습니다.
Gaon IMAX에서 상영하는 IMAX 영화 중 1편을 선택하여 관람하실 수 있습니다.','gift3.png',15000);
commit;
select * from gc_store;
