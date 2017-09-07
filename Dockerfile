FROM node:8

RUN npm install -g scrapbox-converter@1.0.1

WORKDIR /app

ENTRYPOINT ["scrapbox-converter"]
CMD ["--help"]
