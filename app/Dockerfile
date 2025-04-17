# Use an official Python runtime as a base image
FROM python:3.9-slim

# Set the working directory in the container
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY . /app

# Install the dependencies from requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Install python-dotenv to load environment variables from .env
RUN pip install python-dotenv

# Expose port 5000 for the Flask app
EXPOSE 5000

# Define environment variables to make the Flask app run in production mode
ENV FLASK_ENV=production

# Run the Flask app when the container starts
CMD ["python", "app.py"]
