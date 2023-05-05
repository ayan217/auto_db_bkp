

CREATE TABLE `user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `phone` varchar(255) DEFAULT NULL,
  `photo` text,
  `qr` text,
  `acc_type` int NOT NULL COMMENT '0=normal,1=admin',
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


INSERT INTO user VALUES
("1","admin","admin@yopmail.com","$2y$10$rCw5bkhD9eqkn/NOWWgX5OnrXo0kqycRhqxj.gGMVQeJNz97lxSX2","","","","1",""),
("12","Demo Lady","democoder@yopmail.com","","4444444444","resized-1683276361_400X400.png","Demo Lady_QRCODE_12.png","0","2023-05-05 14:15:56"),
("11","Test User Two","democoder998@yopmail.com","","3333333333","resized-1683270560_400X400.jpg","11_QR_6454abb74d061.png","0","2023-05-05 12:39:13"),
("10","Test user","democoder999@yopmail.com","","123456789","resized-1683270224_400X400.jpg","10_QR_6454aa6f1f42e.png","0","2023-05-05 12:33:36"),
("13","Demo","democoder998@yopmail.com","","7777777777","user_default.png","Demo_QRCODE_13.png","0","2023-05-05 14:24:04"),
("14","asdasdasd","asdasd@asd.cac","","+14155552671","user_default.png","asdasdasd_QRCODE_14.png","0","2023-05-05 14:37:49"),
("15","asda","democoder999@yopmail.com","","4567894567","user_default.png","asda_QRCODE_15.png","0","2023-05-05 14:41:15");


