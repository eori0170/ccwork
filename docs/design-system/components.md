# Component Patterns

> 새 컴포넌트 작성 또는 수정 시 이 파일을 참조한다. `tokens.md`와 함께 사용한다.

## Button

| 종류 | 배경 | 텍스트 | Border | Hover |
|---|---|---|---|---|
| **Primary** | `bg-gradient-to-br from-accent to-accent-container` | `text-on-accent` | 없음 | `hover:opacity-90` |
| **Secondary** | `bg-surface-high` | `text-foreground` | 없음 | `hover:bg-surface-highest` |
| **Ghost** | 없음 | `text-accent` | 없음 | `hover:bg-accent/5` |

```tsx
// Primary
<button className="bg-gradient-to-br from-accent to-accent-container text-on-accent px-5 py-2 rounded-md font-semibold hover:opacity-90 transition-opacity">

// Secondary
<button className="bg-surface-high text-foreground px-5 py-2 rounded-md font-semibold hover:bg-surface-highest transition-colors">

// Ghost
<button className="text-accent px-5 py-2 rounded-md font-semibold hover:bg-accent/5 transition-colors">
```

`rounded-md` = `0.375rem` (Stitch `md` roundedness 기준)

---

## Cards & Lists

- 카드 컨테이너: `bg-card` (Tonal Layering으로 "들어올린 종이" 효과)
- 리스트 항목 구분: **divider 선 금지** — `gap-y-[1.4rem]` 간격으로 대체
- Hover: `hover:bg-surface-low`
- 선택 상태: `bg-surface-highest`

```tsx
// 리스트 컨테이너
<ul className="flex flex-col gap-y-[1.4rem]">

// 카드 아이템
<li className="bg-card rounded-md p-4 hover:bg-surface-low transition-colors cursor-pointer">

// 선택된 카드
<li className="bg-surface-highest rounded-md p-4 cursor-pointer">
```

---

## Input Fields

기본 상태에 Ghost Border, 포커스 시 accent 1px border.

```tsx
<div className="flex flex-col gap-y-1">
  <label className="text-xs font-semibold tracking-widest uppercase text-muted-foreground">
    제목
  </label>
  <input
    className="
      bg-card
      border border-border/15
      focus:border-accent focus:outline-none
      rounded-md px-3 py-2
      text-base text-foreground
      placeholder:text-muted-foreground/50
      transition-colors
    "
  />
</div>
```

라벨은 항상 입력창 **위**에 `label-md` 스타일로 배치, `gap-y-1` 간격.

---

## Knowledge Token (Tag Chip)

태그 기능에 사용되는 커스텀 칩 컴포넌트. border 없음.

```tsx
<span className="group relative inline-flex items-center bg-surface-highest text-muted-foreground rounded-full px-3 py-0.5 text-xs font-medium">
  javascript
  <button className="ml-1.5 opacity-0 group-hover:opacity-100 transition-opacity text-muted-foreground hover:text-foreground">
    ×
  </button>
</span>
```

- `bg-surface-highest` (#dbe4e7) + `rounded-full` + border 없음
- `×` 버튼은 칩 hover 시에만 표시 (`opacity-0 group-hover:opacity-100`)
- 삭제 시 즉시 `PATCH /notes/:id` 서버 반영 (`spec-fixed.md` 참조)
