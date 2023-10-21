# Use an official Python runtime as a parent image
FROM python:latest

# Set the working directory in the container
WORKDIR /app

# Copy the requirements file into the container at /app
COPY requirements.txt /app/

# Install any needed packages specified in requirements.txt
RUN pip install -r requirements.txt
RUN pip install gunicorn
# Copy the rest of your application code to the container
COPY . /app

# Make port 8000 available to the world outside this container
EXPOSE 8000

# Define the command to run your application with Gunicorn
CMD ["gunicorn", "--bind", "0.0.0.0:8000", "application:app"]
