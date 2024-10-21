# set base image (host OS)
FROM python:3.9-alpine

# set the working directory in the container
WORKDIR /code

# copy the dependencies file to the working directory
COPY requirements.txt .

# install dependencies
RUN pip install -r requirements.txt

# copy the content of the local src directory to the working directory
COPY cors-poc.py .

# Service must listen to $PORT environment variable.
# This default value facilitates local development.
# ENV PORT=8080

# import from our app.py file
CMD ["gunicorn", "--bind", "0.0.0.0:80", "--workers", "1", "--threads", "8", "--timeout", "0", "cors-poc:app"]