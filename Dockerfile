# FROM alpine:latest

# RUN apk add py3-pip && \ 
#     apk update && \
#     apk add python3-dev 
# RUN apk add default-libmysqlclient-dev && \
#     apk add build-essential

FROM ubuntu:latest

RUN apt update && \
    apt install -y python3-pip && \ 
    apt install -y python3-dev default-libmysqlclient-dev build-essential

WORKDIR /app

COPY . /app

RUN pip3 install -r requirements.txt                                                                        

# EXPOSE 5000

ENTRYPOINT  ["python3"]

CMD ["manage.py runserver 0:8000"]