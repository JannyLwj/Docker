
FROM centos:7
MAINTAINER JANNY

RUN yum -y update;yum clean all
RUN yum install -y httpd
RUN yum install -y openssh-server
RUN yum install -y mod_wsgi
#RUN pip install djangorestframework
RUN mkdir /var/www/html/restmanage-tool
#RUN mkdir /var/www/html/restmanage-tool/testmanage
#RUN mkdir /var/www/html/restmanage-tool/log
#RUN mkdir /var/www/html/restmanage-tool/audio
#RUN chmod -R 777 /var/www/html/restmanage-tool
#RUN chmod -R 777 /var/www/html/testmanage-tool/log
#RUN chmod -R 777 /var/www/html/testmanage-tool/audio
WORKDIR /var/www/html/restmanage-tool
copy restmanagement /var/www/html/restmanage-tool/restmanagement
copy httpd.conf /etc/httpd/conf/
RUN yum install -y wget
RUN wget https://bootstrap.pypa.io/get-pip.py
#opy get-pip.py /var/www/html/restmanage-tool
RUN python get-pip.py
RUN pip install django
RUN yum install -y gcc
RUN yum install -y python-devel
RUN yum install -y mysql-devel
RUN yum install -y openssl-devel
RUN yum install -y zlib-devel
RUN pip install MySQL-python
RUN pip install djangorestframework
RUN pip install XlsxWriter
RUN pip install xlrd
RUN pip install xlwt
RUN pip install xlutils
RUN /sbin/httpd
ADD run.sh /usr/local/sbin/run.sh
RUN chmod 755 /usr/local/sbin/run.sh
EXPOSE 22 80 8000
CMD ["/usr/local/sbin/run.sh"]
#CMD ["python", "/var/www/html/restmanage-tool/restmanagement/manage.py", "runserver"]
