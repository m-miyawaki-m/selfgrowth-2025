#!/bin/bash

# フェーズ1（Issue 1〜5）：設計
for i in {1..5}; do
  gh issue edit $i --add-label "設計"
done

# フェーズ2（Issue 6〜10）：設計
for i in {6..10}; do
  gh issue edit $i --add-label "設計"
done

# フェーズ3（Issue 11〜16）：フロント
for i in {11..16}; do
  gh issue edit $i --add-label "フロント"
done

# フェーズ4（Issue 17〜21）：バックエンド
for i in {17..21}; do
  gh issue edit $i --add-label "バックエンド"
done

# フェーズ5（Issue 22〜24）：テスト
for i in {22..24}; do
  gh issue edit $i --add-label "テスト"
done

# フェーズ6（Issue 25〜28）：成果物
for i in {25..28}; do
  gh issue edit $i --add-label "成果物"
done
