# Design Tokens — Color

> 스타일 작업 시 가장 먼저 참조하는 파일. 모든 컬러는 이 표의 Tailwind 클래스를 사용한다.

## 전체 토큰 표

| Stitch 토큰 | CSS 변수 | Hex | Tailwind 클래스 | 용도 |
|---|---|---|---|---|
| background / surface | `--color-background` | `#f8f9fa` | `bg-background` | 앱 전체 베이스 캔버스 |
| surface_container_low | `--color-surface-low` | `#f1f4f6` | `bg-surface-low` | 사이드바, 내비게이션 배경 |
| surface_container | `--color-surface` | `#eaeff1` | `bg-surface` | 섹션 구분 배경 |
| surface_container_high | `--color-surface-high` | `#e2e9ec` | `bg-surface-high` | Secondary 버튼 배경 |
| surface_container_highest | `--color-surface-highest` | `#dbe4e7` | `bg-surface-highest` | 선택된 사이드바 항목, 태그 칩 배경 |
| surface_container_lowest | `--color-card` | `#ffffff` | `bg-card` | 카드, 입력 필드 (최상위 레이어) |
| tertiary | `--color-accent` | `#0053dc` | `bg-accent` / `text-accent` | 주요 액션 전용 (절제해서 사용) |
| tertiary_container | `--color-accent-container` | `#3e76fe` | `bg-accent-container` | 액센트 그라디언트 끝점 |
| on_tertiary | `--color-on-accent` | `#faf8ff` | `text-on-accent` | 액센트 배경 위 텍스트 |
| on_surface | `--color-foreground` | `#2b3437` | `text-foreground` | 주요 텍스트 |
| on_surface_variant | `--color-muted-foreground` | `#586064` | `text-muted-foreground` | 본문 장문, 보조 텍스트 |
| outline_variant | `--color-border` | `#abb3b7` | `border-border` | Ghost Border 전용 |
| error | `--color-destructive` | `#e53935` | `text-destructive` | 삭제/에러 액션 |

## Surface Hierarchy

레이어를 물리적 재질처럼 쌓는다. 아래로 갈수록 시각적으로 위에 있다.

```
bg-background  (#f8f9fa)  ← 앱 전체 바닥
  └─ bg-surface-low       (#f1f4f6)  ← 사이드바
       └─ bg-surface      (#eaeff1)  ← 섹션 구분
            └─ bg-card    (#ffffff)  ← 카드/에디터 ("들어올린 종이" 효과)
```

## No-Line Rule

섹션 구분에 `border` 실선을 사용하지 않는다. 배경색 전환으로만 경계를 만든다.

```
사이드바 bg-surface-low  |  메인 bg-background
         ↑ 선이 아닌 색상 변환으로 경계가 "느껴진다"
```

## Glass & Gradient Rule

**플로팅 요소** (모달, 드롭다운): Glassmorphism
```css
background: rgba(248, 249, 250, 0.8); /* bg-background 80% */
backdrop-filter: blur(12px);
```

**Primary CTA**: 액센트 그라디언트
```css
/* Tailwind: bg-gradient-to-br from-accent to-accent-container */
background: linear-gradient(to bottom right, #0053dc, #3e76fe);
```
