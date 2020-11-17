#TelephoneMgmt SQL
CREATE TABLE Telephone
(
	seq				INT			AUTO_INCREMENT		PRIMARY KEY,   # AUTO_INCREMENT: ORACLE의 SEQUENCE        
	kind				TINYINT		NOT NULL,
	tel				CHAR(8)		NOT NULL,
	NAME				VARCHAR(20)	NOT NULL,
	quantity			SMALLINT		NOT NULL,
	defaultFee		INT,
	fee				INT,
	tax				INT,
	total				INT
)