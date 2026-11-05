/* GAON_CINEMA_MEMBER 테이블 (회원정보) */

DROP TABLE GC_MEMBER; 
DROP SEQUENCE GC_MEMBER_SEQ;

CREATE TABLE GC_MEMBER (
  MEMBER_ID NUMBER(10)         NOT NULL PRIMARY KEY,  --MEMBER 고유키
  USERID    VARCHAR2(20 CHAR)  NOT NULL,              --사용자 아이디
  USERPW    VARCHAR2(20 CHAR)  NOT NULL,              --사용자 비밀번호
  IMG_FILE  VARCHAR2(100 CHAR),                       --프로필 사진파일
  NAME      VARCHAR2(20 CHAR)  NOT NULL,              --이름
  GENDER    VARCHAR2(5 CHAR)   NOT NULL,              --성별
  BIRTH     DATE               NOT NULL,              --생일
  TELNUM    VARCHAR2(20 CHAR)  NOT NULL,              --전화번호
  EMAIL     VARCHAR2(70 CHAR)  NOT NULL,              --이메일
  ZIPCODE   VARCHAR2(10 CHAR)  NOT NULL,              --우편번호
  ADDRESS1  VARCHAR2(100 CHAR) NOT NULL,              --주소
  ADDRESS2  VARCHAR2(100 CHAR) NULL,                  --세부주소
  POINT	    NUMBER(10),			   	                      --포인트
  MOVIE_RATE VARCHAR2(300 CHAR),                      --평점매긴 영화들
  MOVIE_LIKE VARCHAR2(300 CHAR)                       --찜한 영화들
);
CREATE SEQUENCE GC_MEMBER_SEQ;

insert into GC_MEMBER values 
	(GC_MEMBER_SEQ.nextval,'admin','1234','img.jpg','관리자','남',sysdate,'1234' ,'12312@123123.com','가온', '시네마','가온시네마',0, 'empty/', 'empty/1/');

insert into GC_MEMBER values 
	(GC_MEMBER_SEQ.nextval,'hb','1234','img.jpg','김회원','남',sysdate,'1234' ,'12312@123123.com','가온', '시네마','가온시네마',0, 'empty/', 'empty/1/');
	
commit;