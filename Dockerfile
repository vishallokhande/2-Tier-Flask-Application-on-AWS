FROM python:3.9-slim
WORKDIR /app

RUN apt-get update && apt-get install -y gcc default-libmysqlclient-dev pkg-config && rm -rf /var/lib/apt/lists/*

# copy only requirements for cache
COPY app/requirements.txt .

RUN python -m pip install --upgrade pip
RUN pip install --no-cache-dir -r requirements.txt

# copy app folder contents (not the whole repo)
COPY app/ .

EXPOSE 5000
CMD ["python", "app.py"]
