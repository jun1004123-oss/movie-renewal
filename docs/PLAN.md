# 마이그레이션 플랜

가온시네마(Spring 3 + JSP + Oracle)를 **Spring Boot 4 REST API + React SPA + PostgreSQL**로 다시 만듭니다. 원본은 `legacy/`에 그대로 두고, 기능 하나씩 "API + 화면" 세트로 옮깁니다.

- 기준일: 2026-11-06
- 가정: 주 10시간 내외, 약 21주

## 목표

1. **기능 동등성**: 기존 기능(URL 75개, [매핑표](url-mapping.md))을 빠짐없이 새 구조로 옮긴다.
2. **채용 시장에서 쓰는 기술 익히기**: Spring Boot, JPA, REST API, Spring Security, React, TypeScript, 테스트, CI/CD, Docker.
3. **재사용할 뼈대**: 검증된 공통 구조를 템플릿 저장소로 떼어내 다음 프로젝트에 쓴다.

## 원칙

- **원본은 읽기만 한다.** `legacy/`와 원본 폴더는 수정하지 않는다.
- **수직 슬라이스.** 기능 하나를 API, 화면, 테스트까지 끝내고 다음으로 간다.
- **한 Phase에 새 기술은 한두 개.** 각 Phase는 완료 기준을 통과해야 다음으로 넘어간다.
- **템플릿은 나중에 떼어낸다.** 직접 써서 검증된 것만 넣는다.
- **설명할 수 있는 코드만 커밋한다.** AI가 만든 코드도 한 줄씩 이해한 뒤 커밋한다.

## 기술 스택

| 영역 | 선택 | 고른 이유 |
|---|---|---|
| 언어 | Java 21 LTS | 현재 채용 공고의 기본 버전 |
| 백엔드 | Spring Boot 4.x, Gradle | 새로 시작하는 프로젝트는 4.x (3.5는 2026-06 오픈소스 지원 종료) |
| DB | PostgreSQL (로컬: Docker, 배포: Supabase/Neon 같은 관리형) | 가볍고 무료 호스팅 가능, 부분 유니크 인덱스 지원, 맘링크와 같은 DB |
| DB 접근 | Spring Data JPA (+ 복잡한 조회는 QueryDSL 또는 네이티브 쿼리) | DB를 바꾸므로 MyBatis SQL 재사용 이점이 작고, 자사 서비스 채용 수요가 큼 |
| 스키마 | Flyway | 스키마를 코드로 버전 관리 |
| API | REST + ProblemDetail + springdoc-openapi(Swagger) | 일관된 에러 형식, 자동 문서 |
| 인증 | Spring Security + JWT + BCrypt | 프론트·백엔드 분리 구조 |
| 프론트엔드 | React 19 + TypeScript + Vite | 분리된 백엔드에는 SPA가 단순함 |
| 프론트 라이브러리 | React Router, TanStack Query, Zustand, React Hook Form + Zod, Tailwind CSS | 라우팅, 서버 상태, 화면 상태, 폼, 스타일 |
| 테스트 | JUnit 5, Mockito, MockMvc, Testcontainers, Vitest + Testing Library | 계층별 테스트, 실제 PostgreSQL로 통합 테스트 |
| CI/CD | GitHub Actions | Phase 1부터 PR마다 빌드·테스트 |
| 배포 | Docker Compose (Nginx + backend), 클라우드 서버 1대 | Nginx가 프론트 정적 파일과 `/api` 프록시를 함께 처리 |

라이브러리 버전은 프로젝트를 생성할 때 Spring Boot 4 호환 여부를 확인하고 `build.gradle`, `package.json`에 고정합니다.

## 저장소 구조

```
movie-renewal/
├─ legacy/                 원본 복사본 (읽기 전용)
├─ backend/
│  └─ src/main/java/com/gaon/cinema/
│     ├─ global/           config, error, security, 공통 응답
│     └─ domain/<도메인>/   controller · service · repository · entity · dto
│  └─ src/main/resources/db/migration/   Flyway SQL
├─ frontend/src/
│  ├─ app/                 라우터, Provider
│  ├─ pages/               라우트별 페이지
│  ├─ features/<기능>/      컴포넌트 · 훅 · API 호출
│  └─ shared/              API 클라이언트, 공통 UI, 유틸
├─ docs/                   플랜, 매핑표, ERD, API 규칙, 결정 기록(adr/)
├─ docker-compose.yml · .github/workflows/ · .env.example
└─ CLAUDE.md · README.md
```

## 로드맵

| Phase | 주차 | 내용 | 완료 기준 |
|---|---|---|---|
| 0. 준비·분석 | 1 | 환경 설치, 저장소, URL 매핑표, 기존·새 ERD | `docs/`에 매핑표와 새 스키마 설계가 있다 |
| 1. Boot 기반 + 조회 API | 2~5 | 프로젝트 생성, Flyway, 엔티티, 영화·극장·이벤트·스토어 조회 API, 공통 에러, Swagger, 테스트, CI | Swagger에서 조회 API가 동작하고, 없는 ID는 404 + ProblemDetail, PR마다 CI 통과 |
| 2. React 조회 화면 | 6~8 | Vite 프로젝트, 레이아웃 라우트, 메인·영화·극장·이벤트·스토어 화면 | 새로고침해도 URL만으로 같은 화면이 나온다 |
| 3. 회원·인증 | 9~10 | Security, JWT(Access + httpOnly Refresh 쿠키), 가입·로그인, 권한, 보호 라우트 | 비로그인은 401, 일반 회원의 관리자 API는 403 |
| 템플릿 1차 | 10 | 공통 부분을 `fullstack-starter` 템플릿 저장소로 정리 | 템플릿으로 새 프로젝트를 바로 시작할 수 있다 |
| 4. 예매 | 11~14 | `schedules/options`, 시간표, 좌석 API, 예매 화면(Zustand), 좌석 그리드, 예매·취소 | 같은 좌석 동시 요청 100건 중 정확히 1건 성공 |
| 5. 쓰기 기능 | 15~16 | 찜, 평점, QnA·답글, 스토어 구매, 기프트코드, 비밀번호 재설정 메일(@Async) | 남의 글 수정은 403, 메일이 응답을 늦추지 않는다 |
| 6. 관리자 | 17~18 | 영화·상영관·상영일정·이벤트·상품 관리, 이미지 업로드 | 관리자가 등록한 상영일정이 예매 화면에 바로 나온다 |
| 7. 배포·문서 | 19~21 | Dockerfile, docker-compose, 배포 파이프라인, HTTPS, README | 공개 URL에서 가입부터 예매까지 되고, README만 보고 로컬 실행 가능 |
| 마무리 | — | 템플릿 확정, 맘링크에 CI·테스트·폴더 규칙 적용 | |

선택 심화 (21주 이후): Redis 좌석 임시 선점, 인기 영화 캐시, PG 테스트 결제, Playwright E2E.

## 깊게 팔 세 가지

1. **좌석 동시성**: `reservation_seat`의 부분 유니크 인덱스로 DB가 최종 방어선. 중복 키 예외 → 409. 비관적 락과 비교한 결과를 README 트러블슈팅에 기록.
2. **인증 설계**: JWT를 고른 이유, Access/Refresh 토큰 보관 위치, BCrypt. 기존 구조의 "사용자 아이디를 파라미터로 받는 문제"를 어떻게 고쳤는지 설명.
3. **테스트**: 각 Phase의 완료 기준을 테스트 코드로 옮긴다.

## 역할 분담 (사람 + Claude Code)

| 작업 | 방식 |
|---|---|
| 환경 설정, 반복 작업(엔티티·DTO·API 뼈대·테스트 골격), 문서 | Claude Code가 작성 → 리뷰 후 커밋 |
| Security 설정, 좌석 동시성, React 예매 상태 설계 | **직접 먼저 작성** → Claude Code가 리뷰 |
| 막히는 개념 | "면접에서 설명하듯이" 설명 요청 |

## 진행 현황

- [x] JDK 21 설치 (Temurin 21.0.13)
- [x] 저장소 생성, `legacy/` 복사 (비밀값 가림)
- [x] URL 매핑표 ([url-mapping.md](url-mapping.md))
- [x] 기존·새 ERD 초안 ([erd.md](erd.md))
- [ ] Docker Desktop 설치 (WSL2 필요)
- [ ] ERD의 "확인이 필요한 것" 정리
- [ ] Phase 1 시작
