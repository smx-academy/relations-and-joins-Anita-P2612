		Task 2: Bank Data

CREATE TABLE clients(
	client_id INT PRIMARY KEY,
	ime VARCHAR (20),
	prezime VARCHAR (50),
	adresa VARCHAR (100) NULL,
	tel_broj VARCHAR (20) NULL,
	email VARCHAR (100) NULL,
	data_na_ragjanje VARCHAR (10),
	broj_dokument VARCHAR (10) NULL
);

CREATE TABLE accountsmkd(
	account_id INT PRIMARY KEY,
	broj_smetka_mkd VARCHAR (50),
	data_otvaranje_mkd VARCHAR (20),
	saldo_mkd DECIMAL (35, 2),
	client_id INT
);

CREATE TABLE savings(
	saving_id INT PRIMARY KEY,
	saving_smetka VARCHAR (50),
	saving_otvaranje VARCHAR (20),
	saving_saldo DECIMAL (35, 2),
	client_id INT
);

CREATE TABLE debits(
	debit_id INT PRIMARY KEY,
	debit_smetka VARCHAR (50),
	debit_otvaranje VARCHAR (20),
	debit_saldo DECIMAL (35, 2),
	client_id INT
);

CREATE TABLE credits(
	credit_id INT PRIMARY KEY,
	credit_smetka VARCHAR (50),
	credit_godina VARCHAR (20),
	credit_odobren_iznos DECIMAL (35, 2),
	credit_iskoristen_iznos DECIMAL (35, 2),
	credit_saldo DECIMAL (35 ,2),
	client_id INT
);


FOREIGN KEY (client_id) REFERENCES accountsmkd(client_id)   --ovie mi davaa greska, ama site tabeli podole se kreiraa,dali bez razlika na greskata imaat funkcija?
);
FOREIGN KEY (client_id) REFERENCES savings(client_id)
);
FOREIGN KEY (client_id) REFERENCES debits(client_id)
);
FOREIGN KEY (client_id) REFERENCES credits(client_id)
);

INSERT INTO clients(client_id, ime, prezime, data_na_ragjanje)
VALUES 
(1, 'Ana', 'Petrovska', '01.01.1990'),
(2, 'Marko', 'Stojanov', '01.02.1991'),
(3, 'Elena', 'Kostovska', '01.03.1990'),
(4, 'Igor', 'Dimitrov', '01.04.1991'),
(5, 'Viktor', 'Stefanov', '01.05.1991');

INSERT INTO accountsmkd(account_id, broj_smetka_mkd, data_otvaranje_mkd, saldo_mkd, client_id)
VALUES 
(1, '123456789', '12.12.2000', 100000, 1),
(2, '246890135', '03.03.2003', 10000, 2),
(3, '908765432', '04.04.2004', 500000, 3),
(4, '809310222', '05.05.1990', 200000, 4),
(5, '210564879', '06.06.1996', 1000000,5),
(6, '210555444', '07.07.2006', 5000, 2),
(7, '310666777', '08.08.2008', 1000, 4);

INSERT INTO savings(saving_id, saving_smetka, saving_otvaranje, saving_saldo, client_id)
VALUES 
(1, '112233','2000', 10000, 3),
(2, '222222','2005', 40000, 4),
(3, '333333', '2001', 60000, 6),
(4, '444444', '2000', 15000,3),
(5, '555555', '2001', 20000, 1),
(6, '666666','2002', 25000, 5);

INSERT INTO debits(debit_id, debit_smetka, debit_otvaranje, debit_saldo, client_id)
VALUES 
(1, '111111','2005', 10000, 2),
(2, '222333','2004', 40000, 3),
(3, '3332222', '2001', 60000, 4),
(4, '44445', '2002', 15000, 1),
(5, '555556', '2001', 20000, 5),
(6, '66667','2002', 25000, 5);

INSERT INTO credits(credit_id, credit_smetka, credit_godina, credit_odobren_iznos, credit_iskoristen_iznos, credit_saldo, client_id)
VALUES 
(1, 'X11111','2005', 100000, 20000, 80000, 2),
(2, 'Y22333','2004', 400000, 0, 400000, 3),
(3, 'Z332222', '2001', 60000, 10000, 50000, 4),
(4, 'A4445', '2002', 15000, 1000, 14000, 1);

SELECT * FROM clients;

SELECT c.ime, c.prezime,                        
       acc.broj_smetka_mkd, acc.data_otvaranje_mkd, acc.saldo_mkd, 
	   s.saving_smetka, s.saving_otvaranje, s.saving_saldo, 
	   deb.debit_smetka, deb.debit_otvaranje, deb.debit_saldo, 
	   cr.credit_smetka, cr.credit_godina, cr.credit_odobren_iznos,cr.credit_iskoristen_iznos, cr.credit_saldo
FROM clients AS c
INNER JOIN accountsmkd AS acc
ON c.client_id = acc.client_id
INNER JOIN savings AS s
ON c.client_id = s.client_id
INNER JOIN debits AS deb
ON c.client_id = deb.client_id
INNER JOIN credits AS cr
ON c.client_id = cr.client_id;


	--Query 1: List all clients who have more than a specific amount in their savings account (e.g., $10,000)

SELECT c.ime, c.prezime, s.saving_saldo 
FROM clients AS c
INNER JOIN savings AS s
ON c.client_id = s.client_id
WHERE s.saving_saldo>20000;

	--Query 2: Retrieve all debit cards issued within a specific date range.

SELECT c.ime, c.prezime, deb.debit_smetka, deb.debit_otvaranje
FROM clients AS c
INNER JOIN debits AS deb
ON c.client_id = deb.client_id
WHERE deb.debit_otvaranje>2003;

	--Query 3: List all clients who have taken credit, along with the credit amount and start date, filtering for credits issued after a specific date.

SELECT c.ime, c.prezime, cr.credit_smetka, cr.credit_godina, credit_odobren_iznos
FROM clients AS c
INNER JOIN credits AS cr
ON c.client_id = cr.client_id
WHERE cr.credit_godina>2002;

