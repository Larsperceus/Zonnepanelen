
DROP SCHEMA zonnepanelen;
CREATE SCHEMA zonnepanelen;

CREATE TABLE `extras` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `fires`
--

CREATE TABLE `fires` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `on` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `fires`
--

INSERT INTO `fires` (`id`, `on`, `created_at`, `updated_at`) VALUES
(1, 0, NULL, NULL),
(2, 1, NULL, NULL),
(3, 0, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `lamps`
--

CREATE TABLE `lamps` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `locations`
--

CREATE TABLE `locations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `location` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `locations`
--

INSERT INTO `locations` (`id`, `user_id`, `location`, `created_at`, `updated_at`) VALUES
(1, 1, 'Luik', '2022-01-31 12:30:36', '2022-01-31 12:30:36'),
(2, 1, 'Brussel', '2022-01-31 12:30:51', '2022-01-31 12:30:51'),
(3, 2, 'Gent', '2022-01-31 12:31:34', '2022-01-31 12:44:40'),
(4, 3, 'Oosthoven', '2022-01-31 12:35:23', '2022-01-31 12:35:23');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2022_01_26_114037_create_fires_table', 1),
(5, '2022_01_26_134925_create_winsts_table', 1),
(6, '2022_01_26_134943_create_verbruiks_table', 1),
(7, '2022_01_27_151000_create_locations_table', 1),
(8, '2022_01_31_090322_create_zonnepanelen_data_table', 1),
(9, '2022_01_31_090347_create_extras_table', 1),
(10, '2022_01_31_090427_create_lamps_table', 1),
(11, '2022_01_31_090503_create_zonnepanelen_extras_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `set` tinyint(1) NOT NULL DEFAULT '0',
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `set`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'user1', 'user1@gmail.com', '2022-01-31 12:30:09', '$2y$10$z0YuLlgZY4Cs0ab.xFRK5.6OwlZ3Kky8tgc8hGOUNG1xG4YavPJFm', 1, NULL, '2022-01-31 12:30:09', '2022-01-31 12:30:36'),
(2, 'Timo Van Litsenborg', 'timovanlitsenborg@gmail.com', NULL, '$2y$10$EzZqWtJB8RKC7ZRUFAYBFebwiQV7yqSlbrLffJUCDJ1QQBfg3LbRu', 1, NULL, '2022-01-31 12:31:19', '2022-01-31 12:44:40'),
(3, 'user3', 'u3@gmail.com', NULL, '$2y$10$4nudmoqmajAzO7XGSsgYnOF8mTjBOwU4Uw.9YsJ8bRybO6j337jeW', 1, NULL, '2022-01-31 12:35:10', '2022-01-31 12:35:23');

-- --------------------------------------------------------

--
-- Table structure for table `verbruiks`
--

CREATE TABLE `verbruiks` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `verbruik` double(8,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `verbruiks`
--

INSERT INTO `verbruiks` (`id`, `verbruik`, `created_at`, `updated_at`) VALUES
(1, 555.33, NULL, NULL),
(2, 254.00, NULL, NULL),
(3, 1084.00, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `winsts`
--

CREATE TABLE `winsts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `winst` double(8,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `winsts`
--

INSERT INTO `winsts` (`id`, `winst`, `created_at`, `updated_at`) VALUES
(1, 356.21, NULL, NULL),
(2, 420.69, NULL, NULL),
(3, 11.36, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `zonnepanelen_data`
--

CREATE TABLE `zonnepanelen_data` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `time` int(11) NOT NULL,
  `kwh` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `zonnepanelen_extras`
--

CREATE TABLE `zonnepanelen_extras` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `location_id` bigint(20) UNSIGNED NOT NULL,
  `piekuur` double NOT NULL,
  `zonnepanelen` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `zonnepanelen_extras`
--

INSERT INTO `zonnepanelen_extras` (`id`, `created_at`, `updated_at`, `user_id`, `location_id`, `piekuur`, `zonnepanelen`) VALUES
(1, '2022-01-31 12:30:36', '2022-01-31 12:30:36', 1, 1, 0, 456),
(2, '2022-01-31 12:31:34', '2022-01-31 12:44:40', 2, 3, 5, 8),
(3, '2022-01-31 12:35:23', '2022-01-31 12:35:23', 3, 4, 0, 456);

--
-- Indexes for dumped tables
--


--
ALTER TABLE `locations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `locations_user_id_foreign` (`user_id`);

--
-- Indexes for table `migrations`

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `verbruiks`
--
ALTER TABLE `verbruiks`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `winsts`
--
ALTER TABLE `winsts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `zonnepanelen_data`
--
ALTER TABLE `zonnepanelen_data`
  ADD PRIMARY KEY (`id`),
  ADD KEY `zonnepanelen_data_user_id_foreign` (`user_id`);

--
-- Indexes for table `zonnepanelen_extras`
--
ALTER TABLE `zonnepanelen_extras`
  ADD PRIMARY KEY (`id`),
  ADD KEY `zonnepanelen_extras_user_id_foreign` (`user_id`),
  ADD KEY `zonnepanelen_extras_location_id_foreign` (`location_id`);



--
-- AUTO_INCREMENT for table `zonnepanelen_data`
--
ALTER TABLE `zonnepanelen_data`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `zonnepanelen_extras`
--
ALTER TABLE `zonnepanelen_extras`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `locations`
--
ALTER TABLE `locations`
  ADD CONSTRAINT `locations_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `zonnepanelen_data`
--
ALTER TABLE `zonnepanelen_data`
  ADD CONSTRAINT `zonnepanelen_data_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `zonnepanelen_extras`
--
ALTER TABLE `zonnepanelen_extras`
  ADD CONSTRAINT `zonnepanelen_extras_location_id_foreign` FOREIGN KEY (`location_id`) REFERENCES `locations` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `zonnepanelen_extras_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
  
ALTER TABLE `zonnepanelen`.`users` 
CHANGE COLUMN `id` `id` BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT ;
ALTER TABLE `zonnepanelen`.`locations` 
CHANGE COLUMN `id` `id` BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT ;
ALTER TABLE `zonnepanelen`.`fires` 
CHANGE COLUMN `id` `id` BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT ,
ADD PRIMARY KEY (`id`);
;
