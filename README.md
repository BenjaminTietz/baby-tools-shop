# Django E-Commerce Webshop 🏍️

This project is a full-featured e-commerce web application built using Django and deployed with Docker and Nginx on a V-Server.

---

## Table of Contents

1. [Introduction](#introduction)
2. [Quickstart](#quickstart)
3. [Requirements](#requirements)
4. [Screenshots](#photos)
5. [Contact](#contact)

---

## Introduction

This Django-based webshop allows users to register, log in, browse products, apply filters, and view product details. The system supports an admin panel where shop owners can manage products, orders, and users.

---

## Quickstart

1. **Install dependencies:**
   ```sh
   sudo apt update && sudo apt install -y docker.io docker-compose git
   ```
2. **Clone the repository:**
   ```sh
   git clone -b development git@github.com:BenjaminTietz/baby-tools-shop.git
   cd baby-tools-shop
   ```
3. **Create and configure the `.env` file:**
   ```sh
   touch .env
   nano .env
   ```
   Add the following content, replacing `<your-server-ip>` with your actual IP:
   ```sh
   ALLOWED_HOSTS=["localhost", "127.0.0.1", "<your-server-ip>"]
   ```
4. **Build the Docker image:**
   ```sh
   docker build -t baby-tools-shop .
   ```
5. **Start the container:**
   ```sh
   docker run -d -p 8025:8025 --name baby-tools-container baby-tools-shop
   ```
6. **Apply database migrations manually (to ensure DB is ready):**
   ```sh
   docker exec -it baby-tools-container python manage.py migrate --noinput
   ```
7. **Create a superuser:**
   ```sh
   docker exec -it baby-tools-container python manage.py createsuperuser
   ```
   Follow the prompts to set up a username, email, and password.
8. **Access the webshop:**
   ```sh
   http://<your-server-ip>:8025/
   ```
9. **Log in to the admin panel:**
   ```sh
   http://<your-server-ip>:8025/admin
   ```

---

## Requirements

- A V-Server running Ubuntu/Debian
- Docker & Docker Compose
- Git

Ensure your system is up to date:

```sh
sudo apt update && sudo apt install -y docker.io docker-compose nginx git
```

---

## Photos

##### Home Page with login

<img alt="" src="https://github.com/MET-DEV/Django-E-Commerce/blob/master/project_images/capture_20220323080815407.jpg"></img>

##### Home Page with filter

<img alt="" src="https://github.com/MET-DEV/Django-E-Commerce/blob/master/project_images/capture_20220323080840305.jpg"></img>

##### Product Detail Page

<img alt="" src="https://github.com/MET-DEV/Django-E-Commerce/blob/master/project_images/capture_20220323080934541.jpg"></img>

##### Home Page with no login

<img alt="" src="https://github.com/MET-DEV/Django-E-Commerce/blob/master/project_images/capture_20220323080953570.jpg"></img>

##### Register Page

<img alt="" src="https://github.com/MET-DEV/Django-E-Commerce/blob/master/project_images/capture_20220323081016022.jpg"></img>

##### Login Page

<img alt="" src="https://github.com/MET-DEV/Django-E-Commerce/blob/master/project_images/capture_20220323081044867.jpg"></img>

## Contact

### 👤 Personal

- [Portfolio](https://benjamin-tietz.com/)
- [Drop me a mail](mailto:mail@benjamin-tietz.com)

### 🌍 Social

- [LinkedIn](https://www.linkedin.com/in/benjamin-tietz/)

### 💻 Project Repository

- [GitHub Repository](https://github.com/BenjaminTietz/baby-tools-shop)
