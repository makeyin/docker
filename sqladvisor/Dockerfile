FROM ubuntu:16.04 

# COPY ./sqladvisor/nginx-1.11.1 /tmp/nginx
# COPY ./sqladvisor/SQLAdvisor /SQLAdvisor
# COPY ./sqladvisor/percona-release_0.1-4.xenial_all.deb percona-release_0.1-4.xenial_all.deb

COPY ./nginx-1.11.1 /tmp/nginx
COPY ./SQLAdvisor /SQLAdvisor
COPY ./percona-release_0.1-4.xenial_all.deb percona-release_0.1-4.xenial_all.deb


RUN   dpkg -i percona-release_0.1-4.xenial_all.deb\
&& apt-get update -y \
&& apt-get install cmake  libaio-dev libffi-dev libglib2.0  libglib2.0-dev libperconaserverclient18.1-dev -y


WORKDIR /SQLAdvisor
RUN cmake -DBUILD_CONFIG=mysql_release -DCMAKE_BUILD_TYPE=debug -DCMAKE_INSTALL_PREFIX=/usr/local/sqlparser ./ \
&& make \
&& make install


WORKDIR /SQLAdvisor/sqladvisor
RUN echo "include_directories(\"/usr/lib/x86_64-linux-gnu/glib-2.0/include\")" >> CMakeLists.txt \
&& cmake -DCMAKE_BUILD_TYPE=debug ./ \
&& make \
&& ln -s /SQLAdvisor/sqladvisor/sqladvisor /bin/sqladvisor\
#nginx
WORKDIR /tmp/nginx/
RUN cd /tmp/nginx && ls -l && ./configure --prefix=/usr/local/nginx --user=nginx --group=nginx --with-http_stub_status_module && make && make install
RUN ln -s /usr/local/nginx/sbin/* /usr/local/sbin/
RUN useradd -M -s /sbin/nologin nginx
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]