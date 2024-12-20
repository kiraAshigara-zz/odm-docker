CREATE DATABASE omsdev CHARACTER SET latin1;
CREATE DATABASE tdms CHARACTER SET latin1;
CREATE DATABASE dms CHARACTER SET latin1;
CREATE DATABASE dna_log CHARACTER SET latin1;
CREATE USER 'omsdevuser'@'localhost' IDENTIFIED BY 'omsdevuser';
CREATE USER 'omsdevuser'@'127.0.0.1' IDENTIFIED BY 'omsdevuser';
CREATE USER 'omsdevuser'@'%' IDENTIFIED BY 'omsdevuser';
GRANT ALL PRIVILEGES ON *.* TO 'omsdevuser'@'localhost' WITH GRANT OPTION;
GRANT ALL PRIVILEGES ON *.* TO 'omsdevuser'@'127.0.0.1' WITH GRANT OPTION;
GRANT ALL PRIVILEGES ON *.* TO 'omsdevuser'@'%' WITH GRANT OPTION;
GRANT ALL PRIVILEGES ON *.* TO 'root'@'127.0.0.1';
FLUSH PRIVILEGES;
