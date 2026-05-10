# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

React 19 + TypeScript + Vite 기반의 노트 앱. JSON Server를 mock API로 사용하며, 학습/실습 목적의 프로젝트.

## Commands

| Command              | Purpose                                            |
| -------------------- | -------------------------------------------------- |
| `npm run dev`        | Vite 개발 서버(5173) + JSON Server(3001) 동시 실행 |
| `npm run build`      | TypeScript 컴파일 + Vite 프로덕션 빌드             |
| `npm run server`     | JSON Server 단독 실행 (port 3001)                  |
| `npm run lint`       | ESLint 실행 (--fix 포함)                           |
| `npm run format`     | Prettier 포맷팅                                    |
| `npm test`           | Vitest 단일 실행                                   |
| `npm run test:watch` | Vitest watch 모드                                  |

단일 테스트 실행: `npx vitest run src/path/to/test.test.ts`

## Architecture

### Tech Stack

- React 19, TypeScript 5.7, Vite 6, Tailwind CSS 4 (Vite plugin)
- 테스트: Vitest + Testing Library (jsdom)
- 백엔드: JSON Server (`db.json` → `http://localhost:3001/notes`)

### 구조 및 데이터 흐름

```
src/
├── api/notes.ts          # fetch() 기반 CRUD API (localhost:3001 하드코딩)
├── components/
│   ├── Layout.tsx        # 헤더 + 사이드바 + 메인 영역 레이아웃
│   ├── NoteList.tsx      # 노트 목록 (사이드바)
│   ├── NoteItem.tsx      # 개별 노트 카드
│   └── NoteEditor.tsx    # 노트 생성/수정 폼
├── context/
│   └── NotesContext.tsx  # React Context로 전역 상태 관리 (notes, loading, error, CRUD)
├── types/note.ts         # Note 인터페이스 (id, title, content, createdAt, updatedAt)
├── App.tsx               # 루트 컴포넌트 (selectedNoteId, isCreating 등 UI 상태)
├── main.tsx              # 엔트리포인트
└── index.css             # Tailwind 테마 (Pretendard 폰트, 라이트 테마)
```

- **상태 관리**: `NotesContext`가 노트 CRUD + 로딩/에러 상태 관리, `useNotes()` 훅으로 접근
- **UI 상태**: `App.tsx`에서 선택된 노트 ID, 생성 모드 등 로컬 상태 관리
- **API 호출 → Context setState → 컴포넌트 리렌더** 흐름

### 컴포넌트 패턴

- **named export** 함수 컴포넌트: `export function NoteList() {}`
- Props 인터페이스를 컴포넌트 바로 위에 `{컴포넌트명}Props`로 정의
- 인라인 destructuring: `({ note, isSelected }: NoteItemProps)`
- 조건부 early return으로 loading/error/empty 상태 처리 (NoteList, NoteEditor)
- Layout은 `sidebar`, `main`을 ReactNode props로 받는 슬롯 패턴

### 상태 관리 패턴

- **전역 상태**: Context + Provider + custom hook (`useNotes()`) 구조
  - `createContext<T | null>(null)` → hook에서 null 체크 후 throw
  - Provider 내부에서 API 호출 후 `setNotes(prev => ...)` 로 상태 갱신
  - Context CRUD 메서드(addNote 등)는 에러를 catch하지 않고 호출부로 전파
- **UI 상태**: App.tsx에서 `useState`로 로컬 관리 (selectedNoteId, isCreating)
- API 모듈은 namespace import: `import * as api from '../api/notes'`

### API 호출 패턴

- `src/api/notes.ts`에 순수 async 함수로 분리 (클래스 아님)
- `fetch()` → `res.ok` 체크 → throw Error → `res.json()` 반환
- 타임스탬프(createdAt, updatedAt)는 클라이언트에서 생성
- API URL은 모듈 상수로 하드코딩: `const API_URL = 'http://localhost:3001'`

### 네이밍 패턴

- 컴포넌트 파일/이름: PascalCase (`NoteEditor.tsx`)
- 비컴포넌트 파일: camelCase (`notes.ts`, `note.ts`)
- 이벤트 핸들러: 컴포넌트 내부 `handle{Action}`, props로 전달 시 `on{Action}`
- Context 메서드: `create/update/delete` + 엔티티명 — API 레이어와 동일한 동사 사용

### 일관성 없는 패턴 (주의)

1. **export 방식 혼재**: App만 `export default`, 나머지 컴포넌트는 모두 named export
2. **에러 처리 위치 불일치**: Context CRUD는 에러를 catch하지 않고 전파하지만, 초기 fetchNotes만 Context 내부에서 `.catch()` 처리. 에러 핸들링은 호출부(NoteEditor)에서 try/catch로 수행
3. **eslint-disable 사용**: NoteEditor에서 `react-hooks/exhaustive-deps` 규칙을 eslint-disable-line으로 억제 중

### Code Style

- Prettier: 세미콜론 사용, 싱글 쿼트, 탭 2칸, trailing comma, 100자 폭
- ESLint: flat config, TypeScript + React Hooks 규칙
- Strict TypeScript (noUnusedLocals, noUnusedParameters)

## Commit Convention

커밋 전 husky pre-commit 훅이 lint-staged를 실행하고, commit-msg 훅이 commitlint를 실행한다.

### 형식

```
type: 제목 (필수)

본문 (필수, 2줄 이상)
```

### 허용 type

| type       | 용도        |
| ---------- | ----------- |
| `feat`     | 새 기능     |
| `fix`      | 버그 수정   |
| `docs`     | 문서        |
| `refactor` | 리팩토링    |
| `test`     | 테스트      |
| `chore`    | 빌드/설정   |
| `style`    | 포맷팅      |
| `perf`     | 성능 개선   |
| `revert`   | 되돌리기    |
| `ci`       | CI 설정     |
| `build`    | 빌드 시스템 |

### 규칙

- type은 소문자만 (`Feat:` 불가)
- 제목 끝에 `.` 금지
- 제목 + 본문은 빈 줄로 구분
- 본문은 2줄 이상 필수
