CREATE TABLE `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(191) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `model_has_permissions` (
  `permission_id` bigint(20) unsigned NOT NULL,
  `model_type` varchar(191) NOT NULL,
  `model_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`),
  CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `model_has_roles` (
  `role_id` bigint(20) unsigned NOT NULL,
  `model_type` varchar(191) NOT NULL,
  `model_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`),
  CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `password_resets` (
  `email` varchar(191) NOT NULL,
  `token` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `permissions` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) NOT NULL,
  `guard_name` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `permissions_name_guard_name_unique` (`name`,`guard_name`)
) ENGINE=InnoDB AUTO_INCREMENT=110 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(191) NOT NULL,
  `tokenable_id` bigint(20) unsigned NOT NULL,
  `name` varchar(191) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `role_has_permissions` (
  `permission_id` bigint(20) unsigned NOT NULL,
  `role_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`role_id`),
  KEY `role_has_permissions_role_id_foreign` (`role_id`),
  CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `roles` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) NOT NULL,
  `guard_name` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `roles_name_guard_name_unique` (`name`,`guard_name`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `td_bon_alat_detail` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `kode` varchar(32) DEFAULT NULL,
  `jumlah` int(10) unsigned NOT NULL,
  `tr_bon_alat_id` int(10) unsigned NOT NULL,
  `tr_barang_laboratorium_id` int(10) unsigned NOT NULL,
  `tr_kartu_stok_id` int(10) unsigned DEFAULT NULL,
  `tr_kartu_stok_id_kembali` int(10) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `jumlah_kembali` smallint(5) unsigned DEFAULT NULL,
  `keterangan` varchar(255) DEFAULT NULL,
  `status` tinyint(3) unsigned DEFAULT NULL COMMENT '0 = > Tidak Lengkap, 1 =>lengkap',
  PRIMARY KEY (`id`),
  KEY `td_bon_alat_detail_tr_bon_alat_id_foreign` (`tr_bon_alat_id`),
  KEY `td_bon_alat_detail_tr_barang_laboratorium_id_foreign` (`tr_barang_laboratorium_id`),
  KEY `td_bon_alat_detail_tr_kartu_stok_id_foreign` (`tr_kartu_stok_id`),
  CONSTRAINT `td_bon_alat_detail_tr_barang_laboratorium_id_foreign` FOREIGN KEY (`tr_barang_laboratorium_id`) REFERENCES `tr_barang_laboratorium` (`id`) ON DELETE CASCADE,
  CONSTRAINT `td_bon_alat_detail_tr_bon_alat_id_foreign` FOREIGN KEY (`tr_bon_alat_id`) REFERENCES `tr_bon_alat` (`id`) ON DELETE CASCADE,
  CONSTRAINT `td_bon_alat_detail_tr_kartu_stok_id_foreign` FOREIGN KEY (`tr_kartu_stok_id`) REFERENCES `tr_kartu_stok` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `td_hasil_praktek` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `kode` varchar(32) DEFAULT NULL,
  `jumlah` int(255) unsigned NOT NULL,
  `tr_barang_laboratorium_id` int(255) unsigned NOT NULL,
  `tr_serma_hasil_sisa_praktek_id` int(10) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `tr_kartu_stok_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `td_hasil_praktek_tr_serma_hasil_sisa_praktek_id_foreign` (`tr_serma_hasil_sisa_praktek_id`),
  CONSTRAINT `td_hasil_praktek_tr_serma_hasil_sisa_praktek_id_foreign` FOREIGN KEY (`tr_serma_hasil_sisa_praktek_id`) REFERENCES `tr_serma_hasil_sisa_praktek` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `td_hilang_rusak_detail` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `kode` varchar(32) DEFAULT NULL,
  `tr_barang_laboratorium_id` int(10) unsigned NOT NULL,
  `tr_hilang_rusak_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `jumlah_hilang_rusak` int(10) unsigned NOT NULL,
  `status` tinyint(3) unsigned DEFAULT 0,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `td_hilang_rusak_detail_tr_barang_laboratorium_id_foreign` (`tr_barang_laboratorium_id`),
  KEY `td_hilang_rusak_detail_tr_hilang_rusak_id_foreign` (`tr_hilang_rusak_id`),
  CONSTRAINT `td_hilang_rusak_detail_tr_barang_laboratorium_id_foreign` FOREIGN KEY (`tr_barang_laboratorium_id`) REFERENCES `tr_barang_laboratorium` (`id`) ON DELETE CASCADE,
  CONSTRAINT `td_hilang_rusak_detail_tr_hilang_rusak_id_foreign` FOREIGN KEY (`tr_hilang_rusak_id`) REFERENCES `tr_hilang_rusak` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `td_ijin_penggunaan_lbs_detail` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `kode` varchar(32) DEFAULT NULL,
  `jumlah` int(10) unsigned NOT NULL,
  `tr_ijin_penggunaan_lbs_id` int(10) unsigned NOT NULL,
  `tr_barang_laboratorium_id` int(10) unsigned NOT NULL,
  `tr_kartu_stok_id` int(10) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `keterangan` varchar(255) DEFAULT NULL,
  `td_satuan_id` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `td_ijin_penggunaan_lbs_detail_tr_ijin_penggunaan_lbs_id_foreign` (`tr_ijin_penggunaan_lbs_id`),
  KEY `td_ijin_penggunaan_lbs_detail_tr_barang_laboratorium_id_foreign` (`tr_barang_laboratorium_id`),
  KEY `td_ijin_penggunaan_lbs_detail_tr_kartu_stok_id_foreign` (`tr_kartu_stok_id`),
  CONSTRAINT `td_ijin_penggunaan_lbs_detail_tr_barang_laboratorium_id_foreign` FOREIGN KEY (`tr_barang_laboratorium_id`) REFERENCES `tr_barang_laboratorium` (`id`) ON DELETE CASCADE,
  CONSTRAINT `td_ijin_penggunaan_lbs_detail_tr_ijin_penggunaan_lbs_id_foreign` FOREIGN KEY (`tr_ijin_penggunaan_lbs_id`) REFERENCES `tr_ijin_penggunaan_lbs` (`id`) ON DELETE CASCADE,
  CONSTRAINT `td_ijin_penggunaan_lbs_detail_tr_kartu_stok_id_foreign` FOREIGN KEY (`tr_kartu_stok_id`) REFERENCES `tr_kartu_stok` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `td_kesiapan_praktek_detail` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `tr_barang_laboratorium_id` int(10) unsigned NOT NULL,
  `tr_kesiapan_praktek_id` int(10) unsigned NOT NULL,
  `jumlah` int(10) unsigned DEFAULT 0,
  `keterangan` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `kode` varchar(32) DEFAULT NULL,
  `tr_kartu_stok_id` int(10) unsigned DEFAULT NULL,
  `td_satuan_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `td_kesiapan_praktek_detail_tr_barang_laboratorium_id_foreign` (`tr_barang_laboratorium_id`),
  KEY `td_kesiapan_praktek_detail_tr_kesiapan_praktek_id_foreign` (`tr_kesiapan_praktek_id`),
  CONSTRAINT `td_kesiapan_praktek_detail_tr_barang_laboratorium_id_foreign` FOREIGN KEY (`tr_barang_laboratorium_id`) REFERENCES `tr_barang_laboratorium` (`id`) ON DELETE CASCADE,
  CONSTRAINT `td_kesiapan_praktek_detail_tr_kesiapan_praktek_id_foreign` FOREIGN KEY (`tr_kesiapan_praktek_id`) REFERENCES `tr_kesiapan_praktek` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `td_satuan` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `qty` int(10) unsigned DEFAULT NULL,
  `tm_satuan_id` smallint(5) unsigned DEFAULT NULL,
  `tm_barang_id` int(10) unsigned DEFAULT NULL,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `td_satuan_user_id_foreign` (`user_id`),
  KEY `td_satuan_tm_satuan_id_foreign` (`tm_satuan_id`),
  KEY `td_satuan_tm_barang_id_foreign` (`tm_barang_id`),
  CONSTRAINT `td_satuan_tm_barang_id_foreign` FOREIGN KEY (`tm_barang_id`) REFERENCES `tm_barang` (`id`) ON DELETE SET NULL,
  CONSTRAINT `td_satuan_tm_satuan_id_foreign` FOREIGN KEY (`tm_satuan_id`) REFERENCES `tm_satuan` (`id`) ON DELETE SET NULL,
  CONSTRAINT `td_satuan_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=78 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `td_sisa_praktek` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `kode` varchar(32) DEFAULT NULL,
  `jumlah` int(10) unsigned NOT NULL,
  `tr_barang_laboratorium_id` int(10) unsigned NOT NULL,
  `tr_kartu_stok_id` int(10) unsigned DEFAULT NULL,
  `tr_serma_hasil_sisa_praktek_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `td_satuan_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `td_sisa_praktek_tr_barang_laboratorium_id_foreign` (`tr_barang_laboratorium_id`),
  KEY `td_sisa_praktek_tr_serma_hasil_sisa_praktek_id_foreign` (`tr_serma_hasil_sisa_praktek_id`),
  KEY `td_sisa_praktek_tr_kartu_stok_id_foreign` (`tr_kartu_stok_id`),
  CONSTRAINT `td_sisa_praktek_tr_barang_laboratorium_id_foreign` FOREIGN KEY (`tr_barang_laboratorium_id`) REFERENCES `tr_barang_laboratorium` (`id`) ON DELETE CASCADE,
  CONSTRAINT `td_sisa_praktek_tr_kartu_stok_id_foreign` FOREIGN KEY (`tr_kartu_stok_id`) REFERENCES `tr_kartu_stok` (`id`) ON DELETE CASCADE,
  CONSTRAINT `td_sisa_praktek_tr_serma_hasil_sisa_praktek_id_foreign` FOREIGN KEY (`tr_serma_hasil_sisa_praktek_id`) REFERENCES `tr_serma_hasil_sisa_praktek` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `tm_barang` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nama_barang` varchar(64) NOT NULL,
  `spesifikasi` varchar(255) DEFAULT NULL,
  `keterangan` varchar(255) DEFAULT NULL,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `tm_satuan_id` smallint(5) unsigned DEFAULT NULL,
  `tm_jenis_barang_id` tinyint(3) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `qty` int(10) unsigned DEFAULT NULL,
  `kode_barang` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `tm_barang_user_id_foreign` (`user_id`),
  KEY `tm_barang_tm_satuan_id_foreign` (`tm_satuan_id`),
  KEY `tm_barang_tm_jenis_barang_id_foreign` (`tm_jenis_barang_id`),
  CONSTRAINT `tm_barang_tm_jenis_barang_id_foreign` FOREIGN KEY (`tm_jenis_barang_id`) REFERENCES `tm_jenis_barang` (`id`) ON DELETE SET NULL,
  CONSTRAINT `tm_barang_tm_satuan_id_foreign` FOREIGN KEY (`tm_satuan_id`) REFERENCES `tm_satuan` (`id`) ON DELETE SET NULL,
  CONSTRAINT `tm_barang_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=73 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `tm_jenis_barang` (
  `id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `jenis_barang` varchar(32) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `tm_jurusan` (
  `id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `kode` varchar(8) DEFAULT NULL,
  `jurusan` varchar(64) NOT NULL,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `tm_jurusan_user_id_foreign` (`user_id`),
  CONSTRAINT `tm_jurusan_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `tm_laboratorium` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `kode` varchar(32) NOT NULL,
  `laboratorium` varchar(64) NOT NULL,
  `tm_jurusan_id` tinyint(3) unsigned NOT NULL,
  `is_aktif` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `singkatan` varchar(255) DEFAULT NULL,
  `warna` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `tm_laboratorium_tm_jurusan_id_foreign` (`tm_jurusan_id`),
  CONSTRAINT `tm_laboratorium_tm_jurusan_id_foreign` FOREIGN KEY (`tm_jurusan_id`) REFERENCES `tm_jurusan` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `tm_matakuliah` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `kode` varchar(12) DEFAULT NULL,
  `matakuliah` varchar(64) NOT NULL,
  `is_aktif` tinyint(1) NOT NULL,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `tm_matakuliah_user_id_foreign` (`user_id`),
  CONSTRAINT `tm_matakuliah_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=175 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `tm_minggu` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `minggu_ke` tinyint(3) unsigned NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `tm_tahun_ajaran_id` tinyint(3) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `keterangan` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `tm_minggu_tm_tahun_ajaran_id_foreign` (`tm_tahun_ajaran_id`),
  CONSTRAINT `tm_minggu_tm_tahun_ajaran_id_foreign` FOREIGN KEY (`tm_tahun_ajaran_id`) REFERENCES `tm_tahun_ajaran` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `tm_program_studi` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `kode` varchar(12) DEFAULT NULL,
  `program_studi` varchar(64) NOT NULL,
  `tm_jurusan_id` tinyint(3) unsigned NOT NULL,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `tm_program_studi_tm_jurusan_id_foreign` (`tm_jurusan_id`),
  KEY `tm_program_studi_user_id_foreign` (`user_id`),
  CONSTRAINT `tm_program_studi_tm_jurusan_id_foreign` FOREIGN KEY (`tm_jurusan_id`) REFERENCES `tm_jurusan` (`id`) ON DELETE CASCADE,
  CONSTRAINT `tm_program_studi_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `tm_satuan` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `satuan` varchar(64) NOT NULL,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `tm_satuan_user_id_foreign` (`user_id`),
  CONSTRAINT `tm_satuan_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `tm_semester` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `semester` tinyint(3) unsigned NOT NULL,
  `is_genap` tinyint(1) NOT NULL,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `tm_tahun_ajaran_id` tinyint(3) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `tm_semester_user_id_foreign` (`user_id`),
  KEY `tm_semester_tm_tahun_ajaran_id_foreign` (`tm_tahun_ajaran_id`),
  CONSTRAINT `tm_semester_tm_tahun_ajaran_id_foreign` FOREIGN KEY (`tm_tahun_ajaran_id`) REFERENCES `tm_tahun_ajaran` (`id`) ON DELETE SET NULL,
  CONSTRAINT `tm_semester_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `tm_staff` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `kode` varchar(32) DEFAULT NULL,
  `nama` varchar(64) NOT NULL,
  `email` varchar(64) DEFAULT NULL,
  `no_hp` varchar(32) DEFAULT NULL,
  `foto` varchar(255) DEFAULT NULL,
  `is_aktif` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `tm_status_kepegawaian_id` tinyint(3) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `tm_staff_tm_status_kepegawaian_id_foreign` (`tm_status_kepegawaian_id`),
  CONSTRAINT `tm_staff_tm_status_kepegawaian_id_foreign` FOREIGN KEY (`tm_status_kepegawaian_id`) REFERENCES `tm_status_kepegawaian` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=121 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `tm_status_kepegawaian` (
  `id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `status_kepegawaian` varchar(32) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `tm_tahun_ajaran` (
  `id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `tahun_ajaran` varchar(10) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `is_genap` tinyint(3) unsigned DEFAULT NULL,
  `is_aktif` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `tr_barang_laboratorium` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `stok` int(10) unsigned NOT NULL,
  `tm_laboratorium_id` smallint(5) unsigned NOT NULL,
  `tm_barang_id` int(10) unsigned NOT NULL,
  `is_aktif` tinyint(1) unsigned NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `kode` varchar(32) DEFAULT NULL,
  `keterangan` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `tr_barang_laboratorium_tm_laboratorium_id_foreign` (`tm_laboratorium_id`),
  KEY `tr_barang_laboratorium_tm_barang_id_foreign` (`tm_barang_id`),
  CONSTRAINT `tr_barang_laboratorium_tm_barang_id_foreign` FOREIGN KEY (`tm_barang_id`) REFERENCES `tm_barang` (`id`) ON DELETE CASCADE,
  CONSTRAINT `tr_barang_laboratorium_tm_laboratorium_id_foreign` FOREIGN KEY (`tm_laboratorium_id`) REFERENCES `tm_laboratorium` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=88 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `tr_bon_alat` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `kode` varchar(32) DEFAULT NULL,
  `is_pegawai` tinyint(1) DEFAULT NULL,
  `tm_staff_id` int(10) unsigned DEFAULT NULL,
  `nama` varchar(255) DEFAULT NULL,
  `nim` varchar(255) DEFAULT NULL,
  `golongan_kelompok` varchar(255) DEFAULT NULL,
  `tm_laboratorium_id` smallint(5) unsigned DEFAULT NULL,
  `tanggal_pinjam` datetime DEFAULT NULL,
  `tr_member_laboratorium_id_pinjam` smallint(5) unsigned DEFAULT NULL,
  `tanggal_kembali` datetime DEFAULT NULL,
  `kembali_is_pegawai` tinyint(3) unsigned DEFAULT NULL,
  `kembali_nama` varchar(64) DEFAULT NULL,
  `kembali_nim` varchar(15) DEFAULT NULL,
  `kembali_golongan_kelompok` varchar(64) DEFAULT NULL,
  `tr_member_laboratorium_id_kembali` smallint(5) unsigned DEFAULT NULL,
  `status` tinyint(3) unsigned DEFAULT NULL COMMENT '1. Sedang Dipinjam, 2. Kembali',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `kembali_tm_staff_id` int(10) unsigned DEFAULT NULL,
  `tm_staff_id_pembimbing` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `tr_bon_alat_tm_staff_id_foreign` (`tm_staff_id`),
  KEY `tr_bon_alat_tr_member_laboratorium_id_pinjam_foreign` (`tr_member_laboratorium_id_pinjam`),
  KEY `tr_bon_alat_tr_member_laboratorium_id_kembali_foreign` (`tr_member_laboratorium_id_kembali`),
  KEY `tr_bon_alat_tr_laboratorium_id_foreign` (`tm_laboratorium_id`),
  CONSTRAINT `tr_bon_alat_tm_staff_id_foreign` FOREIGN KEY (`tm_staff_id`) REFERENCES `tm_staff` (`id`) ON DELETE SET NULL,
  CONSTRAINT `tr_bon_alat_tr_laboratorium_id_foreign` FOREIGN KEY (`tm_laboratorium_id`) REFERENCES `tm_laboratorium` (`id`) ON DELETE SET NULL,
  CONSTRAINT `tr_bon_alat_tr_member_laboratorium_id_kembali_foreign` FOREIGN KEY (`tr_member_laboratorium_id_kembali`) REFERENCES `tr_member_laboratorium` (`id`) ON DELETE SET NULL,
  CONSTRAINT `tr_bon_alat_tr_member_laboratorium_id_pinjam_foreign` FOREIGN KEY (`tr_member_laboratorium_id_pinjam`) REFERENCES `tr_member_laboratorium` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `tr_hilang_rusak` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `kode` varchar(32) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `nim` varchar(255) NOT NULL,
  `golongan_kelompok` varchar(255) NOT NULL,
  `tanggal_sanggup` date NOT NULL,
  `tr_member_laboratorium_id` smallint(5) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `status` tinyint(3) unsigned DEFAULT NULL,
  `tm_laboratorium_id` smallint(5) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `tr_hilang_rusak_tr_member_laboratorium_id_foreign` (`tr_member_laboratorium_id`),
  KEY `tr_hilang_rusak_tr_laboratorium_id_foreign` (`tm_laboratorium_id`),
  CONSTRAINT `tr_hilang_rusak_tr_laboratorium_id_foreign` FOREIGN KEY (`tm_laboratorium_id`) REFERENCES `tm_laboratorium` (`id`) ON DELETE CASCADE,
  CONSTRAINT `tr_hilang_rusak_tr_member_laboratorium_id_foreign` FOREIGN KEY (`tr_member_laboratorium_id`) REFERENCES `tr_member_laboratorium` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `tr_ijin_penggunaan_lbs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `kode` varchar(32) DEFAULT NULL,
  `is_pegawai` tinyint(1) NOT NULL,
  `tm_staff_id` int(10) unsigned DEFAULT NULL,
  `nama` varchar(255) DEFAULT NULL,
  `nim` varchar(255) DEFAULT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `tm_staff_id_pembimbing` int(10) unsigned DEFAULT NULL,
  `tm_program_studi_id` smallint(5) unsigned DEFAULT NULL,
  `tr_member_laboratorium_id` smallint(5) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `status` tinyint(3) unsigned DEFAULT NULL,
  `tm_laboratorium_id` smallint(5) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `tr_ijin_penggunaan_lbs_tm_staff_id_foreign` (`tm_staff_id`),
  KEY `tr_ijin_penggunaan_lbs_tm_staff_id_pembimbing_foreign` (`tm_staff_id_pembimbing`),
  KEY `tr_ijin_penggunaan_lbs_tm_program_studi_id_foreign` (`tm_program_studi_id`),
  KEY `tr_ijin_penggunaan_lbs_tr_member_laboratorium_id_foreign` (`tr_member_laboratorium_id`),
  KEY `tr_ijin_penggunaan_lbs_tm_laboratorium_id_foreign` (`tm_laboratorium_id`),
  CONSTRAINT `tr_ijin_penggunaan_lbs_tm_laboratorium_id_foreign` FOREIGN KEY (`tm_laboratorium_id`) REFERENCES `tm_laboratorium` (`id`) ON DELETE CASCADE,
  CONSTRAINT `tr_ijin_penggunaan_lbs_tm_program_studi_id_foreign` FOREIGN KEY (`tm_program_studi_id`) REFERENCES `tm_program_studi` (`id`) ON DELETE SET NULL,
  CONSTRAINT `tr_ijin_penggunaan_lbs_tm_staff_id_foreign` FOREIGN KEY (`tm_staff_id`) REFERENCES `tm_staff` (`id`) ON DELETE SET NULL,
  CONSTRAINT `tr_ijin_penggunaan_lbs_tm_staff_id_pembimbing_foreign` FOREIGN KEY (`tm_staff_id_pembimbing`) REFERENCES `tm_staff` (`id`) ON DELETE SET NULL,
  CONSTRAINT `tr_ijin_penggunaan_lbs_tr_member_laboratorium_id_foreign` FOREIGN KEY (`tr_member_laboratorium_id`) REFERENCES `tr_member_laboratorium` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `tr_kajur` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `tm_jurusan_id` tinyint(3) unsigned NOT NULL,
  `tm_staff_id` int(10) unsigned NOT NULL,
  `is_aktif` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `tr_kajur_tm_jurusan_id_foreign` (`tm_jurusan_id`),
  KEY `tr_kajur_tm_staff_id_foreign` (`tm_staff_id`),
  CONSTRAINT `tr_kajur_tm_jurusan_id_foreign` FOREIGN KEY (`tm_jurusan_id`) REFERENCES `tm_jurusan` (`id`) ON DELETE CASCADE,
  CONSTRAINT `tr_kajur_tm_staff_id_foreign` FOREIGN KEY (`tm_staff_id`) REFERENCES `tm_staff` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `tr_kaprodi` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `tm_program_studi_id` smallint(5) unsigned NOT NULL,
  `tm_staff_id` int(10) unsigned NOT NULL,
  `is_aktif` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `tr_kaprodi_tm_program_studi_id_foreign` (`tm_program_studi_id`),
  KEY `tr_kaprodi_tm_staff_id_foreign` (`tm_staff_id`),
  CONSTRAINT `tr_kaprodi_tm_program_studi_id_foreign` FOREIGN KEY (`tm_program_studi_id`) REFERENCES `tm_program_studi` (`id`) ON DELETE CASCADE,
  CONSTRAINT `tr_kaprodi_tm_staff_id_foreign` FOREIGN KEY (`tm_staff_id`) REFERENCES `tm_staff` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `tr_kartu_stok` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tr_barang_laboratorium_id` int(10) unsigned NOT NULL,
  `is_stok_in` tinyint(1) NOT NULL,
  `qty` int(10) unsigned NOT NULL DEFAULT 0,
  `stok` int(10) unsigned NOT NULL,
  `tr_member_laboratorium_id` smallint(5) unsigned DEFAULT NULL,
  `tr_usulan_kebutuhan_detail_id` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `kode` varchar(32) DEFAULT NULL,
  `keterangan` varchar(255) DEFAULT NULL,
  `keterangan_sys` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `tr_kartu_stok_tr_member_laboratorium_id_foreign` (`tr_member_laboratorium_id`),
  KEY `tr_kartu_stok_tr_barang_laboratorium_id_foreign` (`tr_barang_laboratorium_id`),
  KEY `tr_kartu_stok_tr_usulan_kebutuhan_detail_id_foreign` (`tr_usulan_kebutuhan_detail_id`),
  CONSTRAINT `tr_kartu_stok_tr_barang_laboratorium_id_foreign` FOREIGN KEY (`tr_barang_laboratorium_id`) REFERENCES `tr_barang_laboratorium` (`id`) ON DELETE CASCADE,
  CONSTRAINT `tr_kartu_stok_tr_member_laboratorium_id_foreign` FOREIGN KEY (`tr_member_laboratorium_id`) REFERENCES `tr_member_laboratorium` (`id`) ON DELETE CASCADE,
  CONSTRAINT `tr_kartu_stok_tr_usulan_kebutuhan_detail_id_foreign` FOREIGN KEY (`tr_usulan_kebutuhan_detail_id`) REFERENCES `tr_usulan_kebutuhan_detail` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=378 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `tr_kesiapan_praktek` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `kode` varchar(32) NOT NULL,
  `tr_matakuliah_dosen_id` int(10) unsigned DEFAULT NULL,
  `tr_matakuliah_semester_prodi_id` int(10) unsigned DEFAULT NULL,
  `tm_staff_id` int(10) unsigned DEFAULT NULL,
  `rekomendasi` tinyint(3) unsigned DEFAULT NULL COMMENT '1=>Siapkan dan Lanjutkan, 2=>Dimodifikasi, 3=>Diganti Acara Praktek yang Lain, 4=>Ditunda',
  `tr_member_laboratorium_id` smallint(6) unsigned DEFAULT NULL,
  `tm_minggu_id` smallint(6) unsigned DEFAULT NULL,
  `tanggal` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `tm_laboratorium_id` smallint(5) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `tr_kesiapan_praktek_tr_matakuliah_dosen_id_foreign` (`tr_matakuliah_dosen_id`),
  KEY `tr_kesiapan_praktek_tm_staff_id_foreign` (`tm_staff_id`),
  KEY `tr_matakuliah_semester_prodi_id` (`tr_matakuliah_semester_prodi_id`),
  KEY `tr_kesiapan_praktek_tr_member_laboratorium_id` (`tr_member_laboratorium_id`),
  KEY `tr_kesiapan_praktek_tm_minggu_id_foreign` (`tm_minggu_id`),
  KEY `tr_kesiapan_praktek_tr_laboratorium_id_foreign` (`tm_laboratorium_id`),
  CONSTRAINT `tr_kesiapan_praktek_tm_minggu_id_foreign` FOREIGN KEY (`tm_minggu_id`) REFERENCES `tm_minggu` (`id`) ON DELETE CASCADE,
  CONSTRAINT `tr_kesiapan_praktek_tm_staff_id_foreign` FOREIGN KEY (`tm_staff_id`) REFERENCES `tm_staff` (`id`) ON DELETE CASCADE,
  CONSTRAINT `tr_kesiapan_praktek_tr_laboratorium_id_foreign` FOREIGN KEY (`tm_laboratorium_id`) REFERENCES `tm_laboratorium` (`id`) ON DELETE CASCADE,
  CONSTRAINT `tr_kesiapan_praktek_tr_matakuliah_dosen_id_foreign` FOREIGN KEY (`tr_matakuliah_dosen_id`) REFERENCES `tr_matakuliah_dosen` (`id`) ON DELETE CASCADE,
  CONSTRAINT `tr_kesiapan_praktek_tr_member_laboratorium_id` FOREIGN KEY (`tr_member_laboratorium_id`) REFERENCES `tr_member_laboratorium` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `tr_matakuliah_dosen` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tr_matakuliah_semester_prodi_id` int(10) unsigned DEFAULT NULL,
  `tm_staff_id` int(10) unsigned DEFAULT NULL,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `tr_matakuliah_dosen_tr_matakuliah_semester_prodi_id_foreign` (`tr_matakuliah_semester_prodi_id`),
  KEY `tr_matakuliah_dosen_tm_staff_id_foreign` (`tm_staff_id`),
  KEY `tr_matakuliah_dosen_user_id_foreign` (`user_id`),
  CONSTRAINT `tr_matakuliah_dosen_tm_staff_id_foreign` FOREIGN KEY (`tm_staff_id`) REFERENCES `tm_staff` (`id`) ON DELETE SET NULL,
  CONSTRAINT `tr_matakuliah_dosen_tr_matakuliah_semester_prodi_id_foreign` FOREIGN KEY (`tr_matakuliah_semester_prodi_id`) REFERENCES `tr_matakuliah_semester_prodi` (`id`) ON DELETE SET NULL,
  CONSTRAINT `tr_matakuliah_dosen_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=156 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `tr_matakuliah_semester_prodi` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tm_program_studi_id` smallint(5) unsigned DEFAULT NULL,
  `tm_semester_id` smallint(5) unsigned DEFAULT NULL,
  `tm_matakuliah_id` smallint(5) unsigned DEFAULT NULL,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `jumlah_golongan` tinyint(3) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `tr_matakuliah_semester_prodi_tm_matakuliah_id_foreign` (`tm_matakuliah_id`),
  KEY `tr_matakuliah_semester_prodi_tm_program_studi_id_foreign` (`tm_program_studi_id`),
  KEY `tr_matakuliah_semester_prodi_tm_semester_id_foreign` (`tm_semester_id`),
  KEY `tr_matakuliah_semester_prodi_user_id_foreign` (`user_id`),
  CONSTRAINT `tr_matakuliah_semester_prodi_tm_matakuliah_id_foreign` FOREIGN KEY (`tm_matakuliah_id`) REFERENCES `tm_matakuliah` (`id`) ON DELETE SET NULL,
  CONSTRAINT `tr_matakuliah_semester_prodi_tm_program_studi_id_foreign` FOREIGN KEY (`tm_program_studi_id`) REFERENCES `tm_program_studi` (`id`) ON DELETE SET NULL,
  CONSTRAINT `tr_matakuliah_semester_prodi_tm_semester_id_foreign` FOREIGN KEY (`tm_semester_id`) REFERENCES `tm_semester` (`id`) ON DELETE SET NULL,
  CONSTRAINT `tr_matakuliah_semester_prodi_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=199 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `tr_member_laboratorium` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `tm_laboratorium_id` smallint(5) unsigned NOT NULL,
  `tm_staff_id` int(10) unsigned NOT NULL,
  `is_kalab` tinyint(1) NOT NULL DEFAULT 0,
  `is_aktif` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `kode` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `tr_member_laboratorium_tm_laboratorium_id_foreign` (`tm_laboratorium_id`),
  KEY `tr_member_laboratorium_tm_staff_id_foreign` (`tm_staff_id`),
  CONSTRAINT `tr_member_laboratorium_tm_laboratorium_id_foreign` FOREIGN KEY (`tm_laboratorium_id`) REFERENCES `tm_laboratorium` (`id`) ON DELETE CASCADE,
  CONSTRAINT `tr_member_laboratorium_tm_staff_id_foreign` FOREIGN KEY (`tm_staff_id`) REFERENCES `tm_staff` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=66 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `tr_penggantian_praktek` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `jadwal_asli` datetime NOT NULL,
  `jadwal_ganti` datetime NOT NULL,
  `acara_praktek` varchar(255) NOT NULL,
  `tr_kaprodi_id` smallint(5) unsigned NOT NULL,
  `tr_member_laboratorium_id` smallint(5) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `kode` varchar(32) DEFAULT NULL,
  `tr_matakuliah_semester_prodi_id` int(11) unsigned DEFAULT NULL,
  `tm_staff_id` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `tr_penggantian_praktek_tr_kaprodi_id_foreign` (`tr_kaprodi_id`),
  KEY `tr_penggantian_praktek_tr_member_laboratorium_id_foreign` (`tr_member_laboratorium_id`),
  KEY `tr_penggantian_praktek_tr_matakuliah_semester_prodi_id_foreign` (`tr_matakuliah_semester_prodi_id`),
  KEY `tr_penggantian_praktek_tm_staff_id_foreign` (`tm_staff_id`),
  CONSTRAINT `tr_penggantian_praktek_tm_staff_id_foreign` FOREIGN KEY (`tm_staff_id`) REFERENCES `tm_staff` (`id`),
  CONSTRAINT `tr_penggantian_praktek_tr_kaprodi_id_foreign` FOREIGN KEY (`tr_kaprodi_id`) REFERENCES `tr_kaprodi` (`id`) ON DELETE CASCADE,
  CONSTRAINT `tr_penggantian_praktek_tr_matakuliah_semester_prodi_id_foreign` FOREIGN KEY (`tr_matakuliah_semester_prodi_id`) REFERENCES `tr_matakuliah_semester_prodi` (`id`) ON DELETE CASCADE,
  CONSTRAINT `tr_penggantian_praktek_tr_member_laboratorium_id_foreign` FOREIGN KEY (`tr_member_laboratorium_id`) REFERENCES `tr_member_laboratorium` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `tr_serma_hasil_sisa_praktek` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `kode` varchar(32) NOT NULL,
  `tr_matakuliah_dosen_id` int(10) unsigned DEFAULT NULL,
  `tr_member_laboratorium_id` smallint(5) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `tm_minggu_id` smallint(5) unsigned DEFAULT NULL,
  `tanggal` date DEFAULT NULL,
  `acara_praktek` text DEFAULT NULL,
  `tm_laboratorium_id` smallint(5) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `tr_serma_hasil_sisa_praktek_tr_matakuliah_dosen_id_foreign` (`tr_matakuliah_dosen_id`),
  KEY `tr_serma_hasil_sisa_praktek_tr_member_laboratorium_id_foreign` (`tr_member_laboratorium_id`),
  KEY `tr_serma_hasil_sisa_praktek_tm_minggu_id_foreign` (`tm_minggu_id`),
  KEY `tr_serma_hasil_sisa_praktek_tr_laboratorium_id_foreign` (`tm_laboratorium_id`),
  CONSTRAINT `tr_serma_hasil_sisa_praktek_tm_minggu_id_foreign` FOREIGN KEY (`tm_minggu_id`) REFERENCES `tm_minggu` (`id`) ON DELETE SET NULL,
  CONSTRAINT `tr_serma_hasil_sisa_praktek_tr_laboratorium_id_foreign` FOREIGN KEY (`tm_laboratorium_id`) REFERENCES `tm_laboratorium` (`id`) ON DELETE CASCADE,
  CONSTRAINT `tr_serma_hasil_sisa_praktek_tr_matakuliah_dosen_id_foreign` FOREIGN KEY (`tr_matakuliah_dosen_id`) REFERENCES `tr_matakuliah_dosen` (`id`) ON DELETE CASCADE,
  CONSTRAINT `tr_serma_hasil_sisa_praktek_tr_member_laboratorium_id_foreign` FOREIGN KEY (`tr_member_laboratorium_id`) REFERENCES `tr_member_laboratorium` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `tr_usulan_kebutuhan` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `kode` varchar(32) DEFAULT NULL,
  `acara_praktek` varchar(255) NOT NULL,
  `jml_kel` tinyint(3) unsigned NOT NULL,
  `keterangan` varchar(255) DEFAULT NULL,
  `status` tinyint(3) unsigned NOT NULL COMMENT '1 => pengajuan, 2 =>review tim bahan, 3 => cetak tim bahan, 4 => acc, 5=>deliver, 6 =>selesai ',
  `tm_minggu_id` smallint(5) unsigned DEFAULT NULL,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `tr_matakuliah_dosen_id` int(10) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `tanggal` date NOT NULL,
  `jml_gol` tinyint(4) NOT NULL,
  `tm_laboratorium_id` smallint(5) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `tr_usulan_kebutuhan_user_id_foreign` (`user_id`),
  KEY `tr_usulan_kebutuhan_tr_matakuliah_dosen_id_foreign` (`tr_matakuliah_dosen_id`),
  KEY `tr_usulan_kebutuhan_tm_laboratorium_id_foreign` (`tm_laboratorium_id`),
  KEY `tr_usulan_kebutuhan_tm_minggu_id_foreign` (`tm_minggu_id`),
  CONSTRAINT `tr_usulan_kebutuhan_tm_laboratorium_id_foreign` FOREIGN KEY (`tm_laboratorium_id`) REFERENCES `tm_laboratorium` (`id`) ON DELETE SET NULL,
  CONSTRAINT `tr_usulan_kebutuhan_tm_minggu_id_foreign` FOREIGN KEY (`tm_minggu_id`) REFERENCES `tm_minggu` (`id`) ON DELETE CASCADE,
  CONSTRAINT `tr_usulan_kebutuhan_tr_matakuliah_dosen_id_foreign` FOREIGN KEY (`tr_matakuliah_dosen_id`) REFERENCES `tr_matakuliah_dosen` (`id`) ON DELETE SET NULL,
  CONSTRAINT `tr_usulan_kebutuhan_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `tr_usulan_kebutuhan_detail` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `keb_kel` tinyint(3) unsigned NOT NULL,
  `total_keb` int(10) unsigned NOT NULL,
  `keb_acc` int(10) unsigned DEFAULT NULL,
  `tm_barang_id` int(10) unsigned DEFAULT NULL,
  `td_satuan_id` int(10) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `tr_usulan_kebutuhan_id` bigint(20) unsigned NOT NULL,
  `keterangan` varchar(128) DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `tr_usulan_kebutuhan_detail_tm_barang_id_foreign` (`tm_barang_id`),
  KEY `tr_usulan_kebutuhan_detail_td_satuan_id_foreign` (`td_satuan_id`),
  KEY `tr_usulan_kebutuhan_detail_tr_usulan_kebutuhan_id_foreign` (`tr_usulan_kebutuhan_id`),
  CONSTRAINT `tr_usulan_kebutuhan_detail_td_satuan_id_foreign` FOREIGN KEY (`td_satuan_id`) REFERENCES `td_satuan` (`id`) ON DELETE SET NULL,
  CONSTRAINT `tr_usulan_kebutuhan_detail_tm_barang_id_foreign` FOREIGN KEY (`tm_barang_id`) REFERENCES `tm_barang` (`id`) ON DELETE SET NULL,
  CONSTRAINT `tr_usulan_kebutuhan_detail_tr_usulan_kebutuhan_id_foreign` FOREIGN KEY (`tr_usulan_kebutuhan_id`) REFERENCES `tr_usulan_kebutuhan` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) NOT NULL,
  `email` varchar(191) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) NOT NULL,
  `google_id` text DEFAULT NULL,
  `avatar` text DEFAULT NULL,
  `role` int(10) unsigned DEFAULT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `is_aktif` tinyint(3) unsigned NOT NULL,
  `tm_staff_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=121 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;