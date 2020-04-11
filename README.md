# Apache Sqoop Docker image

[![DockerPulls](https://img.shields.io/docker/pulls/dvoros/sqoop.svg)](https://registry.hub.docker.com/u/dvoros/sqoop/)
[![DockerStars](https://img.shields.io/docker/stars/dvoros/sqoop.svg)](https://registry.hub.docker.com/u/dvoros/sqoop/)

_Note: this is the master branch - for a particular Sqoop version always check the related branch_

## Usage

### MySQL Server 를 띄웁니다
* 아래와 같이 데이터베이스 경로 생성 후 MySQL 서버를 띄웁니다
* 수집을 위한 테스트 테이블 생성 및 데이터를 입력 합니다
```
mkdir data/mysql
docker run -d --rm --name mysql -e "MYSQL_ALLOW_EMPTY_PASSWORD=yes" -v `pwd`/data/mysql:/var/lib/mysql -it mysql
docker exec -it mysql -uroot
create database psyoblade
use psyoblade
create table users (id int, account varchar(100));
insert into users values (1, 'psyoblade');
insert into users values (2, 'leeyh0216');
insert into users values (3, 'ajg0716');
```

### Sqoop 을 통해 테이블을 수집합니다
* Sqoop 프로젝트를 빌드하고 컨테이너를 생성후 띄웁니다
```
docker build -t dvoros/sqoop-hive:2.3.3 .
docker run -v `pwd`/jars:/jdbc -it dvoros/sqoop-hive:2.3.3
```


## MySQL import example

```
MYSQL_HOST=
MYSQL_USER=
MYSQL_PASS=
MYSQL_DB=
MYSQL_TABLE=
sqoop import --connect jdbc:mysql://$MYSQL_HOST/$MYSQL_DB --table $MYSQL_TABLE --username $MYSQL_USER --password $MYSQL_PASS -m 1
```
