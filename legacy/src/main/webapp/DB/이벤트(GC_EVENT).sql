DROP TABLE GC_EVENT; 
DROP SEQUENCE GC_EVENT_SEQ;

/* GC_EVENT 테이블 (이벤트) 완료*/
CREATE TABLE GC_EVENT (
  EVENT_ID NUMBER(10)          NOT NULL PRIMARY KEY,  --EVENT 고유키
  TITLE    VARCHAR2(30 CHAR)   NOT NULL,              --제목
  CONTENTS VARCHAR2(3000 CHAR) NOT NULL,              --내용
  POSTER   VARCHAR2(100 CHAR)  NOT NULL,              --포스터
  IMG      VARCHAR2(100 CHAR)  NOT NULL,              --내용이미지
  WDATE    DATE                NOT NULL,              --작성일
  E_Start   DATE		           NOT NULL,              --시작일
  E_END	   DATE		           NOT NULL              --종료일
);

CREATE SEQUENCE GC_EVENT_SEQ;


insert into gc_event values(gc_event_seq.nextval, '메트 오페라 패키지 관람권 출시', '멋있는 메트오페라 관람권 뭔지 모르지만 고급스러운 이벤트', 'poster01.jpg', 'img01.jpg', to_date('2016/01/10'), to_date('2016/01/10'), to_date('2016/04/16') );
insert into gc_event values(gc_event_seq.nextval, '시네프랑스 예매 경품 이벤트', '뭔가 있어보이는 프랑스를 이용한 이벤트', 'poster02.jpg', 'img02.jpg', to_date('2016/01/12'), to_date('2016/02/12'), to_date('2016/05/16') );
insert into gc_event values(gc_event_seq.nextval, '쿵푸팬더 콤포 세트 이벤트', '영화도 보고 싶고 장난감도 갖고 싶은 욕심 많은 자녀들을 위한 이벤트', 'poster03.jpg', 'img03.jpg', to_date('2016/01/14'), to_date('2016/01/14'), to_date('2016/06/16') );
insert into gc_event values(gc_event_seq.nextval, '병신년 이벤트', '새해 복 많이 받으세요 병신년', 'poster04.jpg', 'img04.jpg', to_date('2016/01/01'), to_date('2016/01/01'), to_date('2017/04/16') );
insert into gc_event values(gc_event_seq.nextval, '위대한 할인', '위대한 할인 이벤트 받아가세요', 'poster05.jpg', 'img05.jpg', to_date('2015/10/01'), to_date('2015/10/01'), to_date('2016/01/16') );
insert into gc_event values(gc_event_seq.nextval, '풍경으로 보는 인상주의', '위대한 할인 이벤트 받아가세요', 'poster06.jpg', 'img06.jpg', to_date('2016/02/01'), to_date('2016/02/01'), to_date('2018/10/01') );
insert into gc_event values(gc_event_seq.nextval, '<쇼생크 탈출> 금요일 시사회', '위대한 할인 이벤트 받아가세요', 'poster08.jpg', 'img08.jpg', to_date('2016/02/03'), to_date('2015/02/03'), to_date('2015/07/01') );
insert into gc_event values(gc_event_seq.nextval, '드레스메이커 경품 이벤트', '위대한 할인 이벤트 받아가세요', 'poster09.jpg', 'img09.jpg', to_date('2016/02/03'), to_date('2016/02/03'), to_date('2018/07/01') );


COMMIT;