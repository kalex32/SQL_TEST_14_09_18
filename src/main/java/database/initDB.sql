CREATE DATABASE IF NOT EXISTS publications;
USE publications;

CREATE TABLE `publications`.`authors`
(
  au_id  INT PRIMARY KEY AUTO_INCREMENT,
  author VARCHAR(25) NOT NULL
);

CREATE TABLE `publications`.`publishers`
(
  pub_id    INT PRIMARY KEY AUTO_INCREMENT,
  publisher VARCHAR(255) NOT NULL,
  url       VARCHAR(255)
);

CREATE TABLE `publications`.`titles`
(
  title_id INT PRIMARY KEY AUTO_INCREMENT,
  title    VARCHAR(255) NOT NULL,
  yearpub  INT,
  pub_id   INT,
  FOREIGN KEY (pub_id) REFERENCES publishers (pub_id)
);

CREATE TABLE `publications`.`wwwsites`
(
  site_id INT PRIMARY KEY AUTO_INCREMENT,
  site    VARCHAR(255) NOT NULL,
  url     VARCHAR(255)
);

CREATE TABLE `publications`.`wwwsiteauthors`
(
  au_id   INT,
  FOREIGN KEY (au_id) REFERENCES authors (au_id),
  site_id INT,
  FOREIGN KEY (site_id) REFERENCES wwwsites(site_id)
);

CREATE TABLE `publications`.`titleauthors`
(
  au_id    INT,
  FOREIGN KEY (au_id) REFERENCES authors (au_id),
  title_id INT,
  FOREIGN KEY (title_id) REFERENCES titles (title_id)
)