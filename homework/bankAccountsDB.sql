DROP DATABASE IF EXISTS bank_db;
CREATE DATABASE bank_db;
use bank_db;

CREATE TABLE account (
	ID int not null primary key auto_increment,
	account_holder nvarchar(50) not null,
	balance decimal(20,2) not null,
	fees decimal(20,2) not null
);

CREATE TABLE transaction (
	ID int not null primary key auto_increment,
    amount decimal(20,2) not null,
	txn_type nvarchar(50) not null,
	account_ID int not null,
    foreign key(account_ID) references account(ID)
);

Insert account (account_holder, balance, fees) values ('Anna Bengel', 8888.00, 250.00);
Insert account (account_holder, balance, fees) values ('Chase Williams', 5444.00, 175.00);
Insert account (account_holder, balance, fees) values ('Jonelle Wehrman', 3333.00, 88.00);
Insert account (account_holder, balance, fees) values ('Steven Ross', 3322.00, 88.00);

Insert transaction (amount, txn_type, account_ID) values (500.00, 'Deposit', 3);
Insert transaction (amount, txn_type, account_ID) values (-200.00, 'Withdrawal', 4);
Insert transaction (amount, txn_type, account_ID) values (200.00, 'Deposit', 4);
Insert transaction (amount, txn_type, account_ID) values (248.00, 'Deposit', 1);