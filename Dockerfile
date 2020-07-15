FROM python:2.7.14-jessie

WORKDIR /zap-command-line-utitlity/

COPY zap-command-line-utitlity/ /zap-command-line-utitlity/

WORKDIR /zap-command-line-utitlity/

#RUN pip install -U pip setuptools && pip install -r /apps/requirements.txt

#EXPOSE 5050

ENTRYPOINT ["sh"]

CMD ["run-zap-scan.sh.py"]
