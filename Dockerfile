FROM python:3.9.1

WORKDIR /app

COPY . /app

RUN pip3 install -r requirements.txt

EXPOSE 8000

CMD sleep 20 && echo "Waited 20s to make sure Mysql is up" && \
    python manage.py makemigrations && python manage.py migrate && \
    gunicorn -c gunicorn_config.py mywebapp.wsgi



# Commands:
# sudo docker build -t django-backend:1.1 .
# sudo docker run -it -v $(pwd):/app:ro -d -p 7001:5000  djwebapp:1.1
