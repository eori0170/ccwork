# Spacing

> 기준 단위: **1.4rem**. 모든 간격은 이 배수로 구성된다.

## 스케일 표

| 토큰 | rem | px (참고) | Tailwind | 용도 |
|---|---|---|---|---|
| spacing.1 | 0.35rem | ~6px | `gap-1.5` / `py-1.5` | 라벨 ↔ 입력 간격 |
| spacing.2 | 0.7rem | ~11px | `gap-3` / `mb-3` | Headline ↔ Body 간격 |
| spacing.4 | 1.4rem | ~22px | `gap-[1.4rem]` | 리스트 항목 간격 (기본 리듬) |
| spacing.6 | 2.1rem | ~34px | `gap-8` / `py-8` | 컴포넌트 내부 섹션 간격 |
| spacing.10 | 3.5rem | ~56px | `py-14` / `gap-14` | 레이아웃 블록 간격 (Atmospheric) |

## 사용 원칙

- 여백을 구조적 요소로 사용한다. 의심스러우면 마진을 늘린다.
- 리스트 항목 구분은 `gap-y-[1.4rem]` — divider 선 사용 금지.
- 레이아웃 블록(사이드바 ↔ 메인) 사이 패딩은 최소 `spacing.10`.
- 인라인 요소(태그 칩 내부 등) 수평 패딩은 `px-3`, 수직은 `py-0.5` ~ `py-1`.
