## ✅ 1. プロジェクト構成（提案）

あなたのディレクトリに合わせて、以下の構成を追加するとスムーズです：

```
C:\Development\自己成長プレゼン用2025\selfgrowth-2025_製造
├─backend                   ← Spring Boot プロジェクト
│  ├─src/...
│  ├─pom.xml
│  └─application.yml
├─docker                    ← DB等のコンテナ定義
│  ├─mysql/
│  │   ├─init.sql           ← 初期データ投入（任意）
│  │   └─Dockerfile（不要）
│  └─docker-compose.yml
├─docs                      ← 既存の設計資料
│  └─phaseX_...
└─readme.md
```

---

## ✅ 2. docker-composeでMySQLを構築

### 📄 `docker/docker-compose.yml`

```yaml
version: '3.8'

services:
  mysql:
    image: mysql:8.0
    container_name: selfgrowth-mysql
    ports:
      - "3306:3306"
    environment:
      MYSQL_ROOT_PASSWORD: rootpass
      MYSQL_DATABASE: selfgrowth_db
      MYSQL_USER: devuser
      MYSQL_PASSWORD: devpass
    volumes:
      - ./mysql:/docker-entrypoint-initdb.d  # init.sql 置き場（任意）
    networks:
      - selfgrowth-net

networks:
  selfgrowth-net:
    driver: bridge
```

> ✔ `docker/docker/mysql/init.sql` に `CREATE TABLE` や `INSERT` を書けば、初回起動時に反映されます。

---

## ✅ 3. Spring Boot 側のDB接続設定（`application.yml`）

```yaml
spring:
  datasource:
    url: jdbc:mysql://localhost:3306/selfgrowth_db
    username: devuser
    password: devpass
    driver-class-name: com.mysql.cj.jdbc.Driver
  jpa:
    hibernate:
      ddl-auto: update  # 初期は create や validate も可
    show-sql: true
    properties:
      hibernate.format_sql: true
```

---

## ✅ 4. 起動手順

```bash
cd docker
docker-compose up -d
```

* ブラウザや `MySQL Workbench` で `localhost:3306` に接続して確認。
* ユーザー：`devuser` / パスワード：`devpass` / DB：`selfgrowth_db`

---

## ✍ 補足：次にやるべきこと

1. `backend` に Spring Initializr でプロジェクト作成（`mysql` / `jpa` / `web` / `lombok`）
2. `entity` クラスを `2-01 ER図.md` に基づいて実装
3. `repository` と `rest controller` でAPI雛形を作成

---