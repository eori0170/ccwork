# Typography

> **Inter 전용.** 하나의 서체를 스케일과 웨이트로 계층화한다. (앱 타이틀 Boogaloo 예외)

## 타입 스케일

| 역할 | 토큰명 | 크기 | Weight | Letter Spacing | Line Height | 컬러 |
|---|---|---|---|---|---|---|
| Display | `display-lg` | 3.5rem | 700 | -0.02em | 1.1 | `text-foreground` |
| Headline | `headline-md` | 1.75rem | 600 | -0.01em | 1.4 | `text-foreground` |
| Body | `body-lg` | 1rem | 400 | 0 | 1.6 | `text-muted-foreground` (장문) / `text-foreground` (강조) |
| Label | `label-md` | 0.75rem | 600 | +0.05em | 1.2 | `text-muted-foreground` |

## Tailwind 클래스 매핑

| 토큰 | Tailwind |
|---|---|
| `display-lg` | `text-[3.5rem] font-bold tracking-[-0.02em] leading-[1.1]` |
| `headline-md` | `text-[1.75rem] font-semibold tracking-[-0.01em] leading-[1.4]` |
| `body-lg` | `text-base font-normal leading-relaxed` |
| `label-md` | `text-xs font-semibold tracking-widest uppercase` |

## Label 규칙

`label-md`는 항상 `uppercase`로 렌더링한다. 메타데이터와 내러티브 콘텐츠를 시각적으로 구분하기 위해서다.

```tsx
<span className="text-xs font-semibold tracking-widest uppercase text-muted-foreground">
  태그
</span>
```

## 컬러 사용 원칙

- 장문 본문 → `text-muted-foreground` (#586064): 눈의 피로 감소
- 강조/제목 → `text-foreground` (#2b3437): 명확한 계층 표현
- 절대 `#000000` 사용 금지 → `text-foreground`로 대체
