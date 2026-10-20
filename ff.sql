-- 1. Справочники (Независимые таблицы)

CREATE TABLE epochs (
    id_epoch INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL
);

CREATE TABLE genres (
    id_genre INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL
);

CREATE TABLE departments (
    id_department INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL
);

CREATE TABLE ticket_types (
    id_ticket_type INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL,
    price REAL NOT NULL
);

-- 2. Зависимые таблицы (Имеют внешние ключи - FK)

CREATE TABLE employees (
    id_employee INTEGER PRIMARY KEY AUTOINCREMENT,
    full_name TEXT NOT NULL,
    position TEXT NOT NULL,
    id_department INTEGER,
    FOREIGN KEY (id_department) REFERENCES departments(id_department)
);

CREATE TABLE artists (
    id_artist INTEGER PRIMARY KEY AUTOINCREMENT,
    full_name TEXT NOT NULL,
    life_years TEXT,
    country TEXT,
    id_epoch INTEGER,
    FOREIGN KEY (id_epoch) REFERENCES epochs(id_epoch)
);

CREATE TABLE halls (
    id_hall INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL,
    floor INTEGER,
    id_employee INTEGER, -- Ответственный сотрудник
    FOREIGN KEY (id_employee) REFERENCES employees(id_employee)
);

CREATE TABLE exhibits (
    id_exhibit INTEGER PRIMARY KEY AUTOINCREMENT,
    title TEXT NOT NULL,
    creation_year INTEGER,
    id_artist INTEGER,
    id_genre INTEGER,
    id_hall INTEGER,
    FOREIGN KEY (id_artist) REFERENCES artists(id_artist),
    FOREIGN KEY (id_genre) REFERENCES genres(id_genre),
    FOREIGN KEY (id_hall) REFERENCES halls(id_hall)
);

CREATE TABLE visitors (
    id_visitor INTEGER PRIMARY KEY AUTOINCREMENT,
    full_name TEXT,
    phone TEXT,
    email TEXT
);

CREATE TABLE tickets (
    id_ticket INTEGER PRIMARY KEY AUTOINCREMENT,
    sale_date DATE NOT NULL,
    id_ticket_type INTEGER,
    id_visitor INTEGER,
    FOREIGN KEY (id_ticket_type) REFERENCES ticket_types(id_ticket_type),
    FOREIGN KEY (id_visitor) REFERENCES visitors(id_visitor)
);

CREATE TABLE groups (
    id_group INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL
);

CREATE TABLE excursions (
    id_excursion INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL,
    date DATE NOT NULL,
    id_guide INTEGER, -- Экскурсовод (сотрудник)
    id_group INTEGER,
    FOREIGN KEY (id_guide) REFERENCES employees(id_employee),
    FOREIGN KEY (id_group) REFERENCES groups(id_group)
);
