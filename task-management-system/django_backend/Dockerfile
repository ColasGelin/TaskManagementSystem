FROM python:3.11-slim

WORKDIR /app

RUN apt-get update && apt-get install -y \
    libpq-dev \
    curl \
    netcat-traditional \
    && rm -rf /var/lib/apt/lists/*

COPY requirements.txt .
RUN pip install -r requirements.txt

COPY . .

# Make entrypoint executable
RUN chmod +x scripts/entrypoint.sh

EXPOSE 8000

# Use entrypoint instead of CMD
ENTRYPOINT ["sh", "./scripts/entrypoint.sh"]