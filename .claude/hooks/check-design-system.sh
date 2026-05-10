#!/bin/bash
# Design System Lint Hook
# PostToolUse (Write/Edit) 후 src/components/ 내 금지 패턴을 검사한다.

TARGET="src/components"
ERRORS=0

if [ ! -d "$TARGET" ]; then
  exit 0
fi

echo "--- Design System Check ---"

# 1. 순수 검정 텍스트 금지 (#000000)
if grep -rn "#000000" "$TARGET" --include="*.tsx" --include="*.ts" -q; then
  echo "[WARN] #000000 사용 금지 — text-foreground(#2b3437) 를 사용하세요"
  grep -rn "#000000" "$TARGET" --include="*.tsx" --include="*.ts"
  ERRORS=$((ERRORS + 1))
fi

# 2. 기본 Tailwind 그림자 금지 (shadow-[...] 커스텀은 허용)
if grep -rn '\bshadow-sm\b\|\bshadow-md\b\|\bshadow-lg\b\|\bshadow-xl\b\|\bshadow-2xl\b' "$TARGET" --include="*.tsx" -q; then
  echo "[WARN] 기본 shadow 유틸리티 금지 — Tonal Layering 또는 shadow-[...] 커스텀을 사용하세요"
  grep -rn '\bshadow-sm\b\|\bshadow-md\b\|\bshadow-lg\b\|\bshadow-xl\b\|\bshadow-2xl\b' "$TARGET" --include="*.tsx"
  ERRORS=$((ERRORS + 1))
fi

# 3. 실선 구분선 금지 (border-t / border-b / border-l / border-r 단독 사용)
if grep -rn '\bborder-t\b\|\bborder-b\b\|\bborder-l\b\|\bborder-r\b' "$TARGET" --include="*.tsx" -q; then
  echo "[WARN] 실선 border 구분선 금지 — 배경색 전환(bg-surface-low 등)으로 대체하세요"
  grep -rn '\bborder-t\b\|\bborder-b\b\|\bborder-l\b\|\bborder-r\b' "$TARGET" --include="*.tsx"
  ERRORS=$((ERRORS + 1))
fi

# 4. <hr> 구분선 금지
if grep -rn '<hr' "$TARGET" --include="*.tsx" -q; then
  echo "[WARN] <hr> divider 금지 — gap-y-[1.4rem] 간격으로 대체하세요"
  grep -rn '<hr' "$TARGET" --include="*.tsx"
  ERRORS=$((ERRORS + 1))
fi

if [ $ERRORS -eq 0 ]; then
  echo "[OK] 디자인 시스템 검사 통과"
  exit 0
else
  echo ""
  echo "[!] $ERRORS 개 위반 항목 발견 — docs/design-system/rules.md 참조"
  exit 2
fi
