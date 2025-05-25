#!/bin/bash

# Phase 1（Issue 1〜10）
for i in {1..10}; do
  gh issue edit $i --milestone "Phase 1: 要件定義と設計"
done

# Phase 2（Issue 11〜21）
for i in {11..21}; do
  gh issue edit $i --milestone "Phase 2: 実装"
done

# Phase 3（Issue 22〜28）
for i in {22..28}; do
  gh issue edit $i --milestone "Phase 3: テストと成果物作成"
done
