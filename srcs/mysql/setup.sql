GRANT ALL PRIVILEGES ON *.* TO 'wordpress'@'localhost' IDENTIFIED BY '123';
CREATE DATABASE wp;
USE wp;
CREATE TABLE example ( id smallint unsigned not null auto_increment, name varchar(20) not null, constraint pk_example primary key (id) );
INSERT INTO example ( id, name ) VALUES ( 1, 'Sample data' );
