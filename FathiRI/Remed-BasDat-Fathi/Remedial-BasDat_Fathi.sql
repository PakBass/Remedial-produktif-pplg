--Langkah-Langkah REMEDIAL-BASDAT
--1. Membuat Database

CREATE DATABASE db_remedial;
USE db_remedial;


--2. Membuat Tabel tbl_prodi dan tbl_mhs

CREATE TABLE tbl_prodi (
    kode_prodi VARCHAR(10) PRIMARY KEY,
    nama_prodi VARCHAR(50)
);

CREATE TABLE tbl_mhs (
    nim VARCHAR(10) PRIMARY KEY,
    nama_mhs VARCHAR(50),
    alamat VARCHAR(50),
    umur INT,
    tahun_lulus INT,
    kode_prodi VARCHAR(10),
    FOREIGN KEY (kode_prodi) REFERENCES tbl_prodi(kode_prodi)
);


--3. Mengisi Data Awal

--Tabel tbl_prodi:

INSERT INTO tbl_prodi (kode_prodi, nama_prodi) VALUES
('A01', 'Sistem Komputer'),
('A02', 'Sistem Informasi'),
('A03', 'Teknik Informatika');

--Tabel tbl_mhs:

INSERT INTO tbl_mhs (nim, nama_mhs, alamat, umur, tahun_lulus, kode_prodi) VALUES
('04102001', 'Nur Qomari', 'Surabaya', 25, 2009, 'A01'),
('04102002', 'Akham Akhdan', 'Surabaya', 23, 2007, 'A01'),
('04102003', 'Junior', 'Sidoarjo', 22, 2007, 'A01'),
('04202001', 'Eko Prasetyo', 'Sidoarjo', 26, 2006, 'A02'),
('04202002', 'Hadi Irawan', 'Gresik', 26, 2009, 'A02'),
('04202003', 'Badruzzaman', 'Surabaya', 25, 2009, 'A03'),
('04202004', 'Budi Irawan', 'Surabaya', 23, 2007, 'A02');

--SOAL :
--1. Tampilkan Data Mahasiswa yang memiliki umur 25 tahun kebawah?..
--2. Tampilkan Total Mahasiswa yang lulus pada tahun 2009?…
--3. Tampilkan Data Program Studi yang Jumlah Mahasiswanya paling sedikit (MIN & SUB QUERY)?…
--4. Tampilkan Data Program Studi yang Jumlah Mahasiswanya paling banyak (MAX & SUB QUERY)?…
--5. Tampilkan Data Mahasiswa yang Memiliki keyword “Irawan”?…
--6. Tampilkan Jumlah Data Mahasiswa Berdasarkan Alamat (GROUP)?…
--7. Masukkan 1 record baru pada table Mahasiswa?…
--8. Ganti Nama Mahasiswa yang baru Anda masukkan tersebut manjadi “Gunawan Susilo”?…
--9. Hapus Data yang baru Anda masukkan tersebut?…
--10. Tampilkan Nama Mahasiswa dan Nama Program Studi dengan Penggabungan Dua Tabel (JOIN)?…

--JAWABAN :

--1. Data Mahasiswa umur ≤ 25
SELECT * FROM tbl_mhs WHERE umur <= 25;


--2. Total Mahasiswa yang lulus tahun 2009
SELECT COUNT(*) AS total_mahasiswa FROM tbl_mhs WHERE tahun_lulus = 2009;



--3. Prodi dengan Jumlah Mahasiswa Paling Sedikit
SELECT kode_prodi, COUNT(*) AS jumlah
FROM tbl_mhs
GROUP BY kode_prodi
HAVING COUNT(*) = (
    SELECT MIN(jumlah)
    FROM (
        SELECT COUNT(*) AS jumlah
        FROM tbl_mhs
        GROUP BY kode_prodi
    ) AS sub;
);


--4. Prodi dengan Jumlah Mahasiswa Paling Banyak
SELECT kode_prodi, COUNT(*) AS jumlah
FROM tbl_mhs
GROUP BY kode_prodi
HAVING COUNT(*) = (
    SELECT MAX(jumlah)
    FROM (
        SELECT COUNT(*) AS jumlah
        FROM tbl_mhs
        GROUP BY kode_prodi
    ) AS sub;
);


--5. Mahasiswa dengan nama mengandung “Irawan”
SELECT * FROM tbl_mhs WHERE nama_mhs LIKE '%Irawan%';


--6. Jumlah Mahasiswa Berdasarkan Alamat
SELECT alamat, COUNT(*) AS jumlah_mahasiswa
FROM tbl_mhs
GROUP BY alamat;


--7. Insert 1 record baru
INSERT INTO tbl_mhs (nim, nama_mhs, alamat, umur, tahun_lulus, kode_prodi)
VALUES ('04202005', 'Susilo', 'Malang', 24, 2008, 'A03');


--8. Update nama menjadi “Gunawan Susilo”
UPDATE tbl_mhs
SET nama_mhs = 'Gunawan Susilo'
WHERE nim = '04202005';


--9. Hapus data mahasiswa baru
DELETE FROM tbl_mhs
WHERE nim = '04202005';


--10. JOIN: Nama Mahasiswa + Nama Program Studi
SELECT m.nama_mhs, p.nama_prodi
FROM tbl_mhs m
JOIN tbl_prodi p ON m.kode_prodi = p.kode_prodi;