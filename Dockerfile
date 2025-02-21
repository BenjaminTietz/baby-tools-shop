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

# Collect static files for production
RUN python manage.py collectstatic --noinput

# Expose port 8025 so the application can be accessed externally
EXPOSE 8025

# This is the command that will be executed on container launch
ENTRYPOINT ["python", "manage.py", "runserver", "0.0.0.0:8025"]


