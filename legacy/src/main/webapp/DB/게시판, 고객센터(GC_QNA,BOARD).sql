
ALTER TABLE GC_BOARD_REPLY drop CONSTRAINT BOARD_REPLY_FK;
ALTER TABLE GC_QNA_REPLY drop CONSTRAINT QNA_REPLY_FK;

DROP TABLE GC_BOARD_REPLY;
DROP TABLE GC_BOARD; 
DROP SEQUENCE GC_BOARD_SEQ;
DROP TABLE GC_QNA_REPLY;
DROP TABLE GC_QNA; 
DROP SEQUENCE GC_QNA_REPLY_SEQ;
DROP SEQUENCE GC_QNA_SEQ;

COMMIT;


/* GC_QNA 테이블 (고객센터) */
CREATE TABLE GC_QNA (
  QNA_ID   NUMBER(10)          NOT NULL PRIMARY KEY,  --QNA 고유키
  USERID   VARCHAR2(12 CHAR)   NOT NULL,              --사용자 아이디
  TITLE    VARCHAR2(30 CHAR)   NOT NULL,              --제목
  CONTENTS VARCHAR2(3000 CHAR) NOT NULL,              --내용
  WDATE    DATE                NOT NULL,              --작성일
  COUNT    NUMBER(10)          NOT NULL               --조회수  
);
CREATE SEQUENCE GC_QNA_SEQ;

insert into GC_QNA values(GC_QNA_SEQ.nextval,'후레쉬맨',
'맨시리즈는..','바이오맨 우뢰맨짱', 
to_date('2016/02/17'), 77);

insert into GC_QNA values(GC_QNA_SEQ.nextval,'스포주의',
'검사외전 후기','그냥 그래요', 
to_date('2016/02/13'), 37);

insert into GC_QNA values(GC_QNA_SEQ.nextval,'포크',
'붐!바!스!틱!','붐 ! 바 ! 스 ! 틱 ! 붐붐붐 !!!!나 댄스학원 등록하러 감. 본 사람은 알 듯 ㅋㅋ', 
to_date('2016/02/03'), 30);

insert into GC_QNA values(GC_QNA_SEQ.nextval,'모히또',
'몰디브 한잔 할까','이병헌의 능청 연기가 일품입니다', 
to_date('2016/02/18'), 25);

insert into GC_QNA values(GC_QNA_SEQ.nextval,'쿵푸 퐈이어',
'평론가들의 평가보다는','평론가들의 평가를 보고 큰 기대를 안해서 그랬던 건지 모르겠지만 나름 재미있었음', 
to_date('2016/02/03'), 87);

insert into GC_QNA values(GC_QNA_SEQ.nextval,'먼저가',
'히말라야 감동 그자체','실화를 바탕으로 제작한 히말라야 대박 조짐!', 
to_date('2016/02/03'), 47);

insert into GC_QNA values(GC_QNA_SEQ.nextval,'불꽃남자',
'검사외전 시사회 당첨 후기','강동원의 춤추는장면, 키스신 찍은 여자분 귀엽네요', 
to_date('2016/01/30'), 87);

insert into GC_QNA values(GC_QNA_SEQ.nextval,'외부자',
'후훗','그분의 사생활 때문에 폄하하기엔 영화가 너무 잘 빠졌다 ㅋㅋ', 
to_date('2016/02/13'), 37);

insert into GC_QNA values(GC_QNA_SEQ.nextval,'좋아해줘',
'좋아!좋아!','술 한잔하며 연애하고 싶게 만드는 영화!!', 
to_date('2016/01/20'), 87);

insert into GC_QNA values(GC_QNA_SEQ.nextval,'감귤',
'믿고보는 황정민','황정민의 연기는 끝내줍니다', 
to_date('2016/02/10'), 67;

insert into GC_QNA values(GC_QNA_SEQ.nextval,'관람객',
'1관 좌석이용 문의','A열 13좌석 시트에서 냄새나요~ ', 
to_date('2016/02/02'), 25);

insert into GC_QNA values(GC_QNA_SEQ.nextval,'10점만점에10점',
'좋아해줘 후기','배우들 연기만 빛이 나네요', 
to_date('2016/02/19'), 91);

insert into GC_QNA values(GC_QNA_SEQ.nextval,'좋아해줘요',
'술한잔하며 연애할사람','좋아해줘 보고나니 연애하고 싶다!', 
to_date('2016/02/19'), 12);

insert into GC_QNA values(GC_QNA_SEQ.nextval,'노답노잼',
'노답생각','허허허 노잼입니다모두들 인정하시겠죠?', 
to_date('2016/01/30'), 5);

insert into GC_QNA values(GC_QNA_SEQ.nextval,'푸하하',
'쿵푸후~','색감 미친듯 액션신 죽이네요', 
to_date('2016/02/17'), 11);

insert into GC_QNA values(GC_QNA_SEQ.nextval,'안전빵',
'팝콘이 맛없음','편의점에서 파는 카카오빵보다 못함', 
to_date('2016/01/15'), 16);

insert into GC_QNA values(GC_QNA_SEQ.nextval,'스파르타',
'저스트 어 모멘트','강동원 의외로 코믹연기 잘하네', 
to_date('2016/02/17'), 4);

insert into GC_QNA values(GC_QNA_SEQ.nextval,'히어로',
'강동원 재발견','그냥 웃긴 연기가 아닌 볼수 없었던 표정들로 영화를 주도하네', 
to_date('2016/02/12'), 85);

insert into GC_QNA values(GC_QNA_SEQ.nextval,'옥수수빵',
'직원 불친절','불친절하고 인사도 안하네.. 직원교육좀 똑바로 시키세요!', 
to_date('2016/02/04'), 38);

insert into GC_QNA values(GC_QNA_SEQ.nextval,'개그풀',
'꿀잼','골때리게 웃기네', 
to_date('2016/02/19'), 17);

insert into GC_QNA values(GC_QNA_SEQ.nextval,'10점만점에10점',
'데드풀 후기','10점 안주면 딴영화 10점 못줄듯', 
to_date('2016/02/18'), 25);

insert into GC_QNA values(GC_QNA_SEQ.nextval,'파랑새',
'쿵푸후후~','잭 블랙과 팬더는 옳다', 
to_date('2016/01/27'), 44);

insert into GC_QNA values(GC_QNA_SEQ.nextval,'우비소년',
'좋아해줘..','배우들 때문에 7점준다!', 
to_date('2016/02/19'), 62);

insert into GC_QNA values(GC_QNA_SEQ.nextval,'까까머리',
'좋긴 개뿔!','보니깐 영화가 아니라 그냥 쓰레기더만...', 
to_date('2016/02/18'), 56);

insert into GC_QNA values(GC_QNA_SEQ.nextval,'나를 돌아봐',
'할인 적용문의','통신사 할인과 문화상품권을 동시에 적용할수 있나요?', 
to_date('2016/01/13'), 78);

insert into GC_QNA values(GC_QNA_SEQ.nextval,'안다다씨',
'바닷마을 다이어리 후기','잔잔하지만 깊은 감동을 주는 영화. 마음이 따뜻해지고 평온해지는 영화인것 같다', 
to_date('2016/01/15'), 88);

insert into GC_QNA values(GC_QNA_SEQ.nextval,'쿨한가이',
'영화관 화장실 문의','비데좀 설치해주세요', 
to_date('2016/01/20'), 16);

insert into GC_QNA values(GC_QNA_SEQ.nextval,'애매모호',
'상품권 예매문의','문화상품권이나, 해피머니 상품권으로도 예매 가능한가요?', 
to_date('2016/02/17'), 77);

commit;

/* GC_QNA_REPLY 테이블 (고객센터 댓글) */
CREATE TABLE GC_QNA_REPLY (
  QNA_REPLY_ID NUMBER(10)         NOT NULL PRIMARY KEY,  --QNA_REPLY 고유키
  QNA_ID       NUMBER(10)         NOT NULL,              --GC_BOARD 테이블로 외래키 적용
  USERID       VARCHAR2(12 CHAR)  NOT NULL,              --사용자 아이디
  CONTENTS     VARCHAR2(200 CHAR) NOT NULL,              --내용
  WDATE        DATE               NOT NULL               --작성일
);
CREATE SEQUENCE GC_QNA_REPLY_SEQ;

insert into GC_QNA_REPLY values(GC_QNA_REPLY_SEQ.nextval, 1 , '반달가면', '님 좀 짱인듯',  to_date('2016/2/17'));

insert into GC_QNA_REPLY values(GC_QNA_REPLY_SEQ.nextval, 2 , '갓정민', '난 재밌게 봤는데...ㅋㅋ',  to_date('2016/2/13'));

insert into GC_QNA_REPLY values(GC_QNA_REPLY_SEQ.nextval, 3 , '후훗', '강동원 꿀잼',  to_date('2016/2/17'));

insert into GC_QNA_REPLY values(GC_QNA_REPLY_SEQ.nextval, 4 , '정신차려', '연기는 인정',  to_date('2016/2/18'));

insert into GC_QNA_REPLY values(GC_QNA_REPLY_SEQ.nextval, 5 , '퐈야', '블랙형 짱',  to_date('2016/2/05'));

insert into GC_QNA_REPLY values(GC_QNA_REPLY_SEQ.nextval, 6 , '펑펑', '지루하긴 하지만 연기는 일품',  to_date('2016/2/05'));

insert into GC_QNA_REPLY values(GC_QNA_REPLY_SEQ.nextval, 7 , '개부럽', '해투에 나왔는데 내스타일~ㅋㅋ',  to_date('2016/2/01'));

insert into GC_QNA_REPLY values(GC_QNA_REPLY_SEQ.nextval, 8 , '히스토리', '그래도 난 싫어!',  to_date('2016/2/14'));

insert into GC_QNA_REPLY values(GC_QNA_REPLY_SEQ.nextval, 9 , '좋은걸', '연락주세요 ㅋㅋ',  to_date('2016/1/25'));

insert into GC_QNA_REPLY values(GC_QNA_REPLY_SEQ.nextval, 10 , '나예매', '오늘 그 자리 예매했는데 변경해야지 ㅋ',  to_date('2016/2/18'));

insert into GC_QNA_REPLY values(GC_QNA_REPLY_SEQ.nextval, 11 , '나솔로', '난 2점!',  to_date('2016/2/19'));

insert into GC_QNA_REPLY values(GC_QNA_REPLY_SEQ.nextval, 12 , '제점수는요', '한강에서 봐요~',  to_date('2016/2/19'));

insert into GC_QNA_REPLY values(GC_QNA_REPLY_SEQ.nextval, 13 , '꿀잼', '꿀잼!',  to_date('2016/1/31'));

insert into GC_QNA_REPLY values(GC_QNA_REPLY_SEQ.nextval, 14 , '하하하', '액션 쥑이네',  to_date('2016/2/18'));

insert into GC_QNA_REPLY values(GC_QNA_REPLY_SEQ.nextval, 15 , '카스', '카카오빵에는 바나나죠',  to_date('2016/1/16'));

insert into GC_QNA_REPLY values(GC_QNA_REPLY_SEQ.nextval, 16 , '짱이야', '강동원 흥해라!',  to_date('2016/2/17'));

insert into GC_QNA_REPLY values(GC_QNA_REPLY_SEQ.nextval, 17 , '한라봉', '갓정민',  to_date('2016/2/12'));

insert into GC_QNA_REPLY values(GC_QNA_REPLY_SEQ.nextval, 18 , '관리자', '해고시키겠습니다!',  to_date('2016/2/05'));

insert into GC_QNA_REPLY values(GC_QNA_REPLY_SEQ.nextval, 19 , '꿀잼', '개콘보다 재밌습니다',  to_date('2016/2/19'));

insert into GC_QNA_REPLY values(GC_QNA_REPLY_SEQ.nextval, 20 , '꿀꿀', '10점까지는 아닌듯..',  to_date('2016/2/19'));

insert into GC_QNA_REPLY values(GC_QNA_REPLY_SEQ.nextval, 21 , '쿵푸러버', '팬더마을에 살고싶다',  to_date('2016/1/28'));

insert into GC_QNA_REPLY values(GC_QNA_REPLY_SEQ.nextval, 22 , '노랑머리', '5점도 아까운 영화!',  to_date('2016/2/19'));

insert into GC_QNA_REPLY values(GC_QNA_REPLY_SEQ.nextval, 23 , '꼬꼬', '배우들이 아깝다',  to_date('2016/2/20'));

insert into GC_QNA_REPLY values(GC_QNA_REPLY_SEQ.nextval, 24 , '관리자', '현장에서 티켓 구매 시 상품권과 이동통신사 할인이 동시에 적용하실 수 있습니다.',  to_date('2016/1/15'));

insert into GC_QNA_REPLY values(GC_QNA_REPLY_SEQ.nextval, 25 , '자연별곡', '히로세 스즈 짱 좋아요',  to_date('2016/1/17'));

insert into GC_QNA_REPLY values(GC_QNA_REPLY_SEQ.nextval, 26 , '관리자', '물티슈 이용해주세요',  to_date('2016/1/22'));

insert into GC_QNA_REPLY values(GC_QNA_REPLY_SEQ.nextval, 27 , '관리자', '문의하신 문화상품권, 해피머니상품권, 도서상품권의 경우 가온시네마 홈페이지에서는 예매가 불가하며 현장에서만 현금과 동일하게 사용가능합니다',  to_date('2016/2/17'));


commit;


ALTER TABLE GC_QNA_REPLY ADD CONSTRAINT QNA_REPLY_FK FOREIGN KEY (QNA_ID)
REFERENCES GC_QNA(QNA_ID) ON DELETE CASCADE;


COMMIT;