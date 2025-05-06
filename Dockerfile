FROM python:3.9-slim

WORKDIR /app

COPY requirements.txt .

RUN pip install --no-cache-dir -r requirements.txt

RUN python -m spacy download en_core_web_sm

# Copy everything (must include the templates/ folder)
COPY . .

CMD ["python", "app.py"]
