# URL 매핑표: 기존 `.do` → 새 REST API

기존 URL 75개를 새 구조로 옮기면 **REST API 약 50개 + React 화면 라우트**가 됩니다. 화면만 그리던 URL(`*Pre*.do`, `write.do` 등)은 API가 아니라 프론트엔드 라우트가 됩니다.

- 분석 기준: `legacy/src/main/java/com/gaon/**/*Controller.java` (2026-11-06)
- "로그인" 열: 새 API의 요구 권한. `-` 비로그인 가능 · `회원` 로그인 필요 · `본인` 작성자 본인 · `관리자` ROLE_ADMIN
- 새 API 이름은 Phase별로 구현하면서 확정합니다. 바뀌면 이 표를 같이 고칩니다.

## 기존 구조의 문제 (새 API에서 고칠 것)

| 문제 | 기존 코드 | 새 API |
|---|---|---|
| 사용자 위조 가능 | 평점·찜·예매·예매내역이 사용자 아이디를 요청 파라미터(`NowUser`, `userid`)로 받음 | 사용자는 항상 인증 토큰에서 꺼냄 (`/me`) |
| 관리자 권한 없음 | `admin*.do` 13개에 서버 쪽 권한 확인이 없음 (인터셉터 없음) | `/api/admin/**` 전체 ROLE_ADMIN |
| 본인 확인이 화면에만 있음 | QnA 수정·삭제 버튼을 JSP에서만 숨김 | 서비스 계층에서 작성자 확인, 아니면 403 |
| 쓰기 작업에 GET 사용 | 등록·수정·삭제·예매가 대부분 GET | POST / PATCH / PUT / DELETE |
| 비밀번호를 메일로 발송 | `memberpwSerch.do`가 평문 비밀번호를 메일로 보냄 | 재설정 링크 발송 (비밀번호는 BCrypt 해시라 복원 불가) |
| JSON을 손으로 조립 | `PrintWriter`로 문자열 JSON 출력 | `@RestController` + DTO 자동 직렬화 |
| 예매 단계 조회 API가 10개 | 극장·지역·영화·날짜 조합마다 URL이 따로 있음 | `GET /api/schedules/options` 하나로 통합 |

## 메인 · 공통

| # | 기존 URL | 기존 방식 | 하는 일 | 새 API | 로그인 | 새 화면 |
|---|---|---|---|---|---|---|
| 1 | `/` | GET → JSP | 기본 템플릿 페이지 (미사용) | 삭제 | | |
| 2 | `mainLayout.do` | GET → Tiles | 공통 레이아웃 | — | | 레이아웃 라우트 |
| 3 | `main.do` | GET → JSP | 상영작·개봉예정작 목록 | `GET /api/movies?status=NOW_SHOWING` · `?status=UPCOMING` | - | `/` |
| 4 | `mainDetail.do` | GET → JSON | 메인의 영화 상세 팝업 | `GET /api/movies/{id}` | - | `/` (모달) |
| 5 | `notice.do` | GET → JSP | 공지 (정적 화면) | — | | `/notice` |

## 영화

| # | 기존 URL | 기존 방식 | 하는 일 | 새 API | 로그인 | 새 화면 |
|---|---|---|---|---|---|---|
| 6 | `movie.do` | GET → JSP | 상영작·개봉예정작 목록 | `GET /api/movies?status=` | - | `/movies` |
| 7 | `movieDetail.do` | GET → JSON | 영화 상세 | `GET /api/movies/{id}` | - | `/movies/:id` |
| 8 | `movieDetailrate.do` | GET → JSON | 평점 등록 + 평균 갱신 | `PUT /api/movies/{id}/rating` | 회원 | |
| 9 | `RateCheck.do` | GET → JSON | 내가 평점을 줬는지 | `GET /api/movies/{id}/rating/me` | 회원 | |
| 10 | `LikeCheck.do` | GET → JSON | 내가 찜했는지 | `GET /api/movies/{id}/like` | 회원 | |
| 11 | `LikeAdd.do` | GET → 텍스트 | 찜 추가 | `PUT /api/movies/{id}/like` | 회원 | |
| 12 | `LikeRemove.do` | GET → 텍스트 | 찜 취소 | `DELETE /api/movies/{id}/like` | 회원 | |
| 13 | `LikeMovie.do` | GET → JSP | 내 찜 목록 | `GET /api/members/me/likes` | 회원 | `/my/likes` |

## 극장

기존 `GC_THEATER` 한 행은 "상영관"(예: 서울 > 강남 > 1관)입니다. 새 구조에서는 **지점(cinema)** 과 **상영관(screen)** 으로 나눕니다.

| # | 기존 URL | 기존 방식 | 하는 일 | 새 API | 로그인 | 새 화면 |
|---|---|---|---|---|---|---|
| 14 | `theater.do` | GET → JSP | 극장 페이지 | `GET /api/cinemas` | - | `/cinemas` |
| 15 | `theaterSelectLname.do` | GET → JSON | 도시별 지점 목록 | `GET /api/cinemas?city=` | - | |
| 16 | `theaterSelectIntroAll.do` | GET → JSON | 전체 극장 소개 | `GET /api/cinemas` | - | |
| 17 | `theaterSelectIntroByCname.do` | GET → JSON | 도시별 극장 소개 | `GET /api/cinemas?city=` | - | |
| 18 | `theaterSelectIntroByLname.do` | GET → JSON | 지점 소개 | `GET /api/cinemas/{id}` | - | `/cinemas/:id` |

## 예매

| # | 기존 URL | 기존 방식 | 하는 일 | 새 API | 로그인 | 새 화면 |
|---|---|---|---|---|---|---|
| 19 | `reservation.do` | GET → JSP | 예매 1단계 화면 | — | | `/reservation` |
| 20 | `moviereservation.do` | GET → JSP | 영화를 고른 상태로 예매 시작 | — | | `/reservation?movieId=` |
| 21 | `reservationSelectMovieNameAgeAll.do` | GET → JSON | 예매 가능한 영화 전체 | `GET /api/schedules/options` | - | |
| 22 | `reservationSelectMovieNameAge.do` | GET → JSON | 조건에 맞는 영화 | `GET /api/schedules/options?cinemaId=&date=` | - | |
| 23 | `reservationSelectTheaterCnameAll.do` | GET → JSON | 도시 전체 | `GET /api/schedules/options` | - | |
| 24 | `reservationSelectTheaterCname.do` | GET → JSON | 조건에 맞는 도시 | `GET /api/schedules/options?movieId=` | - | |
| 25 | `reservationSelectTheaterLnameAll.do` | GET → JSON | 도시의 지점 전체 | `GET /api/schedules/options?city=` | - | |
| 26 | `reservationSelectTheaterLname.do` | GET → JSON | 조건에 맞는 지점 | `GET /api/schedules/options?city=&movieId=` | - | |
| 27 | `reservationSelectDateAll.do` | GET → JSON | 날짜 전체 | `GET /api/schedules/options` | - | |
| 28 | `reservationSelectDate.do` | GET → JSON | 조건에 맞는 날짜 | `GET /api/schedules/options?movieId=&cinemaId=` | - | |
| 29 | `reservationSelectHour.do` | GET → JSON | 상영 시간표 | `GET /api/schedules?movieId=&cinemaId=&date=` | - | |
| 30 | `step2.do` | GET → JSP | 좌석 선택 화면 | — | | `/reservation` (같은 화면의 다음 단계) |
| 31 | `seatNum.do` | GET → JSON | 상영관 행·열 개수 | `GET /api/schedules/{id}/seats` | - | |
| 32 | `seatRevCheck.do` | GET → JSON | 이미 예약된 좌석 | `GET /api/schedules/{id}/seats` (31과 통합) | - | |
| 33 | `LastRev.do` | GET → 텍스트 | 예매 저장 (중복 방지 없음) | `POST /api/reservations` → 201 / 좌석 충돌 409 | 회원 | |
| 34 | `selectrev.do` | GET → JSP | 예매 내역 (`userid` 파라미터) | `GET /api/members/me/reservations` | 회원 | `/my/reservations` |
| — | (신규) | | 예매 취소 | `PATCH /api/reservations/{id}` (상태 변경) | 본인 | |

`GET /api/schedules/options`는 현재 선택값(도시·지점·영화·날짜)을 받아, 다음에 고를 수 있는 영화·지점·날짜 목록을 한 번에 돌려줍니다. 기존 URL 9개(#21~#28 + 일부)를 대체합니다.

## 회원 · 인증

| # | 기존 URL | 기존 방식 | 하는 일 | 새 API | 로그인 | 새 화면 |
|---|---|---|---|---|---|---|
| 35 | `write.do` | GET → JSP | 회원가입 화면 | — | | `/signup` |
| 36 | `join.do` | 요청 → redirect | 회원가입 + 2,000포인트 지급 | `POST /api/members` → 201 | - | |
| 37 | `search.do` | 요청 → 텍스트 | 아이디 중복 확인 | `GET /api/members/exists?userId=` | - | |
| 38 | `login.do` | 요청 → 텍스트 | 로그인 (세션 저장) | `POST /api/auth/login` | - | `/login` |
| 39 | `logout.do` | 요청 → redirect | 로그아웃 | `POST /api/auth/logout` | 회원 | |
| — | (신규) | | 토큰 재발급 | `POST /api/auth/refresh` | - | |
| 40 | `memberPreSerch.do` | 요청 → JSP | 아이디·비밀번호 찾기 화면 | — | | `/find-account` |
| 41 | `memberidSerch.do` | 요청 → 텍스트 | 아이디 찾기 | `POST /api/auth/find-id` (마스킹해서 응답) | - | |
| 42 | `memberpwSerch.do` | 요청 → 메일 | 비밀번호를 메일로 발송 | `POST /api/auth/password-reset` + `POST /api/auth/password-reset/confirm` | - | `/reset-password` |
| 43 | `member.do` | 요청 → JSP | 마이페이지 | `GET /api/members/me` | 회원 | `/my` |
| 44 | `memberPreEdit.do` | 요청 → JSP | 정보 수정 화면 | — | | `/my/edit` |
| 45 | `memberEdit.do` | 요청 → redirect | 정보 수정 (프로필 이미지 포함) | `PATCH /api/members/me` | 회원 | |
| 46 | `memberDelete.do` | 요청 → redirect | 회원 탈퇴 | `DELETE /api/members/me` → 204 | 회원 | |

## 스토어

| # | 기존 URL | 기존 방식 | 하는 일 | 새 API | 로그인 | 새 화면 |
|---|---|---|---|---|---|---|
| 47 | `store.do` | GET → JSP | 상품 목록 | `GET /api/store/products` | - | `/store` |
| 48 | `StoreDetail.do` | GET → JSON | 상품 상세 | `GET /api/store/products/{id}` | - | |
| 49 | `buy.do` | GET → JSP | 구매 화면 | — | | `/store/:id/buy` |
| 50 | `buyMail.do` | 요청 → 텍스트 | 포인트 차감 + 기프트코드 생성 + 메일 발송 | `POST /api/orders` → 201 / 포인트 부족 409 (메일은 비동기) | 회원 | |
| — | (신규) | | 내 기프트코드 | `GET /api/members/me/gift-codes` | 회원 | `/my/gift-codes` |

## 이벤트

| # | 기존 URL | 기존 방식 | 하는 일 | 새 API | 로그인 | 새 화면 |
|---|---|---|---|---|---|---|
| 51 | `event.do` | GET → JSP | 진행 중·종료 이벤트 | `GET /api/events?status=ONGOING` · `?status=ENDED` | - | `/events` |
| 52 | `eventDetail.do` | GET → JSON | 이벤트 상세 | `GET /api/events/{id}` | - | `/events/:id` |

## QnA

| # | 기존 URL | 기존 방식 | 하는 일 | 새 API | 로그인 | 새 화면 |
|---|---|---|---|---|---|---|
| 53 | `qnaList.do` | GET → JSP | 목록 (검색 + 페이징) | `GET /api/qnas?keyword=&page=&size=` | - | `/qna` |
| 54 | `qnaDetail.do` | 요청 → JSP | 상세 + 조회수 증가 + 답글 | `GET /api/qnas/{id}` | - | `/qna/:id` |
| 55 | `qnaPreInsert.do` | GET → JSP | 작성 화면 | — | | `/qna/new` |
| 56 | `qnaInsert.do` | GET → redirect | 작성 | `POST /api/qnas` → 201 | 회원 | |
| 57 | `qnaPreEdit.do` | GET → JSP | 수정 화면 | — | | `/qna/:id/edit` |
| 58 | `qnaEdit.do` | GET → redirect | 수정 | `PATCH /api/qnas/{id}` | 본인 | |
| 59 | `qnaDelete.do` | GET → redirect | 삭제 | `DELETE /api/qnas/{id}` → 204 | 본인·관리자 | |
| 60 | `qnaReplyInsert.do` | GET → redirect | 답글 작성 | `POST /api/qnas/{id}/replies` → 201 | 회원 | |
| 61 | `EditQnaReply.do` | GET → redirect | 답글 수정 | `PATCH /api/qnas/{id}/replies/{replyId}` | 본인 | |
| 62 | `DeleteQnaReply.do` | GET → redirect | 답글 삭제 | `DELETE /api/qnas/{id}/replies/{replyId}` → 204 | 본인·관리자 | |

## 관리자

| # | 기존 URL | 기존 방식 | 하는 일 | 새 API | 로그인 | 새 화면 |
|---|---|---|---|---|---|---|
| 63 | `adminMemberList.do` | GET → JSP | 회원 목록 | `GET /api/admin/members` | 관리자 | `/admin/members` |
| 64 | `adminReservationList.do` | GET → JSP | 예매 목록 | `GET /api/admin/reservations` | 관리자 | `/admin/reservations` |
| 65 | `adminMovieTheaterList.do` | GET → JSP | 영화·상영관 목록 | `GET /api/admin/movies` · `GET /api/admin/screens` | 관리자 | `/admin` |
| 66 | `adminMoviePreInsert.do` | GET → JSP | 영화 등록 화면 | — | | `/admin/movies/new` |
| 67 | `adminMovieInsert.do` | POST (파일 업로드) | 영화 등록 | `POST /api/admin/movies` (multipart) → 201 | 관리자 | |
| 68 | `adminMoviePreEdit.do` | GET → JSP | 영화 수정 화면 | — | | `/admin/movies/:id/edit` |
| 69 | `adminMovieEdit.do` | GET → redirect | 영화 수정 | `PATCH /api/admin/movies/{id}` | 관리자 | |
| 70 | `adminMovieDelete.do` | GET → redirect | 영화 삭제 | `DELETE /api/admin/movies/{id}` → 204 | 관리자 | |
| 71 | `adminTheaterPreInsert.do` | GET → JSP | 상영관 등록 화면 | — | | `/admin/screens/new` |
| 72 | `adminTheaterInsert.do` | GET → redirect | 상영관 + 좌석 배치 등록 | `POST /api/admin/screens` → 201 | 관리자 | |
| 73 | `adminTheaterPreEdit.do` | GET → JSP | 상영관 수정 화면 | — | | `/admin/screens/:id/edit` |
| 74 | `adminTheaterEdit.do` | GET → redirect | 상영관 수정 | `PATCH /api/admin/screens/{id}` | 관리자 | |
| 75 | `adminTheaterDelete.do` | GET → redirect | 상영관 삭제 | `DELETE /api/admin/screens/{id}` → 204 | 관리자 | |
| — | (신규) | | 상영일정 관리 (기존엔 SQL로만 입력) | `GET/POST/PATCH/DELETE /api/admin/schedules` | 관리자 | `/admin/schedules` |
| — | (신규) | | 이벤트·상품 관리 | `/api/admin/events` · `/api/admin/store/products` | 관리자 | |

## 사용하지 않는 코드

- `CodeController.java`: 매핑이 하나도 없음. 기프트코드 생성은 `EmailController.buyMail()`이 대신함
- `HomeController` (`/`): Spring 기본 템플릿 그대로
