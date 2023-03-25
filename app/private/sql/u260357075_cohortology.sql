-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Mar 24, 2023 at 04:24 PM
-- Server version: 10.5.18-MariaDB-cll-lve
-- PHP Version: 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `u260357075_cohortology`
--
CREATE DATABASE IF NOT EXISTS `u260357075_cohortology` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE `u260357075_cohortology`;

-- --------------------------------------------------------

--
-- Table structure for table `cohorts`
--

DROP TABLE IF EXISTS `cohorts`;
CREATE TABLE `cohorts` (
  `cohort_id` int(11) NOT NULL,
  `cohort_name` varchar(255) NOT NULL,
  `cohort_group_id` int(11) NOT NULL,
  `cohort_event_id` int(11) NOT NULL,
  `cohort_datetime` datetime NOT NULL,
  `cohort_notes` mediumtext NOT NULL,
  `cohort_owner_id` int(11) NOT NULL,
  `cohort_added` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `cohort_amended` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `cohort_hidden` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Table structure for table `galleries`
--

DROP TABLE IF EXISTS `galleries`;
CREATE TABLE `galleries` (
  `gallery_id` int(11) NOT NULL,
  `gallery_typ_id` int(11) NOT NULL,
  `gallery_name` varchar(100) NOT NULL,
  `gallery_cohort_id` int(11) NOT NULL,
  `gallery_flaggedfordeletion` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `gallery_changed_by` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Table structure for table `gallerylinks`
--

DROP TABLE IF EXISTS `gallerylinks`;
CREATE TABLE `gallerylinks` (
  `gallerylinks_id` int(11) NOT NULL,
  `gallerylinks_img_id` int(11) NOT NULL,
  `gallerylinks_added` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `gallerylinks_amended` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `gallerylinks_flaggedfordeletion` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `gallerylinks_changed_by` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Table structure for table `grouplinks`
--

DROP TABLE IF EXISTS `grouplinks`;
CREATE TABLE `grouplinks` (
  `grouplink_id` int(11) NOT NULL,
  `grouplink_group_id` int(11) NOT NULL,
  `grouplink_cohort_id` int(11) NOT NULL,
  `grouplink_user_id` int(11) NOT NULL,
  `grouplink_message_id` int(11) NOT NULL,
  `grouplink_requested` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `grouplink_confirmed` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `grouplink_flaggedfordeletion` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `grouplink_changed_by` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Table structure for table `groups`
--

DROP TABLE IF EXISTS `groups`;
CREATE TABLE `groups` (
  `group_id` int(11) NOT NULL,
  `group_owner_id` int(11) NOT NULL,
  `group_name` varchar(255) NOT NULL,
  `group_desc` mediumtext NOT NULL,
  `group_added` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `group_amended` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `group_flaggedfordeletion` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `group_changed_by` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Table structure for table `images`
--

DROP TABLE IF EXISTS `images`;
CREATE TABLE `images` (
  `img_id` int(11) NOT NULL,
  `img_owner_id` int(11) NOT NULL,
  `img_typ_id` int(11) NOT NULL,
  `img_filename` varchar(30) NOT NULL,
  `img_ext` char(4) NOT NULL,
  `img_caption` varchar(100) NOT NULL,
  `img_added` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `img_amended` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `img_flaggedfordeletion` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `img_changed_by` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Dumping data for table `images`
--

INSERT INTO `images` (`img_id`, `img_owner_id`, `img_typ_id`, `img_filename`, `img_ext`, `img_caption`, `img_added`, `img_amended`, `img_flaggedfordeletion`, `img_changed_by`) VALUES
(1004, 100001, 0, 'CH641c3bfd9d893076563113', 'jpg', 'dmu', '2023-03-23 11:46:05', '2023-03-23 11:46:05', '0000-00-00 00:00:00', 100001),
(1005, 100001, 0, 'CH641c4019abcf1243994415', 'png', 'This is the caption', '2023-03-23 12:03:37', '2023-03-23 12:03:37', '0000-00-00 00:00:00', 100001),
(1006, 100001, 0, 'CH641ce2dc5afbc901159671', 'jpg', 'DMU', '2023-03-23 23:38:04', '2023-03-23 23:38:04', '0000-00-00 00:00:00', 100001),
(1007, 100001, 0, 'CH641ce4aa2c879090879418', 'jpg', 'dmu', '2023-03-23 23:45:46', '2023-03-23 23:45:46', '0000-00-00 00:00:00', 100001),
(1008, 100001, 0, 'CH641ce579cb9e7188410772', 'jpg', 'dmu', '2023-03-23 23:49:13', '2023-03-23 23:49:13', '0000-00-00 00:00:00', 100001),
(1009, 100001, 0, 'CH641ce601d9366672039362', 'jpg', 'dmu', '2023-03-23 23:51:29', '2023-03-23 23:51:29', '0000-00-00 00:00:00', 100001),
(1010, 100001, 0, 'CH641ce6dee227b385552675', 'jpg', 'dmu', '2023-03-23 23:55:10', '2023-03-23 23:55:10', '0000-00-00 00:00:00', 100001),
(1011, 100001, 0, 'CH641ce76cf1cd4047926866', 'jpg', 'dmu', '2023-03-23 23:57:32', '2023-03-23 23:57:32', '0000-00-00 00:00:00', 100001),
(1012, 100001, 0, 'CH641ce7f554584712959065', 'jpg', 'shaved', '2023-03-23 23:59:49', '2023-03-23 23:59:49', '0000-00-00 00:00:00', 100001),
(1013, 100001, 0, 'CH641ce87c47bfe133441206', 'jpg', 'shaved', '2023-03-24 00:02:04', '2023-03-24 00:02:04', '0000-00-00 00:00:00', 100001),
(1014, 100001, 0, 'CH641ce8fbe812e790678541', 'jpg', 'vsmall', '2023-03-24 00:04:11', '2023-03-24 00:04:11', '0000-00-00 00:00:00', 100001),
(1015, 100001, 0, 'CH641cea7d32a1d073294590', 'jpg', 'dmu', '2023-03-24 00:10:37', '2023-03-24 00:10:37', '0000-00-00 00:00:00', 100001),
(1016, 100001, 0, 'CH641ceb5772e92637606321', 'jpg', 'shaved', '2023-03-24 00:14:15', '2023-03-24 00:14:15', '0000-00-00 00:00:00', 100001),
(1017, 100001, 0, 'CH641cebb95ec9a232993855', 'jpg', 'shaved', '2023-03-24 00:15:53', '2023-03-24 00:15:53', '0000-00-00 00:00:00', 100001),
(1018, 100001, 0, 'CH641ced025d817976399618', 'jpg', 'shaved', '2023-03-24 00:21:22', '2023-03-24 00:21:22', '0000-00-00 00:00:00', 100001),
(1019, 100001, 0, 'CH641ced89046f1447085043', 'jpg', 'dmu', '2023-03-24 00:23:36', '2023-03-24 00:23:36', '0000-00-00 00:00:00', 100001),
(1020, 100001, 0, 'CH641cf71f7ab1a159585867', 'jpg', 'walk', '2023-03-24 01:04:31', '2023-03-24 01:04:31', '0000-00-00 00:00:00', 100001);

-- --------------------------------------------------------

--
-- Table structure for table `maps`
--

DROP TABLE IF EXISTS `maps`;
CREATE TABLE `maps` (
  `map_id` int(11) NOT NULL,
  `map_owner_id` int(11) NOT NULL,
  `map_typ_id` int(11) NOT NULL,
  `map_filename` varchar(30) NOT NULL,
  `map_caption` varchar(100) NOT NULL,
  `map_added` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `map_amended` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `map_flaggedfordeletion` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `map_changed_by` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

DROP TABLE IF EXISTS `messages`;
CREATE TABLE `messages` (
  `message_id` int(11) NOT NULL,
  `message_typ_id` int(11) NOT NULL,
  `message_cohort_id` int(11) NOT NULL,
  `message_event_id` int(11) NOT NULL,
  `message_to_id` int(11) NOT NULL,
  `messsage_from_id` int(11) NOT NULL,
  `messsage_subject` varchar(255) NOT NULL,
  `messsage_text` mediumtext NOT NULL,
  `message_sent` timestamp NOT NULL DEFAULT current_timestamp(),
  `message_flaggedfordeletion` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `message_changed_by` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pdfs`
--

DROP TABLE IF EXISTS `pdfs`;
CREATE TABLE `pdfs` (
  `pdf_id` int(11) NOT NULL,
  `pdf_owner_id` int(11) NOT NULL,
  `pdf_typ_id` int(11) NOT NULL,
  `pdf_filename` varchar(30) NOT NULL,
  `pdf_caption` varchar(100) NOT NULL,
  `pdf_added` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `pdf_amended` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `pdf_flaggedfordeletion` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `pdf_changed_by` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Table structure for table `templates`
--

DROP TABLE IF EXISTS `templates`;
CREATE TABLE `templates` (
  `event_id` int(11) NOT NULL,
  `event_name` varchar(255) NOT NULL,
  `event_banner` varchar(255) DEFAULT NULL,
  `event_text_id` int(11) DEFAULT NULL,
  `event_details` mediumtext NOT NULL,
  `event_footnote` mediumtext DEFAULT NULL,
  `event_grade_id` int(11) NOT NULL,
  `event_distance` int(11) NOT NULL,
  `event_ascent` int(11) NOT NULL,
  `event_terrain_id` int(11) NOT NULL,
  `event_type_id` int(11) NOT NULL,
  `event_host_id` int(11) NOT NULL,
  `event_picture_id` int(11) NOT NULL,
  `event_map_id` int(11) DEFAULT NULL,
  `event_meet_id` int(11) NOT NULL,
  `event_meet_notes` mediumtext DEFAULT NULL,
  `event_added` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `event_amended` timestamp NULL DEFAULT '0000-00-00 00:00:00',
  `event_hidden` timestamp NULL DEFAULT '0000-00-00 00:00:00',
  `event_status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Dumping data for table `templates`
--

INSERT INTO `templates` (`event_id`, `event_name`, `event_banner`, `event_text_id`, `event_details`, `event_footnote`, `event_grade_id`, `event_distance`, `event_ascent`, `event_terrain_id`, `event_type_id`, `event_host_id`, `event_picture_id`, `event_map_id`, `event_meet_id`, `event_meet_notes`, `event_added`, `event_amended`, `event_hidden`, `event_status`) VALUES
(1, ' Eyam Froggatt Edge Leadmill & Sir William Hill', NULL, NULL, 'This excellent walk encompasses many of the best elements of the peak district with woodland walks, exposed edges and riverside paths.', NULL, 2, 12, 640, 3, 1, 5, 1, NULL, 1, NULL, '2020-11-28 19:31:05', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2),
(2, ' Redmires & Dale Dike Reservoirs', NULL, NULL, 'On a hill above Dale Dike Reservoir (site of the UK\'s worst reservoir disaster) is an iconic tower which we visit on our walk amongst some of the most distinctive scenery in the Peak District area.', NULL, 2, 11, 330, 5, 1, 1, 2, NULL, 2, NULL, '2020-11-28 19:31:05', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2),
(3, ' Winster Snitterton and the Midshires Way', NULL, NULL, 'Another pleasant walk from Matlock with a very different perspective.', NULL, 2, 8, 550, 2, 1, 14, 3, NULL, 3, NULL, '2020-11-28 19:31:05', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `user_title` varchar(255) NOT NULL,
  `user_firstname` varchar(255) NOT NULL,
  `user _middlenames` varchar(255) NOT NULL,
  `user_lastname` varchar(255) NOT NULL,
  `user_address_id` int(11) NOT NULL,
  `user_screenname` varchar(255) NOT NULL,
  `user_email_home` varchar(255) NOT NULL,
  `user_email.work` varchar(255) NOT NULL,
  `user_phone_work` varchar(255) NOT NULL,
  `user_phone_home` varchar(255) NOT NULL,
  `user_phone_mobile` varchar(255) NOT NULL,
  `user_role_id` int(11) NOT NULL,
  `user_status_id` int(11) NOT NULL,
  `user_added` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `user_amended` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `user_hidden` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Table structure for table `videos`
--

DROP TABLE IF EXISTS `videos`;
CREATE TABLE `videos` (
  `video_id` int(11) NOT NULL,
  `video_owner_id` int(11) NOT NULL,
  `video_typ_id` int(11) NOT NULL,
  `video_filename` varchar(30) NOT NULL,
  `video_ext` char(4) NOT NULL,
  `video_caption` varchar(100) NOT NULL,
  `video_added` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `video_amended` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `video_flaggedfordeletion` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `video_changed_by` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cohorts`
--
ALTER TABLE `cohorts`
  ADD PRIMARY KEY (`cohort_id`);

--
-- Indexes for table `galleries`
--
ALTER TABLE `galleries`
  ADD PRIMARY KEY (`gallery_id`);

--
-- Indexes for table `gallerylinks`
--
ALTER TABLE `gallerylinks`
  ADD PRIMARY KEY (`gallerylinks_id`);

--
-- Indexes for table `grouplinks`
--
ALTER TABLE `grouplinks`
  ADD PRIMARY KEY (`grouplink_id`);

--
-- Indexes for table `groups`
--
ALTER TABLE `groups`
  ADD PRIMARY KEY (`group_id`);

--
-- Indexes for table `images`
--
ALTER TABLE `images`
  ADD PRIMARY KEY (`img_id`);

--
-- Indexes for table `maps`
--
ALTER TABLE `maps`
  ADD PRIMARY KEY (`map_id`);

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`message_id`);

--
-- Indexes for table `pdfs`
--
ALTER TABLE `pdfs`
  ADD PRIMARY KEY (`pdf_id`);

--
-- Indexes for table `templates`
--
ALTER TABLE `templates`
  ADD PRIMARY KEY (`event_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `videos`
--
ALTER TABLE `videos`
  ADD PRIMARY KEY (`video_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cohorts`
--
ALTER TABLE `cohorts`
  MODIFY `cohort_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `galleries`
--
ALTER TABLE `galleries`
  MODIFY `gallery_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `gallerylinks`
--
ALTER TABLE `gallerylinks`
  MODIFY `gallerylinks_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `grouplinks`
--
ALTER TABLE `grouplinks`
  MODIFY `grouplink_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `groups`
--
ALTER TABLE `groups`
  MODIFY `group_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `images`
--
ALTER TABLE `images`
  MODIFY `img_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1021;

--
-- AUTO_INCREMENT for table `maps`
--
ALTER TABLE `maps`
  MODIFY `map_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `message_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pdfs`
--
ALTER TABLE `pdfs`
  MODIFY `pdf_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `templates`
--
ALTER TABLE `templates`
  MODIFY `event_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `videos`
--
ALTER TABLE `videos`
  MODIFY `video_id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
