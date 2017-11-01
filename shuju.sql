/*
SQLyog 企业版 - MySQL GUI v7.14 
MySQL - 5.6.23-log : Database - demo
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

CREATE DATABASE /*!32312 IF NOT EXISTS*/`demo` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `demo`;

/*Table structure for table `auth_group` */

DROP TABLE IF EXISTS `auth_group`;

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `auth_group` */

/*Table structure for table `auth_group_permissions` */

DROP TABLE IF EXISTS `auth_group_permissions`;

CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `auth_group_permissions` */

/*Table structure for table `auth_permission` */

DROP TABLE IF EXISTS `auth_permission`;

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

/*Data for the table `auth_permission` */

insert  into `auth_permission`(`id`,`name`,`content_type_id`,`codename`) values (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can add permission',2,'add_permission'),(5,'Can change permission',2,'change_permission'),(6,'Can delete permission',2,'delete_permission'),(7,'Can add group',3,'add_group'),(8,'Can change group',3,'change_group'),(9,'Can delete group',3,'delete_group'),(10,'Can add user',4,'add_user'),(11,'Can change user',4,'change_user'),(12,'Can delete user',4,'delete_user'),(13,'Can add content type',5,'add_contenttype'),(14,'Can change content type',5,'change_contenttype'),(15,'Can delete content type',5,'delete_contenttype'),(16,'Can add session',6,'add_session'),(17,'Can change session',6,'change_session'),(18,'Can delete session',6,'delete_session');

/*Table structure for table `auth_user` */

DROP TABLE IF EXISTS `auth_user`;

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `auth_user` */

/*Table structure for table `auth_user_groups` */

DROP TABLE IF EXISTS `auth_user_groups`;

CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `auth_user_groups` */

/*Table structure for table `auth_user_user_permissions` */

DROP TABLE IF EXISTS `auth_user_user_permissions`;

CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `auth_user_user_permissions` */

/*Table structure for table `django_admin_log` */

DROP TABLE IF EXISTS `django_admin_log`;

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `django_admin_log` */

/*Table structure for table `django_content_type` */

DROP TABLE IF EXISTS `django_content_type`;

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

/*Data for the table `django_content_type` */

insert  into `django_content_type`(`id`,`app_label`,`model`) values (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(6,'sessions','session');

/*Table structure for table `django_migrations` */

DROP TABLE IF EXISTS `django_migrations`;

CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

/*Data for the table `django_migrations` */

insert  into `django_migrations`(`id`,`app`,`name`,`applied`) values (1,'contenttypes','0001_initial','2017-08-14 16:08:06.882275'),(2,'auth','0001_initial','2017-08-14 16:08:22.335019'),(3,'admin','0001_initial','2017-08-14 16:08:24.137442'),(4,'admin','0002_logentry_remove_auto_add','2017-08-14 16:08:24.331560'),(5,'contenttypes','0002_remove_content_type_name','2017-08-14 16:08:26.771734'),(6,'auth','0002_alter_permission_name_max_length','2017-08-14 16:08:28.529596'),(7,'auth','0003_alter_user_email_max_length','2017-08-14 16:08:29.268720'),(8,'auth','0004_alter_user_username_opts','2017-08-14 16:08:29.298586'),(9,'auth','0005_alter_user_last_login_null','2017-08-14 16:08:30.739196'),(10,'auth','0006_require_contenttypes_0002','2017-08-14 16:08:30.746142'),(11,'auth','0007_alter_validators_add_error_messages','2017-08-14 16:08:30.774689'),(12,'auth','0008_alter_user_username_max_length','2017-08-14 16:08:30.824968'),(13,'sessions','0001_initial','2017-08-14 16:08:35.030360');

/*Table structure for table `django_session` */

DROP TABLE IF EXISTS `django_session`;

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `django_session` */

insert  into `django_session`(`session_key`,`session_data`,`expire_date`) values ('1aezuliird85s8ytoladgdrdq4ntpxod','YWVhYjI5YTU1OTJhMWMwMTZkOWNkOGYyYjIzYjIxZTdjMjRjNjU2Yjp7InNob3BsaXN0Ijp7fX0=','2017-09-01 18:43:40.625609'),('3t8mq5uu68yt9xtnj16ewy0430dvgy2r','NzRlODk2MTc0ZTg4MzU5OWVhNTQ5MWE1YzA2MmNhYTg5NzhiYzEyMzp7InZlcmlmeWNvZGUiOiJMN0g4IiwiYWRtaW51c2VyIjoiXHU3YmExXHU3NDA2XHU1NDU4In0=','2017-08-30 02:27:17.687040'),('6iffsps09rpmp7xe0d993gov6kjf79pw','ZjljYzgyZDI1OWQ2MDgxZDY3ZWQwMzY4NjQ4ZjFmOTY0YmRlYWUxMjp7InNob3BsaXN0Ijp7IjE0Ijp7ImlkIjoxNCwiZ29vZHMiOiJcdTUzNGVcdTc4NTUiLCJwaWNuYW1lIjoiMTUwMjk2OTg3Mi4yNjE4MzQxLmpwZyIsInByaWNlIjoxMDAuMCwic3RvcmUiOjEwMDAsIm0iOjF9LCIyMSI6eyJpZCI6MjEsImdvb2RzIjoiXHU1OTI3XHU4MmNmXHU2MjUzIiwicGljbmFtZSI6IjE1MDI5NzIzODMuMzAxNTkyNi5qcGciLCJwcmljZSI6MTAwLjAsInN0b3JlIjoxMDAwMCwibSI6NDd9fSwib3JkZXJsaXN0Ijp7IjIxIjp7ImlkIjoyMSwiZ29vZHMiOiJcdTU5MjdcdTgyY2ZcdTYyNTMiLCJwaWNuYW1lIjoiMTUwMjk3MjM4My4zMDE1OTI2LmpwZyIsInByaWNlIjoxMDAuMCwic3RvcmUiOjEwMDAwLCJtIjo0N319LCJ0b3RhbCI6NDcwMC4wLCJ2ZXJpZnljb2RlIjoiNDE0OSIsImFkbWludXNlciI6eyJpZCI6NCwibmFtZSI6Ilx1N2JhMVx1NzQwNlx1NTQ1OCJ9fQ==','2017-09-01 10:21:50.604203'),('b2n35e91q2ucih6f7u29u1gmy3mbs1gh','ZDg1ZmYwYzZkNzljNTAzYmMxMDU2NTg1MTJjZWU2NGYwYjg5YTk2ZTp7InZlcmlmeWNvZGUiOiJLMDlQIiwiYWRtaW51c2VyIjoiXHU3YmExXHU3NDA2XHU1NDU4Iiwic2hvcGxpc3QiOnsiMTciOnsiaWQiOjE3LCJnb29kcyI6Ilx1ODg2M1x1NjcwZCIsInBpY25hbWUiOiIxNTAyOTcyMTM0LjYxOTg4OTMuanBnIiwicHJpY2UiOjIwMDAuMCwic3RvcmUiOjIwMDAsIm0iOjF9LCIxOCI6eyJpZCI6MTgsImdvb2RzIjoiXHU3ZjhlXHU3NzA5IiwicGljbmFtZSI6IjE1MDI5NzIxNzMuODUxNTYxOC5qcGciLCJwcmljZSI6MTUwMC4wLCJzdG9yZSI6MjAwMCwibSI6OH19LCJ2aXB1c2VyIjp7ImlkIjoxMywidXNlcm5hbWUiOiJodWl5dWFuMiIsIm5hbWUiOiJcdTUzYzhcdTY2MmZcdTRmMWFcdTU0NTgiLCJhZGRyZXNzIjoiXHU2Y2IzXHU1MzE3IiwicGhvbmUiOiIwMDAwMDAwIiwiY29kZSI6IjAwMDAwMCJ9LCJvcmRlcmxpc3QiOnsiMTgiOnsiaWQiOjE4LCJnb29kcyI6Ilx1N2Y4ZVx1NzcwOSIsInBpY25hbWUiOiIxNTAyOTcyMTczLjg1MTU2MTguanBnIiwicHJpY2UiOjE1MDAuMCwic3RvcmUiOjIwMDAsIm0iOjF9fSwidG90YWwiOjE1MDAuMH0=','2017-09-02 04:31:15.825699'),('bgucrq3c7845m5hr4unt8g4ofzwi50oy','NTk0MGI3MTk4YzY5NWQ2NTM5OTA1MjQ0YTZmN2M2MGJmMzUyNzdlODp7InZlcmlmeWNvZGUiOiJMVkE3IiwiYWRtaW51c2VyIjoiXHU3YmExXHU3NDA2XHU1NDU4In0=','2017-08-31 11:20:42.877044'),('di082pob22zaza70adf7uy8nttu9bgsl','YWVhYjI5YTU1OTJhMWMwMTZkOWNkOGYyYjIzYjIxZTdjMjRjNjU2Yjp7InNob3BsaXN0Ijp7fX0=','2017-09-02 04:33:04.918116'),('eoe1dhnka4u4yc655tc9q2opqyu940un','MWQwOTBkMWE3YTQ0ZTIxYWNjOWM4ZTBiYzkzMjg3NjRiYmZkYTk2ODp7InNob3BsaXN0Ijp7IjEzIjp7ImlkIjoxMywiZ29vZHMiOiJcdTU0MGFcdTVlMjZcdTg4ZDkiLCJwaWNuYW1lIjoiMTUwMjk2OTI3Mi4zMjcwMTg3LmpwZyIsInByaWNlIjoxMDAwLjAsInN0b3JlIjoxMDAwLCJtIjoyfSwiMTUiOnsiaWQiOjE1LCJnb29kcyI6Ilx1NWMwZlx1NTQwYVx1NWUyNiIsInBpY25hbWUiOiIxNTAyOTcwODE2LjI0MTg2NS5qcGciLCJwcmljZSI6MTAwLjAsInN0b3JlIjoxMDAwMCwibSI6MX0sIjIwIjp7ImlkIjoyMCwiZ29vZHMiOiJcdTdmOGVcdTRlM2QiLCJwaWNuYW1lIjoiMTUwMjk3MjI0OC4xNTQwNTU4LmpwZyIsInByaWNlIjo1MDAwLjAsInN0b3JlIjoyMDAsIm0iOjF9LCIyMiI6eyJpZCI6MjIsImdvb2RzIjoiXHU1OTFhXHU4NDI4XHU4ZmJlIiwicGljbmFtZSI6IjE1MDI5NzI0MDIuNDg1MzgyLmpwZyIsInByaWNlIjoxMDAwLjAsInN0b3JlIjoxMDAwLCJtIjoxfX0sIm9yZGVybGlzdCI6eyIxMyI6eyJpZCI6MTMsImdvb2RzIjoiXHU1NDBhXHU1ZTI2XHU4OGQ5IiwicGljbmFtZSI6IjE1MDI5NjkyNzIuMzI3MDE4Ny5qcGciLCJwcmljZSI6MTAwMC4wLCJzdG9yZSI6MTAwMCwibSI6Mn0sIjE1Ijp7ImlkIjoxNSwiZ29vZHMiOiJcdTVjMGZcdTU0MGFcdTVlMjYiLCJwaWNuYW1lIjoiMTUwMjk3MDgxNi4yNDE4NjUuanBnIiwicHJpY2UiOjEwMC4wLCJzdG9yZSI6MTAwMDAsIm0iOjF9LCIyMCI6eyJpZCI6MjAsImdvb2RzIjoiXHU3ZjhlXHU0ZTNkIiwicGljbmFtZSI6IjE1MDI5NzIyNDguMTU0MDU1OC5qcGciLCJwcmljZSI6NTAwMC4wLCJzdG9yZSI6MjAwLCJtIjoxfX0sInRvdGFsIjo3MTAwLjAsInZlcmlmeWNvZGUiOiIxMzNVIiwiYWRtaW51c2VyIjoiXHU3YmExXHU3NDA2XHU1NDU4IiwidmlwdXNlciI6eyJpZCI6NywidXNlcm5hbWUiOiJodWl5dWFuIiwibmFtZSI6Ilx1NGYxYVx1NTQ1OCIsImFkZHJlc3MiOiJcdTZjYjNcdTUzNTciLCJwaG9uZSI6IjEwMDAwMCIsImNvZGUiOiIxMDAwMCJ9fQ==','2017-09-02 12:33:12.212783'),('falkr68nsh6nf1adsw1jlo5edkcaesjs','ZTNmMThkMjI1NzIwYTkwNzRmYzE4ZGRlYTcwMDdlYzMzZDU0ZGI4ZTp7InNob3BsaXN0Ijp7IjE4Ijp7ImlkIjoxOCwiZ29vZHMiOiJcdTdmOGVcdTc3MDkiLCJwaWNuYW1lIjoiMTUwMjk3MjE3My44NTE1NjE4LmpwZyIsInByaWNlIjoxNTAwLjAsInN0b3JlIjoyMDAwLCJtIjoxfX19','2017-09-01 18:40:42.760469'),('gheqr0tteoedohqv2qxcgkauz884jley','NGE4NWU2ZmE5MzQzMjk2NTJjYmYyMmIyZjlkY2RiYjFmODQ5OTBiZjp7InNob3BsaXN0Ijp7IjEzIjp7ImlkIjoxMywiZ29vZHMiOiJcdTU0MGFcdTVlMjZcdTg4ZDkiLCJwaWNuYW1lIjoiMTUwMjk2OTI3Mi4zMjcwMTg3LmpwZyIsInByaWNlIjoxMDAwLjAsInN0b3JlIjoxMDAwLCJtIjoxfX0sInZpcHVzZXIiOnsiaWQiOjcsInVzZXJuYW1lIjoiaHVpeXVhbiIsIm5hbWUiOiJcdTRmMWFcdTU0NTgiLCJhZGRyZXNzIjoiXHU2Y2IzXHU1MzU3IiwicGhvbmUiOiIxMDAwMDAiLCJjb2RlIjoiMTAwMDAifSwib3JkZXJsaXN0Ijp7IjEzIjp7ImlkIjoxMywiZ29vZHMiOiJcdTU0MGFcdTVlMjZcdTg4ZDkiLCJwaWNuYW1lIjoiMTUwMjk2OTI3Mi4zMjcwMTg3LmpwZyIsInByaWNlIjoxMDAwLjAsInN0b3JlIjoxMDAwLCJtIjoxfX0sInRvdGFsIjoxMDAwLjB9','2017-09-01 18:39:40.642935'),('gkruoijx5z39rjufu9cz4wzh5wpvmqqx','ZmFmNzkxMjNhNzllMmNlZDdmZDY5NjE0YjliMTA4ZWE4OTVhMjU0Mjp7ImFkbWludXNlciI6Ilx1N2JhMVx1NzQwNlx1NTQ1OCIsInZlcmlmeWNvZGUiOiJFVldIIn0=','2017-08-30 02:58:03.120325'),('hkewwv11k9fh9rkg3jh9l4ze3qzkx9hk','OTg3ZmFjOWY4MTgwMDU0MTI2NjUwYTU1MTI0Njk4MjRmYzdiMmUyMzp7InNob3BsaXN0Ijp7IjEzIjp7ImlkIjoxMywiZ29vZHMiOiJcdTU0MGFcdTVlMjZcdTg4ZDkiLCJwaWNuYW1lIjoiMTUwMjk2OTI3Mi4zMjcwMTg3LmpwZyIsInByaWNlIjoxMDAwLjAsInN0b3JlIjoxMDAwLCJtIjoxfX0sInZpcHVzZXIiOnsiaWQiOjcsInVzZXJuYW1lIjoiaHVpeXVhbiIsIm5hbWUiOiJcdTRmMWFcdTU0NTgiLCJhZGRyZXNzIjoiXHU2Y2IzXHU1MzU3IiwicGhvbmUiOiIxMDAwMDAiLCJjb2RlIjoiMTAwMDAifX0=','2017-09-01 18:43:15.334342'),('ktunwa5qdvmjngwu7kil90xivdp9huyt','NDVjMzQ3OGU1ZTcxOGYyMGJlNDIwMTU0OWEyN2NiY2VjMTcxYTYyZDp7InZlcmlmeWNvZGUiOiJOOTgzIiwiYWRtaW51c2VyIjoiXHU3YmExXHU3NDA2XHU1NDU4Iiwic2hvcGxpc3QiOnsiMTAiOnsiaWQiOjEwLCJnb29kcyI6Ilx1N2IxNFx1OGJiMFx1NjcyY1x1NzUzNVx1ODExMSIsInBpY25hbWUiOiIxNTAyOTI0Nzc3LjMyMTU5NjYuanBnIiwicHJpY2UiOjY1MDAuMCwic3RvcmUiOjEyMDAsIm0iOjJ9LCIxOCI6eyJpZCI6MTgsImdvb2RzIjoiXHU3ZjhlXHU3NzA5IiwicGljbmFtZSI6IjE1MDI5NzIxNzMuODUxNTYxOC5qcGciLCJwcmljZSI6MTUwMC4wLCJzdG9yZSI6MjAwMCwibSI6Nn0sIjE3Ijp7ImlkIjoxNywiZ29vZHMiOiJcdTg4NjNcdTY3MGQiLCJwaWNuYW1lIjoiMTUwMjk3MjEzNC42MTk4ODkzLmpwZyIsInByaWNlIjoyMDAwLjAsInN0b3JlIjoyMDAwLCJtIjo1fSwiMTMiOnsiaWQiOjEzLCJnb29kcyI6Ilx1NTQwYVx1NWUyNlx1ODhkOSIsInBpY25hbWUiOiIxNTAyOTY5MjcyLjMyNzAxODcuanBnIiwicHJpY2UiOjEwMDAuMCwic3RvcmUiOjEwMDAsIm0iOjR9LCIxNCI6eyJpZCI6MTQsImdvb2RzIjoiXHU1MzRlXHU3ODU1IiwicGljbmFtZSI6IjE1MDI5Njk4NzIuMjYxODM0MS5qcGciLCJwcmljZSI6MTAwLjAsInN0b3JlIjoxMDAwLCJtIjoxfSwiMTYiOnsiaWQiOjE2LCJnb29kcyI6Ilx1NGUwYVx1ODg2MyIsInBpY25hbWUiOiIxNTAyOTcyMDk1Ljk0NjUxOS5qcGciLCJwcmljZSI6MTAwMC4wLCJzdG9yZSI6MTAwMDAsIm0iOjF9fSwib3JkZXJsaXN0Ijp7IjE0Ijp7ImlkIjoxNCwiZ29vZHMiOiJcdTUzNGVcdTc4NTUiLCJwaWNuYW1lIjoiMTUwMjk2OTg3Mi4yNjE4MzQxLmpwZyIsInByaWNlIjoxMDAuMCwic3RvcmUiOjEwMDAsIm0iOjF9LCIxNiI6eyJpZCI6MTYsImdvb2RzIjoiXHU0ZTBhXHU4ODYzIiwicGljbmFtZSI6IjE1MDI5NzIwOTUuOTQ2NTE5LmpwZyIsInByaWNlIjoxMDAwLjAsInN0b3JlIjoxMDAwMCwibSI6MX19LCJ0b3RhbCI6MTEwMC4wLCJ2aXB1c2VyIjp7ImlkIjo3LCJ1c2VybmFtZSI6Imh1aXl1YW4iLCJuYW1lIjoiXHU0ZjFhXHU1NDU4IiwiYWRkcmVzcyI6Ilx1NmNiM1x1NTM1NyIsInBob25lIjoiMTAwMDAwIiwiY29kZSI6IjEwMDAwIn19','2017-09-03 01:12:56.313598'),('o60ojajv04sahssx4sejw85456mst7bz','NWIwZjEwY2RlMzQ1Y2I2MDA1ZWY4MmE3YzZkNGQyNmJmNDhjNjFiZTp7InZlcmlmeWNvZGUiOiJMS0lPIiwiYWRtaW51c2VyIjoiXHU3YmExXHU3NDA2XHU1NDU4Iiwic2hvcGxpc3QiOnsiMTMiOnsiaWQiOjEzLCJnb29kcyI6Ilx1NTQwYVx1NWUyNlx1ODhkOSIsInBpY25hbWUiOiIxNTAyOTY5MjcyLjMyNzAxODcuanBnIiwicHJpY2UiOjEwMDAuMCwic3RvcmUiOjEwMDAsIm0iOjF9LCIxNCI6eyJpZCI6MTQsImdvb2RzIjoiXHU1MzRlXHU3ODU1IiwicGljbmFtZSI6IjE1MDI5Njk4NzIuMjYxODM0MS5qcGciLCJwcmljZSI6MTAwLjAsInN0b3JlIjoxMDAwLCJtIjoxfX0sIm9yZGVybGlzdCI6eyIxMyI6eyJpZCI6MTMsImdvb2RzIjoiXHU1NDBhXHU1ZTI2XHU4OGQ5IiwicGljbmFtZSI6IjE1MDI5NjkyNzIuMzI3MDE4Ny5qcGciLCJwcmljZSI6MTAwMC4wLCJzdG9yZSI6MTAwMCwibSI6MX0sIjE0Ijp7ImlkIjoxNCwiZ29vZHMiOiJcdTUzNGVcdTc4NTUiLCJwaWNuYW1lIjoiMTUwMjk2OTg3Mi4yNjE4MzQxLmpwZyIsInByaWNlIjoxMDAuMCwic3RvcmUiOjEwMDAsIm0iOjF9fSwidG90YWwiOjExMDAuMH0=','2017-09-02 22:09:32.430327'),('s8lyw0ya7li3mdhkhb1ivfbdhn1l8j99','ZWY4ZGUwMTM0YjAwMmVmZGI4YmY5MWFlMDQxNTI1YWQwNGExY2NhODp7InNob3BsaXN0Ijp7IjE3Ijp7ImlkIjoxNywiZ29vZHMiOiJcdTg4NjNcdTY3MGQiLCJwaWNuYW1lIjoiMTUwMjk3MjEzNC42MTk4ODkzLmpwZyIsInByaWNlIjoyMDAwLjAsInN0b3JlIjoyMDAwLCJtIjo3fX0sInZlcmlmeWNvZGUiOiJDNkZNIiwiYWRtaW51c2VyIjoiXHU3YmExXHU3NDA2XHU1NDU4In0=','2017-09-02 04:52:07.619311'),('szw07n05sexi9igo97ddoj4jm7nwhz9g','YmQ0NzcxMGQwNzQ0OTY3YWYyMmQzYTgwMzIxMjY2NjBjZmVlOTljODp7InNob3BsaXN0Ijp7IjEzIjp7ImlkIjoxMywiZ29vZHMiOiJcdTU0MGFcdTVlMjZcdTg4ZDkiLCJwaWNuYW1lIjoiMTUwMjk2OTI3Mi4zMjcwMTg3LmpwZyIsInByaWNlIjoxMDAwLjAsInN0b3JlIjoxMDAwLCJtIjoxN30sIjIwIjp7ImlkIjoyMCwiZ29vZHMiOiJcdTdmOGVcdTRlM2QiLCJwaWNuYW1lIjoiMTUwMjk3MjI0OC4xNTQwNTU4LmpwZyIsInByaWNlIjo1MDAwLjAsInN0b3JlIjoyMDAsIm0iOjJ9LCIxNCI6eyJpZCI6MTQsImdvb2RzIjoiXHU1MzRlXHU3ODU1IiwicGljbmFtZSI6IjE1MDI5Njk4NzIuMjYxODM0MS5qcGciLCJwcmljZSI6MTAwLjAsInN0b3JlIjoxMDAwLCJtIjo0fSwiMTgiOnsiaWQiOjE4LCJnb29kcyI6Ilx1N2Y4ZVx1NzcwOSIsInBpY25hbWUiOiIxNTAyOTcyMTczLjg1MTU2MTguanBnIiwicHJpY2UiOjE1MDAuMCwic3RvcmUiOjIwMDAsIm0iOjEwMH19LCJvcmRlcmxpc3QiOnsiMTgiOnsiaWQiOjE4LCJnb29kcyI6Ilx1N2Y4ZVx1NzcwOSIsInBpY25hbWUiOiIxNTAyOTcyMTczLjg1MTU2MTguanBnIiwicHJpY2UiOjE1MDAuMCwic3RvcmUiOjIwMDAsIm0iOjEwMH19LCJ0b3RhbCI6MTUwMDAwLjAsImFkbWludXNlciI6Ilx1NGYxYVx1NTQ1OCIsInZpcHVzZXIiOnsiaWQiOjcsInVzZXJuYW1lIjoiaHVpeXVhbiIsIm5hbWUiOiJcdTRmMWFcdTU0NTgiLCJhZGRyZXNzIjoiXHU2Y2IzXHU1MzU3IiwicGhvbmUiOiIxMDAwMDAiLCJjb2RlIjoiMTAwMDAifX0=','2017-09-01 18:28:46.985634'),('ums600t1rw1xmqg5ir61ecv1t329gca7','MzMyODE3YWUyODUxYzA1MTlkMTQ3ZmJmNGUwNzVhZmZlYWU0OGFmMzp7InNob3BsaXN0Ijp7IjE5Ijp7ImlkIjoxOSwiZ29vZHMiOiJcdTdjODlcdTgyNzIiLCJwaWNuYW1lIjoiMTUwMjk3MjIxMC43MjkwNzY0LmpwZyIsInByaWNlIjoxMjAwLjAsInN0b3JlIjoyMDAwMCwibSI6MX0sIjE3Ijp7ImlkIjoxNywiZ29vZHMiOiJcdTg4NjNcdTY3MGQiLCJwaWNuYW1lIjoiMTUwMjk3MjEzNC42MTk4ODkzLmpwZyIsInByaWNlIjoyMDAwLjAsInN0b3JlIjoyMDAwLCJtIjoxfX0sIm9yZGVybGlzdCI6eyIxNyI6eyJpZCI6MTcsImdvb2RzIjoiXHU4ODYzXHU2NzBkIiwicGljbmFtZSI6IjE1MDI5NzIxMzQuNjE5ODg5My5qcGciLCJwcmljZSI6MjAwMC4wLCJzdG9yZSI6MjAwMCwibSI6MX19LCJ0b3RhbCI6MjAwMC4wLCJ2aXB1c2VyIjp7ImlkIjo3LCJ1c2VybmFtZSI6Imh1aXl1YW4iLCJuYW1lIjoiXHU0ZjFhXHU1NDU4IiwiYWRkcmVzcyI6Ilx1NmNiM1x1NTM1NyIsInBob25lIjoiMTAwMDAwIiwiY29kZSI6IjEwMDAwIn0sInZlcmlmeWNvZGUiOiJLQks2IiwiYWRtaW51c2VyIjoiXHU3YmExXHU3NDA2XHU1NDU4In0=','2017-09-02 00:27:13.592014');

/*Table structure for table `myweb_detail` */

DROP TABLE IF EXISTS `myweb_detail`;

CREATE TABLE `myweb_detail` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `orderid` int(11) unsigned DEFAULT NULL,
  `goodsid` int(11) unsigned DEFAULT NULL,
  `name` varchar(32) DEFAULT NULL,
  `price` double(6,2) DEFAULT NULL,
  `num` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=110 DEFAULT CHARSET=utf8;

/*Data for the table `myweb_detail` */

insert  into `myweb_detail`(`id`,`orderid`,`goodsid`,`name`,`price`,`num`) values (1,1,10,'笔记本电脑',6500.00,2),(2,2,13,'吊带裙',1000.00,9),(3,2,20,'美丽',5000.00,2),(4,2,14,'华硕',100.00,3),(5,3,13,'吊带裙',1000.00,10),(6,3,20,'美丽',5000.00,2),(7,3,14,'华硕',100.00,3),(8,4,13,'吊带裙',1000.00,10),(9,4,20,'美丽',5000.00,2),(10,4,14,'华硕',100.00,3),(11,5,13,'吊带裙',1000.00,10),(12,5,20,'美丽',5000.00,2),(13,5,14,'华硕',100.00,3),(14,6,13,'吊带裙',1000.00,10),(15,6,20,'美丽',5000.00,2),(16,6,14,'华硕',100.00,3),(17,7,20,'美丽',5000.00,2),(18,7,14,'华硕',100.00,3),(19,8,20,'美丽',5000.00,2),(20,8,14,'华硕',100.00,3),(21,9,20,'美丽',5000.00,2),(22,9,14,'华硕',100.00,3),(23,10,20,'美丽',5000.00,2),(24,10,14,'华硕',100.00,3),(25,11,20,'美丽',5000.00,2),(26,11,14,'华硕',100.00,3),(27,12,20,'美丽',5000.00,2),(28,12,14,'华硕',100.00,3),(29,13,20,'美丽',5000.00,2),(30,14,20,'美丽',5000.00,2),(31,15,20,'美丽',5000.00,2),(32,16,20,'美丽',5000.00,2),(33,17,13,'吊带裙',1000.00,11),(34,18,13,'吊带裙',1000.00,11),(35,18,20,'美丽',5000.00,2),(36,19,13,'吊带裙',1000.00,11),(37,19,20,'美丽',5000.00,2),(38,20,14,'华硕',100.00,4),(39,21,14,'华硕',100.00,4),(40,22,14,'华硕',100.00,4),(41,23,14,'华硕',100.00,4),(42,24,14,'华硕',100.00,4),(43,25,14,'华硕',100.00,4),(44,26,14,'华硕',100.00,4),(45,27,14,'华硕',100.00,4),(46,28,14,'华硕',100.00,4),(47,29,20,'美丽',5000.00,2),(48,30,20,'美丽',5000.00,2),(49,31,20,'美丽',5000.00,2),(50,32,20,'美丽',5000.00,2),(51,33,20,'美丽',5000.00,2),(52,34,20,'美丽',5000.00,2),(53,35,20,'美丽',5000.00,2),(54,36,20,'美丽',5000.00,2),(55,37,18,'美眉',1500.00,100),(56,38,18,'美眉',1500.00,100),(57,39,18,'美眉',1500.00,100),(58,40,18,'美眉',1500.00,100),(59,41,18,'美眉',1500.00,100),(60,42,18,'美眉',1500.00,100),(61,43,18,'美眉',1500.00,100),(62,44,18,'美眉',1500.00,100),(63,45,18,'美眉',1500.00,100),(64,46,18,'美眉',1500.00,100),(65,47,13,'吊带裙',1000.00,1),(66,48,13,'吊带裙',1000.00,1),(67,49,20,'美丽',5000.00,1),(68,50,20,'美丽',5000.00,1),(69,51,19,'粉色',1200.00,1),(70,52,19,'粉色',1200.00,1),(71,53,19,'粉色',1200.00,1),(72,54,20,'美丽',5000.00,1),(73,55,19,'粉色',1200.00,1),(74,56,17,'衣服',2000.00,1),(75,57,19,'粉色',1200.00,1),(76,57,17,'衣服',2000.00,1),(77,58,19,'粉色',1200.00,1),(78,58,17,'衣服',2000.00,1),(79,NULL,19,'粉色',1200.00,1),(80,NULL,17,'衣服',2000.00,1),(81,NULL,19,'粉色',1200.00,1),(82,NULL,17,'衣服',2000.00,1),(83,NULL,17,'衣服',2000.00,1),(84,59,17,'衣服',2000.00,1),(85,60,18,'美眉',1500.00,1),(86,61,18,'美眉',1500.00,1),(87,62,15,'小吊带',100.00,1),(88,63,13,'吊带裙',1000.00,1),(89,63,15,'小吊带',100.00,1),(90,64,22,'多萨达',1000.00,1),(91,65,20,'美丽',5000.00,1),(92,75,17,'衣服',2000.00,4),(93,75,13,'吊带裙',1000.00,1),(94,76,13,'吊带裙',1000.00,1),(95,76,14,'华硕',100.00,1),(96,77,13,'吊带裙',1000.00,1),(97,77,14,'华硕',100.00,1),(98,78,13,'吊带裙',1000.00,1),(99,78,14,'华硕',100.00,1),(100,79,13,'吊带裙',1000.00,1),(101,79,14,'华硕',100.00,1),(102,80,13,'吊带裙',1000.00,1),(103,80,14,'华硕',100.00,1),(104,81,10,'笔记本电脑',6500.00,2),(105,82,18,'美眉',1500.00,5),(106,82,17,'衣服',2000.00,5),(107,82,13,'吊带裙',1000.00,4),(108,83,14,'华硕',100.00,1),(109,83,16,'上衣',1000.00,1);

/*Table structure for table `myweb_goods` */

DROP TABLE IF EXISTS `myweb_goods`;

CREATE TABLE `myweb_goods` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `typeid` int(11) unsigned DEFAULT NULL,
  `goods` varchar(32) DEFAULT NULL,
  `company` varchar(50) DEFAULT NULL,
  `descr` text,
  `price` double(6,2) DEFAULT NULL,
  `picname` varchar(255) DEFAULT NULL,
  `state` tinyint(1) DEFAULT '1',
  `store` int(11) unsigned DEFAULT '0',
  `num` int(11) unsigned DEFAULT '0',
  `clicknum` int(11) unsigned DEFAULT '0',
  `addtime` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `typeid` (`typeid`)
) ENGINE=MyISAM AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;

/*Data for the table `myweb_goods` */

insert  into `myweb_goods`(`id`,`typeid`,`goods`,`company`,`descr`,`price`,`picname`,`state`,`store`,`num`,`clicknum`,`addtime`) values (18,24,'美眉','你','             啊时间跨度噶就是个阿古斯京港澳       ',1500.00,'1502972173.8515618.jpg',1,2000,0,65,1502972173),(13,24,'吊带裙','我','                   美丽的衣服就如你一样美丽 ',1000.00,'1502969272.3270187.jpg',1,1000,0,49,1502969272),(16,24,'上衣','我','           好啊好啊啊是啊倒萨         ',1000.00,'1502972095.946519.jpg',1,10000,0,13,1502972096),(17,24,'衣服','你','                    宿科技大会氨基酸安世高就爱',2000.00,'1502972134.6198893.jpg',1,2000,0,35,1502972134),(10,28,'笔记本电脑','河北省','         这是一个笔记本电脑           ',6500.00,'1502924777.3215966.jpg',1,1200,0,7,1502924777),(14,28,'华硕','我','           的都是卡死伽卡啊         ',100.00,'1502969872.2618341.jpg',1,1000,0,24,1502969872),(15,25,'小吊带','还是','                裙子啊    ',100.00,'1502970816.241865.jpg',1,10000,0,3,1502970816),(19,24,'粉色','你','           啊时间跨度噶空间高科技         ',1200.00,'1502972210.7290764.jpg',1,20000,0,2,1502972210),(20,24,'美丽','我','            就啊圣诞节啊时间等哈世界杯navy        ',5000.00,'1502972248.1540558.jpg',1,200,0,12,1502972248),(21,24,'大苏打','你','              宋丹丹摄氏度阿萨德      ',100.00,'1502972383.3015926.jpg',1,10000,0,8,1502972383),(22,28,'多萨达','速度','                    多萨达三大三的',1000.00,'1502972402.485382.jpg',1,1000,0,5,1502972402),(23,28,'联想','我','            啊韩国当局会撒娇的哈开始打算        ',1000.00,'1502972458.5952253.jpg',1,10000,0,1,1502972458),(24,28,'华为','我','                    达三大三大四的',9000.00,'1502972494.8997588.jpg',1,1000,0,1,1502972494);

/*Table structure for table `myweb_orders` */

DROP TABLE IF EXISTS `myweb_orders`;

CREATE TABLE `myweb_orders` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(11) unsigned DEFAULT NULL,
  `linkman` varchar(32) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `code` char(6) DEFAULT NULL,
  `phone` varchar(16) DEFAULT NULL,
  `addtime` int(11) unsigned DEFAULT NULL,
  `total` double(8,2) DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=84 DEFAULT CHARSET=utf8;

/*Data for the table `myweb_orders` */

insert  into `myweb_orders`(`id`,`uid`,`linkman`,`address`,`code`,`phone`,`addtime`,`total`,`status`) values (2,7,'会员','河南','10000','100000',1503073185,19300.00,2),(3,7,'会员','河南','10000','100000',1503074342,20300.00,2),(4,7,'会员','河南','10000','100000',1503074361,20300.00,2),(5,7,'会员','河南','10000','100000',1503074434,20300.00,1),(6,7,'会员','河南','10000','100000',1503074556,20300.00,2),(7,7,'会员','河南','10000','100000',1503074627,10300.00,0),(8,7,'会员','河南','10000','100000',1503075079,10300.00,1),(9,7,'会员','河南','10000','100000',1503075154,10300.00,1),(10,7,'会员','河南','10000','100000',1503075390,10300.00,1),(11,7,'会员','河南','10000','100000',1503075709,10300.00,1),(12,7,'会员','河南','10000','100000',1503075738,10300.00,1),(83,7,'会员','河南','10000','100000',1503191508,1100.00,0),(82,7,'会员','河南','10000','100000',1503187418,21500.00,0),(81,7,'会员','河南','10000','100000',1503187114,13000.00,0),(75,7,'会员','河南','10000','100000',1503164129,9000.00,1),(77,7,'会员','河南','10000','100000',1503180425,1100.00,0),(78,7,'会员','河南','10000','100000',1503180430,1100.00,0),(79,7,'会员','河南','10000','100000',1503180500,1100.00,0),(80,7,'会员','河南','10000','100000',1503180521,1100.00,0),(76,7,'会员','河南','10000','100000',1503180349,1100.00,0);

/*Table structure for table `myweb_type` */

DROP TABLE IF EXISTS `myweb_type`;

CREATE TABLE `myweb_type` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(32) DEFAULT NULL,
  `pid` int(11) unsigned DEFAULT '0',
  `path` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=35 DEFAULT CHARSET=utf8;

/*Data for the table `myweb_type` */

insert  into `myweb_type`(`id`,`name`,`pid`,`path`) values (18,'数码',0,'0,'),(28,'电脑',18,'0,18,'),(17,'服装',0,'0,'),(24,'女士衣服',17,'0,17,'),(25,'连衣裙',24,'0,17,24,'),(29,'笔记本电脑',28,'0,18,28,'),(30,'相机',18,'0,18,'),(31,'食品',0,'0,'),(32,'面包',31,'0,31,'),(33,'夹心面包',32,'0,31,32,'),(34,'不夹心面包',32,'0,31,32,');

/*Table structure for table `myweb_users` */

DROP TABLE IF EXISTS `myweb_users`;

CREATE TABLE `myweb_users` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(32) NOT NULL,
  `name` varchar(16) DEFAULT NULL,
  `password` char(32) NOT NULL,
  `sex` tinyint(1) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `code` char(6) DEFAULT NULL,
  `phone` varchar(16) DEFAULT NULL,
  `email` varchar(50) NOT NULL,
  `state` tinyint(1) DEFAULT '1',
  `addtime` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

/*Data for the table `myweb_users` */

insert  into `myweb_users`(`id`,`username`,`name`,`password`,`sex`,`address`,`code`,`phone`,`email`,`state`,`addtime`) values (3,'lishi','李四','e10adc3949ba59abbe56e057f20f883e',1,'北京','413026','131151151','123@qq.com',0,1502730169),(4,'admin','管理员','e10adc3949ba59abbe56e057f20f883e',1,'北京','10000','100000','0000',0,1502758446),(5,'ha','qq','099b3b060154898840f0ebdfb46ec78f',1,'q','q','121','11',0,1502799890),(6,'wqewq','wwww','ad57484016654da87125db86f4227ea3',0,'w','ww','1','w',1,1502799921),(7,'huiyuan','会员','e10adc3949ba59abbe56e057f20f883e',1,'河南','10000','100000','0000001',1,1502886673),(8,'11','11','6512bd43d9caa6e02c990b0a82652dca',1,'11','11','11','11',1,1502928494),(9,'789789','789','21b95a0f90138767b0fd324e6be3457b',1,'河北','10000','00000','00000',1,1502929643),(10,'147852','类','e10adc3949ba59abbe56e057f20f883e',1,'河南','1111','11111','1111',1,1502929711),(11,'1212','好久','22ac3c5a5bf0b520d281c122d1490650',0,'都是','1212','12121','12121',1,1502929773),(12,'nihao','哈哈','e10adc3949ba59abbe56e057f20f883e',1,'河南','100000','11111','1111',1,1502938859),(13,'huiyuan2','又是会员','e10adc3949ba59abbe56e057f20f883e',1,'河北','000000','0000000','0000000',1,1502939630),(14,'88888','llll','0a113ef6b61820daa5611c870ed8d5ee',0,'beijung','234567','23456789','234567890',1,1502957964);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
