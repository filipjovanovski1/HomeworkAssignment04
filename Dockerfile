# Use an official Python runtime as a parent image
FROM python:3.9-slim

# Set environment variables
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

# Set working directory
WORKDIR /app

# Install dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of the application code
COPY mse_scrapper.py ./
COPY csv/ ./csv/

# Expose the Flask port
EXPOSE 5000

# Command to run the Flask app
CMD ["python", "mse_scrapper.py"]
