# Django E-Commerce Webshop 🏍️

This project is a full-featured e-commerce web application built using Django and deployed with Docker and Nginx on a V-Server.

---

## Table of Contents

1. [Introduction](#introduction)
2. [Quickstart](#quickstart)
3. [Requirements](#requirements)
4. [Clone the Repository](#clone-the-repository)
5. [Environment Configuration](#environment-configuration)
6. [Run the Application with Docker](#run-the-application-with-docker)
7. [Configure Nginx as Reverse Proxy](#configure-nginx-as-reverse-proxy)
8. [Usage](#usage)
9. [Screenshots](#screenshots)
10. [License](#license)

---

## Introduction

This Django-based webshop allows users to register, log in, browse products, apply filters, and view product details. The system supports an admin panel where shop owners can manage products, orders, and users.

---

## Quickstart ⚡️

1. **Install dependencies:**
   ```sh
   sudo apt update && sudo apt install -y docker.io docker-compose nginx git
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
   docker run -d -p 8026:8025 --env-file .env --name baby-tools-container baby-tools-shop
   ```
6. **Create a superuser:**
   ```sh
   docker exec -it baby-tools-container python manage.py createsuperuser
   ```
   Follow the prompts to set up a username, email, and password.
7. **Configure Nginx as a reverse proxy:**
   ```sh
   sudo nano /etc/nginx/sites-enabled/alternatives
   ```
   Add the following:
   ```nginx
   server {
       listen 8025;
       listen [::]:8025;
       server_name <your-server-ip>;
       location / {
           proxy_pass http://127.0.0.1:8026;
           proxy_set_header Host $host;
           proxy_set_header X-Real-IP $remote_addr;
           proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
           proxy_set_header X-Forwarded-Proto $scheme;
       }
       location /static/ {
           alias /baby-tools-shop/babyshop_app/static/;
       }
       location /media/ {
           alias /baby-tools-shop/babyshop_app/media/;
       }
   }
   ```
8. **Restart Nginx:**
   ```sh
   sudo nginx -t
   sudo systemctl restart nginx
   ```
9. **Access the webshop:**
   ```sh
   http://<your-server-ip>:8025/
   ```
10. **Log in to the admin panel:**
    ```sh
    http://<your-server-ip>:8025/admin
    ```

---

## Requirements 📋

- A V-Server running Ubuntu/Debian
- Docker & Docker Compose
- Nginx
- Git

Ensure your system is up to date:

```sh
sudo apt update && sudo apt install -y docker.io docker-compose nginx git
```

---

## Clone the Repository 📝

Navigate to your preferred directory and **clone the project**:

```sh
cd ~
git clone -b development git@github.com:BenjaminTietz/baby-tools-shop.git
cd baby-tools-shop
```

---

## Environment Configuration 🌱

Create the `.env` file with necessary environment variables:

```sh
touch .env
nano .env
```

Paste the following content **(replace `<your-server-ip>` with your actual IP)**:

```sh
ALLOWED_HOSTS=["localhost", "127.0.0.1", "<your-server-ip>"]
```

Save and exit (`CTRL + X`, then `Y`, then `Enter`).

Ensure the correct permissions:

```sh
sudo chown $(whoami):$(whoami) .env
sudo chmod 644 .env
```

---

## Run the Application with Docker 🛠️

### 1. Build the Docker Image

```sh
docker build -t baby-tools-shop .
```

### 2. Start the Container

```sh
docker run -d -p 8026:8025 --env-file .env --name baby-tools-container baby-tools-shop
```

### 3. Verify if the Application is Running

Test in your browser:

```sh
http://<your-server-ip>:8026
```

If the page loads, the application is running! ✅

### Photos

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
