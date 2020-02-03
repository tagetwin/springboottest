# Springboot-MyBatis-MySQL
## 1. MySQL 세팅
```sql
create database spring;
create user spring@'%' identified by 'bitc5600';
grant all privileges on spring.* to 'spring'@'%';

CREATE TABLE mem (
	id int AUTO_INCREMENT PRIMARY KEY,
    username varchar(100) UNIQUE not null,
    password varchar(100) not null,
    email varchar(100), 
    createDate timestamp
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
```

## 2.JSTL 태그 라이브러리
```jsp
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
```