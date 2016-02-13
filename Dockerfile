FROM python:3-alpine

ENV LANG C

# install requirements
RUN apk add --no-cache vsftpd
ADD requirements*.txt setup.cfg ./
RUN pip install --no-cache-dir -r requirements.txt

# install asserts
ADD assets/ /opt/resource/

# test
ADD test/ /opt/resource-tests/
RUN /opt/resource-tests/test.sh
