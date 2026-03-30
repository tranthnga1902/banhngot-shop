# Bakery Shop

A full-stack e-commerce web application for selling bakery products, built with Spring Boot, Thymeleaf, and SQL Server.

---

## Table of Contents

- [Overview](#overview)
- [Features](#features)
- [Tech Stack](#tech-stack)
- [Requirements](#requirements)
- [Getting Started](#getting-started)
- [Project Structure](#project-structure)
- [API Endpoints](#api-endpoints)
- [Environment Variables](#environment-variables)
- [Deployment](#deployment)
- [License](#license)

---

## Overview

Bakery Shop is a web-based e-commerce platform that supports browsing products, managing orders, and administering the store. The system includes three access levels: Customer, Staff, and Admin, each with a dedicated interface and functionality.

---

## Features

### Customer
- Browse and search products
- Manage shopping cart
- Place orders at checkout
- Update user profile
- Reset password via email

### Staff
- Process and manage customer orders

### Admin
- Dashboard with store statistics
- Full product management
- Order oversight
- User account management
- Blog and news posting

---

## Tech Stack

| Layer | Technology |
|---|---|
| Backend | Spring Boot 3.2.0, Spring Security, Spring Data JPA |
| Frontend | Thymeleaf, HTML5, CSS3, JavaScript |
| Database | SQL Server |
| Email | Spring Mail (Gmail SMTP) |
| Build Tool | Maven |

---

## Requirements

- Java 17 or higher
- Maven 3.9 or higher
- SQL Server 2019 or higher
- Docker (optional, for containerized deployment)

---

## Getting Started

### 1. Clone the repository

```bash
git clone https://github.com/your-username/bakery-shop.git
cd bakery-shop
```

### 2. Set up the database

Create a database named `Webcake2` in SQL Server, then import the provided SQL file:

```bash
sqlcmd -S localhost -U sa -P your_password -i path/to/database.sql
```

### 3. Configure environment variables

Copy the example environment file and fill in your values:

```bash
cp .env.example .env
```

Or edit `src/main/resources/application.properties` directly:

```properties
spring.datasource.url=jdbc:sqlserver://localhost:1433;databaseName=Webcake2;encrypt=false;trustServerCertificate=true
spring.datasource.username=sa
spring.datasource.password=your_password
```

### 4. Run the application

```bash
mvn spring-boot:run
```

The application will be available at `http://localhost:8080`.

### Default Accounts

| Role | Username | Password |
|---|---|---|
| Admin | admin | admin123 |
| Staff | staff | staff123 |
| Customer | user | user123 |

> These are development credentials. Change all passwords before deploying to production.

---

## Project Structure

```
src/main/java/com/example/projectend/
    controller/
        admin/          # Admin controllers
        staff/          # Staff controllers
    entity/             # JPA entities
    repository/         # Data access layer
    service/
        auth/           # Authentication services
    config/             # Application configuration

src/main/resources/
    templates/
        admin/          # Admin views
        staff/          # Staff views
        layouts/        # Shared layout templates
    static/             # CSS, JavaScript, images
```

---

## API Endpoints

### Public

| Method | Path | Description |
|---|---|---|
| GET | `/` | Home page |
| GET | `/san-pham` | Product listing |
| GET | `/san-pham/{id}` | Product detail |
| GET | `/login` | Login page |
| GET | `/register` | Registration page |

### Customer (authentication required)

| Method | Path | Description |
|---|---|---|
| GET | `/gio-hang` | View cart |
| POST | `/gio-hang/them` | Add item to cart |
| POST | `/checkout` | Place order |
| GET | `/profile` | User profile |

### Admin (`/admin/*`)

| Method | Path | Description |
|---|---|---|
| GET | `/admin/dashboard` | Admin dashboard |
| GET | `/admin/san-pham` | Manage products |
| GET | `/admin/orders` | Manage orders |
| GET | `/admin/taikhoan` | Manage users |

### Staff (`/staff/*`)

| Method | Path | Description |
|---|---|---|
| GET | `/staff/dashboard` | Staff dashboard |
| GET | `/staff/orders` | View and process orders |

---

## Environment Variables

| Variable | Description | Default |
|---|---|---|
| `SERVER_PORT` | Port the server listens on | `8080` |
| `SPRING_DATASOURCE_URL` | JDBC connection string | — |
| `SPRING_DATASOURCE_USERNAME` | Database username | `sa` |
| `SPRING_DATASOURCE_PASSWORD` | Database password | — |
| `MAIL_USERNAME` | Gmail address for SMTP | — |
| `MAIL_PASSWORD` | Gmail app password | — |
| `SPRING_PROFILES_ACTIVE` | Active Spring profile | `prod` |

---

## Deployment

### Docker

```bash
# Build the image
docker build -t bakery-shop .

# Run the container
docker run -p 8080:8080 --env-file .env bakery-shop
```

### Docker Compose

```bash
docker-compose up -d
```

### Render.com

1. Push the repository to GitHub.
2. Create a new Web Service on Render and connect the repository.
3. Add all required environment variables from `.env.example`.
4. Deploy — Render will build and start the service automatically.

### Railway.app

1. Push the repository to GitHub.
2. Create a new project on Railway and deploy from GitHub.
3. Add a SQL Server or PostgreSQL database plugin.
4. Configure environment variables in the Railway dashboard.

---

## License

This project is developed for educational purposes.