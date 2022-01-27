FROM python:3.8-alpine as base

RUN apk update && apk add postgresql-dev gcc musl-dev
RUN /usr/local/bin/python -m pip install --upgrade pip

WORKDIR /code
COPY . /code

RUN pip install -r requirements-dev.txt

ENV DATABASE_URL postgres://localhost/twitter_api_flask
ENV FLASK_APP wsgi.py
ENV FLASK_ENV development

EXPOSE 5000

CMD ["flask", "run", "--host", "0.0.0.0"]