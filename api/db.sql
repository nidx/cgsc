CREATE TABLE `answers` (
   `id` int(10) not null auto_increment,
   `user_id` int(10) not null,
   `question_id` int(10) not null,
   `answer` longtext not null,
   PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1;


CREATE TABLE `comment` (
   `id` int(10) not null auto_increment,
   `user_id` int(10) not null,
   `comment` longtext not null,
   `datetime` datetime not null,
   PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1;


CREATE TABLE `comment_event_assoc` (
   `id` int(10) not null auto_increment,
   `comment_id` int(10) not null,
   `event_id` int(10) not null,
   PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1;


CREATE TABLE `comment_post_assoc` (
   `id` int(10) not null auto_increment,
   `comment_id` int(10) not null,
   `post_id` int(10) not null,
   PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1;


CREATE TABLE `comment_user_assoc` (
   `id` int(10) not null auto_increment,
   `comment_id` int(10) not null,
   `user_id` int(10) not null,
   PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1;


CREATE TABLE `events` (
   `id` int(10) not null auto_increment,
   `title` tinytext not null,
   `start` datetime not null,
   `duration` decimal(5,2) not null default '3.00',
   `is_featured` int(1) not null default '0',
   `spots` int(3),
   `location_id` int(10),
   `description` longtext,
   `faq` text,
   `creator_id` int(10) not null,
   `created_datetime` datetime not null,
   PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1;


CREATE TABLE `locations` (
   `id` int(10) not null auto_increment,
   `name` tinytext not null,
   `address` text,
   PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1;


CREATE TABLE `posts` (
   `id` int(10) not null auto_increment,
   `comment_id` int(10) not null,
   PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1;


CREATE TABLE `questions` (
   `id` int(10) not null auto_increment,
   `question` text not null,
   `is_active` int(1) not null default '1',
   PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1;


CREATE TABLE `rsvps` (
   `id` int(10) not null auto_increment,
   `user_id` int(10),
   `event_id` int(10),
   `status` int(1) not null default '1',
   PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1;


CREATE TABLE `users` (
   `id` int(10) not null auto_increment,
   `email` tinytext not null,
   `name` tinytext not null,
   `nickname` tinytext,
   `join_date` date not null,
   `last_access` datetime not null,
   `photo` tinytext,
   `gender` int(1) not null default '1',
   `dob` date not null,
   `contact_details` text,
   PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1;