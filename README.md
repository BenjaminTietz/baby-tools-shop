# Django E-Commerce Webshop 🏍️

## This project is a full-featured e-commerce web application built using Django and deployed with Docker on a V-Server.

---

## Introduction

This Django-based webshop allows users to register, log in, browse products, apply filters, and view product details. The system supports an admin panel where shop owners can manage products, orders, and users.

---

## Table of Contents

1. [Introduction](#introduction)
2. [Quickstart](#quickstart)
3. [Usage](#usage)
4. [Requirements](#requirements)
5. [Screenshots](#photos)
6. [Contact](#contact)
7. [Checklist](checklist_update.pdf)
8. [Docker Cheat-Sheet](docker-cheatsheet.md)

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
3. **Generate and configure the .env file:** <br>
   The environment file will be created automatically from env.template.
   Adjust the values to match your setup:
   ```sh
   cp .envtemplate .env
   nano .env
   ```
4. **Build the Docker image:**
   ```sh
   docker build -t baby-tools-shop .
   ```
5. **Start the container:**
   ```sh
   docker run -d -p 8025:8025 --env-file .env --name baby-tools-container baby-tools-shop
   ```
6. **Access the webshop:**
   ```sh
   http://<your-server-ip>:8025/
   ```
7. **Log in to the admin panel:**
   ```sh
   http://<your-server-ip>:8025/admin
   ```

---

## Usage

### **Environment Variables**

The application uses environment variables to configure certain aspects of the system. These can be set in the `.env` file:

```sh
ALLOWED_HOSTS=["localhost", "127.0.0.1", "<your-server-ip>"]
DEBUG=True
DJANGO_PRODUCTION=False
DJANGO_SUPERUSER_USERNAME=admin
DJANGO_SUPERUSER_EMAIL=admin@example.com
DJANGO_SUPERUSER_PASSWORD=adminpassword
```

### **Managing the Database**

Run migrations manually inside the container if needed:

```sh
docker exec -it baby-tools-container python manage.py migrate
```

To create a new Django superuser manually:

```sh
docker exec -it baby-tools-container python manage.py createsuperuser
```

### **Collecting Static Files**

If you update static files and need to collect them again, run:

```sh
docker exec -it baby-tools-container python manage.py collectstatic --noinput
```

### **Stopping and Restarting the Container**

To stop the container:

```sh
docker stop baby-tools-container
```

To restart it:

```sh
docker start baby-tools-container
```

To remove the container completely:

```sh
docker rm baby-tools-container
```

To rebuild and restart:

```sh
docker build -t baby-tools-shop .
docker run -d -p 8025:8025 --env-file .env --name baby-tools-container baby-tools-shop
```

---

## Requirements

- A V-Server running Ubuntu/Debian
- Docker & Docker Compose
- Git

Ensure your system is up to date:

```sh
sudo apt update && sudo apt install -y docker.io docker-compose git
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
