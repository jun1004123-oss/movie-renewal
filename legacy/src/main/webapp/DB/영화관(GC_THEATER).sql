
DROP TABLE GC_THEATER; 
DROP SEQUENCE GC_THEATER_SEQ;

/* GC_THEATER 테이블 (영화관) */
CREATE TABLE GC_THEATER (
  THEATER_ID   NUMBER(10)        NOT NULL PRIMARY KEY,  --THEATER 고유키
  CNAME        VARCHAR2(10 CHAR) NOT NULL,              --도시 이름 (서울, 인천/경기)
  CORDER       NUMBER(3)         NOT NULL,              --도시 순서 (가나다 순이 아닌 서울, 인천, 경기 순서로 뿌려주도록)
  LNAME        VARCHAR2(10 CHAR) NOT NULL,              --지역 이름 (신촌, 강남, 성신)
  CORDER2      NUMBER(3)         NOT NULL,              --지역 순서 (신촌, 강남, 성신)
  TNAME        VARCHAR2(10 CHAR) NOT NULL,              --영화관 이름 (1관, 2관, 3D관, 4D관)
  TTYPE        VARCHAR2(10 CHAR) NOT NULL,              --영화관 종류 (2D, 3D, 4D)
  TIMG         VARCHAR2(50 CHAR) NOT NULL,              --영화관 이미지
  SEATCOUNT    NUMBER(3)         NOT NULL,              --좌석 총 개수
  SEATROWCOUNT NUMBER(2)         NOT NULL,              --좌석 행 개수
  SEATCOLCOUNT NUMBER(2)         NOT NULL,              --좌석 열 개수
  SEATSTYLE    NUMBER(2)         NOT NULL               --스타일
);
CREATE SEQUENCE GC_THEATER_SEQ;


/* GC_THEATER 데이터 삽입 */

/* 서울 */

INSERT INTO GC_THEATER VALUES (GC_THEATER_SEQ.NEXTVAL, '서울', 1, '강남', 1, '1관', '2D', 'theater_sample.jpg', 90, 9, 10, 1);
INSERT INTO GC_THEATER VALUES (GC_THEATER_SEQ.NEXTVAL, '서울', 1, '강남', 1, '2관', '2D', 'theater_sample.jpg', 400, 20, 20, 2);
INSERT INTO GC_THEATER VALUES (GC_THEATER_SEQ.NEXTVAL, '서울', 1, '강남', 1, '3관', '2D', 'theater_sample.jpg', 70, 7, 10, 3);

INSERT INTO GC_THEATER VALUES (GC_THEATER_SEQ.NEXTVAL, '서울', 1, '목동', 2, '1관', '2D', 'theater_sample.jpg', 90, 9, 10, 1);
INSERT INTO GC_THEATER VALUES (GC_THEATER_SEQ.NEXTVAL, '서울', 1, '목동', 2, '2관', '2D', 'theater_sample.jpg', 400, 20, 20, 2);
INSERT INTO GC_THEATER VALUES (GC_THEATER_SEQ.NEXTVAL, '서울', 1, '목동', 2, '3관', '2D', 'theater_sample.jpg', 70, 7, 10, 3);

INSERT INTO GC_THEATER VALUES (GC_THEATER_SEQ.NEXTVAL, '서울', 1, '센트럴', 3, '1관', '2D', 'theater_sample.jpg', 90, 9, 10, 1);
INSERT INTO GC_THEATER VALUES (GC_THEATER_SEQ.NEXTVAL, '서울', 1, '센트럴', 3, '2관', '2D', 'theater_sample.jpg', 400, 20, 20, 2);
INSERT INTO GC_THEATER VALUES (GC_THEATER_SEQ.NEXTVAL, '서울', 1, '센트럴', 3, '3관', '2D', 'theater_sample.jpg', 70, 7, 10, 3);

INSERT INTO GC_THEATER VALUES (GC_THEATER_SEQ.NEXTVAL, '서울', 1, '신촌', 4, '1관', '2D', 'theater_sample.jpg', 90, 9, 10, 1);
INSERT INTO GC_THEATER VALUES (GC_THEATER_SEQ.NEXTVAL, '서울', 1, '신촌', 4, '2관', '2D', 'theater_sample.jpg', 400, 20, 20, 2);
INSERT INTO GC_THEATER VALUES (GC_THEATER_SEQ.NEXTVAL, '서울', 1, '신촌', 4, '3관', '2D', 'theater_sample.jpg', 70, 7, 10, 3);

INSERT INTO GC_THEATER VALUES (GC_THEATER_SEQ.NEXTVAL, '서울', 1, '이수', 5, '1관', '2D', 'theater_sample.jpg', 90, 9, 10, 1);
INSERT INTO GC_THEATER VALUES (GC_THEATER_SEQ.NEXTVAL, '서울', 1, '이수', 5, '2관', '2D', 'theater_sample.jpg', 400, 20, 20, 2);
INSERT INTO GC_THEATER VALUES (GC_THEATER_SEQ.NEXTVAL, '서울', 1, '이수', 5, '3관', '2D', 'theater_sample.jpg', 70, 7, 10, 3);

INSERT INTO GC_THEATER VALUES (GC_THEATER_SEQ.NEXTVAL, '서울', 1, '화곡', 6, '1관', '2D', 'theater_sample.jpg', 90, 9, 10, 1);
INSERT INTO GC_THEATER VALUES (GC_THEATER_SEQ.NEXTVAL, '서울', 1, '화곡', 6, '2관', '2D', 'theater_sample.jpg', 400, 20, 20, 2);
INSERT INTO GC_THEATER VALUES (GC_THEATER_SEQ.NEXTVAL, '서울', 1, '화곡', 6, '3관', '2D', 'theater_sample.jpg', 70, 7, 10, 3);

INSERT INTO GC_THEATER VALUES (GC_THEATER_SEQ.NEXTVAL, '서울', 1, '동대문', 7, '1관', '2D', 'theater_sample.jpg', 90, 9, 10, 1);
INSERT INTO GC_THEATER VALUES (GC_THEATER_SEQ.NEXTVAL, '서울', 1, '동대문', 7, '2관', '2D', 'theater_sample.jpg', 400, 20, 20, 2);
INSERT INTO GC_THEATER VALUES (GC_THEATER_SEQ.NEXTVAL, '서울', 1, '동대문', 7, '3관', '2D', 'theater_sample.jpg', 70, 7, 10, 3);

INSERT INTO GC_THEATER VALUES (GC_THEATER_SEQ.NEXTVAL, '서울', 1, '상봉', 8, '1관', '2D', 'theater_sample.jpg', 90, 9, 10, 1);
INSERT INTO GC_THEATER VALUES (GC_THEATER_SEQ.NEXTVAL, '서울', 1, '상봉', 8, '2관', '2D', 'theater_sample.jpg', 400, 20, 20, 2);
INSERT INTO GC_THEATER VALUES (GC_THEATER_SEQ.NEXTVAL, '서울', 1, '상봉', 8, '3관', '2D', 'theater_sample.jpg', 70, 7, 10, 3);

INSERT INTO GC_THEATER VALUES (GC_THEATER_SEQ.NEXTVAL, '서울', 1, '수유', 9, '1관', '2D', 'theater_sample.jpg', 90, 9, 10, 1);
INSERT INTO GC_THEATER VALUES (GC_THEATER_SEQ.NEXTVAL, '서울', 1, '수유', 9, '2관', '2D', 'theater_sample.jpg', 400, 20, 20, 2);
INSERT INTO GC_THEATER VALUES (GC_THEATER_SEQ.NEXTVAL, '서울', 1, '수유', 9, '3관', '2D', 'theater_sample.jpg', 70, 7, 10, 3);

INSERT INTO GC_THEATER VALUES (GC_THEATER_SEQ.NEXTVAL, '서울', 1, '은평', 10, '1관', '2D', 'theater_sample.jpg', 90, 9, 10, 1);
INSERT INTO GC_THEATER VALUES (GC_THEATER_SEQ.NEXTVAL, '서울', 1, '은평', 10, '2관', '2D', 'theater_sample.jpg', 400, 20, 20, 2);
INSERT INTO GC_THEATER VALUES (GC_THEATER_SEQ.NEXTVAL, '서울', 1, '은평', 10, '3관', '2D', 'theater_sample.jpg', 70, 7, 10, 3);

INSERT INTO GC_THEATER VALUES (GC_THEATER_SEQ.NEXTVAL, '서울', 1, '코엑스', 11, '1관', '2D', 'theater_sample.jpg', 90, 9, 10, 1);
INSERT INTO GC_THEATER VALUES (GC_THEATER_SEQ.NEXTVAL, '서울', 1, '코엑스', 11, '2관', '2D', 'theater_sample.jpg', 400, 20, 20, 2);
INSERT INTO GC_THEATER VALUES (GC_THEATER_SEQ.NEXTVAL, '서울', 1, '코엑스', 11, '3관', '2D', 'theater_sample.jpg', 70, 7, 10, 3);

/* 인천/경기 */

INSERT INTO GC_THEATER VALUES (GC_THEATER_SEQ.NEXTVAL, '인천/경기', 2, '검단', 12, '1관', '2D', 'theater_sample.jpg', 90, 9, 10, 1);
INSERT INTO GC_THEATER VALUES (GC_THEATER_SEQ.NEXTVAL, '인천/경기', 2, '검단', 12, '2관', '2D', 'theater_sample.jpg', 400, 20, 20, 2);
INSERT INTO GC_THEATER VALUES (GC_THEATER_SEQ.NEXTVAL, '인천/경기', 2, '검단', 12, '3관', '2D', 'theater_sample.jpg', 70, 7, 10, 3);

INSERT INTO GC_THEATER VALUES (GC_THEATER_SEQ.NEXTVAL, '인천/경기', 2, '남양주', 13, '1관', '2D', 'theater_sample.jpg', 90, 9, 10, 1);
INSERT INTO GC_THEATER VALUES (GC_THEATER_SEQ.NEXTVAL, '인천/경기', 2, '남양주', 13, '2관', '2D', 'theater_sample.jpg', 400, 20, 20, 2);
INSERT INTO GC_THEATER VALUES (GC_THEATER_SEQ.NEXTVAL, '인천/경기', 2, '남양주', 13, '3관', '2D', 'theater_sample.jpg', 70, 7, 10, 3);

INSERT INTO GC_THEATER VALUES (GC_THEATER_SEQ.NEXTVAL, '인천/경기', 2, '백석', 14, '1관', '2D', 'theater_sample.jpg', 90, 9, 10, 1);
INSERT INTO GC_THEATER VALUES (GC_THEATER_SEQ.NEXTVAL, '인천/경기', 2, '백석', 14, '2관', '2D', 'theater_sample.jpg', 400, 20, 20, 2);
INSERT INTO GC_THEATER VALUES (GC_THEATER_SEQ.NEXTVAL, '인천/경기', 2, '백석', 14, '3관', '2D', 'theater_sample.jpg', 70, 7, 10, 3);

INSERT INTO GC_THEATER VALUES (GC_THEATER_SEQ.NEXTVAL, '인천/경기', 2, '분당', 15, '1관', '2D', 'theater_sample.jpg', 90, 9, 10, 1);
INSERT INTO GC_THEATER VALUES (GC_THEATER_SEQ.NEXTVAL, '인천/경기', 2, '분당', 15, '2관', '2D', 'theater_sample.jpg', 400, 20, 20, 2);
INSERT INTO GC_THEATER VALUES (GC_THEATER_SEQ.NEXTVAL, '인천/경기', 2, '분당', 15, '3관', '2D', 'theater_sample.jpg', 70, 7, 10, 3);

INSERT INTO GC_THEATER VALUES (GC_THEATER_SEQ.NEXTVAL, '인천/경기', 2, '수원남문', 16, '1관', '2D', 'theater_sample.jpg', 90, 9, 10, 1);
INSERT INTO GC_THEATER VALUES (GC_THEATER_SEQ.NEXTVAL, '인천/경기', 2, '수원남문', 16, '2관', '2D', 'theater_sample.jpg', 400, 20, 20, 2);
INSERT INTO GC_THEATER VALUES (GC_THEATER_SEQ.NEXTVAL, '인천/경기', 2, '수원남문', 16, '3관', '2D', 'theater_sample.jpg', 70, 7, 10, 3);

INSERT INTO GC_THEATER VALUES (GC_THEATER_SEQ.NEXTVAL, '인천/경기', 2, '양주', 17, '1관', '2D', 'theater_sample.jpg', 90, 9, 10, 1);
INSERT INTO GC_THEATER VALUES (GC_THEATER_SEQ.NEXTVAL, '인천/경기', 2, '양주', 17, '2관', '2D', 'theater_sample.jpg', 400, 20, 20, 2);
INSERT INTO GC_THEATER VALUES (GC_THEATER_SEQ.NEXTVAL, '인천/경기', 2, '양주', 17, '3관', '2D', 'theater_sample.jpg', 70, 7, 10, 3);

INSERT INTO GC_THEATER VALUES (GC_THEATER_SEQ.NEXTVAL, '인천/경기', 2, '영통', 18, '1관', '2D', 'theater_sample.jpg', 90, 9, 10, 1);
INSERT INTO GC_THEATER VALUES (GC_THEATER_SEQ.NEXTVAL, '인천/경기', 2, '영통', 18, '2관', '2D', 'theater_sample.jpg', 400, 20, 20, 2);
INSERT INTO GC_THEATER VALUES (GC_THEATER_SEQ.NEXTVAL, '인천/경기', 2, '영통', 18, '3관', '2D', 'theater_sample.jpg', 70, 7, 10, 3);

INSERT INTO GC_THEATER VALUES (GC_THEATER_SEQ.NEXTVAL, '인천/경기', 2, '인천논현', 19, '1관', '2D', 'theater_sample.jpg', 90, 9, 10, 1);
INSERT INTO GC_THEATER VALUES (GC_THEATER_SEQ.NEXTVAL, '인천/경기', 2, '인천논현', 19, '2관', '2D', 'theater_sample.jpg', 400, 20, 20, 2);
INSERT INTO GC_THEATER VALUES (GC_THEATER_SEQ.NEXTVAL, '인천/경기', 2, '인천논현', 19, '3관', '2D', 'theater_sample.jpg', 70, 7, 10, 3);

INSERT INTO GC_THEATER VALUES (GC_THEATER_SEQ.NEXTVAL, '인천/경기', 2, '킨텍스', 20, '1관', '2D', 'theater_sample.jpg', 90, 9, 10, 1);
INSERT INTO GC_THEATER VALUES (GC_THEATER_SEQ.NEXTVAL, '인천/경기', 2, '킨텍스', 20, '2관', '2D', 'theater_sample.jpg', 400, 20, 20, 2);
INSERT INTO GC_THEATER VALUES (GC_THEATER_SEQ.NEXTVAL, '인천/경기', 2, '킨텍스', 20, '3관', '2D', 'theater_sample.jpg', 70, 7, 10, 3);

INSERT INTO GC_THEATER VALUES (GC_THEATER_SEQ.NEXTVAL, '인천/경기', 2, '파주출판도시', 21, '1관', '2D', 'theater_sample.jpg', 90, 9, 10, 1);
INSERT INTO GC_THEATER VALUES (GC_THEATER_SEQ.NEXTVAL, '인천/경기', 2, '파주출판도시', 21, '2관', '2D', 'theater_sample.jpg', 400, 20, 20, 2);
INSERT INTO GC_THEATER VALUES (GC_THEATER_SEQ.NEXTVAL, '인천/경기', 2, '파주출판도시', 21, '3관', '2D', 'theater_sample.jpg', 70, 7, 10, 3);

INSERT INTO GC_THEATER VALUES (GC_THEATER_SEQ.NEXTVAL, '인천/경기', 2, 'DriveM(용인)', 22, '1관', '2D', 'theater_sample.jpg', 90, 9, 10, 1);
INSERT INTO GC_THEATER VALUES (GC_THEATER_SEQ.NEXTVAL, '인천/경기', 2, 'DriveM(용인)', 22, '2관', '2D', 'theater_sample.jpg', 400, 20, 20, 2);
INSERT INTO GC_THEATER VALUES (GC_THEATER_SEQ.NEXTVAL, '인천/경기', 2, 'DriveM(용인)', 22, '3관', '2D', 'theater_sample.jpg', 70, 7, 10, 3);

INSERT INTO GC_THEATER VALUES (GC_THEATER_SEQ.NEXTVAL, '인천/경기', 2, '김포', 23, '1관', '2D', 'theater_sample.jpg', 90, 9, 10, 1);
INSERT INTO GC_THEATER VALUES (GC_THEATER_SEQ.NEXTVAL, '인천/경기', 2, '김포', 23, '2관', '2D', 'theater_sample.jpg', 400, 20, 20, 2);
INSERT INTO GC_THEATER VALUES (GC_THEATER_SEQ.NEXTVAL, '인천/경기', 2, '김포', 23, '3관', '2D', 'theater_sample.jpg', 70, 7, 10, 3);

INSERT INTO GC_THEATER VALUES (GC_THEATER_SEQ.NEXTVAL, '인천/경기', 2, '동탄', 24, '1관', '2D', 'theater_sample.jpg', 90, 9, 10, 1);
INSERT INTO GC_THEATER VALUES (GC_THEATER_SEQ.NEXTVAL, '인천/경기', 2, '동탄', 24, '2관', '2D', 'theater_sample.jpg', 400, 20, 20, 2);
INSERT INTO GC_THEATER VALUES (GC_THEATER_SEQ.NEXTVAL, '인천/경기', 2, '동탄', 24, '3관', '2D', 'theater_sample.jpg', 70, 7, 10, 3);

INSERT INTO GC_THEATER VALUES (GC_THEATER_SEQ.NEXTVAL, '인천/경기', 2, '별내', 25, '1관', '2D', 'theater_sample.jpg', 90, 9, 10, 1);
INSERT INTO GC_THEATER VALUES (GC_THEATER_SEQ.NEXTVAL, '인천/경기', 2, '별내', 25, '2관', '2D', 'theater_sample.jpg', 400, 20, 20, 2);
INSERT INTO GC_THEATER VALUES (GC_THEATER_SEQ.NEXTVAL, '인천/경기', 2, '별내', 25, '3관', '2D', 'theater_sample.jpg', 70, 7, 10, 3);

INSERT INTO GC_THEATER VALUES (GC_THEATER_SEQ.NEXTVAL, '인천/경기', 2, '수원', 26, '1관', '2D', 'theater_sample.jpg', 90, 9, 10, 1);
INSERT INTO GC_THEATER VALUES (GC_THEATER_SEQ.NEXTVAL, '인천/경기', 2, '수원', 26, '2관', '2D', 'theater_sample.jpg', 400, 20, 20, 2);
INSERT INTO GC_THEATER VALUES (GC_THEATER_SEQ.NEXTVAL, '인천/경기', 2, '수원', 26, '3관', '2D', 'theater_sample.jpg', 70, 7, 10, 3);

INSERT INTO GC_THEATER VALUES (GC_THEATER_SEQ.NEXTVAL, '인천/경기', 2, '안산중앙', 27, '1관', '2D', 'theater_sample.jpg', 90, 9, 10, 1);
INSERT INTO GC_THEATER VALUES (GC_THEATER_SEQ.NEXTVAL, '인천/경기', 2, '안산중앙', 27, '2관', '2D', 'theater_sample.jpg', 400, 20, 20, 2);
INSERT INTO GC_THEATER VALUES (GC_THEATER_SEQ.NEXTVAL, '인천/경기', 2, '안산중앙', 27, '3관', '2D', 'theater_sample.jpg', 70, 7, 10, 3);

INSERT INTO GC_THEATER VALUES (GC_THEATER_SEQ.NEXTVAL, '인천/경기', 2, '연수', 28, '1관', '2D', 'theater_sample.jpg', 90, 9, 10, 1);
INSERT INTO GC_THEATER VALUES (GC_THEATER_SEQ.NEXTVAL, '인천/경기', 2, '연수', 28, '2관', '2D', 'theater_sample.jpg', 400, 20, 20, 2);
INSERT INTO GC_THEATER VALUES (GC_THEATER_SEQ.NEXTVAL, '인천/경기', 2, '연수', 28, '3관', '2D', 'theater_sample.jpg', 70, 7, 10, 3);

INSERT INTO GC_THEATER VALUES (GC_THEATER_SEQ.NEXTVAL, '인천/경기', 2, '오산', 29, '1관', '2D', 'theater_sample.jpg', 90, 9, 10, 1);
INSERT INTO GC_THEATER VALUES (GC_THEATER_SEQ.NEXTVAL, '인천/경기', 2, '오산', 29, '2관', '2D', 'theater_sample.jpg', 400, 20, 20, 2);
INSERT INTO GC_THEATER VALUES (GC_THEATER_SEQ.NEXTVAL, '인천/경기', 2, '오산', 29, '3관', '2D', 'theater_sample.jpg', 70, 7, 10, 3);

INSERT INTO GC_THEATER VALUES (GC_THEATER_SEQ.NEXTVAL, '인천/경기', 2, '일산', 30, '1관', '2D', 'theater_sample.jpg', 90, 9, 10, 1);
INSERT INTO GC_THEATER VALUES (GC_THEATER_SEQ.NEXTVAL, '인천/경기', 2, '일산', 30, '2관', '2D', 'theater_sample.jpg', 400, 20, 20, 2);
INSERT INTO GC_THEATER VALUES (GC_THEATER_SEQ.NEXTVAL, '인천/경기', 2, '일산', 30, '3관', '2D', 'theater_sample.jpg', 70, 7, 10, 3);

INSERT INTO GC_THEATER VALUES (GC_THEATER_SEQ.NEXTVAL, '인천/경기', 2, '파주금촌', 31, '1관', '2D', 'theater_sample.jpg', 90, 9, 10, 1);
INSERT INTO GC_THEATER VALUES (GC_THEATER_SEQ.NEXTVAL, '인천/경기', 2, '파주금촌', 31, '2관', '2D', 'theater_sample.jpg', 400, 20, 20, 2);
INSERT INTO GC_THEATER VALUES (GC_THEATER_SEQ.NEXTVAL, '인천/경기', 2, '파주금촌', 31, '3관', '2D', 'theater_sample.jpg', 70, 7, 10, 3);

INSERT INTO GC_THEATER VALUES (GC_THEATER_SEQ.NEXTVAL, '인천/경기', 2, '평택', 32, '1관', '2D', 'theater_sample.jpg', 90, 9, 10, 1);
INSERT INTO GC_THEATER VALUES (GC_THEATER_SEQ.NEXTVAL, '인천/경기', 2, '평택', 32, '2관', '2D', 'theater_sample.jpg', 400, 20, 20, 2);
INSERT INTO GC_THEATER VALUES (GC_THEATER_SEQ.NEXTVAL, '인천/경기', 2, '평택', 32, '3관', '2D', 'theater_sample.jpg', 70, 7, 10, 3);

/* 대전/충청/세종 */

INSERT INTO GC_THEATER VALUES (GC_THEATER_SEQ.NEXTVAL, '대전/충청/세종', 3, '공주', 33, '1관', '2D', 'theater_sample.jpg', 90, 9, 10, 1);
INSERT INTO GC_THEATER VALUES (GC_THEATER_SEQ.NEXTVAL, '대전/충청/세종', 3, '공주', 33, '2관', '2D', 'theater_sample.jpg', 400, 20, 20, 2);
INSERT INTO GC_THEATER VALUES (GC_THEATER_SEQ.NEXTVAL, '대전/충청/세종', 3, '공주', 33, '3관', '2D', 'theater_sample.jpg', 70, 7, 10, 3);

INSERT INTO GC_THEATER VALUES (GC_THEATER_SEQ.NEXTVAL, '대전/충청/세종', 3, '보령', 34, '1관', '2D', 'theater_sample.jpg', 90, 9, 10, 1);
INSERT INTO GC_THEATER VALUES (GC_THEATER_SEQ.NEXTVAL, '대전/충청/세종', 3, '보령', 34, '2관', '2D', 'theater_sample.jpg', 400, 20, 20, 2);
INSERT INTO GC_THEATER VALUES (GC_THEATER_SEQ.NEXTVAL, '대전/충청/세종', 3, '보령', 34, '3관', '2D', 'theater_sample.jpg', 70, 7, 10, 3);

INSERT INTO GC_THEATER VALUES (GC_THEATER_SEQ.NEXTVAL, '대전/충청/세종', 3, '제천', 35, '1관', '2D', 'theater_sample.jpg', 90, 9, 10, 1);
INSERT INTO GC_THEATER VALUES (GC_THEATER_SEQ.NEXTVAL, '대전/충청/세종', 3, '제천', 35, '2관', '2D', 'theater_sample.jpg', 400, 20, 20, 2);
INSERT INTO GC_THEATER VALUES (GC_THEATER_SEQ.NEXTVAL, '대전/충청/세종', 3, '제천', 35, '3관', '2D', 'theater_sample.jpg', 70, 7, 10, 3);

INSERT INTO GC_THEATER VALUES (GC_THEATER_SEQ.NEXTVAL, '대전/충청/세종', 3, '천안', 36, '1관', '2D', 'theater_sample.jpg', 90, 9, 10, 1);
INSERT INTO GC_THEATER VALUES (GC_THEATER_SEQ.NEXTVAL, '대전/충청/세종', 3, '천안', 36, '2관', '2D', 'theater_sample.jpg', 400, 20, 20, 2);
INSERT INTO GC_THEATER VALUES (GC_THEATER_SEQ.NEXTVAL, '대전/충청/세종', 3, '천안', 36, '3관', '2D', 'theater_sample.jpg', 70, 7, 10, 3);

INSERT INTO GC_THEATER VALUES (GC_THEATER_SEQ.NEXTVAL, '대전/충청/세종', 3, '대전', 37, '1관', '2D', 'theater_sample.jpg', 90, 9, 10, 1);
INSERT INTO GC_THEATER VALUES (GC_THEATER_SEQ.NEXTVAL, '대전/충청/세종', 3, '대전', 37, '2관', '2D', 'theater_sample.jpg', 400, 20, 20, 2);
INSERT INTO GC_THEATER VALUES (GC_THEATER_SEQ.NEXTVAL, '대전/충청/세종', 3, '대전', 37, '3관', '2D', 'theater_sample.jpg', 70, 7, 10, 3);

INSERT INTO GC_THEATER VALUES (GC_THEATER_SEQ.NEXTVAL, '대전/충청/세종', 3, '세종', 38, '1관', '2D', 'theater_sample.jpg', 90, 9, 10, 1);
INSERT INTO GC_THEATER VALUES (GC_THEATER_SEQ.NEXTVAL, '대전/충청/세종', 3, '세종', 38, '2관', '2D', 'theater_sample.jpg', 400, 20, 20, 2);
INSERT INTO GC_THEATER VALUES (GC_THEATER_SEQ.NEXTVAL, '대전/충청/세종', 3, '세종', 38, '3관', '2D', 'theater_sample.jpg', 70, 7, 10, 3);

INSERT INTO GC_THEATER VALUES (GC_THEATER_SEQ.NEXTVAL, '대전/충청/세종', 3, '진천', 39, '1관', '2D', 'theater_sample.jpg', 90, 9, 10, 1);
INSERT INTO GC_THEATER VALUES (GC_THEATER_SEQ.NEXTVAL, '대전/충청/세종', 3, '진천', 39, '2관', '2D', 'theater_sample.jpg', 400, 20, 20, 2);
INSERT INTO GC_THEATER VALUES (GC_THEATER_SEQ.NEXTVAL, '대전/충청/세종', 3, '진천', 39, '3관', '2D', 'theater_sample.jpg', 70, 7, 10, 3);

INSERT INTO GC_THEATER VALUES (GC_THEATER_SEQ.NEXTVAL, '대전/충청/세종', 3, '충주', 40, '1관', '2D', 'theater_sample.jpg', 90, 9, 10, 1);
INSERT INTO GC_THEATER VALUES (GC_THEATER_SEQ.NEXTVAL, '대전/충청/세종', 3, '충주', 40, '2관', '2D', 'theater_sample.jpg', 400, 20, 20, 2);
INSERT INTO GC_THEATER VALUES (GC_THEATER_SEQ.NEXTVAL, '대전/충청/세종', 3, '충주', 40, '3관', '2D', 'theater_sample.jpg', 70, 7, 10, 3);


/* 부산/대구/경상 */

INSERT INTO GC_THEATER VALUES (GC_THEATER_SEQ.NEXTVAL, '부산/대구/경상', 4, '거창', 41, '1관', '2D', 'theater_sample.jpg', 90, 9, 10, 1);
INSERT INTO GC_THEATER VALUES (GC_THEATER_SEQ.NEXTVAL, '부산/대구/경상', 4, '거창', 41, '2관', '2D', 'theater_sample.jpg', 400, 20, 20, 2);
INSERT INTO GC_THEATER VALUES (GC_THEATER_SEQ.NEXTVAL, '부산/대구/경상', 4, '거창', 41, '3관', '2D', 'theater_sample.jpg', 70, 7, 10, 3);

INSERT INTO GC_THEATER VALUES (GC_THEATER_SEQ.NEXTVAL, '부산/대구/경상', 4, '경주', 42, '1관', '2D', 'theater_sample.jpg', 90, 9, 10, 1);
INSERT INTO GC_THEATER VALUES (GC_THEATER_SEQ.NEXTVAL, '부산/대구/경상', 4, '경주', 42, '2관', '2D', 'theater_sample.jpg', 400, 20, 20, 2);
INSERT INTO GC_THEATER VALUES (GC_THEATER_SEQ.NEXTVAL, '부산/대구/경상', 4, '경주', 42, '3관', '2D', 'theater_sample.jpg', 70, 7, 10, 3);

INSERT INTO GC_THEATER VALUES (GC_THEATER_SEQ.NEXTVAL, '부산/대구/경상', 4, '구미강동', 43, '1관', '2D', 'theater_sample.jpg', 90, 9, 10, 1);
INSERT INTO GC_THEATER VALUES (GC_THEATER_SEQ.NEXTVAL, '부산/대구/경상', 4, '구미강동', 43, '2관', '2D', 'theater_sample.jpg', 400, 20, 20, 2);
INSERT INTO GC_THEATER VALUES (GC_THEATER_SEQ.NEXTVAL, '부산/대구/경상', 4, '구미강동', 43, '3관', '2D', 'theater_sample.jpg', 70, 7, 10, 3);

INSERT INTO GC_THEATER VALUES (GC_THEATER_SEQ.NEXTVAL, '부산/대구/경상', 4, '대구(칠성로)', 44, '1관', '2D', 'theater_sample.jpg', 90, 9, 10, 1);
INSERT INTO GC_THEATER VALUES (GC_THEATER_SEQ.NEXTVAL, '부산/대구/경상', 4, '대구(칠성로)', 44, '2관', '2D', 'theater_sample.jpg', 400, 20, 20, 2);
INSERT INTO GC_THEATER VALUES (GC_THEATER_SEQ.NEXTVAL, '부산/대구/경상', 4, '대구(칠성로)', 44, '3관', '2D', 'theater_sample.jpg', 70, 7, 10, 3);

INSERT INTO GC_THEATER VALUES (GC_THEATER_SEQ.NEXTVAL, '부산/대구/경상', 4, '문경', 45, '1관', '2D', 'theater_sample.jpg', 90, 9, 10, 1);
INSERT INTO GC_THEATER VALUES (GC_THEATER_SEQ.NEXTVAL, '부산/대구/경상', 4, '문경', 45, '2관', '2D', 'theater_sample.jpg', 400, 20, 20, 2);
INSERT INTO GC_THEATER VALUES (GC_THEATER_SEQ.NEXTVAL, '부산/대구/경상', 4, '문경', 45, '3관', '2D', 'theater_sample.jpg', 70, 7, 10, 3);

INSERT INTO GC_THEATER VALUES (GC_THEATER_SEQ.NEXTVAL, '부산/대구/경상', 4, '북대구(칠곡)', 46, '1관', '2D', 'theater_sample.jpg', 90, 9, 10, 1);
INSERT INTO GC_THEATER VALUES (GC_THEATER_SEQ.NEXTVAL, '부산/대구/경상', 4, '북대구(칠곡)', 46, '2관', '2D', 'theater_sample.jpg', 400, 20, 20, 2);
INSERT INTO GC_THEATER VALUES (GC_THEATER_SEQ.NEXTVAL, '부산/대구/경상', 4, '북대구(칠곡)', 46, '3관', '2D', 'theater_sample.jpg', 70, 7, 10, 3);

INSERT INTO GC_THEATER VALUES (GC_THEATER_SEQ.NEXTVAL, '부산/대구/경상', 4, '서면', 47, '1관', '2D', 'theater_sample.jpg', 90, 9, 10, 1);
INSERT INTO GC_THEATER VALUES (GC_THEATER_SEQ.NEXTVAL, '부산/대구/경상', 4, '서면', 47, '2관', '2D', 'theater_sample.jpg', 400, 20, 20, 2);
INSERT INTO GC_THEATER VALUES (GC_THEATER_SEQ.NEXTVAL, '부산/대구/경상', 4, '서면', 47, '3관', '2D', 'theater_sample.jpg', 70, 7, 10, 3);

INSERT INTO GC_THEATER VALUES (GC_THEATER_SEQ.NEXTVAL, '부산/대구/경상', 4, '울산', 48, '1관', '2D', 'theater_sample.jpg', 90, 9, 10, 1);
INSERT INTO GC_THEATER VALUES (GC_THEATER_SEQ.NEXTVAL, '부산/대구/경상', 4, '울산', 48, '2관', '2D', 'theater_sample.jpg', 400, 20, 20, 2);
INSERT INTO GC_THEATER VALUES (GC_THEATER_SEQ.NEXTVAL, '부산/대구/경상', 4, '울산', 48, '3관', '2D', 'theater_sample.jpg', 70, 7, 10, 3);

INSERT INTO GC_THEATER VALUES (GC_THEATER_SEQ.NEXTVAL, '부산/대구/경상', 4, '진주', 49, '1관', '2D', 'theater_sample.jpg', 90, 9, 10, 1);
INSERT INTO GC_THEATER VALUES (GC_THEATER_SEQ.NEXTVAL, '부산/대구/경상', 4, '진주', 49, '2관', '2D', 'theater_sample.jpg', 400, 20, 20, 2);
INSERT INTO GC_THEATER VALUES (GC_THEATER_SEQ.NEXTVAL, '부산/대구/경상', 4, '진주', 49, '3관', '2D', 'theater_sample.jpg', 70, 7, 10, 3);

INSERT INTO GC_THEATER VALUES (GC_THEATER_SEQ.NEXTVAL, '부산/대구/경상', 4, '해운대', 50, '1관', '2D', 'theater_sample.jpg', 90, 9, 10, 1);
INSERT INTO GC_THEATER VALUES (GC_THEATER_SEQ.NEXTVAL, '부산/대구/경상', 4, '해운대', 50, '2관', '2D', 'theater_sample.jpg', 400, 20, 20, 2);
INSERT INTO GC_THEATER VALUES (GC_THEATER_SEQ.NEXTVAL, '부산/대구/경상', 4, '해운대', 50, '3관', '2D', 'theater_sample.jpg', 70, 7, 10, 3);

INSERT INTO GC_THEATER VALUES (GC_THEATER_SEQ.NEXTVAL, '부산/대구/경상', 4, '경남대', 51, '1관', '2D', 'theater_sample.jpg', 90, 9, 10, 1);
INSERT INTO GC_THEATER VALUES (GC_THEATER_SEQ.NEXTVAL, '부산/대구/경상', 4, '경남대', 51, '2관', '2D', 'theater_sample.jpg', 400, 20, 20, 2);
INSERT INTO GC_THEATER VALUES (GC_THEATER_SEQ.NEXTVAL, '부산/대구/경상', 4, '경남대', 51, '3관', '2D', 'theater_sample.jpg', 70, 7, 10, 3);

INSERT INTO GC_THEATER VALUES (GC_THEATER_SEQ.NEXTVAL, '부산/대구/경상', 4, '구미', 52, '1관', '2D', 'theater_sample.jpg', 90, 9, 10, 1);
INSERT INTO GC_THEATER VALUES (GC_THEATER_SEQ.NEXTVAL, '부산/대구/경상', 4, '구미', 52, '2관', '2D', 'theater_sample.jpg', 400, 20, 20, 2);
INSERT INTO GC_THEATER VALUES (GC_THEATER_SEQ.NEXTVAL, '부산/대구/경상', 4, '구미', 52, '3관', '2D', 'theater_sample.jpg', 70, 7, 10, 3);

INSERT INTO GC_THEATER VALUES (GC_THEATER_SEQ.NEXTVAL, '부산/대구/경상', 4, '김천', 53, '1관', '2D', 'theater_sample.jpg', 90, 9, 10, 1);
INSERT INTO GC_THEATER VALUES (GC_THEATER_SEQ.NEXTVAL, '부산/대구/경상', 4, '김천', 53, '2관', '2D', 'theater_sample.jpg', 400, 20, 20, 2);
INSERT INTO GC_THEATER VALUES (GC_THEATER_SEQ.NEXTVAL, '부산/대구/경상', 4, '김천', 53, '3관', '2D', 'theater_sample.jpg', 70, 7, 10, 3);

INSERT INTO GC_THEATER VALUES (GC_THEATER_SEQ.NEXTVAL, '부산/대구/경상', 4, '덕천', 54, '1관', '2D', 'theater_sample.jpg', 90, 9, 10, 1);
INSERT INTO GC_THEATER VALUES (GC_THEATER_SEQ.NEXTVAL, '부산/대구/경상', 4, '덕천', 54, '2관', '2D', 'theater_sample.jpg', 400, 20, 20, 2);
INSERT INTO GC_THEATER VALUES (GC_THEATER_SEQ.NEXTVAL, '부산/대구/경상', 4, '덕천', 54, '3관', '2D', 'theater_sample.jpg', 70, 7, 10, 3);

INSERT INTO GC_THEATER VALUES (GC_THEATER_SEQ.NEXTVAL, '부산/대구/경상', 4, '부산극장', 55, '1관', '2D', 'theater_sample.jpg', 90, 9, 10, 1);
INSERT INTO GC_THEATER VALUES (GC_THEATER_SEQ.NEXTVAL, '부산/대구/경상', 4, '부산극장', 55, '2관', '2D', 'theater_sample.jpg', 400, 20, 20, 2);
INSERT INTO GC_THEATER VALUES (GC_THEATER_SEQ.NEXTVAL, '부산/대구/경상', 4, '부산극장', 55, '3관', '2D', 'theater_sample.jpg', 70, 7, 10, 3);

INSERT INTO GC_THEATER VALUES (GC_THEATER_SEQ.NEXTVAL, '부산/대구/경상', 4, '사천', 56, '1관', '2D', 'theater_sample.jpg', 90, 9, 10, 1);
INSERT INTO GC_THEATER VALUES (GC_THEATER_SEQ.NEXTVAL, '부산/대구/경상', 4, '사천', 56, '2관', '2D', 'theater_sample.jpg', 400, 20, 20, 2);
INSERT INTO GC_THEATER VALUES (GC_THEATER_SEQ.NEXTVAL, '부산/대구/경상', 4, '사천', 56, '3관', '2D', 'theater_sample.jpg', 70, 7, 10, 3);

INSERT INTO GC_THEATER VALUES (GC_THEATER_SEQ.NEXTVAL, '부산/대구/경상', 4, '안동', 57, '1관', '2D', 'theater_sample.jpg', 90, 9, 10, 1);
INSERT INTO GC_THEATER VALUES (GC_THEATER_SEQ.NEXTVAL, '부산/대구/경상', 4, '안동', 57, '2관', '2D', 'theater_sample.jpg', 400, 20, 20, 2);
INSERT INTO GC_THEATER VALUES (GC_THEATER_SEQ.NEXTVAL, '부산/대구/경상', 4, '안동', 57, '3관', '2D', 'theater_sample.jpg', 70, 7, 10, 3);

INSERT INTO GC_THEATER VALUES (GC_THEATER_SEQ.NEXTVAL, '부산/대구/경상', 4, '장산', 58, '1관', '2D', 'theater_sample.jpg', 90, 9, 10, 1);
INSERT INTO GC_THEATER VALUES (GC_THEATER_SEQ.NEXTVAL, '부산/대구/경상', 4, '장산', 58, '2관', '2D', 'theater_sample.jpg', 400, 20, 20, 2);
INSERT INTO GC_THEATER VALUES (GC_THEATER_SEQ.NEXTVAL, '부산/대구/경상', 4, '장산', 58, '3관', '2D', 'theater_sample.jpg', 70, 7, 10, 3);

INSERT INTO GC_THEATER VALUES (GC_THEATER_SEQ.NEXTVAL, '부산/대구/경상', 4, '창원', 59, '1관', '2D', 'theater_sample.jpg', 90, 9, 10, 1);
INSERT INTO GC_THEATER VALUES (GC_THEATER_SEQ.NEXTVAL, '부산/대구/경상', 4, '창원', 59, '2관', '2D', 'theater_sample.jpg', 400, 20, 20, 2);
INSERT INTO GC_THEATER VALUES (GC_THEATER_SEQ.NEXTVAL, '부산/대구/경상', 4, '창원', 59, '3관', '2D', 'theater_sample.jpg', 70, 7, 10, 3);

/* 광주/전라 */

INSERT INTO GC_THEATER VALUES (GC_THEATER_SEQ.NEXTVAL, '광주/전라', 5, '광주(충장로)', 60, '1관', '2D', 'theater_sample.jpg', 90, 9, 10, 1);
INSERT INTO GC_THEATER VALUES (GC_THEATER_SEQ.NEXTVAL, '광주/전라', 5, '광주(충장로)', 60, '2관', '2D', 'theater_sample.jpg', 400, 20, 20, 2);
INSERT INTO GC_THEATER VALUES (GC_THEATER_SEQ.NEXTVAL, '광주/전라', 5, '광주(충장로)', 60, '3관', '2D', 'theater_sample.jpg', 70, 7, 10, 3);

INSERT INTO GC_THEATER VALUES (GC_THEATER_SEQ.NEXTVAL, '광주/전라', 5, '목포', 61, '1관', '2D', 'theater_sample.jpg', 90, 9, 10, 1);
INSERT INTO GC_THEATER VALUES (GC_THEATER_SEQ.NEXTVAL, '광주/전라', 5, '목포', 61, '2관', '2D', 'theater_sample.jpg', 400, 20, 20, 2);
INSERT INTO GC_THEATER VALUES (GC_THEATER_SEQ.NEXTVAL, '광주/전라', 5, '목포', 61, '3관', '2D', 'theater_sample.jpg', 70, 7, 10, 3);

INSERT INTO GC_THEATER VALUES (GC_THEATER_SEQ.NEXTVAL, '광주/전라', 5, '송천', 62, '1관', '2D', 'theater_sample.jpg', 90, 9, 10, 1);
INSERT INTO GC_THEATER VALUES (GC_THEATER_SEQ.NEXTVAL, '광주/전라', 5, '송천', 62, '2관', '2D', 'theater_sample.jpg', 400, 20, 20, 2);
INSERT INTO GC_THEATER VALUES (GC_THEATER_SEQ.NEXTVAL, '광주/전라', 5, '송천', 62, '3관', '2D', 'theater_sample.jpg', 70, 7, 10, 3);

INSERT INTO GC_THEATER VALUES (GC_THEATER_SEQ.NEXTVAL, '광주/전라', 5, '신대(순천)', 63, '1관', '2D', 'theater_sample.jpg', 90, 9, 10, 1);
INSERT INTO GC_THEATER VALUES (GC_THEATER_SEQ.NEXTVAL, '광주/전라', 5, '신대(순천)', 63, '2관', '2D', 'theater_sample.jpg', 400, 20, 20, 2);
INSERT INTO GC_THEATER VALUES (GC_THEATER_SEQ.NEXTVAL, '광주/전라', 5, '신대(순천)', 63, '3관', '2D', 'theater_sample.jpg', 70, 7, 10, 3);

INSERT INTO GC_THEATER VALUES (GC_THEATER_SEQ.NEXTVAL, '광주/전라', 5, '전대(광주)', 64, '1관', '2D', 'theater_sample.jpg', 90, 9, 10, 1);
INSERT INTO GC_THEATER VALUES (GC_THEATER_SEQ.NEXTVAL, '광주/전라', 5, '전대(광주)', 64, '2관', '2D', 'theater_sample.jpg', 400, 20, 20, 2);
INSERT INTO GC_THEATER VALUES (GC_THEATER_SEQ.NEXTVAL, '광주/전라', 5, '전대(광주)', 64, '3관', '2D', 'theater_sample.jpg', 70, 7, 10, 3);

INSERT INTO GC_THEATER VALUES (GC_THEATER_SEQ.NEXTVAL, '광주/전라', 5, '첨단', 65, '1관', '2D', 'theater_sample.jpg', 90, 9, 10, 1);
INSERT INTO GC_THEATER VALUES (GC_THEATER_SEQ.NEXTVAL, '광주/전라', 5, '첨단', 65, '2관', '2D', 'theater_sample.jpg', 400, 20, 20, 2);
INSERT INTO GC_THEATER VALUES (GC_THEATER_SEQ.NEXTVAL, '광주/전라', 5, '첨단', 65, '3관', '2D', 'theater_sample.jpg', 70, 7, 10, 3);

INSERT INTO GC_THEATER VALUES (GC_THEATER_SEQ.NEXTVAL, '광주/전라', 5, '콜럼버스 하남', 66, '1관', '2D', 'theater_sample.jpg', 90, 9, 10, 1);
INSERT INTO GC_THEATER VALUES (GC_THEATER_SEQ.NEXTVAL, '광주/전라', 5, '콜럼버스 하남', 66, '2관', '2D', 'theater_sample.jpg', 400, 20, 20, 2);
INSERT INTO GC_THEATER VALUES (GC_THEATER_SEQ.NEXTVAL, '광주/전라', 5, '콜럼버스 하남', 66, '3관', '2D', 'theater_sample.jpg', 70, 7, 10, 3);

INSERT INTO GC_THEATER VALUES (GC_THEATER_SEQ.NEXTVAL, '광주/전라', 5, '남원', 67, '1관', '2D', 'theater_sample.jpg', 90, 9, 10, 1);
INSERT INTO GC_THEATER VALUES (GC_THEATER_SEQ.NEXTVAL, '광주/전라', 5, '남원', 67, '2관', '2D', 'theater_sample.jpg', 400, 20, 20, 2);
INSERT INTO GC_THEATER VALUES (GC_THEATER_SEQ.NEXTVAL, '광주/전라', 5, '남원', 67, '3관', '2D', 'theater_sample.jpg', 70, 7, 10, 3);

INSERT INTO GC_THEATER VALUES (GC_THEATER_SEQ.NEXTVAL, '광주/전라', 5, '목포하당(포르모)', 68, '1관', '2D', 'theater_sample.jpg', 90, 9, 10, 1);
INSERT INTO GC_THEATER VALUES (GC_THEATER_SEQ.NEXTVAL, '광주/전라', 5, '목포하당(포르모)', 68, '2관', '2D', 'theater_sample.jpg', 400, 20, 20, 2);
INSERT INTO GC_THEATER VALUES (GC_THEATER_SEQ.NEXTVAL, '광주/전라', 5, '목포하당(포르모)', 68, '3관', '2D', 'theater_sample.jpg', 70, 7, 10, 3);

INSERT INTO GC_THEATER VALUES (GC_THEATER_SEQ.NEXTVAL, '광주/전라', 5, '순천', 69, '1관', '2D', 'theater_sample.jpg', 90, 9, 10, 1);
INSERT INTO GC_THEATER VALUES (GC_THEATER_SEQ.NEXTVAL, '광주/전라', 5, '순천', 69, '2관', '2D', 'theater_sample.jpg', 400, 20, 20, 2);
INSERT INTO GC_THEATER VALUES (GC_THEATER_SEQ.NEXTVAL, '광주/전라', 5, '순천', 69, '3관', '2D', 'theater_sample.jpg', 70, 7, 10, 3);

INSERT INTO GC_THEATER VALUES (GC_THEATER_SEQ.NEXTVAL, '광주/전라', 5, '여수', 70, '1관', '2D', 'theater_sample.jpg', 90, 9, 10, 1);
INSERT INTO GC_THEATER VALUES (GC_THEATER_SEQ.NEXTVAL, '광주/전라', 5, '여수', 70, '2관', '2D', 'theater_sample.jpg', 400, 20, 20, 2);
INSERT INTO GC_THEATER VALUES (GC_THEATER_SEQ.NEXTVAL, '광주/전라', 5, '여수', 70, '3관', '2D', 'theater_sample.jpg', 70, 7, 10, 3);

INSERT INTO GC_THEATER VALUES (GC_THEATER_SEQ.NEXTVAL, '광주/전라', 5, '전주(객사)', 71, '1관', '2D', 'theater_sample.jpg', 90, 9, 10, 1);
INSERT INTO GC_THEATER VALUES (GC_THEATER_SEQ.NEXTVAL, '광주/전라', 5, '전주(객사)', 71, '2관', '2D', 'theater_sample.jpg', 400, 20, 20, 2);
INSERT INTO GC_THEATER VALUES (GC_THEATER_SEQ.NEXTVAL, '광주/전라', 5, '전주(객사)', 71, '3관', '2D', 'theater_sample.jpg', 70, 7, 10, 3);

INSERT INTO GC_THEATER VALUES (GC_THEATER_SEQ.NEXTVAL, '광주/전라', 5, '콜럼버스 상무', 72, '1관', '2D', 'theater_sample.jpg', 90, 9, 10, 1);
INSERT INTO GC_THEATER VALUES (GC_THEATER_SEQ.NEXTVAL, '광주/전라', 5, '콜럼버스 상무', 72, '2관', '2D', 'theater_sample.jpg', 400, 20, 20, 2);
INSERT INTO GC_THEATER VALUES (GC_THEATER_SEQ.NEXTVAL, '광주/전라', 5, '콜럼버스 상무', 72, '3관', '2D', 'theater_sample.jpg', 70, 7, 10, 3);

/* 강원 */

INSERT INTO GC_THEATER VALUES (GC_THEATER_SEQ.NEXTVAL, '강원', 6, '속초', 73, '1관', '2D', 'theater_sample.jpg', 90, 9, 10, 1);
INSERT INTO GC_THEATER VALUES (GC_THEATER_SEQ.NEXTVAL, '강원', 6, '속초', 73, '2관', '2D', 'theater_sample.jpg', 400, 20, 20, 2);
INSERT INTO GC_THEATER VALUES (GC_THEATER_SEQ.NEXTVAL, '강원', 6, '속초', 73, '3관', '2D', 'theater_sample.jpg', 70, 7, 10, 3);

INSERT INTO GC_THEATER VALUES (GC_THEATER_SEQ.NEXTVAL, '강원', 6, '원주', 74, '1관', '2D', 'theater_sample.jpg', 90, 9, 10, 1);
INSERT INTO GC_THEATER VALUES (GC_THEATER_SEQ.NEXTVAL, '강원', 6, '원주', 74, '2관', '2D', 'theater_sample.jpg', 400, 20, 20, 2);
INSERT INTO GC_THEATER VALUES (GC_THEATER_SEQ.NEXTVAL, '강원', 6, '원주', 74, '3관', '2D', 'theater_sample.jpg', 70, 7, 10, 3);

/* 제주 */

INSERT INTO GC_THEATER VALUES (GC_THEATER_SEQ.NEXTVAL, '제주', 7, '제주', 75, '1관', '2D', 'theater_sample.jpg', 90, 9, 10, 1);
INSERT INTO GC_THEATER VALUES (GC_THEATER_SEQ.NEXTVAL, '제주', 7, '제주', 75, '2관', '2D', 'theater_sample.jpg', 400, 20, 20, 2);
INSERT INTO GC_THEATER VALUES (GC_THEATER_SEQ.NEXTVAL, '제주', 7, '제주', 75, '3관', '2D', 'theater_sample.jpg', 70, 7, 10, 3);

INSERT INTO GC_THEATER VALUES (GC_THEATER_SEQ.NEXTVAL, '제주', 7, '제주아라', 76, '1관', '2D', 'theater_sample.jpg', 90, 9, 10, 1);
INSERT INTO GC_THEATER VALUES (GC_THEATER_SEQ.NEXTVAL, '제주', 7, '제주아라', 76, '2관', '2D', 'theater_sample.jpg', 400, 20, 20, 2);
INSERT INTO GC_THEATER VALUES (GC_THEATER_SEQ.NEXTVAL, '제주', 7, '제주아라', 76, '3관', '2D', 'theater_sample.jpg', 70, 7, 10, 3);

COMMIT;
