FROM python:3.9-slim

WORKDIR /app

COPY requirements.txt .
RUN python -c "from transformers import pipeline; pipeline('text-classification')"

RUN pip install --no-cache-dir -r requirements.txt

COPY . .

CMD ["python", "app.py"]
