

CREATE TABLE `hwbz_chat` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `from` varchar(255) NOT NULL DEFAULT '',
  `to` varchar(255) NOT NULL DEFAULT '',
  `message` text NOT NULL,
  `attached_files` varchar(255) DEFAULT NULL,
  `sent` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `recd` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;






CREATE TABLE `hwbz_complaints` (
  `id` int NOT NULL AUTO_INCREMENT,
  `job_id` varchar(255) NOT NULL,
  `reported_user_id` int NOT NULL,
  `reported_by_user_id` int NOT NULL,
  `reason` longtext NOT NULL,
  `status` int NOT NULL,
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;






CREATE TABLE `hwbz_faq` (
  `id` int NOT NULL AUTO_INCREMENT,
  `question` text NOT NULL,
  `answer` longtext NOT NULL,
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;






CREATE TABLE `hwbz_hcp_docs` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `doc_name` varchar(255) NOT NULL,
  `file` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


INSERT INTO hwbz_hcp_docs VALUES
("5","1","Active Professional License","1_acl_1681879406.png"),
("4","1","Driver\'s License or State ID","1_dl_1681879406.jpg"),
("6","1","Active BLS Card","1_abc_1681879406.jpg");




CREATE TABLE `hwbz_hcp_services` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `logo` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


INSERT INTO hwbz_hcp_services VALUES
("1","CNA",""),
("2","LVN",""),
("3","Occupational Therapist",""),
("4","LWN","");




CREATE TABLE `hwbz_hourly_rate` (
  `id` int NOT NULL AUTO_INCREMENT,
  `state_id` int NOT NULL,
  `service_id` int NOT NULL,
  `amount` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


INSERT INTO hwbz_hourly_rate VALUES
("1","17","2","20"),
("2","44","1","50"),
("5","31","3","55"),
("4","69","4","63"),
("6","44","4","150"),
("7","44","3","80"),
("8","44","2","100"),
("9","1","4","200");




CREATE TABLE `hwbz_job_timesheet` (
  `id` int NOT NULL,
  `job_id` varchar(255) NOT NULL,
  `date` date NOT NULL,
  `shift` varchar(255) NOT NULL,
  `service_id` int NOT NULL,
  `pdf` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;






CREATE TABLE `hwbz_jobs` (
  `id` int NOT NULL AUTO_INCREMENT,
  `job_id` text NOT NULL,
  `stripe_payment_id` text NOT NULL,
  `ss_id` int NOT NULL,
  `hcp_id` int DEFAULT NULL,
  `job_date` date NOT NULL,
  `shift` varchar(255) NOT NULL,
  `service_ids` varchar(255) NOT NULL,
  `address` text NOT NULL,
  `city` varchar(255) NOT NULL,
  `state_id` int NOT NULL,
  `zip` varchar(255) NOT NULL,
  `amount` varchar(255) NOT NULL,
  `invoice` varchar(255) NOT NULL,
  `time_sheet_id` int DEFAULT NULL,
  `status` int NOT NULL COMMENT '0=open,1=completed,2=pending',
  `reject_reason` varchar(255) DEFAULT NULL,
  `rating` float DEFAULT NULL,
  `review` varchar(255) DEFAULT NULL,
  `review_reply` text,
  `cancel` int NOT NULL,
  `cancelation_time` datetime DEFAULT NULL,
  `refunded_amount` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


INSERT INTO hwbz_jobs VALUES
("1","HWBZ_JOB_634130","pi_3N40ZGLYqjmNFtt70Kx4Yzqa","63","","2023-05-27","02:00-18:00","2,1","demo address","demo city","44","22222","2400","HWBZ_JOB_invoice_20230504171329.pdf","","0","","","","","1","2023-05-04 17:29:30","2400","2023-05-04 17:13:29",""),
("2","HWBZ_JOB_638152","pi_3N40sVLYqjmNFtt71BhOwfjB","63","","2023-05-05","00:00-21:00","2","demo address","demo city","44","22222","2100","HWBZ_JOB_invoice_20230504173320.pdf","","0","","","","","1","2023-05-04 17:34:26","1900","2023-05-04 17:33:20",""),
("3","HWBZ_JOB_636969","pi_3N40vSLYqjmNFtt70hJkcmau","63","","2023-06-10","06:00-20:00","4,2,1","demo address","demo city","44","22222","4200","HWBZ_JOB_invoice_20230504173624.pdf","","0","","","","","0","","","2023-05-04 17:36:24","");




CREATE TABLE `hwbz_last_added_id` (
  `table_name` varchar(255) NOT NULL,
  `id` int NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;






CREATE TABLE `hwbz_notification` (
  `id` int NOT NULL AUTO_INCREMENT,
  `datetime` datetime NOT NULL,
  `content` longtext NOT NULL,
  `status` int NOT NULL COMMENT '0=unread,1=read',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;






CREATE TABLE `hwbz_site_meta` (
  `id` int NOT NULL AUTO_INCREMENT,
  `meta_key` varchar(255) NOT NULL,
  `meta_value` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


INSERT INTO hwbz_site_meta VALUES
("1","site_commission","25");




CREATE TABLE `hwbz_ss_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `logo` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


INSERT INTO hwbz_ss_type VALUES
("18","Private Organizations",""),
("19","Schools",""),
("20","Doctor\'s Offices","");




CREATE TABLE `hwbz_states` (
  `Code` char(2) DEFAULT NULL,
  `Name` varchar(50) DEFAULT NULL,
  `id` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=76 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


INSERT INTO hwbz_states VALUES
("AL","ALABAMA","1"),
("AK","ALASKA","2"),
("AB","ALBERTA","3"),
("AS","AMERICAN SAMOA","4"),
("AZ","ARIZONA","5"),
("AR","ARKANSAS","6"),
("BC","BRITISH COLUMBIA","7"),
("CA","CALIFORNIA","8"),
("PW","CAROLINE ISLANDS","9"),
("CO","COLORADO","10"),
("CT","CONNETICUT","11"),
("DE","DELAWARE","12"),
("DC","DISTRICT OF COLUMBIA","13"),
("FM","FEDERATED STATE","14"),
("FL","FLORIDA","15"),
("GA","GEORGIA","16"),
("GU","GUAM","17"),
("HI","HAWAII","18"),
("ID","IDOHA","19"),
("IL","ILLINOIS","20"),
("IN","INDIANA","21"),
("IA","IOWA","22"),
("KS","KANSAS","23"),
("KY","KENTUCKY","24"),
("LA","LOUSIANA","25"),
("ME","MAINE","26"),
("MB","MANITOBA","27"),
("MP","MARIANA ISLANDS","28"),
("MH","MARSHALL ISLANDS","29"),
("MD","MARYLAND","30"),
("MA","MASSACHUSETTS","31"),
("MI","MICHIGAN","32"),
("MN","MINNESOTA","33"),
("MS","MISSISSIPPI","34"),
("MO","MISSOURI","35"),
("MT","MONTANA","36"),
("NE","NEBRASKA","37"),
("NV","NEVADA","38"),
("NB","NEW BRUNSWICK","39"),
("NH","NEW HAMPSHIRE","40"),
("NJ","NEW JERSEY","41"),
("NM","NEW MEXICO","42"),
("NY","NEW YORK","43"),
("NF","NEWFOUNDLAND","44"),
("NC","NORTH CAROLINA","45"),
("ND","NORTH DAKOTA","46"),
("NT","NORTHWEST TERRITORIES","47"),
("NS","NOVA SCOTIA","48"),
("NU","NUNAVUT","49"),
("OH","OHIO","50"),
("OK","OKLAHOMA","51"),
("ON","ONTARIO","52"),
("OR","OREGON","53"),
("PA","PENNSYLVANIA","54"),
("PE","PRINCE EDWARD ISLAND","55"),
("PR","PUERTO RICO","56"),
("PQ","QUEBEC","57"),
("RI","RHODE ISLAND","58"),
("SK","SASKATCHEWAN","59"),
("SC","SOUTH CAROLINA","60"),
("SD","SOUTH DAKOTA","61"),
("TN","TENNESSEE","62"),
("TX","TEXAS","63"),
("UT","UTAH","64"),
("VT","VERMONT","65"),
("VI","VIRGIN ISLANDS","66"),
("VA","VIRGINIA","67"),
("WA","WASHINGTON","68"),
("WV","WEST VIRGINIA","69"),
("WI","WISCONSIN","70"),
("WY","WYOMING","71"),
("YT","YUKON TERRITORY","72"),
("AE","ARMED FORCES - EUROPE","73"),
("AA","ARMED FORCES - AMERICAS","74"),
("AP","ARMED FORCES - PACIFIC","75");




CREATE TABLE `hwbz_terms_of_use` (
  `id` int NOT NULL AUTO_INCREMENT,
  `term_type` int NOT NULL COMMENT '0=website,1=patient,2=org,3=hcp,4=admin',
  `content` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;






CREATE TABLE `hwbz_transaction` (
  `id` int NOT NULL AUTO_INCREMENT,
  `transaction_id` varchar(255) NOT NULL,
  `user_id` int NOT NULL,
  `job_id` varchar(255) NOT NULL,
  `payment_account` text NOT NULL,
  `amount` int NOT NULL,
  `status` int NOT NULL COMMENT '0=completed,1=failed',
  `type` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


INSERT INTO hwbz_transaction VALUES
("1","#HWTXN9142","63","HWBZ_JOB_634130","pm_1N40ZHLYqjmNFtt7OkfXeztC","2400","0","job_post","2023-05-04 17:13:29"),
("2","#HWTXN9938","63","HWBZ_JOB_634130","re_3N40ZGLYqjmNFtt70tFBXugM","2400","0","job_refund","2023-05-04 17:29:30"),
("3","#HWTXN4731","63","HWBZ_JOB_638152","card_1N1jiyLYqjmNFtt7PNOq0jFU","2100","0","job_post","2023-05-04 17:33:20"),
("4","#HWTXN8597","63","HWBZ_JOB_638152","re_3N40sVLYqjmNFtt718sLyirZ","1900","0","job_refund","2023-05-04 17:34:26"),
("5","#HWTXN7884","63","HWBZ_JOB_636969","card_1N0k4ILYqjmNFtt7QY2dXLKv","4200","0","job_post","2023-05-04 17:36:24");




CREATE TABLE `hwbz_user` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `stripe_cust_id` text,
  `user_name` varchar(255) NOT NULL,
  `first_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `last_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `profile_image` text,
  `acc_type` int NOT NULL COMMENT '0=super_admin,1=admin,2=hcp,3=PATIENT, 4=org',
  `email` varchar(255) NOT NULL,
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `address` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `city` varchar(255) DEFAULT NULL,
  `state_id` int DEFAULT NULL,
  `zip` varchar(255) DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `ssn` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `gender` enum('M','F','O') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `emergency_info` varchar(255) DEFAULT NULL,
  `ss_type_id` int DEFAULT NULL,
  `org_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `status` int NOT NULL COMMENT '0=not_verified,1=verified,2=suspended,3=archived',
  `suspended_till` datetime DEFAULT NULL,
  `stricks` int NOT NULL,
  `notes` text,
  `notification_status` int NOT NULL COMMENT '0=on,1=off',
  `notification_type` int NOT NULL COMMENT '0=instant,1=every 1 hour,2=twice a day, 3=once a day',
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=65 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


INSERT INTO hwbz_user VALUES
("1","","admin","Super","Admin","","0","democoder999@yopmail.com","","$2y$10$rCw5bkhD9eqkn/NOWWgX5OnrXo0kqycRhqxj.gGMVQeJNz97lxSX2","","","","","","","","","","","0","","0","","0","0","2023-04-11 12:25:48",""),
("7","","org_one","Org-updated","One","","4","orgone@yopmail.com","2231412365","$2y$10$bdkoXEnrAgYHK3ObNKm3XujWKGhFUpmwYqS0rJQL3nl3WwGV3pQ4S","Demo Docotr Road","Demo Doctor City","44","5645655","0000-00-00","","","","18","Demo Doctor Center","0","0000-00-00 00:00:00","0","","0","0","2023-04-14 12:39:14","0000-00-00 00:00:00"),
("6","","patient_one","Patient-updated-1","One","","3","patiendone@yopmail.com","2547896514","$2y$10$4UTd6nvyvdoCZbhg4JgKh./8p0eW5ave8mGF0VlSJ.ad/jLNvRXgy","Demo Address","Demo City","15","589745","2000-07-21","54654464564","F","asdasdadasd","0","","0","0000-00-00 00:00:00","0","","0","0","2023-04-14 12:36:50","0000-00-00 00:00:00"),
("63","cus_NmGjsRNDclAGof","ss_card_ac","Stripe","SS","63_StripeSS_HWBZ_profile_picture.jpg","3","ssstripe@yopmail.com","2222222222","$2y$10$lZpzILAbCJgQe684.fjoXexEIIBL2Qzh4CmGTge982alW5uI3HsHi","demo address","demo city","44","22222","2023-03-28","asasdasd","M","asdasdasdas","0","","0","0000-00-00 00:00:00","0","","0","0","2023-04-25 09:30:13","0000-00-00 00:00:00"),
("64","cus_NpxU4VyA2Qh1Z7","hygejywus","Chava Brown","Magee Norman","","4","qatigegewy@mailinator.com","1010101010","$2y$10$9Hyu4baUzk5ebCExKczl9e7WldPtZRyX9IOUWnVtRXhGbo6RE2ltC","Atque quasi nostrum ","Rem nihil aliquid es","42","26731","0000-00-00","","","","20","Orson Heath","0","0000-00-00 00:00:00","0","","0","0","2023-05-05 11:22:19","0000-00-00 00:00:00");


