```sh
# フェーズ1：要件定義・概要設計
gh issue create --title "[1-01] 要件整理（現状の課題洗い出し）"
gh issue create --title "[1-02] 管理対象の定義（技術・研修・現場歴）"
gh issue create --title "[1-03] 画面構成の仮決定（6画面）"
gh issue create --title "[1-04] 開発スコープの決定"
gh issue create --title "[1-05] 使用技術・構成の選定理由まとめ"

# フェーズ2：詳細設計・API設計
gh issue create --title "[2-01] ER図の作成（社員・研修・現場テーブル）"
gh issue create --title "[2-02] API一覧表の作成"
gh issue create --title "[2-03] 状態管理設計（Vuex）"
gh issue create --title "[2-04] フロント-API連携方式の確認"
gh issue create --title "[2-05] バリデーション仕様の設計"

# フェーズ3：フロントエンド実装
gh issue create --title "[3-01] ダッシュボード画面の実装（チャート表示）"
gh issue create --title "[3-02] 社員一覧画面（テーブル＋検索）"
gh issue create --title "[3-03] 社員詳細画面（タブ表示）"
gh issue create --title "[3-04] 社員編集画面（フォーム）"
gh issue create --title "[3-05] 新規登録画面（バリデーション付）"
gh issue create --title "[3-06] ログイン画面（仮認証）"

# フェーズ4：バックエンド実装
gh issue create --title "[4-01] Spring Boot プロジェクト初期構成"
gh issue create --title "[4-02] 社員一覧取得APIの実装"
gh issue create --title "[4-03] 社員詳細取得APIの実装"
gh issue create --title "[4-04] 社員登録・更新APIの実装"
gh issue create --title "[4-05] ログイン認証APIの実装"

# フェーズ5：テスト・デバッグ
gh issue create --title "[5-01] PostmanによるAPI検証"
gh issue create --title "[5-02] Vueコンポーネントの単体テスト"
gh issue create --title "[5-03] 結合テスト：API＋画面"

# フェーズ6：プレゼン準備
gh issue create --title "[6-01] プレゼン資料構成案作成"
gh issue create --title "[6-02] システム構成図・ER図反映"
gh issue create --title "[6-03] デモ用画面キャプチャ作成"
gh issue create --title "[6-04] 発表練習＆タイム調整"
gh issue create --title "[6-05] プレゼン資料の最終確認"
```