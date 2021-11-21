#!/bin/bash

mkdir tempdir
mkdir tempdir/templates
mkdir tempdir/static

cp app.py tempdir/.
cp -r templates/* tempdir/templates/.
cp -r static/* tempdir/static/.

echo "FROM python" >> tempdir/Dockerfile
echo "RUN pip install flask" >> tempdir/Dockerfile
echo "COPY  ./static /home/myapp/static/" >> tempdir/Dockerfile
echo "COPY  ./templates /home/myapp/templates/" >> tempdir/Dockerfile
echo "COPY app.py  /home/myapp/" >> tempdir/Dockerfile
echo "EXPOSE 1010" >> tempdir/Dockerfile
echo "CMD python3 /home/myapp/app.py" >> tempdir/Dockerfile

cd tempdir
docker build -t projectactivity .
docker run -t -d -p 8080:8080 --name activity projectactivity
docker ps -a