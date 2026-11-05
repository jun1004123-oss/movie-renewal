# 가온시네마 리뉴얼 (movie-renewal)

2016년 비트캠프 팀 프로젝트로 만든 영화 예매 사이트 **가온시네마**를 최신 구조로 다시 만드는 프로젝트입니다.

| | 기존 (2016) | 리뉴얼 |
|---|---|---|
| 백엔드 | Spring 3.1, Java 1.6, MyBatis, JSP + Tiles | Spring Boot 4, Java 21, Spring Data JPA, REST API |
| 프론트엔드 | jQuery 1.11, Bootstrap 3 | React 19, TypeScript, Vite, TanStack Query |
| DB | Oracle | PostgreSQL + Flyway |
| 인증 | 세션 (사용자 아이디를 요청 파라미터로 전달) | Spring Security + JWT |
| 배포 | Tomcat WAR | Docker Compose, GitHub Actions |

> 진행 중입니다. 현재 **Phase 0 (준비·분석)** 단계입니다. 진행 현황은 [docs/PLAN.md](docs/PLAN.md)에 있습니다.

## 주요 기능

영화 목록·상세, 평점·찜, 극장 안내, 예매(극장 → 영화 → 날짜 → 시간 → 좌석), 스토어·기프트코드, QnA, 이벤트, 회원, 관리자.

## 이 프로젝트에서 다루는 문제

- **좌석 중복 예매 방지**: 기존에는 좌석을 `'A2/A3/'` 문자열로 저장해 DB가 중복을 막을 수 없었습니다. 좌석 단위 테이블과 부분 유니크 인덱스로 해결하고, 동시 요청 테스트로 검증합니다.
- **인증·인가**: 기존에는 사용자 아이디를 클라이언트가 보내고 관리자 URL에 권한 확인이 없었습니다. 토큰 기반 인증과 역할 기반 인가로 바꿉니다.
- **레거시 분석**: URL 75개와 테이블 11개를 분석해 새 API와 스키마로 옮깁니다.

## 문서

- [마이그레이션 플랜](docs/PLAN.md)
- [URL 매핑표 (기존 → 새 API)](docs/url-mapping.md)
- [ERD (기존 → 새 스키마)](docs/erd.md)

## 저장소 구조

```
legacy/     원본 프로젝트 (읽기 전용, 비밀값 가림)
backend/    Spring Boot API        (Phase 1에서 생성)
frontend/   React SPA              (Phase 2에서 생성)
docs/       설계 문서
```

## 실행 방법

Phase 1 이후에 추가합니다.
