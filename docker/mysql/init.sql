
-- DROP IF EXISTS
DROP TABLE IF EXISTS employee_skill;
DROP TABLE IF EXISTS employee_training;
DROP TABLE IF EXISTS employee_site_history;
DROP TABLE IF EXISTS skill;
DROP TABLE IF EXISTS skill_category;
DROP TABLE IF EXISTS training;
DROP TABLE IF EXISTS site;
DROP TABLE IF EXISTS employee;

-- CREATE TABLES with utf8mb4 charset
CREATE TABLE employee (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100),
    hire_date DATE,
    site_id INT
) DEFAULT CHARSET=utf8mb4;

CREATE TABLE site (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    location VARCHAR(100)
) DEFAULT CHARSET=utf8mb4;

CREATE TABLE employee_site_history (
    id INT AUTO_INCREMENT PRIMARY KEY,
    employee_id INT,
    site_id INT,
    start_date DATE,
    end_date DATE,
    role VARCHAR(100),
    task_summary TEXT,
    tools TEXT,
    note TEXT,
    company_eval VARCHAR(10),
    recommended VARCHAR(100),
    manager_note TEXT
) DEFAULT CHARSET=utf8mb4;

CREATE TABLE skill_category (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100)
) DEFAULT CHARSET=utf8mb4;

CREATE TABLE skill (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    category_id INT
) DEFAULT CHARSET=utf8mb4;

CREATE TABLE employee_skill (
    id INT AUTO_INCREMENT PRIMARY KEY,
    employee_id INT,
    skill_id INT,
    experience VARCHAR(50),
    proficiency INT,
    note TEXT,
    eval_score INT,
    eval_comment TEXT,
    evaluator VARCHAR(100),
    eval_date DATE
) DEFAULT CHARSET=utf8mb4;

CREATE TABLE training (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    description TEXT,
    start_date DATE,
    end_date DATE
) DEFAULT CHARSET=utf8mb4;

CREATE TABLE employee_training (
    id INT AUTO_INCREMENT PRIMARY KEY,
    employee_id INT,
    training_id INT,
    status VARCHAR(50),
    score INT,
    report_submitted BOOLEAN,
    comment TEXT,
    understanding VARCHAR(10),
    feedback TEXT
) DEFAULT CHARSET=utf8mb4;

-- INSERT SAMPLE DATA
INSERT INTO site (name, location) VALUES
('開発拠点A', '東京'),
('開発拠点B', '大阪');

INSERT INTO employee (name, email, hire_date, site_id) VALUES
('山田 太郎', 'yamada@example.com', '2021-04-01', 1),
('佐藤 花子', 'sato@example.com', '2022-01-15', 2);

INSERT INTO skill_category (name) VALUES
('フロントエンド'),
('バックエンド');

INSERT INTO skill (name, category_id) VALUES
('Vue.js', 1),
('Spring Boot', 2);

INSERT INTO employee_skill (employee_id, skill_id, experience, proficiency, note, eval_score, eval_comment, evaluator, eval_date) VALUES
(1, 1, '2年', 4, '業務で使用中', 5, 'フロント得意', '佐藤PM', '2024-12-01'),
(1, 2, '1年', 3, '最近導入', 4, 'API理解あり', '佐藤PM', '2024-12-01');

INSERT INTO training (name, description, start_date, end_date) VALUES
('Vue実践研修', 'VueとVuetifyの実践', '2024-05-01', '2024-05-03'),
('Spring Boot研修', 'API開発研修', '2024-06-01', '2024-06-02');

INSERT INTO employee_training (employee_id, training_id, status, score, report_submitted, comment, understanding, feedback) VALUES
(1, 1, '完了', 90, TRUE, '実務に役立った', 'A', '応用力あり'),
(1, 2, '完了', 85, TRUE, '復習必要', 'B', '基礎は十分');

INSERT INTO employee_site_history (employee_id, site_id, start_date, end_date, role, task_summary, tools, note, company_eval, recommended, manager_note) VALUES
(1, 1, '2023-01-01', '2024-01-01', '開発', 'APIと画面開発', 'Spring Boot, Vue', '5名チーム', '◎', 'バックエンド', '安定稼働');
