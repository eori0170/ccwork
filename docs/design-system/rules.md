# Rules — Do's & Don'ts

> 스타일 작업 시 항상 함께 로드한다. 이 규칙들은 예외 없이 적용된다.

## Do's ✓

- **DO** 여백을 구조적 요소로 사용한다. 의심스러우면 마진을 늘린다.
- **DO** 사이드바의 선택된 항목에 `bg-surface-highest`를 사용한다.
- **DO** 액센트 컬러(`text-accent`, `bg-accent`)는 의도적인 액션(CTA, 포커스)에만 절제해서 사용한다.
- **DO** 섹션 구분은 배경색 전환(`bg-surface-low` vs `bg-background`)으로 표현한다.
- **DO** 태그 칩에 `bg-surface-highest` + `rounded-full` 조합을 사용한다.
- **DO** 플로팅 요소(모달, 드롭다운)에만 Glassmorphism을 적용한다.
- **DO** 라벨(`label-md`)은 항상 `uppercase` + `tracking-widest`로 렌더링한다.
- **DO** 장문 본문에는 `text-muted-foreground(#586064)`를 사용해 눈의 피로를 줄인다.

## Don'ts ✗

- **DON'T** 텍스트에 순수 검정(`#000000`)을 사용한다 → `text-foreground(#2b3437)` 사용.
- **DON'T** 섹션을 1px 실선 border로 구분한다 → 배경색 전환으로 대체.
- **DON'T** 표준 카드나 리스트에 `box-shadow`를 사용한다 → Tonal Layering으로 대체.
- **DON'T** 리스트 항목 사이에 divider 선을 넣는다 → `gap-y-[1.4rem]` 간격으로 대체.
- **DON'T** 기능적 명확성 없이 아이콘을 사용한다 → 이 시스템은 타이포그래피 중심이다.
- **DON'T** Knowledge Token(태그 칩)에 border를 추가한다 → 배경색만으로 충분하다.
- **DON'T** 액센트 컬러를 장식 목적으로 남용한다 → 사용자 의도가 있는 인터랙션에만 사용.
- **DON'T** Inter 외 다른 서체를 본문/UI 요소에 혼용한다 (앱 타이틀 Boogaloo 예외).
