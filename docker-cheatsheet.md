# 🐳 Docker Cheatsheet for Baby Tools Shop

This cheatsheet contains all essential Docker commands used in the project.

---

## **📌 Table of Contents**

1. [Basic Commands](#basic-commands)
2. [Managing Docker Containers](#managing-docker-containers)
3. [Building and Running Docker Images](#building-and-running-docker-images)
4. [Environment Variables & `.env` File](#environment-variables--env-file)
5. [Debugging & Troubleshooting](#debugging--troubleshooting)
6. [Full Deployment (Step-by-Step)](#full-deployment-step-by-step)
7. [Conclusion](#conclusion)

---

## **Basic Commands**

```sh
docker -v                      # Show the installed Docker version
docker ps                      # List running containers
docker ps -a                   # List all containers (including stopped ones)
docker images                  # List all locally stored Docker images
docker container prune -f       # Remove all stopped containers
```

---

## **Managing Docker Containers**

```sh
docker stop <container_id>            # Stop a running container
docker rm <container_id>              # Remove a stopped container
docker restart <container_id>         # Restart a container
docker logs <container_id>            # View logs of a container
docker logs -f <container_id>         # View live logs of a container
docker exec -it <container_id> sh     # Open a shell inside the container
docker exec -it <container_id> python manage.py shell  # Start Django shell inside the container
docker exec -it <container_id> python manage.py migrate  # Apply Django migrations
docker exec -it <container_id> python manage.py createsuperuser  # Create a Django admin user
```

---

## **Building and Running Docker Images**

```sh
docker build -t <image_name> .        # Build a new Docker image
docker run -d -p <host_port>:<container_port> --name <container_name> <image_name>  # Start a new container
docker run --rm --env-file .env busybox env | grep ALLOWED_HOSTS  # Check if Docker loads the `.env` file
docker rmi <image_id>                 # Remove a Docker image
docker image prune -a                  # Remove unused Docker images
```

---

## **Environment Variables & `.env` File**

```sh
cat .env                              # Display the contents of the `.env` file
docker run --rm --env-file .env busybox env | grep ALLOWED_HOSTS  # Verify if `ALLOWED_HOSTS` is loaded
dos2unix .env                         # Convert `.env` to Unix format (if needed)
nano .env                             # Open the `.env` file for editing
```

---

## **Debugging & Troubleshooting**

```sh
docker logs <container_id>            # View error logs
docker exec -it <container_id> python manage.py check  # Check Django for issues
docker exec -it <container_id> python manage.py showmigrations  # Show pending Django migrations
docker exec -it <container_id> python manage.py migrate  # Apply missing Django migrations
docker exec -it <container_id> python manage.py shell  # Open the Django shell for testing
docker stop <container_id> && docker rm <container_id>  # Stop & remove a faulty container
```

---

## **Full Deployment (Step-by-Step)**

If you need to **rebuild everything** from scratch:

```sh
# 1️⃣ Delete old repository
rm -rf baby-tools-shop

# 2️⃣ Clone the repository again
git clone -b development git@github.com:BenjaminTietz/baby-tools-shop.git
cd baby-tools-shop

# 3️⃣ Check the `.env` file
cat .env

# 4️⃣ Convert to Unix format if needed
dos2unix .env

# 5️⃣ Build a new Docker image
docker build -t baby-tools-shop .

# 6️⃣ Stop and remove any existing container
docker stop baby-tools-container
docker rm baby-tools-container

# 7️⃣ Start a new container
docker run -d -p 8025:8025 --env-file .env --name baby-tools-container baby-tools-shop

# 8️⃣ Check logs if any errors occur
docker logs baby-tools-container
```

---

## Conclusion

With this **Docker Cheatsheet**, you have all the necessary commands to **manage, debug, and deploy** your project efficiently. 🚀🔥

💡 **Copy this and keep it handy for quick reference!** 🛠️
