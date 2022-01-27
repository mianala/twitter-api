FROM python:3.8-alpine as base

RUN apk update && apk add postgresql-dev gcc musl-dev bash
RUN pip install --upgrade pip

WORKDIR /code
COPY . /code

RUN pip install -r requirements-dev.txt

EXPOSE 5000

CMD ["flask", "run", "--host", "0.0.0.0"]