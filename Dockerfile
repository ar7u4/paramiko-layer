# Inside your Dockerfile
FROM public.ecr.aws/lambda/python:3.8
# Install Paramiko and other dependencies into /opt/python/
RUN pip install paramiko -t /opt/python/
WORKDIR /var/task
