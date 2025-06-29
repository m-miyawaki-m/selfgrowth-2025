## 📘 ChatGPT プロジェクト構想：事前検討ページ

### 🧭 プロジェクト目的

3年目エンジニアとしての技術成長をアピールするため、以下の条件で社内向けシステムを構築する：

* 対象： 技術スタック、研修、現場歴の管理
* 背景： 既存はExcelでの管理
* 目的： Webアプリ化することで可視性・拡張性・学習効果を高める
* ゴール： プレゼン（30分）で成果物・設計力・実装力をアピール

---

### ⏱ 想定スケジュールと作業時間

* 期間： 約2週間
* 作業時間： 100時間以内

| フェーズ         | 時間目安 |
| ------------ | ---- |
| 要件定義・概要設計    | 10h  |
| 詳細設計・API設計   | 15h  |
| フロントエンド実装    | 25h  |
| バックエンド実装     | 20h  |
| テスト（単体〜結合）   | 10h  |
| プレゼン資料・成果物作成 | 15h  |
| バッファ         | 5h   |

---

### 🧱 技術スタック

| 領域     | 技術選定                                         |
| ------ | -------------------------------------------- |
| フロント   | Vue 3 + Vuetify 3 + Vuex（defineComponent）    |
| バックエンド | Java + Spring Boot（REST API）                 |
| DB     | AWS RDS（MySQL）                               |
| ホスティング | S3 + CloudFront（フロント）\nEC2 or Beanstalk（API） |
| その他    | Chart.js or ApexCharts（可視化）\naxios, CORS設定   |

---

### 🖥 画面構成（6画面）

| No | 画面名        | 内容                     |
| -- | ---------- | ---------------------- |
| 1  | ダッシュボード画面  | 技術スタック・研修受講率グラフ        |
| 2  | 社員一覧画面     | フィルター、検索付きテーブル         |
| 3  | 社員詳細画面     | 技術・研修・現場歴をタブ表示         |
| 4  | 社員情報編集画面   | フォーム、バリデーションあり         |
| 5  | 新規社員登録画面   | 入力フォーム、登録              |
| 6  | ログイン画面（任意） | 仮認証（Cognito or APIベース） |

---

### 🔐 認証方針

#### APIベース（軽量・簡易）

* Spring BootでログインAPI作成
* JWT or セッションでVueと連携
* 工数が少なくて済む（2〜4h）

---

### ☁ AWS構成図（構想）

```
ユーザー → CloudFront → S3（Vue build成果物）
        → API（Spring Boot：EC2）
        → RDS（MySQL）
```

---

## 🧠 技術検討.md

### 1. Vue.js を選定した理由

* 学習コストが低く、コンポーネント志向のフロント開発に適している。
* Composition API（defineComponent）により状態管理との親和性が高い。
* 社内でも導入実績があり、保守性に優れる。

### 2. Vuetify 3 を選んだ理由

* Material Design準拠でUI品質が高い。
* レイアウト・レスポンシブ対応が強力で短期間でも構築しやすい。

### 3. Spring Boot を選んだ理由

* 社内資産と親和性があり、Javaの堅牢性を活かせる。
* REST API設計、Swagger連携など開発効率も良い。

### 4. Vuex（状態管理）を選んだ理由

* グローバルな状態管理が必要なシステムに適している。
* 編集・一覧などの状態共有を効率化できる。

### 5. AWS構成を選んだ理由

* S3 + CloudFront でVueアプリを安全にホスティング可能。
* RDS + EC2 でAPI・DBも本番環境に近い構成で構築できる。
* また、**EC2のみでフロントとバックエンドをまとめてホスティングする構成**も検討。

  * Vueのビルド成果物（index.html など）を `/var/www/html` に配置し、Nginxで配信。
  * Spring Bootアプリをポート8080で起動し、Nginxのリバースプロキシを使って `/api/` リクエストをSpring側へ転送。
  * こうした構成は実務でも多く、**Webサーバとアプリサーバの役割分担・CORS回避・SSL対応**などを学べる好例となる。
* S3 + CloudFront でVueアプリを安全にホスティング可能。
* RDS + EC2 でAPI・DBも本番環境に近い構成で構築できる。

---

### 🎓 プレゼン構成（30分）

※このプレゼンでは「システムそのもの」よりも、\*\*なぜ・どう考えて作ったか（背景・目的・技術検討）\*\*に重点を置きます。

| スライド項目      | 内容例                                                    |
| ----------- | ------------------------------------------------------ |
| ① 背景・目的（厚め） | Excelによる運用の課題感、なぜ自作Webシステムが有効か、プロジェクト実施の動機、スケジュールと制約など |
| ② 技術選定・検討   | Vue/Vuetifyを選んだ理由、AWS構成の検討、認証方式の比較など技術的判断プロセスの説明       |
| ③ 設計方針      | 画面構成・ER図・状態管理設計・API設計などの具体的検討結果                        |
| ④ 実装ハイライト   | Vueの構成、axios通信、フォームUI、バリデーション、API接続のポイントなど             |
| ⑤ テスト方針     | テスト観点、Postman・結合テストの工夫、エラー対応例など                        |
| ⑥ 学び・工夫点    | 実装で詰まったポイント、認証や構成における工夫、初見技術のキャッチアップ方法など               |
| ⑦ デモ & 展望   | 実際の動作確認 or 画面キャプチャ、今後の改善・社内展開の可能性                      |
| ⑧ まとめ・質疑応答  | 今回の成長ポイント、今後の活用アイディア、質問受付など                            |

| スライド項目     | 内容例                    |
| ---------- | ---------------------- |
| ① 背景・目的    | なぜ作ったか、何を改善したいか        |
| ② 技術構成     | Vue, Spring, AWS構成図など  |
| ③ 設計方針     | ER図、API設計、状態管理設計など     |
| ④ 実装ハイライト  | axios通信、状態管理、バリデーションなど |
| ⑤ テスト方針    | 単体・結合、Postman例など       |
| ⑥ 学び・工夫点   | CORS、認証、AWS構築トラブルなど    |
| ⑦ デモ & 展望  | 今後の改修計画・部門展開の可能性       |
| ⑧ まとめ・質疑応答 | プレゼンの締めと成長アピール         |

## ✅ ブランチ構成方針（機能別＋成果物分離）

| ブランチ種別                      | 目的                                      | 内容例                                                     |
| --------------------------- | --------------------------------------- | ------------------------------------------------------- |
| `feature/docs`（成果物系）        | 要件定義や設計ドキュメントなど、**成果物として提出する資料の管理・履歴化** | 要件定義書、画面設計、ER図、構成図、技術選定理由、プレゼン資料（Markdown/PowerPoint）など |
| `feature/frontend`（製造：フロント） | Vue/VuetifyでのUI構築、状態管理設計（Vuex）など        | ログイン画面、社員一覧・詳細画面、登録・編集画面、ダッシュボード、Chart.js               |
| `feature/backend`（製造：API）   | Spring BootでのREST API実装、DB連携、認証方式など     | CRUD API、ログインAPI、MySQLスキーマ、CORS設定、DTO/Entity層           |
| `feature/test`（テスト）         | 単体・結合テスト、Postman定義、mockデータ、検証用JSON      | APIテスト仕様書、テストコード（JUnit）、Postmanコレクション、axios通信用mock      |

---

## 🔁 マージ運用ルール例（例：GitHub Flowベース）

* `main`：リリース済みの安定ブランチ（最終成果物としてプレゼンに出すもの）
* 各 `feature/*` で作業 → Pull Request → レビュー → `main`へマージ
* ブランチ命名：`feature/<カテゴリ>-<内容>` 例）`feature/docs-requirements`, `feature/frontend-dash`, `feature/backend-login`

---

## ✅ 補足：ブランチ管理の狙い

| 狙い       | 具体例                                        |
| -------- | ------------------------------------------ |
| 作業粒度の明確化 | 「ドキュメント」「UI」「API」「テスト」を切り分け、進捗と品質を把握しやすくする |
| レビューしやすさ | PR単位で変更意図が分かりやすく、修正もしやすい                   |
| 成果物整理    | プレゼン時に「どのブランチで何を作ったか」が説明しやすい               |