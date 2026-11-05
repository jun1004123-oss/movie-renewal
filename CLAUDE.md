# CLAUDE.md

가온시네마(2016, Spring 3 + JSP + Oracle) 영화 예매 사이트를 Spring Boot 4 REST API + React SPA + PostgreSQL로 다시 만드는 포트폴리오 프로젝트.

## 반드시 지킬 것

- `legacy/`는 읽기 전용. 기능·SQL 참고용으로만 읽고 수정하지 않는다. 원본 폴더(`D:\OneDrive\Desktop\비트캠프 수업자료\GAON가온시네마스프링플젝`)도 건드리지 않는다.
- 비밀값(DB·메일 비밀번호, JWT 키)은 코드에 넣지 않고 환경변수로 받는다. `.env`는 커밋하지 않고 `.env.example`만 둔다.
- 한 번에 한 기능(수직 슬라이스). 범위를 넘는 리팩터링은 먼저 묻는다.
- 기능을 옮길 때는 `docs/url-mapping.md`의 새 API 이름과 권한을 따른다. 바꾸면 표도 같이 고친다.
- 스키마 변경은 Flyway 마이그레이션 파일로만 한다. `docs/erd.md`도 같이 고친다.
- Security 설정, 좌석 동시성, React 예매 상태 설계는 사용자가 직접 작성한다. 요청이 없으면 대신 작성하지 말고 리뷰와 설명을 한다.

## 문서

- `docs/PLAN.md`: 스택, 로드맵, 완료 기준, 진행 현황
- `docs/url-mapping.md`: 기존 URL 75개 → 새 API·화면 라우트
- `docs/erd.md`: 기존·새 스키마
- `docs/adr/`: 기술 결정 기록 (`NNNN-제목.md`)

## 스택

- backend: Java 21, Spring Boot 4.x, Gradle, Spring Data JPA, Flyway, Spring Security + JWT, springdoc-openapi
- frontend: React 19, TypeScript, Vite, React Router, TanStack Query, Zustand, React Hook Form + Zod, Tailwind CSS
- DB: PostgreSQL (로컬은 docker-compose)
- test: JUnit 5, Mockito, MockMvc, Testcontainers / Vitest, Testing Library

## 코드 규칙

### backend
- 패키지: `com.gaon.cinema.global.*`(config, error, security, common), `com.gaon.cinema.domain.<도메인>.{controller,service,repository,entity,dto}`
- 엔티티를 응답으로 직접 반환하지 않는다. 요청·응답 DTO는 `record`.
- 에러는 `@RestControllerAdvice`에서 `ProblemDetail`로 통일. 비즈니스 예외는 에러 코드 enum을 가진 커스텀 예외.
- 현재 사용자는 항상 인증 정보에서 꺼낸다. 사용자 아이디를 요청 파라미터로 받지 않는다.
- 쓰기 메서드는 서비스 계층에서 `@Transactional`. 조회는 `@Transactional(readOnly = true)`.
- 목록 응답은 `content, page, size, totalElements, totalPages` 공통 형태.
- 날짜는 ISO 8601, 서버 시간대 Asia/Seoul, DB는 `timestamptz`.

### frontend
- 서버 데이터는 TanStack Query로만 다룬다 (`useEffect`로 직접 fetch 금지).
- API 호출은 `shared/api`의 axios 인스턴스를 통해서만.
- 기능 코드는 `features/<기능>/` 안에 컴포넌트·훅·API를 함께 둔다.

### API
- URL은 복수형 명사, 소문자-하이픈. 동작은 HTTP 메서드로. 관리자 API는 `/api/admin/**`.
- 상태 코드: 200 조회·수정 / 201 생성 / 204 삭제 / 400 검증 실패 / 401 미인증 / 403 권한 없음 / 404 없음 / 409 충돌

## 명령어

아직 backend/frontend가 없다. Phase 1·2에서 생성하면 이 절에 빌드·테스트·실행 명령을 추가한다.

## 완료의 정의

- 빌드와 테스트가 통과한다 (실행해서 확인한다).
- 새 API는 성공·실패 테스트가 있다.
- 관련 문서(`url-mapping.md`, `erd.md`, `PLAN.md` 진행 현황)를 갱신했다.
- 커밋은 기능 단위, 메시지는 한국어 Conventional Commits (`feat:`, `fix:`, `docs:`, `test:`, `refactor:`, `chore:`).
