FROM python:3.9.1

WORKDIR /app

COPY . /app

RUN pip3 install -r requirements.txt    

EXPOSE 8000

CMD gunicorn -c gunicorn_config.py mywebapp.wsgi



# Commands:
# sudo docker build -t djwebapp:1.1 .
# sudo docker run -it -v $(pwd):/app:ro -d -p 7001:5000  djwebapp:1.1


# Backup: Old commands when I created an all in one image (django + nginx + gunicorn)
# RUN apt update && apt install -y nginx 
# CMD service nginx start && gunicorn -c gunicorn_config.py mywebapp.wsgi
# RUN cp nginx_config /etc/nginx/sites-available/
# RUN ln -s /etc/nginx/sites-available/nginx_config /etc/nginx/sites-enabled/nginx_config
# CMD service nginx start && gunicorn -c gunicorn_config.py mywebapp.wsgi



