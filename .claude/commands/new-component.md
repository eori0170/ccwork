다음 디자인 시스템 문서를 읽고 기준을 숙지한 뒤 컴포넌트를 생성하라.

@docs/design-system/tokens.md
@docs/design-system/components.md
@docs/design-system/typography.md
@docs/design-system/rules.md

## 컴포넌트 요구사항

$ARGUMENTS

## 생성 규칙

- 파일 위치: `src/components/`
- named export 함수 컴포넌트: `export function ComponentName() {}`
- Props 인터페이스를 컴포넌트 바로 위에 `{컴포넌트명}Props`로 정의
- 디자인 시스템 토큰(Tailwind 클래스)만 사용 — 임의 hex값 직접 사용 금지
- `rules.md`의 Don'ts 항목 위반 금지
- 생성 후 `npm run lint`로 타입/린트 오류 확인