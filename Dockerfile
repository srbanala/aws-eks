# Specify base image 

FROM ubuntu:latest

# Install dependenies for application

RUN mkdir ./usr/dev
WORKDIR  ./usr/dev

RUN  apt-get update &&  apt-get -y upgrade \
 &&  echo Y|apt-get install python3 \
 &&  apt-get install  -y python3-pip

RUN pip3 install virtualenv &&  virtualenv myenv \
 &&  chmod 755 ./myenv/bin/activate \
 && $source ./myenv/bin/activate

#RUN pip install django

RUN  apt-get install -y libpq-dev &&   pip install psycopg2

#WORKDIR ./django-polls/dist

COPY ./mysite  ./
COPY ./django-polls-0.1.tar.gz ./

RUN python3 -m pip install --user ./django-polls-0.1.tar.gz  && rm django-polls-0.1.tar.gz

EXPOSE 8080
# Run Default Command.

CMD ["python3","./mysite/manage.py","runserver","0:8080"]


