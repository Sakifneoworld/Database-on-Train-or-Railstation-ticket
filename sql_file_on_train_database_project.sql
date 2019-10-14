set echo off;
set define '&';

SET SERVEROUTPUT ON
accept x number prompt 'PASSWORD :== '

declare 
  a number;
  b number := 1407023;
begin
  a := &x;
	if a=b then
	dbms_output.put_line('  	=====***Password is correct *****===== ');
	else
	dbms_output.put_line('  	XXXXXXXXXX  Password is not correct XXXXXXXXXX ');
	RAISE_APPLICATION_ERROR(-20000,'Check your password ');
	end if;
end;
/




drop table PASSENGER CASCADE CONSTRAINTS;
drop table SCHEDULES CASCADE CONSTRAINTS;
drop table TODAY CASCADE CONSTRAINTS;
drop table STATION CASCADE CONSTRAINTS;
drop table TRAIN CASCADE CONSTRAINTS;

/*CREATE TABLE */

create table TRAIN(
	Train_ID 		number (10) ,
	Train_Name 		varchar(20),
	Seat_Number 	number (3),
	Source_ID   	number (10), 
	Destination_ID	number (10),
	PRIMARY KEY (Train_ID)
);
create table STATION(
	Station_ID		number (10),
	Station_Name 	varchar(20),
	PRIMARY KEY (Station_ID)
);
create table TODAY(
	Today_Date date
);
alter table TODAY add primary key (Today_Date);

create table SCHEDULES(
	Today_Date 		date,
	Station_ID		number (10),
	Train_ID 		number (10),
	Arrival_Time 	varchar(10) DEFAULT 'NULL',
	Departure_Time 	varchar(10)
);



alter table SCHEDULES add foreign key (Station_ID) references STATION(Station_ID);

alter table SCHEDULES add foreign key (Train_ID) references TRAIN(Train_ID);

alter table SCHEDULES add foreign key (Today_Date) references TODAY(Today_Date);

create table PASSENGER(
	seat_number		number (3) DEFAULT 0,
	Train_ID 		number (10),
	Today_Date 		date,
	Source_ID		number (10),
	Destination_ID  number (10),
	Arrival_Time 	varchar(10)
	);

alter table PASSENGER add passenger_class varchar (10);

alter table PASSENGER modify passenger_class varchar (5);

alter table PASSENGER rename column passenger_class to passenger_type;

alter table PASSENGER drop column passenger_type;  


	
alter table PASSENGER add foreign key (Train_ID) references TRAIN(Train_ID);

alter table PASSENGER add foreign key (Today_Date) references TODAY(Today_Date);





describe TRAIN;
describe STATION;
describe TODAY;
describe SCHEDULES;
describe PASSENGER;

/* INSERT DATA */

INSERT INTO TRAIN (Train_ID,Train_Name,Seat_Number,Source_ID,Destination_ID) VALUES (20001,'EKOTA',50,10004,10001);
INSERT INTO TRAIN (Train_ID,Train_Name,Seat_Number,Source_ID,Destination_ID) VALUES (20002,'RUPSHA',50,10004,10002);
INSERT INTO TRAIN (Train_ID,Train_Name,Seat_Number,Source_ID,Destination_ID) VALUES (20003,'SUNDARBAN',50,10002,10001);
INSERT INTO TRAIN (Train_ID,Train_Name,Seat_Number,Source_ID,Destination_ID) VALUES (20004,'CHETRA',50,10001,10002);
INSERT INTO TRAIN (Train_ID,Train_Name,Seat_Number,Source_ID,Destination_ID) VALUES (20005,'SILKCITY',50,10003,10001);




INSERT INTO TRAIN (Train_ID,Train_Name,Seat_Number,Source_ID,Destination_ID) VALUES (20010,'SONAR-BANGLA',100,10002,10003);

/* Update */

UPDATE TRAIN SET Seat_Number=45 WHERE Train_Name='SUNDARBAN';

/* Delete */

DELETE FROM TRAIN WHERE Train_Name='SONAR-BANGLA';


select * from TRAIN;

INSERT INTO STATION(Station_ID,Station_Name) VALUES (10002,'KHULNA');
INSERT INTO STATION(Station_ID,Station_Name) VALUES (10003,'RAJSHAHI');
INSERT INTO STATION(Station_ID,Station_Name) VALUES (10001,'DHAKA');
INSERT INTO STATION(Station_ID,Station_Name) VALUES (10004,'DINAJPUR');
INSERT INTO STATION(Station_ID,Station_Name) VALUES (10009,'NATORE');
INSERT INTO STATION(Station_ID,Station_Name) VALUES (10005,'JESSORE');
INSERT INTO STATION(Station_ID,Station_Name) VALUES (10006,'ISHWARDI');
INSERT INTO STATION(Station_ID,Station_Name) VALUES (10007,'JAMUNA-RIVER');
INSERT INTO STATION(Station_ID,Station_Name) VALUES (10008,'MRIJAPUR');

/* select operation order by */

select * from STATION order by Station_ID;

/* select operation order by give more priority station  */


select (Station_ID + 100 ) as ONLY_ID from STATION where Station_ID>10005 ;

INSERT INTO TODAY(Today_Date) VALUES ('04-JUL-2017');

select * from TODAY;

INSERT INTO SCHEDULES(Today_Date,Station_ID,Train_ID,Departure_Time,Arrival_Time) VALUES ('04-JUL-2017',10004,20001,'08:00','07:00');
INSERT INTO SCHEDULES(Today_Date,Station_ID,Train_ID,Departure_Time,Arrival_Time) VALUES ('04-JUL-2017',10009,20001,'11:00','10:45');
INSERT INTO SCHEDULES(Today_Date,Station_ID,Train_ID,Departure_Time,Arrival_Time) VALUES ('04-JUL-2017',10006,20001,'13:00','12:45');
INSERT INTO SCHEDULES(Today_Date,Station_ID,Train_ID,Departure_Time,Arrival_Time) VALUES ('04-JUL-2017',10007,20001,'16:00','15:45');
INSERT INTO SCHEDULES(Today_Date,Station_ID,Train_ID,Departure_Time,Arrival_Time) VALUES ('04-JUL-2017',10008,20001,'18:00','17:45');
INSERT INTO SCHEDULES(Today_Date,Station_ID,Train_ID,Departure_Time,Arrival_Time) VALUES ('04-JUL-2017',10001,20001,'20:00','19:00');

INSERT INTO SCHEDULES(Today_Date,Station_ID,Train_ID,Departure_Time,Arrival_Time) VALUES ('04-JUL-2017',10002,20003,'08:00','07:00');
INSERT INTO SCHEDULES(Today_Date,Station_ID,Train_ID,Departure_Time,Arrival_Time) VALUES ('04-JUL-2017',10005,20003,'11:00','10:45');
INSERT INTO SCHEDULES(Today_Date,Station_ID,Train_ID,Departure_Time,Arrival_Time) VALUES ('04-JUL-2017',10006,20003,'12:00','11:45');
INSERT INTO SCHEDULES(Today_Date,Station_ID,Train_ID,Departure_Time,Arrival_Time) VALUES ('04-JUL-2017',10007,20003,'14:00','13:45');
INSERT INTO SCHEDULES(Today_Date,Station_ID,Train_ID,Departure_Time,Arrival_Time) VALUES ('04-JUL-2017',10008,20003,'19:00','18:45');
INSERT INTO SCHEDULES(Today_Date,Station_ID,Train_ID,Departure_Time,Arrival_Time) VALUES ('04-JUL-2017',10001,20003,'21:00','20:00');

INSERT INTO SCHEDULES(Today_Date,Station_ID,Train_ID,Departure_Time,Arrival_Time) VALUES ('04-JUL-2017',10003,20005,'06:00','05:00');
INSERT INTO SCHEDULES(Today_Date,Station_ID,Train_ID,Departure_Time,Arrival_Time) VALUES ('04-JUL-2017',10006,20005,'07:00','06:45');
INSERT INTO SCHEDULES(Today_Date,Station_ID,Train_ID,Departure_Time,Arrival_Time) VALUES ('04-JUL-2017',10007,20005,'11:00','10:45');
INSERT INTO SCHEDULES(Today_Date,Station_ID,Train_ID,Departure_Time,Arrival_Time) VALUES ('04-JUL-2017',10008,20005,'13:00','12:45');
INSERT INTO SCHEDULES(Today_Date,Station_ID,Train_ID,Departure_Time,Arrival_Time) VALUES ('04-JUL-2017',10001,20005,'16:00','15:00');

INSERT INTO SCHEDULES(Today_Date,Station_ID,Train_ID,Departure_Time,Arrival_Time) VALUES ('04-JUL-2017',10001,20004,'08:00','07:00');
INSERT INTO SCHEDULES(Today_Date,Station_ID,Train_ID,Departure_Time,Arrival_Time) VALUES ('04-JUL-2017',10008,20004,'11:00','10:45');
INSERT INTO SCHEDULES(Today_Date,Station_ID,Train_ID,Departure_Time,Arrival_Time) VALUES ('04-JUL-2017',10007,20004,'12:00','11:45');
INSERT INTO SCHEDULES(Today_Date,Station_ID,Train_ID,Departure_Time,Arrival_Time) VALUES ('04-JUL-2017',10006,20004,'14:00','13:45');
INSERT INTO SCHEDULES(Today_Date,Station_ID,Train_ID,Departure_Time,Arrival_Time) VALUES ('04-JUL-2017',10005,20004,'19:00','18:45');
INSERT INTO SCHEDULES(Today_Date,Station_ID,Train_ID,Departure_Time,Arrival_Time) VALUES ('04-JUL-2017',10002,20004,'21:00','20:00');

INSERT INTO SCHEDULES(Today_Date,Station_ID,Train_ID,Departure_Time,Arrival_Time) VALUES ('04-JUL-2017',10004,20002,'08:00','07:00');
INSERT INTO SCHEDULES(Today_Date,Station_ID,Train_ID,Departure_Time,Arrival_Time) VALUES ('04-JUL-2017',10009,20002,'11:00','10:45');
INSERT INTO SCHEDULES(Today_Date,Station_ID,Train_ID,Departure_Time,Arrival_Time) VALUES ('04-JUL-2017',10006,20002,'12:00','11:45');
INSERT INTO SCHEDULES(Today_Date,Station_ID,Train_ID,Departure_Time,Arrival_Time) VALUES ('04-JUL-2017',10005,20002,'13:00','12:45');
INSERT INTO SCHEDULES(Today_Date,Station_ID,Train_ID,Departure_Time,Arrival_Time) VALUES ('04-JUL-2017',10002,20002,'20:00','19:00');

select * from SCHEDULES;

/* Union operation  */

SELECT Station_ID , Train_ID
FROM SCHEDULES
WHERE Station_ID = 10003
UNION
SELECT S.Station_ID, S.Train_ID
FROM SCHEDULES S
WHERE S.Station_ID=10004;

/* Join Operation */

SELECT SCHEDULES.Train_ID, STATION.Station_ID,STATION.Station_Name
	FROM SCHEDULES JOIN STATION
	ON SCHEDULES.Station_ID = STATION.Station_ID;
	
	
SELECT SCHEDULES.Train_ID, STATION.Station_ID,STATION.Station_Name
	FROM SCHEDULES JOIN STATION
	ON SCHEDULES.Station_ID = STATION.Station_ID AND SCHEDULES.Train_ID=20003  order by SCHEDULES.Departure_Time;
	
	
	
/* SQL PROGRAMING */




DECLARE
	TRAIN1_ID 	TRAIN.TRAIN_ID%type;
	TRAIN1_NAME TRAIN.Train_Name%type := 'SILKCITY';
BEGIN
  SELECT TRAIN_ID INTO TRAIN1_ID
  FROM TRAIN
  WHERE  TRAIN1_NAME=Train_Name;  
  DBMS_OUTPUT.PUT_LINE('TRAIN ID : ' || TRAIN1_ID || '    TRAIN NAME ==='|| TRAIN1_NAME);
END;
/

DECLARE
	TRAIN1_NAME TRAIN.Train_Name%type := 'SILKCITY';
	SOURCE1 	STATION.Station_Name%type;
	DESTINATION1 STATION.Station_Name%type;
BEGIN
  SELECT STATION.Station_Name INTO SOURCE1
  FROM TRAIN,STATION
  WHERE  TRAIN1_NAME=TRAIN.Train_Name
  and TRAIN.Source_ID=STATION.Station_ID;
  SELECT STATION.Station_Name INTO DESTINATION1
  FROM TRAIN,STATION
  WHERE  TRAIN1_NAME=TRAIN.Train_Name
  and TRAIN.Destination_ID=STATION.Station_ID;
  DBMS_OUTPUT.PUT_LINE('TRAIN NAME  : ====' || TRAIN1_NAME || '     SOURCE STATION ===   '|| SOURCE1 || '     DESTINATION STATION ===   ' || DESTINATION1);
END;
/
/* CURSOR */

/*

DECLARE
     CURSOR train_info IS SELECT Today_Date,Station_ID,Train_ID,Arrival_Time FROM SCHEDULES;
	info train_info%ROWTYPE;

BEGIN
OPEN train_info;
      LOOP
        FETCH train_info INTO info;
        EXIT WHEN train_info%ROWCOUNT > 20;
		IF info.Train_ID = 20001  THEN
      DBMS_OUTPUT.PUT_LINE ('station ==: ' || info.Station_ID || ' time ==== ' || info.Arrival_Time);
	  end if;
      END LOOP;
      CLOSE train_info;
END;
/

*/





