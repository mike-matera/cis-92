# Start with the base Python container
# FIXME: Update the version
FROM docker.io/python:3.13.7

# Install packages that are required. 
RUN pip install Django==6.0.1 psutil==7.2.2

# Create a user 
RUN useradd -d /app -M django 

# Copy the Python code into the container
COPY --chown=django:django djangotutorial /app

# Set environment variables 
ENV STUDENT_NAME="Boris Jocoy"
ENV SITE_NAME="www.cis-92.com"
ENV SECRET_KEY="fixme-12345"
ENV DEBUG=1
ENV DATA_DIR="/data"
ENV PORT=8080
ENV DJANGO_SUPERUSER_NAME="test"
ENV DJANGO_SUPERUSER_EMAIL="test@test.test"
ENV DJANGO_SUPERUSER_PASSWORD="test"

# Create the data directory
RUN mkdir $DATA_DIR && chown django:django $DATA_DIR 

# Switch to the new user
USER django 

# Set the working directory
WORKDIR /app 

# Default command to execute in the container
CMD ["/bin/sh", "-c", "./start.sh"]


