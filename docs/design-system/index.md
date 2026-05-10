# Design System — The Digital Atelier

> 철학: **The Curated Archive** — UI는 콘텐츠와 경쟁하지 않는다. 학습의 조용한 순간을 방해하지 않는다.
>
> 핵심 원칙: Soft Minimalism · Tonal Depth · Intentional Asymmetry · Typography-Driven

---

## 파일 구조

| 파일 | 내용 | 로드 시점 |
|---|---|---|
| [`tokens.md`](./tokens.md) | 컬러 토큰 전체 매핑 표, Surface Hierarchy, No-Line Rule | **모든 스타일 작업** |
| [`rules.md`](./rules.md) | Do's & Don'ts (절대 규칙) | **모든 스타일 작업** |
| [`components.md`](./components.md) | Button / Card / Input / Tag Chip 패턴 + Tailwind 클래스 | 컴포넌트 작성/수정 시 |
| [`typography.md`](./typography.md) | 타입 스케일 표, Inter 규칙, 컬러 사용 원칙 | 텍스트/폰트 작업 시 |
| [`elevation.md`](./elevation.md) | Tonal Layering, Ambient Shadow, Ghost Border 스펙 | 깊이/그림자 작업 시 |
| [`spacing.md`](./spacing.md) | 1.4rem 기반 스케일 표 | 간격/레이아웃 작업 시 |

---

## 작업별 빠른 참조

```
버튼 스타일    → @tokens.md @components.md @rules.md
새 컴포넌트    → @tokens.md @components.md @typography.md @rules.md
레이아웃 간격  → @tokens.md @spacing.md @rules.md
컬러 확인      → @tokens.md
```
