# legacy — 가온시네마 원본 (2016, 비트캠프 팀 프로젝트)

이 폴더는 원본 프로젝트의 **읽기 전용 복사본**입니다. 새 코드(`backend/`, `frontend/`)를 만들 때 기능과 SQL을 참고하는 용도로만 쓰고, 여기서는 수정하지 않습니다.

| 항목 | 내용 |
|---|---|
| 스택 | Spring 3.1.1, Java 1.6, MyBatis 3.2, Oracle, JSP + Apache Tiles 2, jQuery 1.11, Bootstrap 3 |
| 규모 | Java 약 4,100줄 · JSP 32개(약 2,900줄) · MyBatis 매퍼 약 730줄 · 직접 작성한 JS 약 1,800줄 · URL 75개 · 테이블 11개 |
| 빌드 | Maven (`pom.xml`), Eclipse(STS) 프로젝트 설정 포함 |

## 원본과 달라진 점

공개 저장소에 올리기 위해 복사할 때 아래만 바꿨습니다.

- `src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml`: Gmail SMTP 계정과 비밀번호를 `${MAIL_USERNAME}`, `${MAIL_PASSWORD}`로 가림
- `src/main/resources/db.properties`: DB 비밀번호를 `${DB_PASSWORD}`로 가림
- `sql/`: 원본 SQL과 안내 문서를 CP949에서 UTF-8로 변환하고 파일명을 영문으로 바꿈
  - `gaon-cinema-new.sql` ← `new신-가온시네마(ALL).sql` (스키마 + 샘플 데이터)
  - `setup-guide-ko.txt` ← `사용법.txt`
  - `movie-update-170808.txt`, `event-update-170808.txt` ← 2017-08-08 데이터 수정본
- 제외: `target/`(빌드 결과), 프로젝트 zip 2개(각 130MB), 메일 라이브러리 zip, 구버전 SQL

원본 위치: `D:\OneDrive\Desktop\비트캠프 수업자료\GAON가온시네마스프링플젝`
