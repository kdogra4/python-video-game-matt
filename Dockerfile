FROM python:3.9-slim
WORKDIR /app
COPY . /app
RUN apt-get update -y && apt-get install
RUN pip install --no-cache-dir -r req/requirements.txt
