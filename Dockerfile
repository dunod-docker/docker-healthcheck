FROM centos:7

RUN yum install -y epel-release && \
    yum update -y && \
    yum install -y  python-pip python-dev curl vim && \
    yum clean all

RUN pip install -r requirements.txt

COPY . /app

WORKDIR /app

HEALTHCHECK --interval=10s --retries=2 CMD curl -f http://localhost:5000/ || exit 1

EXPOSE 5000

ENTRYPOINT [ "python" ]

CMD [ "app.py" ]
