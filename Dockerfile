FROM python:3.9-slim

WORKDIR /app

COPY requirements.txt .

# First install dependencies

RUN pip install --no-cache-dir -r requirements.txt

# Then download the spaCy model

RUN python -m spacy download en\_core\_web\_sm

COPY . .

CMD ["python", "app.py"]
