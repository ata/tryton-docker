FROM python:3.7-slim
RUN apt-get update && \
    apt-get install wait-for-it && \
    rm -rf /var/cache/apt
WORKDIR /app
COPY requirements.txt requirements.txt
RUN pip install --no-cache-dir -r requirements.txt
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
EXPOSE 8000
CMD ["trytond"]
