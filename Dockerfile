FROM python:3.9-slim

WORKDIR /app

COPY requirements.txt .

# First install dependencies

RUN pip install --no-cache-dir -r requirements.txt
# Install spaCy model
RUN python -m spacy download en_core_web_md

# Pre-download Hugging Face models
RUN python -c "from sentence_transformers import SentenceTransformer; SentenceTransformer('paraphrase-MiniLM-L6-v2')"
RUN python -c "from PIL import Image; import requests; from transformers import CLIPProcessor, CLIPModel; CLIPProcessor.from_pretrained('openai/clip-vit-base-patch32'); CLIPModel.from_pretrained('openai/clip-vit-base-patch32')"


# Then download the spaCy model

#RUN python -m spacy download en\_core\_web\_sm

COPY . .

CMD ["python", "app.py"]
