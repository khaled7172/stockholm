FROM python:3.11-slim

WORKDIR /app

RUN pip install --no-cache-dir cryptography

COPY stockholm .

RUN chmod +x stockholm && mkdir -p /root/infection

ENTRYPOINT ["python3", "stockholm"]
