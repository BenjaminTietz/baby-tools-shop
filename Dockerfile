# Use a minimal Python 3 image as the base image
FROM python:3.11-alpine

# Set the working directory inside the container
WORKDIR /baby-tools-shop/babyshop_app/

# Copy dependency file into the container
COPY babyshop_app/requirements.txt ./

# Install dependencies
RUN python -m pip install --upgrade pip
RUN python -m pip install -r requirements.txt

# Copy the entire project into the container
COPY . /baby-tools-shop/

# Apply database migrations
RUN python manage.py makemigrations && python manage.py migrate

# Collect static files for production
RUN python manage.py collectstatic --noinput

# Expose port 8025 so the application can be accessed externally
EXPOSE 8025




