-- Remedial Basis Data Javiare Samuel XI RPL

-- Tabel tbl_prodi
CREATE TABLE tbl_prodi (
  kode_prodi VARCHAR(5) PRIMARY KEY,
  nama_prodi VARCHAR(50)
);

INSERT INTO tbl_prodi (kode_prodi, nama_prodi) VALUES
('A01', 'Sistem Komputer'),
('A02', 'Sistem Informasi'),
('A03', 'Teknik Informatika');
-- Tabel tbl_mhs
CREATE TABLE tbl_mhs (
  nim VARCHAR(10) PRIMARY KEY,
  nama_mhs VARCHAR(50),
  alamat VARCHAR(50),
  umur INT,
  tahun_lulus INT,
  kode_prodi VARCHAR(5),
  FOREIGN KEY (kode_prodi) REFERENCES tbl_prodi(kode_prodi)
);
INSERT INTO tbl_mhs (nim, nama_mhs, alamat, umur, tahun_lulus, kode_prodi) VALUES
('04102001', 'Nur Qomari', 'Surabaya', 25, 2009, 'A01'),
('04102002', 'Akham Ahdan', 'Surabaya', 23, 2007, 'A01'),
('04102003', 'Junior', 'Sidoarjo', 22, 2007, 'A01'),
('04202001', 'Eko Prasetyo', 'Sidoarjo', 20, 2006, 'A02'),
('04202002', 'Hadi Irawan', 'Gresik', 26, 2009, 'A02'),
('04202003', 'Badruzzaman', 'Surabaya', 27, 2009, 'A02'),
('04202004', 'Budi Irawan', 'Surabaya', 23, 2007, 'A02');

-- Menampilkan mahasiswa umur 25 kebawah 
SELECT * FROM tbl_mhs
WHERE umur <= 25;

-- Menampilkan mahasiswa yang lulus tahun 2009
SELECT COUNT(*) AS total_mahasiswa
FROM tbl_mhs
WHERE tahun_lulus = 2009;

-- Menampilkan data mahasiswa yang paling sedikit
SELECT p.kode_prodi, p.nama_prodi
FROM tbl_prodi p
WHERE (
  SELECT COUNT(*)
  FROM tbl_mhs m
  WHERE m.kode_prodi = p.kode_prodi
) = (
  SELECT MIN(jumlah)
  FROM (
    SELECT COUNT(*) AS jumlah
    FROM tbl_mhs
    GROUP BY kode_prodi
  ) AS subquery
);

-- Menampilkan data mahasiswa yang paling banyak
SELECT p.kode_prodi, p.nama_prodi
FROM tbl_prodi p
WHERE (
  SELECT COUNT(*)
  FROM tbl_mhs m
  WHERE m.kode_prodi = p.kode_prodi
) = (
  SELECT MAX(jumlah)
  FROM (
    SELECT COUNT(*) AS jumlah
    FROM tbl_mhs
    GROUP BY kode_prodi
  ) AS subquery
);

-- Menampilkan keyword Irawan
SELECT * FROM tbl_mhs
WHERE nama_mhs LIKE '%Irawan%';

-- Menampilkan berdasarkan Alamat
SELECT alamat, COUNT(*) AS jumlah_mahasiswa
FROM tbl_mhs
GROUP BY alamat;

-- Memasukkan 1 record baru Mahasiswa
INSERT INTO tbl_mhs (nim, nama_mhs, alamat, umur, tahun_lulus, kode_prodi)
VALUES ('04302001', 'Ajus Kresna', 'Bali', 22, 2024, 'A03');

-- Mengubah nama jadi Gunawan Susilo
UPDATE tbl_mhs
SET nama_mhs = 'Gunawan Susilo'
WHERE nim = '04302001';

-- Menghapus data Gunawan Susilo
DELETE FROM tbl_mhs
WHERE nim = '04302001';

-- Menggabung dua data
SELECT m.nama_mhs, p.nama_prodi
FROM tbl_mhs m
JOIN tbl_prodi p ON m.kode_prodi = p.kode_prodi;
