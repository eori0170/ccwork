# Elevation & Depth

> 그림자보다 색상 계층으로 깊이를 표현한다. 그림자는 실제로 "떠있는" 요소에만 허용한다.

## Tonal Layering (기본 원칙)

표준 카드와 리스트에 `box-shadow`를 쓰지 않는다.
`bg-card(#fff)`를 `bg-surface(#eaeff1)` 위에 올려 자연스러운 종이 겹침 효과를 낸다.

```
bg-surface (섹션 배경)
  └─ bg-card (카드 컨테이너) ← 색상 차이만으로 "들어올린" 느낌
```

## Ambient Shadow (플로팅 요소 전용)

모달, 팝오버, 드롭다운처럼 실제로 화면 위에 떠있는 요소에만 사용한다.

```css
box-shadow:
  0 12px 40px rgba(43, 52, 55, 0.06),   /* on_surface 6% */
  0 4px 16px rgba(0, 83, 220, 0.04);    /* accent tint 4% */
```

Tailwind arbitrary value:
```tsx
className="shadow-[0_12px_40px_rgba(43,52,55,0.06),0_4px_16px_rgba(0,83,220,0.04)]"
```

## Ghost Border (접근성 폴백)

유사한 배경색이 겹쳐 시각적 구분이 필요할 때만 사용한다. 경계선처럼 보이면 안 되며, "선의 암시" 수준이어야 한다.

```css
border: 1px solid rgba(171, 179, 183, 0.15); /* outline_variant 15% */
```

Tailwind:
```tsx
className="border border-border/15"
```

## 적용 기준 요약

| 상황 | 방법 |
|---|---|
| 일반 카드/리스트 | Tonal Layering만 사용 |
| 모달/드롭다운 | Ambient Shadow |
| 유사 배경 구분 필요 | Ghost Border |
| 섹션 구분 | 배경색 전환 (`tokens.md` No-Line Rule 참조) |
