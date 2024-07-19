# Step 1: Use an official Python runtime as a parent image
FROM python:3.9-slim

# Step 2: Set environment variables
ENV FLASK_APP=app.py
ENV FLASK_RUN_HOST=0.0.0.0
ENV FLASK_ENV=production

# Step 3: Set the working directory in the container
WORKDIR /app

# Step 4: Copy the requirements file into the container at /app
COPY requirements.txt /app/

# Step 5: Install any needed packages specified in requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Step 6: Copy the rest of the application code into the container at /app
COPY . /app/

# Step 7: Expose port 5000 for the Flask application
EXPOSE 5000

# Step 8: Run the Flask application
CMD ["flask", "run"]

