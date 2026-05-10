# Design System — The Digital Atelier

> 이 문서는 모든 스타일 작업의 단일 참조점이다. 컴포넌트를 작성하거나 수정할 때 반드시 이 문서를 기준으로 삼는다.

---

## 1. Creative North Star

**철학: The Curated Archive**

이 앱은 단순한 노트 도구가 아니라 개인 박물관이다. 모든 노트는 큐레이션된 전시물처럼 다뤄진다. UI는 콘텐츠와 경쟁하지 않으며, 학습의 "조용한 순간"을 방해하지 않는다.

핵심 원칙:
- **Soft Minimalism** — 비워냄으로써 내용을 강조한다
- **Tonal Depth** — 선 대신 배경색 계층으로 공간을 구분한다
- **Intentional Asymmetry** — 경직된 격자보다 숨쉬는 여백을 우선한다
- **Typography-Driven** — 아이콘보다 텍스트가 주인공이다

---

## 2. Color Tokens

### 전체 토큰 표

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

### Surface Hierarchy

레이어를 물리적 재질처럼 쌓는다. 색상이 깊을수록 낮은 레이어다.

```
background (#f8f9fa)          ← 앱 전체 바닥
  └─ surface-low (#f1f4f6)    ← 사이드바
       └─ surface (#eaeff1)   ← 섹션 구분
            └─ card (#ffffff) ← 카드, 에디터 (최상위 — "들어올린 종이" 효과)
```

### No-Line Rule

**섹션 구분에 1px 실선 border를 사용하지 않는다.** 경계는 배경색 전환으로만 만든다.

```
사이드바 bg-surface-low | 메인 bg-background
              ↑ 선이 아닌 색상 변환으로 경계가 "느껴진다"
```

### Glass & Gradient Rule

**플로팅 요소** (모달, 드롭다운): Glassmorphism 적용
```css
background: rgba(248, 249, 250, 0.8); /* surface 80% */
backdrop-filter: blur(12px);
```

**Primary CTA**: 액센트 그라디언트
```css
background: linear-gradient(to bottom right, #0053dc, #3e76fe);
```

---

## 3. Typography

**Inter 전용.** 하나의 서체를 스케일과 웨이트로 계층화한다.

### 타입 스케일

| 역할 | 토큰명 | 크기 | Weight | Letter Spacing | Line Height | 컬러 |
|---|---|---|---|---|---|---|
| Display | `display-lg` | 3.5rem | 700 | -0.02em | 1.1 | `text-foreground` |
| Headline | `headline-md` | 1.75rem | 600 | -0.01em | 1.4 | `text-foreground` |
| Body | `body-lg` | 1rem | 400 | 0 | 1.6 | `text-muted-foreground` (장문) / `text-foreground` (강조) |
| Label | `label-md` | 0.75rem | 600 | +0.05em | 1.2 | `text-muted-foreground` |

### Label 규칙
`label-md`는 항상 `uppercase`로 렌더링한다. 메타데이터와 내러티브 콘텐츠를 시각적으로 구분하기 위해서다.

```tsx
<span className="text-xs font-semibold tracking-widest uppercase text-muted-foreground">
  태그
</span>
```

---

## 4. Elevation & Depth

### Tonal Layering (기본)

표준 카드에 그림자를 쓰지 않는다. `card(#fff)` 위에 `surface(#eaeff1)` 섹션을 배치해 자연스러운 종이 겹침 효과를 낸다.

### Ambient Shadow (플로팅 요소 전용)

모달, 팝오버처럼 실제로 떠있는 요소에만 사용한다.

```css
box-shadow: 0 12px 40px rgba(43, 52, 55, 0.06),   /* on_surface 6% */
            0 4px 16px rgba(0, 83, 220, 0.04);     /* accent tint 4% */
blur: 24px ~ 40px;
```

### Ghost Border (접근성 폴백)

유사한 배경색이 겹쳐 구분이 필요할 때만 사용한다.

```css
border: 1px solid rgba(171, 179, 183, 0.15); /* outline_variant 15% */
```

---

## 5. Components

### Button

| 종류 | 배경 | 텍스트 | Border | Hover |
|---|---|---|---|---|
| **Primary** | `linear-gradient(accent → accent-container)` | `text-on-accent` | 없음 | `opacity-90` |
| **Secondary** | `bg-surface-high` | `text-foreground` | 없음 | `bg-surface-highest` |
| **Ghost** | 없음 | `text-accent` | 없음 | `bg-accent/5` |

```tsx
// Primary
<button className="bg-gradient-to-br from-accent to-accent-container text-on-accent px-5 py-2 rounded-md font-semibold">

// Secondary
<button className="bg-surface-high text-foreground px-5 py-2 rounded-md font-semibold hover:bg-surface-highest">

// Ghost
<button className="text-accent px-5 py-2 rounded-md font-semibold hover:bg-accent/5">
```

`rounded-md` = `0.375rem` (Stitch `md` roundedness 기준)

### Cards & Lists

- 카드 컨테이너: `bg-card` — "들어올린 종이" 효과
- 리스트 항목 구분: **divider 선 금지** — `gap-y-[1.4rem]` 간격으로 대체
- Hover: `hover:bg-surface-low`
- 선택 상태: `bg-surface-highest`

### Input Fields

```tsx
<input className="
  bg-card
  border border-border/15      /* Ghost Border 기본 상태 */
  focus:border-accent           /* focus 시 accent 1px */
  outline-none rounded-md
  px-3 py-2 text-foreground
  placeholder:text-muted-foreground/50
" />
```

라벨은 항상 입력창 **위**에 `label-md` 스타일로 배치, `gap-y-1` 간격.

### Knowledge Token (Tag Chip)

태그 기능에 사용되는 커스텀 칩 컴포넌트.

```tsx
<span className="
  bg-surface-highest            /* #dbe4e7 */
  text-muted-foreground         /* #586064 */
  rounded-full                  /* full roundedness */
  px-3 py-0.5
  text-xs font-medium
  /* border 없음 */
">
  #javascript
</span>
```

- `×` 버튼은 칩 hover 시에만 표시 (`group-hover:opacity-100 opacity-0 transition-opacity`)
- 삭제 즉시 `PATCH /notes/:id` 서버 반영

---

## 6. Spacing

기준 단위: **1.4rem (spacing.4)**

| 토큰 | rem | px | 용도 |
|---|---|---|---|
| spacing.1 | 0.35rem | ~6px | 라벨 ↔ 입력 간격 |
| spacing.2 | 0.7rem | ~11px | Headline ↔ Body 간격 |
| spacing.4 | 1.4rem | ~22px | 리스트 항목 간격 (기본 리듬) |
| spacing.6 | 2.1rem | ~34px | 컴포넌트 내부 섹션 간격 |
| spacing.10 | 3.5rem | ~56px | 레이아웃 블록 간격 (Atmospheric) |

---

## 7. Do's ✓

- **DO** 여백을 구조적 요소로 사용한다. 의심스러우면 마진을 늘린다.
- **DO** 사이드바의 선택된 항목에 `bg-surface-highest`를 사용한다.
- **DO** 액센트 컬러(`text-accent`, `bg-accent`)는 의도적인 액션(CTA, 포커스)에만 절제해서 사용한다.
- **DO** 섹션 구분은 배경색 전환(`surface-low` vs `background`)으로 표현한다.
- **DO** 태그 칩에 `bg-surface-highest` + `rounded-full` 조합을 사용한다.
- **DO** 플로팅 요소(모달, 드롭다운)에만 Glassmorphism을 적용한다.
- **DO** 라벨(`label-md`)은 항상 `uppercase` + `tracking-widest`로 렌더링한다.
- **DO** 장문 본문에는 `text-muted-foreground(#586064)`를 사용해 눈의 피로를 줄인다.

---

## 8. Don'ts ✗

- **DON'T** 텍스트에 순수 검정(`#000000`)을 사용한다 → `text-foreground(#2b3437)`를 사용한다.
- **DON'T** 섹션을 1px 실선 border로 구분한다 → 배경색 전환으로 대체한다.
- **DON'T** 표준 카드나 리스트에 box-shadow를 사용한다 → Tonal Layering으로 대체한다.
- **DON'T** 리스트 항목 사이에 divider 선을 넣는다 → `gap-y-[1.4rem]` 간격으로 대체한다.
- **DON'T** 기능적 명확성 없이 아이콘을 사용한다 → 이 시스템은 타이포그래피 중심이다.
- **DON'T** Knowledge Token(태그 칩)에 border를 추가한다 → 배경색만으로 충분하다.
- **DON'T** 액센트 컬러를 장식 목적으로 남용한다 → 사용자 의도가 있는 인터랙션에만 사용한다.
- **DON'T** Inter 외 다른 서체를 본문/UI 요소에 혼용한다 (앱 타이틀 Boogaloo 예외).
