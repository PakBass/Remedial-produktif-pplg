
-- Membuat tabel tbl_mhs
CREATE TABLE tbl_mhs (
    nim VARCHAR(10) PRIMARY KEY,
    nama_mhs VARCHAR(100),
    alamat VARCHAR(100),
    umur INT,
    tahun_lulus YEAR,
    kode_prodi VARCHAR(10)
);

-- Menambahkan data awal
INSERT INTO tbl_mhs (nim, nama_mhs, alamat, umur, tahun_lulus, kode_prodi) VALUES
('04102001', 'Nur Qomari', 'Surabaya', 25, 2009, 'A01'),
('04102002', 'Akham Ahdan', 'Surabaya', 23, 2007, 'A01'),
('04102003', 'Junior', 'Sidoarjo', 22, 2007, 'A01'),
('04202001', 'Eko Prasetyo', 'Sidoarjo', 20, 2006, 'A02'),
('04202002', 'Hadi Irawan', 'Gresik', 26, 2009, 'A02'),
('04202003', 'Badruzzaman', 'Surabaya', 27, 2009, 'A02'),
('04202004', 'Budi Irawan', 'Surabaya', 23, 2007, 'A02');

-- 1. tampilkan data mahasiswa yang memiliki umur 25 tahun kebawah
select * from tbl_mhs where umur <= 25;

-- 2. Tampilkan Total Mahasiswa yang lulus pada tahun 2009?
select count(*) as total_mahasiswa_2009 from tbl_mhs where tahun_lulus = 2009;

-- 3.	Tampilkan Data Program Studi yang Jumlah Mahasiswanya paling sedikit (MIN &  SUB QUERY)?…
 select MIN(jumlah) from ( select count(*) as jumlah FROM tbl_mhs group by kode_prodi ) as subquery;

--  4.	Tampilkan Data Program Studi yang Jumlah Mahasiswanya paling banyak (MAX & SUB QUERY)?… 
 SELECT kode_prodi, COUNT(*) AS jumlah_mhs FROM tbl_mhs GROUP BY kode_prodi HAVING COUNT(*) = (     SELECT MAX(jumlah)     FROM (         SELECT COUNT(*) AS jumlah         FROM tbl_mhs         GROUP BY kode_prodi     ) AS sub );

--  5.	Tampilkan Data Mahasiswa yang Memiliki keyword “Irawan”?… 
 select * from  tbl_mhs where  nama_mhs like '%Irawan';

--  6.	Tampilkan Jumlah Data Mahasiswa Berdasarkan Alamat (GROUP)?… 
 select alamat, count(*) as jumlah_mhs from tbl_mhs group by alamat;

--  7.	Masukkan 1 record baru pada table Mahasiswa?… 
 insert into tbl_mhs (nim, nama_mhs, alamat, umur, tahun_lulus, kode_prodi) values ('04402011', 'Bagus Joshua', 'Balikpapan', '17', '2024', 'A03');

--  8.	Ganti Nama Mahasiswa yang baru Anda masukkan tersebut manjadi “Gunawan Susilo”?… 
 update tbl_mhs set nama_mhs = 'Gunawan Susil0' where nim = '4402011';

--  9.	Hapus Data yang baru Anda masukkan tersebut?… 
 delete from tbl_mhs where nim = '4402011';

--  10.	Tampilkan Nama Mahasiswa dan Nama Program Studi dengan Penggabungan Dua Tabel (JOIN)?… 
 select m.nama_mhs, p.nama_prodi from tbl_mhs m join tbl_prodi p on m.kode_prodi = p.kode_prodi;
  
