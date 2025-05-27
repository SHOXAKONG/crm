FROM python:3.11-slim
LABEL authors="shohruh"

WORKDIR /app

RUN apt-get update \
    && apt-get install -y build-essential libpq-dev gcc \
    && apt-get clean

COPY . /app

# 🔧 Add this line
RUN chmod +x /app/entrypoint.sh

RUN pip install --upgrade pip && pip install -r requirements.txt

EXPOSE 8000

CMD ["gunicorn", "djcrm.wsgi:application", "--bind", "0.0.0.0:8000"]
