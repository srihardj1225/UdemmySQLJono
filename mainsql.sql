/*Belajar SQL Programmer Zaman Now , Created by Jono*/

SHOW ENGINES;
SHOW DATABASES;
USE belajar_mysql;
SHOW TABLES;

CREATE TABLE barang(
	kode INT,
    nama VARCHAR(100),
    harga INT,
    jumlah INT
)
ENGINE = InnoDB;


DESCRIBE barang;
SHOW CREATE TABLE barang;
DESC barang;

/*Mengubah table
ALTER TABLE barang
	ADD COLUMN nama_column TEXT,
    DROP COLUMN nama,
    RENAME COLUMN nama TO nama_baru,
    MODIFY nama VARCHAR(100) AFTER jumlah,
    MODIFY nama VARCHAR(100) FIRST;
*/
/*Created by Jono*/

/*
Menambah satu Field dalam Tabel Barang
*/
ALTER TABLE barang
ADD COLUMN deskripsi TEXT;
SHOW TABLES;
DESC barang;

/*
salah masukkan kolom/ field dalamn table
*/    
/*Created by Jono*/

/*bikin kolom yang salah dulu*/
ALTER TABLE barang
ADD COLUMN salah TEXT;

SHOW TABLES;
DESC barang;

/*hapus kolomnya*/
/*Created by Jono*/

ALTER TABLE barang
DROP COLUMN salah;
DESC barang;

/*modify column*/
/*Created by Jono*/
ALTER TABLE barang
MODIFY nama VARCHAR(200);
DESC barang;

/*modify tapi mau di geser posisi kolomnya*/
/*Created by Jono*/

ALTER TABLE barang
MODIFY nama VARCHAR(200) AFTER  deskripsi;
DESC barang;

/* posisi kolom di kedepankan*/
/*Created by Jono*/
ALTER TABLE barang
MODIFY nama VARCHAR(200) FIRST;
DESC barang;

/* MODIFY not NULL , kolom nya*/
/*Created by Jono*/
DROP TABLE barang;
SHOW TABLES;

CREATE TABLE barang
(
	id	INT NOT NULL,
    nama VARCHAR(100) NOT NULL,
    harga INT,
    jumlah INT
)	ENGINE = InnoDB;

SHOW TABLES;
ALTER TABLE barang
MODIFY id INT NOT NULL;
desc barang;

ALTER TABLE barang
MODIFY jumlah INT NOT NULL DEFAULT 0;

ALTER TABLE barang
MODIFY harga INT NOT NULL DEFAULT 0;

ALTER TABLE barang
ADD COLUMN deskripsi TEXT;

ALTER TABLE barang
ADD COLUMN deskripsi TEXT;

DESC barang;

ALTER TABLE barang
ADD waktu_dibuat TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP;

DESC barang;

/* coba insert 1 data atau 1 rows*/
/*Created by Jono*/
INSERT INTO barang(id,nama) VALUES (1,'Apel');
SELECT * FROM barang;

/* TRUNCATE  fungsinya untuk menghapus isi table nya */
/*Created by Jono*/

TRUNCATE barang; /*excute untuk hapus data dalam tables barang*/
SELECT *FROM barang;  /* excute dan terlihat tidak ada data dalam table*/
SHOW TABLES; /* tabelnya masih ada cuma isinya yang sudah tidak ada*/

DROP TABLES barang ; /* perintah untuk menghapus table barang*/
SHOW TABLES; /* yang terjadi table barangnya sudah terhapus*/

CREATE TABLE barang
(
	id	INT NOT NULL,
    nama VARCHAR(100) NOT NULL,
    harga INT NOT NULL DEFAULT 0,
    jumlah INT NOT NULL DEFAULT 0
)	ENGINE = InnoDB;

/* INSERT DATA , INSERT DATA, INSERT DATA, INSERT DATA, INSERT DATA, INSERT DATA   */
/*Created by Jono*/
 
 CREATE TABLE products
 (
	id			VARCHAR(10) NOT NULL,
    name		VARCHAR(100) NOT NULL,
    description TEXT,
    price 		INT UNSIGNED NOT NULL,
    quantity	INT UNSIGNED NOT NULL DEFAULT 0,
    created_at	TIMESTAMP	 NOT NULL DEFAULT CURRENT_TIMESTAMP
 ) ENGINE = InnoDB ;
 
 
  SHOW tables;
  DESCRIBE products;
  
  
/*setelah jadi tables productsnya maka kita input datanya*/ 
/*Created by Jono*/

/*soal nomor 1*/
/* id=P0001, name=Mie Ayam Original, price= 15000, quantity=100 */
INSERT INTO products(id,name,price,quantity) VALUES('P0001','Mie Ayam Original', 15000, 100) ;

/*soal nomor 2*/
/*id=P0002, name=Mie Ayam Bakso Tahu, description=Mie Ayam Original + bakso tahu, price=20000, quantity=100 */
INSERT INTO products(id,name,description,price,quantity) VALUES('P0002','Mie Ayam Bakso Tahu','Mie Ayam Original + bakso tahu',20000,100);


/*tadi kan perbaris inputnya skrg kita bisa input data 3 bari sekaligus*/

INSERT INTO products(id,name,price,quantity)
VALUES	('P0003','Mie Ayam Ceker',20000,100),
		('P0004','Mie Ayam Spesial',25000,100),
        ('P0005','Mie Ayam Yamin',15000,100);

/*setelah di input table productsnya makan kita tampilkan isinya*/
SELECT *FROM products;

/*BAGIAN SELECT, BAGIAN SELECT, BAGIAN SELECT, BAGIAN SELECT, BAGIAN SELECT*/
/*CREATE BY JONO*/

SELECT *FROM products;

SELECT id,name,price,quantity FROM products;

SELECT id FROM  products;
SELECT name FROM  products;
SELECT price FROM  products;
SELECT quantity FROM  products;


/*PRIMARY KEY,PRIMARY KEY,PRIMARY KEY,PRIMARY KEY,PRIMARY KEY,PRIMARY KEY,PRIMARY KEY,*/
/*primary key*/

/*Begini caranya*/
CREATE TABLE products
 (
	id			VARCHAR(10) NOT NULL,
    name		VARCHAR(100) NOT NULL,
    description TEXT,
    price 		INT UNSIGNED NOT NULL,
    quantity	INT UNSIGNED NOT NULL DEFAULT 0,
    created_at	TIMESTAMP	 NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (id)
 ) ENGINE = InnoDB ;

/*namun sudah jadi tabelnya kan jadi lebih baik pakai ALTER*/
/*Begini caranya*/
DESC products;

ALTER TABLE products
	ADD PRIMARY KEY(id);
SHOW TABLES;
SHOW CREATE TABLE products;    


/*kalo input 2 data akan redudance*/
INSERT INTO products(id,name,price,quantity) VALUES('P0001','Mie Ayam Original', 15000, 100) ;

/*WHERE CLAUSE, WHERE CLAUSE, WHERE CLAUSE, WHERE CLAUSE, WHERE CLAUSE, WHERE CLAUSE, */
SELECT *FROM products;
SELECT *FROM products WHERE price=15000;
SELECT *FROM products WHERE quantity=100;
SELECT *FROM products WHERE name='Mie Ayam Original';


/*Update data Update data Update data Update data Update data Update data */
/*disini akan update data yaitu sebagai contoh tambah colom dengan kategori semacam list box
*/
ALTER TABLE products 
ADD COLUMN category ENUM ('Makanan','Minuman','Lain-Lain')
AFTER NAME;
DESCRIBE products;

UPDATE products
SET category = 'Makanan'
WHERE id = 'P0001';

DESCRIBE products;
SELECT *FROM products;

/* jadi semacam combo box gitu hasilnya*/

/* kita bisa memberikan SET Category dengan 2 kolom */

UPDATE products
SET category    = 'Makanan',
    description = 'Mie Ayam Original + Ceker'
WHERE id = 'P0003';

/*disini terjadi error karena sebelum statement ini ada */

SELECT *FROM products;

/*UPDATE dengan data yang sudah ada, contoh nominal di tambah 5000*/
UPDATE products
SET price = price - 5000
WHERE id = 'P0001';

/* DELETE data DELETE data DELETE data DELETE data DELETE data DELETE data DELETE data */
DELETE
FROM products
WHERE id = 'P0005';

SELECT *FROM products;

INSERT INTO products (id,name,category,description,price,quantity) VALUES ('P0005','Mie Bakso Polos','Makanan','Tanpa Saos dan Kecap','13000','200');

SELECT *FROM products;

/* ini coding belum bisa euy*/

DELETE
FROM product
WHERE description = 'Tanpa Saos dan Kecap';

SELECT * FROM products;

/*Belajar alias gunanya supaya penyebutan nama kolom dalam syntax sqlnya di Singkat*/
/* ALIAS KOLOM */
SELECT	id AS  kd,
		name AS nm,
        category AS ct,
        description AS dcp,
        price AS prc,
        quantity AS qty,
        created_at AS ctat
FROM products;

/* nama tablennya kepanjangan dan harus disingkat karena nanti waktu join table berguna kalo disingkat*/
/* ALIAS TABLE */
SELECT	p.id AS  kd,
		p.name AS nm,
        p.category AS ct,
        p.description AS dcp,
        p.price AS prc,
        p.quantity AS qty,
        p.created_at AS ctat
FROM products AS p;



