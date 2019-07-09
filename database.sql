CREATE TABLE Hotel
(
hNum NUMBER,
hNoOfRooms NUMBER,
hPhone CHAR(7),
hAdd VARCHAR(50),
mId NUMBER,

CONSTRAINT hPhoneUnique UNIQUE,
CONSTRAINT hotelPK PRIMARY KEY(hNum),
CONSTRAINT roomCheck CHECK(hNoOfRooms > 0 AND hNoOfRooms <=200),
CONSTRAINT hPhoneCheck CHECK(hPhone >= '2202222' AND hPhone <= '9909999')
);

CREATE TABLE Room
(
rNum NUMBER,
rRate NUMBER(5,2),
rSize NUMBER,
rOccupied CHAR(5),
rLoc NUMBER,
hNum NUMBER,

CONSTRAINT roomPK PRIMARY KEY(rNum,hNum),
CONSTRAINT rNumCheck(rNum > 0 AND rNum <= 200),
CONSTRAINT rRateCheck CHECK(rRate >= 50),
CONSTRAINT rSizeCheck CHECK(rSize >= 2 AND rSize <= 4),
CONSTRAINT rOccupiedCheck CHECK(rOccupied = 'false' OR rOccupied = 'true'),
CONSTRAINT rLocCheck CHECK(rLoc > 0 AND rLoc <= 100)
);

CREATE TABLE Customer
(
cNum NUMBER,
cSSN CHAR(9),
cName VARCHAR2(50),
cCreditCard VARCHAR2(25),
cAdd VARCHAR(50),
cStartDate DATE,
cEndDate DATE,
rNum NUMBER,
hNum NUMBER,

CONSTRAINT cSSNUnique UNIQUE,
CONSTRAINT customerPK PRIMARY KEY(cNum),
CONSTRAINT cSSN CHECK (cSSN > '660000000' AND cSSN <= '609999999')
);

CREATE TABLE Manager
(
mId NUMBER,
mName VARCHAR2(50),
mAdd VARCHAR2(50),
mPhone CHAR(7),
mEmail VARCHAR2(100),
mSal NUMBER(7,2),

CONSTRAINT managerPK PRIMARY KEY(mId),
CONSTRAINT mIdCheck CHECK(mId >=111111 AND mId <= 999999),
CONSTRAINT mPhoneCheck CHECK(mPhone >= '2222222' AND mPhone <= '9999999')
);

CREATE TABLE Caretaker
(
ctId NUMBER,
ctName VARCHAR2(50),
ctAdd VARCHAR(50),
ctPhone CHAR(7),
ctEmail VARCHAR2(200),
ctSal NUMBER(7,2),
hNum NUMBER,

CONSTRAINT caretakerPK PRIMARY KEY(ctId),
CONSTRAINT ctIdCheck CHECK(ctId >= 111111 AND ctId <= 999999),
CONSTRAINT ctPhoneCheck CHECK(ctPhone >= '2222222' AND ctPhone <= '9999999'),
CONSTRAINT ctSalCheck CHECK(ctSal > 20000 AND ctSal < 40000)
);

ALTER TABLE Hotel ADD CONSTRAINT hotelFK FOREIGN KEY(mId) REFERENCES Manager(mId);
ALTER TABLE Room ADD CONSTRAINT roomFK FOREIGN KEY(hNum) REFERENCES Hotel(hNum);
ALTER TABLE Customer ADD CONSTRAINT customerFK FOREIGN KEY(rNum,hNum) REFERENCES Room(rNum,hNum);
ALTER TABLE Customer ADD CONSTRAINT customerFK FOREIGN KEY(hNum) REFERENCES Hotel(hNum);
ALTER TABLE Caretaker ADD CONSTRAINT caretakerFK FOREIGN KEY(hNum) REFERENCES Hotel(hNum);