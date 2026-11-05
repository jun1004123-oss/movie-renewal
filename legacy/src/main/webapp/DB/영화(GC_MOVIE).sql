DROP TABLE GC_MOVIE;             
DROP SEQUENCE GC_MOVIE_SEQ; 

	/* GC_MOVIE 테이블 (영화) */
CREATE TABLE GC_MOVIE (
  MOVIE_ID   NUMBER(10)        NOT NULL PRIMARY KEY,  
  NAME_K      VARCHAR2(100 CHAR)  NOT NULL,           
  NAME_E      VARCHAR2(100 CHAR)  NOT NULL,             
  AGE       VARCHAR2(20 CHAR)  NOT NULL,				
  AGEtext       VARCHAR2(50 CHAR)  NOT NULL,			
  D_DAY	       DATE				 NOT NULL,			
  DIRECTOR   VARCHAR2(30 CHAR)  NOT NULL,             
  ACTOR      VARCHAR2(100 CHAR) 	NOT NULL,			
  GENRE       VARCHAR2(50 CHAR)  NOT NULL,               
  PAGE		  VARCHAR2(100 CHAR)  NOT NULL,			
  AVG		  NUMBER(10, 2)		 	 NOT NULL,				
  AVG_NUM  	NUMBER(20)      NOT NULL,       
  CONTENT 	  VARCHAR2(3000 CHAR)	  NOT  NULL,			
  POSTER      VARCHAR2(30 CHAR)    	NOT 	NULL,			
  MOVIE 	  VARCHAR2(100 CHAR)   	NOT NULL,
  STEEL1	   VARCHAR2(30 CHAR)  	NOT NULL,          
  STEEL2	  VARCHAR2(30 CHAR)  	NOT NULL,                
  STEEL3	  VARCHAR2(30 CHAR)  	NOT NULL,                
  STEEL4  	VARCHAR2(30 CHAR)  	NOT NULL,                
  STEEL5	  VARCHAR2(30 CHAR)	  NOT NULL,               
  STEEL6  	VARCHAR2(30 CHAR)  	NOT NULL,              
  STEEL7	  VARCHAR2(30 CHAR)	  NOT NULL,               
  R_TIME	  NUMBER(4)			  NOT NULL,				
  STARTDATE   DATE               NOT NULL,            
  ENDDATE     DATE              NOT NULL               
);

CREATE SEQUENCE GC_MOVIE_SEQ;



insert into GC_MOVIE values(GC_MOVIE_SEQ.nextval, '히말라야', 'The Himalayas', '12', '12세 관람가', to_date('2015/12/16'), 
  '이석훈', '황정민(엄홍길), 정우(박무택), 조성하(이동규)','드라마', 'http://himalaya2015.co.kr/', 8.75, 36,
  '기다려... 우리가 꼭 데리러 갈게...<br><br> 해발 8,750 미터 히말라야 에베레스트 데스존<br> 인간의 접근을 허락하지 않은 신의 영역 그곳에 우리 동료가 묻혀있다.<br> 산 아래 하나였고, 또 다른 가족이었던 사람들<br> 생을 마감한 후배 대원의 시신을 찾기 위해 기록도, 명예도, 보상도 없는 가슴 뜨거운 여정을 시작한다. 그 누구도 시도하지 않았던 위대한 도전 엄홍길 대장과 휴먼원정대의 감동 실화가 공개된다!', 
  'HM_poster.jpg', 'https://www.youtube.com/embed/9FS0YFIJU7Q', 'HM_01.jpg', 'HM_02.jpg', 'HM_03.jpg', 'HM_04.jpg',
  'HM_05.jpg', 'HM_06.jpg', 'HM_07.jpg', 124, to_date('2015/12/16'), to_date('2016/04/16') );

insert into GC_MOVIE values(GC_MOVIE_SEQ.nextval, '바닷마을 다이어리', '海街diary, Our Little Sister', '12', '12세 관람가', to_date('2015/12/17'), 
  '고레에다 히로카즈', '아야세 하루카(코우다 사치), 나가사와 마사미(코우다 요시노), 히로세 스즈(아사노 스즈)','드라마,가족', ' http://movie.naver.com/movie/bi/mi/basic.nhn?code=132610', 8.78, 26, 
  '15년 전 가족을 버린 아버지의 장례식,<br>어릴 적 나와 꼭 닮은 아이를 만났다.<br>조그마한 바닷가 마을 카마쿠라에 살고 있는 사치, 요시노, 치카는 <br>15년 전 집을 떠난 아버지의 부고를 듣고 장례식장으로 향한다.<br> 아버지에 대한 미움도, 추억도 어느덧 희미해졌지만 <br>홀로 남겨진 이복 여동생 ‘스즈’에게만은 왠지 마음이 쓰이는데.. <br>스즈, 우리랑 같이 살래? 넷이서…<br><br> 그렇게 아버지가 된다. 고레에다 히로카즈 감독이 그려낸 <br>문득, 세상이 아름답게 보이는 순간들 <br><바닷마을 다이어리> ',
  'SE_poster.jpg', 'https://www.youtube.com/embed/RVoLfN7CH6c', 'SE_01.jpg', 'SE_02.jpg', 'SE_03.jpg', 'SE_04.jpg',
  'SE_05.jpg', 'SE_06.jpg', 'SE_07.jpg', 128, to_date('2015/12/17'), to_date('2016/03/15') );

insert into GC_MOVIE values(GC_MOVIE_SEQ.nextval, '내부자들:디오리지널', 'Inside Men:The Original', '19', '청소년 관람불가', to_date('2015/12/31'), 
  '우민호', '이병헌(안상구), 조승우(우장훈), 백윤식(이강희)','범죄,드라마', ' http://movie.naver.com/movie/bi/mi/basic.nhn?code=147001', 9.09, 18,
  '더 강렬하다! 더 리얼하다! <br>대한민국을 강타한 권력가들의 진짜 이야기<br>끌어만 주시면 짖지 않고 예쁘게 따라갑니다<br>복수를 계획하는 정치깡패의 과거_ 안상구<br><br>덮으라고요? 왜, 장필우가 들어오랍디까?<br>성공을 거래하는 열혈검사의 반격 _ 우장훈<br><br>너도 성공하고 싶으니까 나한테 온 거 아냐?<br>정치판을 설계하는 논설위원의 야망_ 이강희<br><br>조폭 검찰 언론 정치 재벌<br>내부자들의 숨겨진 이야기가 공개된다!',
  'IN_poster.jpg', 'https://www.youtube.com/embed/mCRzsf8Uduw', 'IN_01.jpg', 'IN_02.jpg', 'IN_03.jpg', 'IN_04.jpg',
  'IN_05.jpg', 'IN_06.jpg', 'IN_07.jpg', 180, to_date('2015/12/31'), to_date('2016/03/03') );

insert into GC_MOVIE values(GC_MOVIE_SEQ.nextval, '굿 다이노', 'The Good Dinosaur', 'all', '전체관람가', to_date('2016/01/07'), 
  '피터 손', '레이몬드 오초아(알로), 제프리 라이트(아빠), 프란시스 맥도맨드(엄마)','애니메이션,모험', 'http://movie.naver.com/movie/bi/mi/basic.nhn?code=109910', 8.94, 12,
  '외모, 성향 뭐 하나 닮은 것이 없는 알로와 스팟<br> 우연한 사고로 엮이게 되면서 알로의 가족을 찾아 함께 모험을 떠나게 된다.<br><br> 한 치 앞을 알 수 없는 여정 속<br> 자연이 선사하는 엄청난 시련과 위대함을 맞닥뜨리게 되는데...<br> 과연 알로는 가족을 찾을 수 있을까?<br><br> 괜찮아, 내가 안아줄게!', 
  'GD_poster.jpg', 'https://www.youtube.com/embed/aMeL8_U1Eso', 'GD_01.jpg', 'GD_02.jpg', 'GD_03.jpg', 'GD_04.jpg',
  'GD_05.jpg', 'GD_06.jpg', 'GD_07.jpg', 101, to_date('2016/01/07'), to_date('2016/03/17') );

insert into GC_MOVIE values(GC_MOVIE_SEQ.nextval, '겁쟁이 페달', '劇場版 よわむしペダル', 'all', '전체 관람가', to_date('2016/01/14'), '나가누마 노리히로', 
  '야마시타 다이키(오노다 사카미치), 토리우미 코스케(이마이즈미 슌스케)','애니메이션', 'http://movie.naver.com/movie/bi/mi/detail.nhn?code=143335', 9.14, 19,
  '구마모토 불의 나라 산맥 레이스<br>최고의 팀을 가르기 위한 대결이 시작된다!<br>소호쿠 고등학교 사이클부에 입단 후 새로운 재능과 꿈을 발견하게 된 오노다. <br> 팀원들의 뜨거운 응원과 도움으로 전국체전에서 승리의 주역이 되며 <br> 신입임에도 불구하고 소호쿠의 새로운 에이스로 떠오르게 된다. <br> 소호쿠 팀은 로드 바이크 레이스 중에서도 가장 고난도 레이스로 손꼽히는 <br> 구마모토 불의 나라 산맥 레이스에 출전, <br>라이벌이자 랭킹 1위의 하코네 고등학교를 비롯 쟁쟁한 경쟁팀들과 우승을 향한 본격적인 대결을 시작한다. <br> 하지만, 정신적 지주였던 마키시마 선배의 갑작스러운 탈퇴 소식 실망한 오노다는 <br> 경기 도중 결정적 실수를 하게 되고 소호쿠 팀은 최악의 위기에 빠지게 되는데… <br><br> 소호쿠 팀은 위기를 극복하고 최고의 로드 바이크 팀의 명성을 되찾을 수 있을까?',
  'PD_poster.jpg', 'https://www.youtube.com/embed/ucJyTdwlgwY', 'PD_01.jpg', 'PD_02.jpg', 'PD_03.jpg', 'PD_04.jpg',
  'PD_05.jpg', 'PD_06.jpg', 'PD_07.jpg', 90, to_date('2016/01/14'), to_date('2016/03/14'));

insert into GC_MOVIE values(GC_MOVIE_SEQ.nextval, '레버넌트:죽음에서 돌아온 자', 'The Revenant', '15', '15세 관람가', to_date('2016/01/14'), 
  '알레한드로 곤잘레스 이냐리투', '레오나르도 디카프리오(휴 글래스), 톰 하디(존 피츠 제럴드), 돔놀 글리슨(앤드류 헨리)','모험,드라마', 'http://movie.naver.com/movie/bi/mi/basic.nhn?code=124212#', 7.93, 15,
  '2016년 가장 강렬한 실화!<br> 전설이 된 한 남자의 위대한 이야기!<br><br> 서부 개척시대 이전인 19세기 아메리카 대륙, 사냥꾼인 휴 글래스(레오나르도 디카프리오)는<br> 아들 호크를 데리고 동료들과 함께 사냥하던 중 회색곰에게 습격 당해 사지가 찢긴다.<br> 비정한 동료 존 피츠 제럴드(톰 하디)는 아직 살아 있는 휴를 죽이려 하고,<br> 아들 호크가 이에 저항하자 호크 마저 죽인 채 숨이 붙어 있는 휴를 땅에 묻고 떠난다.<br> 눈 앞에서 하나뿐인 아들의 죽음을 목격한 휴는<br> 처절한 복수를 위해 부상 입은 몸으로 존의 뒤를 쫓기 시작하는데….', 
  'RV_poster.jpg', 'https://www.youtube.com/embed/T5ridPuTJx0', 'RV_01.jpg', 'RV_02.jpg', 'RV_03.jpg', 'RV_04.jpg',
  'RV_05.jpg', 'RV_06.jpg', 'RV_07.jpg', 156, to_date('2016/01/14'), to_date('2016/03/07') );

insert into GC_MOVIE values(GC_MOVIE_SEQ.nextval, '오빠생각', 'A Melody to Remember', '12', '12세 관람가', to_date('2016/01/21'), 
  '이한', '임시완(한상렬), 고아성(박주미), 이희준(갈고리)','드라마,전쟁', 'http://movie.naver.com/movie/bi/mi/basic.nhn?code=136686', 6.56, 13,
  '전쟁으로 소중한 가족도, 지켜야 할 동료도 모두 잃은 군인 한상렬(임시완).<br><br> 우연히 전출 명령을 받아 머물게 된 부대 내에서 부모를 잃고 홀로 남은 아이들을 만나게 된다.<br> 아이들의 해맑은 모습에 점차 마음을 열게 된 그는 자원봉사자 선생님 박주미(고아성)와 함께<br> 어린이 합창단을 만들어 노래를 가르치기 시작하고,<br> 이들의 노래는 언제 목숨을 잃을지 모르는 전쟁 한가운데 놓인 모든 이들의 마음을 울리기 시작하는데...<br> 전쟁 한가운데, 작은 노래가 만든 위대한 기적이 시작된다!', 
  'BR_poster.jpg', 'https://www.youtube.com/embed/ZuaUGHu0YKU', 'BR_01.jpg', 'BR_02.jpg', 'BR_03.jpg', 'BR_04.jpg',
  'BR_05.jpg', 'BR_06.jpg', 'BR_07.jpg', 124, to_date('2016/01/21'), to_date('2016/03/25') );

insert into GC_MOVIE values(GC_MOVIE_SEQ.nextval, '빅쇼트', 'The Big Short', '19', '청소년 관람불가', to_date('2016/01/21'), 
  '아담 맥케이', '크리스찬 베일(마이클 버리), 스티브 카렐(마크 바움), 브래드 피트(벤 리커트)','드라마', 'http://movie.naver.com/movie/bi/mi/basic.nhn?code=136842', 6.78, 26,
  '여러분, 돈 법시다! 돈 벌 준비 됐죠?<br> 은행은 전부 사기꾼들, 당신의 돈이 사라지는 진짜 이유!!<br><br> 곤경에 빠지는 건 뭔가를 몰라서가 아니다. 뭔가를 확실히 안다는 착각 때문이다” - 마크 트웨인<br> 2005년, 모두를 속인 채 돈 잔치를 벌인 은행들.<br> 그리고 이를 정확히 꿰뚫고 월스트리트를 물 먹인 4명의 괴짜 천재들.<br> 20조의 판돈, 세계 경제를 걸고 은행을 상대로 한 진짜 도박!<br> 그들이 움직이기 시작했다!', 
  'BS_poster.jpg', 'https://www.youtube.com/embed/y7xD85c9IuQ', 'BS_01.jpg', 'BS_02.jpg', 'BS_03.jpg', 'BS_04.jpg',
  'BS_05.jpg', 'BS_06.jpg', 'BS_07.jpg', 130, to_date('2016/01/21'), to_date('2016/03/27') );

insert into GC_MOVIE values(GC_MOVIE_SEQ.nextval, '로봇, 소리', 'SORI: Voice from the Heart', '12', '12세 관람가', to_date('2016/01/27'), 
  '이호재', '이성민(해관), 이희준(진호), 이하늬(지연)','드라마', 'http://movie.naver.com/movie/bi/mi/basic.nhn?code=136821', 7.58, 32,
  '10년전 실종된 딸, 포기하려는 순간 녀석이 나타났다!<br><br> 2003년 대구, 해관(이성민)의 하나뿐인 딸 유주가 실종되는 사건이 벌어진다.<br> 아무런 증거도 단서도 없이 사라진 딸의 흔적을 찾기 위해 해관은 10년 동안 전국을 찾아 헤맨다.<br> 모두가 이제 그만 포기하라며 해관을 말리던 그때, 세상의 모든 소리를 기억하는 로봇 소리를 만난다.<br><br> 미친 소리 같겠지만, 이 녀석이 내 딸을 찾아줄 것 같습니다.<br><br> 해관은 목소리를 통해 대상의 위치를 추적할 수 있는<br> 로봇의 특별한 능력을 감지하고 딸 유주를 찾기 위해 동행에 나선다.<br> 사라진 딸을 찾을 수 있다는 마지막 희망을 안고 소리가 기억해내는 유주의 흔적에 한 걸음씩 가까워지는 둘.<br> 한편, 사라진 로봇을 찾기 위해 해관과 소리를 향한 무리들의 감시망 역시 빠르게 조여오기 시작하는데…<br> 과연 그들은 사라진 딸 유주를 찾을 수 있을까?<br><br> 2016년 가장 희망적인 소리를 만난다!', 
  'RB_poster.jpg', 'https://www.youtube.com/embed/HvCByQLIi-k', 'RB_01.jpg', 'RB_02.jpg', 'RB_03.jpg', 'RB_04.jpg',
  'RB_05.jpg', 'RB_06.jpg', 'RB_07.jpg', 117, to_date('2016/01/27'), to_date('2016/03/21') );

insert into GC_MOVIE values(GC_MOVIE_SEQ.nextval, '쿵푸팬더3', 'Kung Fu Panda 3', 'all', '전체관람가', to_date('2016/01/28'), 
  '여인영, 알레산드로 칼로니', '잭 블랙(포), 안젤리나 졸리(타이그리스), 성룡(몽키)','액션,애니메이션', 'http://kungfupanda2016.co.kr/', 8.89, 29,
  '진짜 쿵푸는 지금부터다!<br><br> 어느 날 우연히, 어린 시절 잃어버렸던 진짜 팬더 아버지를 만난 포는 아버지 리와 함께 팬더들이 어울려 사는<br> 비밀스러운 그 곳, 팬더 마을로 향한다. 자신 못지 않게 여유와 흥 넘치는 팬더들과 즐거운 시간을 보내는 포.<br> 하지만 모든 쿵푸 마스터들을 제압하며 전세계를 위협하는 악당 카이의 등장으로 포는 예상치 못했던 불가능한 도전에 맞닥뜨리게 된다.<br> 놀기 좋아하고, 먹는 게 행복이며, 덤벙대는 게 특기인 팬더 친구들에게 궁극의 쿵푸를 전수해야 하는 것!<br> 이번엔 쿵푸를 가르쳐야 한다! 쿵푸 훈련법 마스터에 나선 포, 팬더 인생 최대의 도전이 시작된다!', 
  'KF_poster.jpg', 'https://www.youtube.com/embed/FEMnJxzJKrk', 'KF_01.jpg', 'KF_02.jpg', 'KF_03.jpg', 'KF_04.jpg',
  'KF_05.jpg', 'KF_06.jpg', 'KF_07.jpg', 95, to_date('2016/01/28'), to_date('2016/03/20') );

insert into GC_MOVIE values(GC_MOVIE_SEQ.nextval, '검사외전', 'A Violent Prosecutor', '15', '15세 관람가', to_date('2016/02/03'),
 '이일형', '황정민(변재욱), 강동원(한치원), 이성민(우종길)','코미디', 'http://movie.naver.com/movie/bi/mi/basic.nhn?code=130903', 8.86, 8,
 '진실 앞에 무대뽀! 다혈질 검사, 살인 누명을 쓰고 감옥에 갇히다!<br><br>거친 수사 방식으로 유명한 다혈질 검사 변재욱(황정민).<br>취조 중이던 피의자가 변사체로 발견 되면서 살인 혐의로 체포된다.<br> 꼼짝없이 살인 누명을 쓰게 된 변재욱은 결국 15년 형을 받고 수감 된다.<br><br>진실 따위 나 몰라라! 허세남발 꽃미남 사기꾼, 반격 작전에 선수로 기용되다!<br><br>감옥에서 복수의 칼을 갈던 재욱.<br> 5년 후, 자신이 누명을 쓰게 된 사건에 대해 알고 있는 허세남발 꽃미남 사기꾼 치원(강동원)을<br> 우연히 만나게 되고, 그 순간 감옥 밖 작전을 대행해 줄 선수임을 직감한다.<br> 검사 노하우를 총 동원, 치원을 무혐의로 내보내고 반격을 준비하는 재욱.<br> 하지만 자유를 얻은 치원은 재욱에게서 벗어날 기회만 호시탐탐 노리는데…<br><br> 감옥에 갇힌 검사와 세상 밖으로 나온 사기꾼!<br> 이들의 예측불허, 반격의 한탕은 성공할 수 있을까?',
 'VP_poster.jpg', 'https://www.youtube.com/embed/timw-LXZvUc', 'VP_01.jpg', 'VP_02.jpg', 'VP_03.jpg', 'VP_04.jpg',
 'VP_05.jpg', 'VP_06.jpg', 'VP_07.jpg', 126, to_date('2016/02/03'), to_date('2016/04/13') );

insert into GC_MOVIE values(GC_MOVIE_SEQ.nextval, '데드풀', 'Deadpool', '19', '청소년 관람불가', to_date('2016/02/17'),
 '팀 밀러', '라이언 레이놀즈(웨이드윌슨/데드풀), 모레나 바카린(바네사 칼리슨/카피캣), 에드 스크레인(아약스)','액션', 'http://movie.naver.com/movie/bi/mi/basic.nhn?code=75426', 6.45, 16,
 '정의감 제로, 책임감 제로, 정신은 인터스텔라급<br><br>마블 역사상 가장 매력 터지는 히어로 데드풀이 온다!<br><br>전직 특수부대 출신의 용병 웨이드 윌슨(라이언 레놀즈)은 암 치료를 위한 비밀 실험에 참여 후, 강력한 힐링팩터를<br> 지닌 슈퍼히어로 데드풀로 거듭난다. 탁월한 무술실력과 거침없는 유머감각을 지녔지만 흉측하게 일그러진 얼굴을<br> 갖게 된 데드풀은 자신의 삶을 완전히 망가뜨린 놈들을 찾아 뒤쫓기 시작하는데…', 
 'DP_poster.jpg', 'https://www.youtube.com/embed/MhylrGLoe2w', 'DP_01.jpg', 'DP_02.jpg', 'DP_03.jpg', 'DP_04.jpg',
 'DP_05.jpg', 'DP_06.jpg', 'DP_07.jpg', 106, to_date('2016/02/17'), to_date('2016/04/10') );

insert into GC_MOVIE values(GC_MOVIE_SEQ.nextval, '동주', 'DongJu', '12', '12세 관람가', to_date('2016/02/17'), 
  '이준익', '강하늘(윤동주), 박정민(송몽규), 김인우(고등형사)','드라마', 'http://movie.naver.com/movie/bi/mi/basic.nhn?code=134899', 7.23, 24,
  '이름도, 언어도, 꿈도, 모든 것이 허락되지 않았던 일제강점기.<br><br>한 집에서 태어나고 자란 동갑내기 사촌지간 동주와 몽규.<br>시인을 꿈꾸는 청년 동주에게 신념을 위해 거침없이 행동하는 청년 몽규는 가장 가까운 벗이면서도, 넘기 힘든 산처럼 느껴진다.<br> 창씨개명을 강요하는 혼란스러운 나라를 떠나 일본 유학 길에 오른 두 사람.<br>일본으로 건너간 뒤 몽규는 더욱 독립 운동에 매진하게 되고, 절망적인 순간에도 시를 쓰며 시대의 비극을 아파하던 동주와의 갈등은 점점 깊어진다.<br> 어둠의 시대, 평생을 함께 한 친구이자 영원한 라이벌이었던 윤동주와 송몽규의 끝나지 않은 이야기가 지금 시작된다.', 
  'DJ_poster.jpg', 'https://www.youtube.com/embed/x50XTtoom3w', 'DJ_01.jpg', 'DJ_02.jpg', 'DJ_03.jpg', 'DJ_04.jpg',
  'DJ_05.jpg', 'DJ_06.jpg', 'DJ_07.jpg', 110, to_date('2016/02/17'), to_date('2016/04/05') );

insert into GC_MOVIE values(GC_MOVIE_SEQ.nextval, '좋아해줘', 'Like for Likes', '12', '12세 관람가', to_date('2016/02/17'), 
  '박현진', '이미연(조경아), 최지우(함주란), 유아인(노진우)','로맨스,코미디', 'http://www.like2016.co.kr/', 7.87, 27,
  '잘 나가는 작가와 더 잘 나가는 스타<br><br> 사랑 잃은 노총각과 집 잃은 노처녀 연애 초짜 작곡가와 밀당 고수 PD<br> 대책 없이 좋아요를 누르다가 진짜 좋아져버린 내 생애 가장 설레는 로맨스<br> 2016년, 이제는 말하세요. 좋아해줘.', 
  'LL_poster.jpg', 'https://www.youtube.com/embed/ddrhCorDMOw', 'LL_01.jpg', 'LL_02.jpg', 'LL_03.jpg', 'LL_04.jpg',
  'LL_05.jpg', 'LL_06.jpg', 'LL_07.jpg', 120, to_date('2016/02/17'), to_date('2016/04/10') );

insert into GC_MOVIE values(GC_MOVIE_SEQ.nextval, '번개맨', 'Bungaeman', 'all', '전체관람가', to_date('2016/02/11'), 
  '조근현', '정현진(번개맨), 루나(한나), 송욱경(잘난 마왕)','판타지', 'http://movie.naver.com/movie/bi/mi/basic.nhn?code=139699', 4.23, 29,
  '더욱 강해진 번개파워!<br> 사상 최강의 마왕에 맞서 조이랜드를 지켜라<br><br> 꿈과 희망이 가득한 조이랜드를 호시탐탐 노리는 악당 잘난마왕은 조이랜드를 무너뜨리기 위해<br> 번개맨의 초능력인 번개파워를 없애려는 계획을 세운다.<br> 잘난마왕은 행동대장인 나잘난과 더잘난을 이용해 조이랜드 극장의 주인공이자<br> 말괄량이 소녀 한나에게 최면을 걸고, 날고 싶은 한나의 꿈을 이용해 블랙홀에 빠트린다.<br> 결국 한나를 구하려던 번개맨은 강력한 블랙홀로 인해 점점 번개파워를 잃어가는데...<br> 과연 번개맨은 블랙홀에서 벗어나 위기에 빠진 조이랜드를 구해낼 수 있을까?', 
  'BG_poster.jpg', 'https://www.youtube.com/embed/zMF_50s_5K4', 'BG_01.jpg', 'BG_02.jpg', 'BG_03.jpg', 'BG_04.jpg',
  'BG_05.jpg', 'BG_06.jpg', 'BG_07.jpg', 72, to_date('2016/02/11'), to_date('2016/04/16') );

insert into GC_MOVIE values(GC_MOVIE_SEQ.nextval, '순정', 'UNFORGETTABLE', '12', '12세 관람가', to_date('2016/02/24'), 
  '이은희', '도경수(범실), 김소현(수옥), 연준석(산돌)','드라마', 'http://movie.naver.com/movie/bi/mi/basic.nhn?code=139674', 0.00, 0,
  '23년 전 첫사랑의 목소리가 라디오에서 흘러나왔다…<br><br>라디오 DJ 형준은 어느 날, 생방송 중에 도착한 낯익은 이름의 편지 한 통에 당혹스러움을 감추지 못한다.<br> 사연을 보낸 이는 바로 23년 전 가슴 한 켠에 묻어두었던 첫사랑의 이름 정수옥.<br> 그녀의 손글씨로 정성스레 쓰인 노트를 보며 형준은 잊고 지냈던 23년 전의 기억들이 되살아나기 시작하는데…<br><br> 1991년, 여름방학을 맞아 수옥이 기다리고 있는 고향 섬마을에 모인 범실과 친구들.<br> 다섯이어야 오롯이 하나가 되는 이들은 함께여서 더욱 빛나는 시간들로 여름날의 추억을 쌓아간다.<br> 과거와 현재를 넘나드는 단 하나의 첫사랑! 그 해 여름, 아련한 추억 속으로 음악비행이 시작된다!', 
  'PL_poster.jpg', 'https://www.youtube.com/embed/LxBtieBcX1g', 'PL_01.jpg', 'PL_02.jpg', 'PL_03.jpg', 'PL_04.jpg',
  'PL_05.jpg', 'PL_06.jpg', 'PL_07.jpg', 113, to_date('2016/02/24'), to_date('2016/05/18') );

insert into GC_MOVIE values(GC_MOVIE_SEQ.nextval, '사울의 아들', 'Saul fia, Son of Saul', '19', '청소년 관람불가', to_date('2016/02/25'), 
  '라즐로 네메스', '게자 뢰리히(사울), 레벤테 몰나르(아브라함), 우르스레힌(비더만)','드라마,공포', 'http://movie.naver.com/movie/bi/mi/basic.nhn?code=139437', 0.00, 0,
  '시체 처리반으로 일하던 남자 앞에 오늘, 아들의 주검이 도착했다…<br><br> 나치의 만행이 극에 달했던 1944년, 아우슈비츠 수용소에는 시체들을 처리하기 위한 비밀 작업반이 있었다.<br> 존더코만도 라고 불리던 이들은 X자 표시가 된 작업복을 입고 아무 것도 묻지 않고 오직 시키는 대로 주어진 임무를 수행한다.<br> 그러던 어느 날, 존더코만도 소속이었던 남자 사울의 앞에 어린 아들의 주검이 도착한다.<br> 처리해야 할 시체더미들 사이에서 아들을 빼낸 사울은 랍비를 찾아 제대로 된 장례를 치러주기로 결심하는데…', 
  'SS_poster.jpg', 'https://www.youtube.com/embed/B3_r7qxHqVo', 'SS_01.jpg', 'SS_02.jpg', 'SS_03.jpg', 'SS_04.jpg',
  'SS_05.jpg', 'SS_06.jpg', 'SS_07.jpg', 107, to_date('2016/02/25'), to_date('2016/05/10') );

insert into GC_MOVIE values(GC_MOVIE_SEQ.nextval, '죽은자의 제국', 'Shisha no teikoku', 'all', '전체관람가', to_date('2016/02/25'), 
  '마키하라 료타로', '호소야 요시마사(존H. 왓슨), 무라세 아유무(프라이데이), 하나자와 카나(아달리 리리스)','애니메이션', 'http://movie.naver.com/movie/bi/mi/basic.nhn?code=143339', 0.00, 0,
  '바라는 것은, 21그램의 영혼과 너의 말<br>사체 소생 기술이 발달해 죽은자를 노동력으로 활용하는 19세기 말 런던.<br>의학을 전공하는 존. H. 왓슨은 친구 프라이데이와의 약속을 지키기 위해 불법으로 죽은자를 만드는 실험을 한다.<br>그의 불법 행위가 첩보기관 월싱엄에 알려지게 되며 왓슨은 위기를 맞게 되지만,<br>오히려 뛰어난 기술과 그의 야심을 높이 산 월싱엄으로부터 특별한 임무를 받게 된다.<br>그것은 바로 한 세기 전 빅터 프랑켄슈타인 박사가 절망 끝에서 만들어 낸 기술이 담긴 빅터의 수기를 찾아내는 것.<br>텅 빈 육체에 21그램의 영혼을 되돌릴 수 있는 유일한 방법인 빅터의 수기를 향해<br>왓슨은 삶과 죽음이 공존하는 욕망과 파멸의 공간으로 발을 내딛게 되는데...',
  'SH_poster.jpg', 'https://www.youtube.com/embed/aMkyF9VC8XQ', 'SH_01.jpg', 'SH_02.jpg', 'SH_03.jpg', 'SH_04.jpg',
  'SH_05.jpg', 'SH_06.jpg', 'SH_07.jpg', 120, to_date('2016/02/25'), to_date('2016/05/17') );

insert into GC_MOVIE values(GC_MOVIE_SEQ.nextval, '제5침공', 'The 5th Wave', '12', '12세 관람가', to_date('2016/02/25'), 
  'J블레이크슨', '클로이 모레츠(캐시 설리번), 닉 로빈슨, 마이카 먼로','모험,SF', 'http://movie.naver.com/movie/bi/mi/basic.nhn?code=125444', 0.00, 0,
  '인류를 전멸시킬 제5침공이 시작된다! <br>제1침공 어둠.. 지구의 모든 전력을 차단 <br>제2침공 파괴.. 전세계 도시들을 폐허로 휩쓴 대지진<br> 제3침공 전염병.. 인류 역사상 최악의 바이러스 <br>제4침공 침투.. 인체에 기생하여 모든 행동을 조종 <br><br>인간의 모습을 한 미스터리한 존재 디 아더스(The Others)는 네 번의 무차별 침공을 일으켜 지구를 초토화시켰다. 99%의 인류가 사망한 대재난 속에서 기적적으로 살아남은 캐시(클로이 모레츠)는 <br> 마지막 공격 제5침공이 시작되기 전에 디 아더스에게 끌려간 동생을 되찾아야 한다. <br>인간과 적을 구분할 수 없는 상황, 과연 캐시는 살아남을 수 있을 것인가. <br><br> 인류의 마지막 희망을 지켜내기 위해 반드시 싸워야 한다!',
  'OH_poster.jpg', ' https://www.youtube.com/embed/EA_bRDDOQL8', 'OH_01.jpg', 'OH_02.jpg', 'OH_03.jpg', 'OH_04.jpg',
  'OH_05.jpg', 'OH_06.jpg', 'OH_07.jpg', 112, to_date('2016/02/25'), to_date('2016/05/15') );

insert into GC_MOVIE values(GC_MOVIE_SEQ.nextval, '룸', 'Room', '15', '15세 관람가', to_date('2016/03/03'), 
  '레니 에이브러햄슨', '브리 라슨(조이), 제이콥 트렘블레이(잭), 윌리암H.머시','드라마', 'http://movie.naver.com/movie/bi/mi/basic.nhn?code=130989', 0.00, 0,
  '램프 하나, 세면대 하나, 침대 하나…<br>작은 방에 갇힌 24살 엄마와 5살 아들<br>7년 전, 한 남자에게 납치돼 작은 방에 갇히게 된 열일곱 살 소녀 조이<br> 세상과 단절된 채 지옥 같은 나날을 보내던 중, 아들 잭을 낳고 엄마가 된다<br><br>감옥 같은 작은 방에서 서로를 의지하며 살아가던 엄마와 아들<br>어느덧 세월은 흘러 잭은 다섯 살 생일을 맞이하게 된다<br>태어나 단 한번도 방 밖으로 나가 보지 못한 잭을<br> 더 이상 좁은 방안에 가둬 둘 수 없다고 생각한 조이는<br> 진짜 세상으로의 탈출을 결심한다<br>그러나, 그들의 극적인 탈출과 충격적인 과거 때문에<br> 세상은 두 사람을 또다시 보이지 않는 방안에 가두려 하는데…', 
  'RO_poster.jpg', ' https://www.youtube.com/embed/Lb5YHKFOiDo', 'RO_01.jpg', 'RO_02.jpg', 'RO_03.jpg', 'RO_04.jpg',
  'RO_05.jpg', 'RO_06.jpg', 'RO_07.jpg', 118, to_date('2016/03/03'), to_date('2016/06/30') );

insert into GC_MOVIE values(GC_MOVIE_SEQ.nextval, '무수단', 'MUSUDAN', '15', '15세 관람가', to_date('2016/03/03'), 
  '구모', '이지아(신유화 중위), 김민준(조진호 대위), 오종혁(유철환 중사) ','미스터리,스릴러', 'http://movie.naver.com/movie/bi/mi/basic.nhn?code=137944', 0.00, 0, 
  '대한민국 최전방 비무장지대에서 벌어진 원인불명의 사고<br>최정예 특임대 급파! 24시간 내 돌아오지 못하면 모두 죽는다!<br> 비무장지대에서 원인불명의 사망, 실종사건이 연이어 발생하자 특전대 엘리트 출신의 조진호 대위(김민준)와<br>생화학 주특기 장교 신유화 중위(이지아)를 각각 팀장, 부팀장으로 한 최정예 특임대가 구성된다.<br> 24시간 내에 비무장지대에서 벌어진 사고의 실체를 파악해 오라는 명령을 받은 그들,<br> 그러나 그곳에 들어선 순간 심상치 않은 흔적들이 발견되고, 대원들도 하나 둘씩 이상한 징후를 감지하기 시작하는데…', 
  'MU_poster.jpg', 'https://www.youtube.com/embed/Ly0V7D2dtoM', 'MU_01.jpg', 'MU_02.jpg', 'MU_03.jpg', 'MU_04.jpg',
  'MU_05.jpg', 'MU_06.jpg', 'MU_07.jpg', 87, to_date('2016/03/03'), to_date('2016/06/20') );

insert into GC_MOVIE values(GC_MOVIE_SEQ.nextval, '조이', 'Joy', '12', '12세 관람가', to_date('2016/03/10'), 
  '데이빗 O. 러셀', '제니퍼 로렌스(조이), 브래들리 쿠퍼, 로버트 드 니로(루디)','코미디,드라마', 'http://movie.naver.com/movie/bi/mi/basic.nhn?code=125458', 0.00, 0,
  '세상 모두가 좋아할 아주 멋진 물건들을 만들거야 <br><br>이혼한 부모님과 전남편, 할머니와 두 아이까지 떠안고 간신히 하루하루를 살아가던 싱글맘 조이(제니퍼 로렌스).<br> 자신이 꿈꿨던 인생과는 너무나 다른 현실에 지쳐가던 어느 날, 깨진 와인잔을 치우던 조이는 하나의 아이디어를 떠올리게 된다.<br> 아주 멋진 것을 만들어 세상에 보여주겠다는 어릴 적 꿈을 이루겠다고 결심한 조이는 상품 제작에 돌입한다.<br> 그러나 사업 경험이 전무한 조이는 기업과 투자자로부터 외면받으며 여자에게 더욱 가혹한 비즈니스 세계의 벽 앞에서 매번 좌절하게 된다.<br> 이 때 전 남편 토니의 소개로 홈쇼핑 채널 QVC의 경영 이사인 닐 워커(브래들리 쿠퍼)를 만나게 된 조이는 <br> 기적적으로 홈쇼핑 방송 기회를 얻게 되고 5만개의 제품을 제작한다.<br> 가난한 싱글맘에서 미국 최고의 여성 CEO가 된 조이!<br> 세상을 놀라게 한 그녀의 기적 같은 실화가 펼쳐진다!', 
  'JOY_poster.jpg', 'https://www.youtube.com/embed/3nWtOo7iZdY', 'JOY_01.jpg', 'JOY_02.jpg', 'JOY_03.jpg', 'JOY_04.jpg',
  'JOY_05.jpg', 'JOY_06.jpg', 'JOY_07.jpg', 124, to_date('2016/03/10'), to_date('2016/06/04') );

commit;

