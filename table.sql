SHOW ENGINES;
SHOW TABLES;

DESCRIBE nama_tabel;
DESC nama_tabel;
SHOW CREATE TABLE nama_tabel;



--membuat table :

CREATE TABLE barang (
kode INT,
nama VARCHAR (100),
harga INT,
jumlah INT,
) ENGINE = InnoDB;


ALTER TABLE barang

          ADD COLUMN nama_column TEXT,

          DROP COLUMN nama,

          RENAME COLUMN nama TO nama_baru,

          MODIFY nama VARCHAR(100) AFTER jumlah,

         MODIFY nama VARCHAR(100) FIRST;
