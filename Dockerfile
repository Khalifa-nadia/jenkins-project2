FROM python:3.9-slim

WORKDIR /app

COPY myapp/requirements.txt .
RUN pip install -r requirements.txt

COPY myapp/ .

CMD ["python", "app.py"]