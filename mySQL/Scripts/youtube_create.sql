DROP DATABASE IF EXISTS youtube;
CREATE DATABASE youtube CHARACTER SET utf8mb4;
USE youtube;

CREATE TABLE `youtube`.`users` (
  `users_id` INT NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `password` VARCHAR(45) NOT NULL,
  `username` VARCHAR(45) NOT NULL,
  `birthdate` DATE NOT NULL,
  `gender` ENUM("male", "female", "non-binary", "intersex") NOT NULL,
  `country` VARCHAR(45) NOT NULL,
  `zipcode` INT NOT NULL,
  PRIMARY KEY (`users_id`))
ENGINE = InnoDB;

INSERT INTO `users` VALUES (1, "vorpalbunny@gmail.com", "S1llyR4bb1t", "VorpalBunny", "2002/04/10", "male", "Spain", 08930),
(2, "mastersounds@gmail.com", "S1llyP0ny", "MasterSounds", "1998/10/08", "male", "Mexico", 06600);

CREATE TABLE `youtube`.`channel` (
  `channel_id` INT NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `desc` TEXT(500) NOT NULL,
  `creation_date` DATE NOT NULL,
  `user` INT NOT NULL,
  PRIMARY KEY (`channel_id`),
  INDEX `user_channel_idx` (`user` ASC),
  CONSTRAINT `user_channel`
    FOREIGN KEY (`user`)
    REFERENCES `youtube`.`users` (`users_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;

INSERT INTO `channel` VALUES (1, "HoppyFactsHub", 
"Channel dedicated to share facts about rabbits", 
"2015/02/15", 1);

CREATE TABLE `youtube`.`subcriptions` (
  `subcriptions_id` INT NOT NULL,
  `user` INT NOT NULL,
  `channel` INT NOT NULL,
  PRIMARY KEY (`subcriptions_id`),
  INDEX `user_subcriptions_idx` (`user` ASC),
  INDEX `channel_subcriptions_idx` (`channel` ASC),
  CONSTRAINT `user_subcriptions`
    FOREIGN KEY (`user`)
    REFERENCES `youtube`.`users` (`users_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `channel_subcriptions`
    FOREIGN KEY (`channel`)
    REFERENCES `youtube`.`channel` (`channel_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;

INSERT INTO `subcriptions` VALUES (1, 2, 1);

CREATE TABLE `youtube`.`videos` (
  `videos_id` INT NOT NULL,
  `title` VARCHAR(45) NOT NULL,
  `desc` TEXT(500) NOT NULL,
  `size` INT NOT NULL,
  `file_name` VARCHAR(45) NOT NULL,
  `length` INT NOT NULL,
  `thumbnail` VARCHAR(45) NOT NULL,
  `views` INT NOT NULL,
  `likes_count` INT NOT NULL,
  `dislikes_count` INT NOT NULL,
  `status` ENUM("public", "hidden", "private") NOT NULL,
  `user` INT NOT NULL,
  `premier_date` DATE NOT NULL,
  PRIMARY KEY (`videos_id`),
  INDEX `user_videos_idx` (`user` ASC),
  CONSTRAINT `user_videos`
    FOREIGN KEY (`user`)
    REFERENCES `youtube`.`users` (`users_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;

INSERT INTO `videos` VALUES (1, "Facts that you should know as a Rabbit owner",
"A video made for all rabbit enjoyers or people who is thinking about getting a pet rabbit",
500, "rabbitfacts1.mp4", 
"15", "./thumbnails/RF1.jpg",
1, 1, 0, "public", 1, "2020/05/15");

CREATE TABLE `youtube`.`tags` (
  `tags_id` INT NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `video` INT NOT NULL,
  PRIMARY KEY (`tags_id`),
  INDEX `tag_videos_idx` (`video` ASC),
  CONSTRAINT `tag_videos`
    FOREIGN KEY (`video`)
    REFERENCES `youtube`.`videos` (`videos_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;

INSERT INTO `tags` VALUES (1, "macots", 1), (2, "educative", 1);

CREATE TABLE `youtube`.`playlists` (
  `playlists_id` INT NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `date` DATE NOT NULL,
  `status` ENUM("public", "private") NOT NULL,
  `user` INT NOT NULL,
  PRIMARY KEY (`playlists_id`),
  INDEX `user_playlist_idx` (`user` ASC),
  CONSTRAINT `user_playlist`
    FOREIGN KEY (`user`)
    REFERENCES `youtube`.`users` (`users_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;

INSERT INTO `playlists` VALUE (1, "animal videos", "2021/10/25", "private", 2);

CREATE TABLE `youtube`.`playlist_videos` (
  `id_playlist` INT NOT NULL,
  `video` INT NOT NULL,
  INDEX `playlist_idx` (`id_playlist` ASC),
  INDEX `videos_idx` (`video` ASC),
  CONSTRAINT `playlist`
    FOREIGN KEY (`id_playlist`)
    REFERENCES `youtube`.`playlists` (`playlists_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `videos`
    FOREIGN KEY (`video`)
    REFERENCES `youtube`.`videos` (`videos_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;

INSERT INTO `playlist_videos` VALUES (1, 1);

CREATE TABLE `youtube`.`likes_videos` (
  `likes_videos_id` INT NOT NULL,
  `user` INT NOT NULL,
  `video` INT NOT NULL,
  `date` DATE NOT NULL,
  PRIMARY KEY (`likes_videos_id`),
  INDEX `user_videos_likes_idx` (`user` ASC),
  INDEX `videos_likes_idx` (`video` ASC),
  CONSTRAINT `user_videos_likes`
    FOREIGN KEY (`user`)
    REFERENCES `youtube`.`users` (`users_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `videos_likes`
    FOREIGN KEY (`video`)
    REFERENCES `youtube`.`videos` (`videos_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;

INSERT INTO `likes_videos` VALUES (1, 2, 1, "2022/10/25");

CREATE TABLE `youtube`.`dislikes_videos` (
  `dislikes_videos_id` INT NOT NULL,
  `user` INT NOT NULL,
  `video` INT NOT NULL,
  `date` DATE NOT NULL,
  PRIMARY KEY (`dislikes_videos_id`),
  INDEX `user_video_dislikes_idx` (`user` ASC),
  INDEX `videos_dislikes_idx` (`video` ASC),
  CONSTRAINT `user_video_dislikes`
    FOREIGN KEY (`user`)
    REFERENCES `youtube`.`users` (`users_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `videos_dislikes`
    FOREIGN KEY (`video`)
    REFERENCES `youtube`.`videos` (`videos_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;

CREATE TABLE `youtube`.`comments` (
  `coments_id` INT NOT NULL,
  `text` TEXT(500) NOT NULL,
  `date` DATE NOT NULL,
  `user` INT NOT NULL,
  `video` INT NOT NULL,
  PRIMARY KEY (`coments_id`),
  INDEX `user_comment_idx` (`user` ASC),
  INDEX `video_comments_idx` (`video` ASC),
  CONSTRAINT `user_comment`
    FOREIGN KEY (`user`)
    REFERENCES `youtube`.`users` (`users_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `video_comments`
    FOREIGN KEY (`video`)
    REFERENCES `youtube`.`videos` (`videos_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;

INSERT INTO `comments` VALUES (1, "Great video, I love rabbits!", "2022/10/25", 2, 1);

CREATE TABLE IF NOT EXISTS `youtube`.`likes_comments` (
  `likes_comments_id` INT NOT NULL,
  `user` INT NOT NULL,
  `comment` INT NOT NULL,
  `date` DATE NOT NULL,
  PRIMARY KEY (`likes_comments_id`),
  INDEX `user_comment_likes_idx` (`user` ASC),
  INDEX `comment_likes_idx` (`comment` ASC),
  CONSTRAINT `user_comment_likes`
    FOREIGN KEY (`user`)
    REFERENCES `youtube`.`users` (`users_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `comment_likes`
    FOREIGN KEY (`comment`)
    REFERENCES `youtube`.`comments` (`coments_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;

INSERT INTO `likes_comments` VALUES (1, 1, 1, "2021/10/25");

CREATE TABLE IF NOT EXISTS `youtube`.`dislikes_comments` (
  `dislikes_comments_id` INT NOT NULL,
  `user` INT NOT NULL,
  `comment` INT NOT NULL,
  `date` DATE NOT NULL,
  PRIMARY KEY (`dislikes_comments_id`),
  INDEX `user_comment_likes_idx` (`user` ASC),
  INDEX `comment_dislikes_idx` (`comment` ASC),
  CONSTRAINT `user_comment_dislikes`
    FOREIGN KEY (`user`)
    REFERENCES `youtube`.`users` (`users_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `comment_dislikes`
    FOREIGN KEY (`comment`)
    REFERENCES `youtube`.`comments` (`coments_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;