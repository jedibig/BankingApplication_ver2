CREATE TABLE Banking_Account (
    accNumber int  NOT NULL CONSTRAINT pk_Banking_Account PRIMARY KEY,
    balance number(15,2)  DEFAULT 100.00 NOT NULL,
    version int DEFAULT 0 NOT NULL
);


CREATE TABLE Banking_User (
    username varchar2(20) NOT NULL
        CONSTRAINT pk_Banking_User PRIMARY KEY,
    name varchar2(50)   NOT NULL,
    password varchar2(20)   NOT NULL,
    accNumber int,
   CONSTRAINT fk_Banking_User_Account FOREIGN KEY (accNumber)
        REFERENCES Banking_Account(accNumber)
);


CREATE TABLE Banking_Transaction (
    transactionID int   NOT NULL CONSTRAINT pk_Banking_Transaction PRIMARY KEY,
    senderID int   NOT NULL,
    receiverID int   NOT NULL,
    nominal number(15,2)   NOT NULL,
    CONSTRAINT fk_Banking_Trans_senderID FOREIGN KEY(senderID)
        REFERENCES Banking_Account (accNumber),
    CONSTRAINT fk_Banking_Trans_receiverID FOREIGN KEY(receiverID)
        REFERENCES Banking_Account (accNumber)
);

create sequence accNum_sequence START WITH 101;
create sequence transID_sequence START WITH 50001;


-- insertUser
insert into Banking_User (username, name, password) values (?, ?, ?);
insert into Banking_Account(accNumber) values (accNum_sequence.nextval);
update Banking_User set accNumber = accNum_sequence.currval where username = ?;

-- retrive user for login
select username, name, password, accNumber from Banking_User where username = ?;

-- retrieveAccount
select name from Banking_User join Banking_Account BA on Banking_User.accNumber = BA.accNumber where BA.accNumber = ?;

-- transfer money
select transID_sequence.nextval from dual;
select balance, version from Banking_Account where accNumber = ?;
update Banking_Account set balance = balance - ?, version = version + 1 where accNumber = ?;
update Banking_Account set balance = balance + ? where accNumber = ?;
insert into Banking_Transaction (transactionID, senderID, receiverID, nominal) values (?, ?, ?, ?);

-- get balance
select balance from Banking_Account where accNumber = ?;

