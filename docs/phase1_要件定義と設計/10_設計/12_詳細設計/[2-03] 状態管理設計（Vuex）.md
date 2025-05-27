
## ✅ \[2-03] 状態管理設計（Vuex）

### 🎯 目的

Vuexを用いて、**社員情報の一覧〜詳細〜編集〜新規登録画面にまたがる状態の一貫管理**を実現する。これにより：

* タブ間での編集内容の保持
* 権限による表示制御（管理者専用項目）
* 編集中／保存済の状態管理
* ログインユーザー情報の保持と利用

を可能にする。

---

### 🏗️ 状態管理スコープ

| ストア名            | 管理対象                     | 使用画面           | 補足                                       |
| --------------- | ------------------------ | -------------- | ---------------------------------------- |
| `employeeStore` | 社員一覧、選択中の社員詳細、編集中の社員情報   | 一覧／詳細／編集／登録画面  | `selectedEmployee`, `employeeList` などを保持 |
| `tabStore`      | 社員詳細・編集画面のカテゴリタブ         | 詳細／編集画面        | `activeTab`（スキル／研修／現場）                   |
| `authStore`     | ログインユーザー情報、権限            | 全画面（特に管理者制御項目） | `user`, `role`（admin／user）               |
| `uiStore`       | 編集中フラグ、保存済フラグ、エラーステータスなど | 編集／登録画面        | フォーム状態の制御、エラー表示制御、バリデーション連携用など           |

---

### 🧱 データ構造イメージ

#### `employeeStore.ts`

```ts
state: () => ({
  employeeList: [],
  selectedEmployee: null,
  isEditing: false,
})
```

#### `tabStore.ts`

```ts
state: () => ({
  activeTab: 'skill', // skill / training / site
})
```

#### `authStore.ts`

```ts
state: () => ({
  user: null,
  role: 'user', // 'admin' の場合のみ非公開項目表示
})
```

#### `uiStore.ts`

```ts
state: () => ({
  isLoading: false,
  hasError: false,
  saveSuccess: false,
})
```

---

### 📦 モジュール構成と役割分担

| モジュール名          | 主な役割                                   |
| --------------- | -------------------------------------- |
| `employeeStore` | APIから社員一覧を取得／選択中社員の保持／編集情報の一時保存        |
| `tabStore`      | 詳細・編集画面で選択中のタブ（スキル／研修／現場）を保持           |
| `authStore`     | ログイン状態・ユーザー情報・管理者判定など（画面制御に活用）         |
| `uiStore`       | バリデーション状態、編集中か否か、保存成功時のトースト表示などUI反映に特化 |

---

### 🛠 使用例（コンポーネント内）

```ts
import { useEmployeeStore } from '@/store/employeeStore'
const employeeStore = useEmployeeStore()
employeeStore.selectedEmployee = { ...employee }
```

```vue
<!-- 管理者専用項目の表示切替 -->
<v-textarea v-if="authStore.role === 'admin'" ... />
```

```ts
watch(() => employeeStore.selectedEmployee, (val) => {
  // 編集フォーム初期化処理
})
```

---

### 🧩 実装方針

* `defineStore`（Vuex or Pinia）を使用し、型安全かつComposition APIに適した形に設計
* 編集時は**一時保存データ**を `employeeStore` に保持し、保存ボタンでAPI連携
* 画面遷移時にも状態維持が必要なため、ストアを\*\*永続化（必要に応じて）\*\*対応
* バリデーション通過後に `uiStore.saveSuccess = true` → トースト表示など

---