# set base image (host OS)
FROM python:3.8

# set the working directory in the container
WORKDIR /code

# copy the dependencies file to the working directory
COPY requirements.txt .

# install dependencies
RUN pip install Flask gunicorn


# copy the content of the local src directory to the working directory
COPY src/ .

# Service must listen to $PORT environment variable.
# This default value facilitates local development.
ENV PORT 8080

CMD exec gunicorn --bind 0.0.0.0:$PORT --workers 1 --threads 8 --timeout 0 app:app # import from our app.py file


