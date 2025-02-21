# Use a minimal Python 3 image as the base image
FROM python:3.11-alpine

# Set the working directory inside the container
WORKDIR /app

# Copy dependency file into the container
COPY requirements.txt .

# Install dependencies
RUN python -m pip install --no-cache-dir --upgrade pip && \
    python -m pip install --no-cache-dir -r requirements.txt

# Copy the entire project into the container
COPY babyshop_app /app/

# Copy entrypoint script and set permissions
COPY ./entrypoint.sh /app/entrypoint.sh
RUN chmod +x /app/entrypoint.sh

# Expose port 8025 so the application can be accessed externally
EXPOSE 8025

# Use entrypoint.sh as the startup command
ENTRYPOINT ["/app/entrypoint.sh"]
