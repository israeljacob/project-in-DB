CREATE TABLE Team
(
  Te_ID INT NOT NULL,
  Te_Name INT NOT NULL,
  Team_Leader_ID INT NOT NULL,
  PRIMARY KEY (Te_ID)
);

CREATE TABLE Rol
(
  R_ID INT NOT NULL,
  R_Name INT NOT NULL,
  PRIMARY KEY (R_ID)
);

CREATE TABLE Projects
(
  Pro_ID INT NOT NULL,
  Pro_Name INT NOT NULL,
  Due_Date INT NOT NULL,
  Cost INT NOT NULL,
  Profit INT NOT NULL,
  Te_ID INT NOT NULL,
  PRIMARY KEY (Pro_ID),
  FOREIGN KEY (Te_ID) REFERENCES Team(Te_ID)
);

CREATE TABLE Evaluation
(
  Ev_ID INT NOT NULL,
  Grade INT NOT NULL,
  Year INT NOT NULL,
  PRIMARY KEY (Ev_ID)
);

CREATE TABLE Task
(
  Ta_ID INT NOT NULL,
  Ta_Name INT NOT NULL,
  Pro_ID INT NOT NULL,
  PRIMARY KEY (Ta_ID, Pro_ID),
  FOREIGN KEY (Pro_ID) REFERENCES Projects(Pro_ID)
);

CREATE TABLE Computer
(
  C_ID INT NOT NULL,
  Processor INT NOT NULL,
  RAM INT NOT NULL,
  SSD INT NOT NULL,
  Year_Of_Purchase INT NOT NULL,
  PRIMARY KEY (C_ID)
);

CREATE TABLE Printer
(
  Pri_ID INT NOT NULL,
  Compeny INT NOT NULL,
  Model INT NOT NULL,
  PRIMARY KEY (Pri_ID)
);

CREATE TABLE Supplier
(
  Su_ID INT NOT NULL,
  Su_Name INT NOT NULL,
  Addres INT NOT NULL,
  Su_Phone INT NOT NULL,
  Su_Email INT NOT NULL,
  PRIMARY KEY (Su_ID)
);

CREATE TABLE Connected_To
(
  Pri_ID INT NOT NULL,
  C_ID INT NOT NULL,
  PRIMARY KEY (Pri_ID, C_ID),
  FOREIGN KEY (Pri_ID) REFERENCES Printer(Pri_ID),
  FOREIGN KEY (C_ID) REFERENCES Computer(C_ID)
);

CREATE TABLE Employee
(
  Em_ID INT NOT NULL,
  Em_Name INT NOT NULL,
  Date_Of_Birth INT NOT NULL,
  R_ID INT NOT NULL,
  Te_ID INT NOT NULL,
  C_ID INT NOT NULL,
  PRIMARY KEY (Em_ID),
  FOREIGN KEY (R_ID) REFERENCES Rol(R_ID),
  FOREIGN KEY (Te_ID) REFERENCES Team(Te_ID),
  FOREIGN KEY (C_ID) REFERENCES Computer(C_ID)
);

CREATE TABLE Software
(
  So_Id INT NOT NULL,
  So_Name INT NOT NULL,
  Version INT NOT NULL,
  Su_ID INT NOT NULL,
  PRIMARY KEY (So_Id),
  FOREIGN KEY (Su_ID) REFERENCES Supplier(Su_ID)
);

CREATE TABLE Employee_Evaluation
(
  Will_Be_Promoted INT NOT NULL,
  Em_ID INT NOT NULL,
  Ev_ID INT NOT NULL,
  PRIMARY KEY (Em_ID, Ev_ID),
  FOREIGN KEY (Em_ID) REFERENCES Employee(Em_ID),
  FOREIGN KEY (Ev_ID) REFERENCES Evaluation(Ev_ID)
);

CREATE TABLE Responsibility
(
  Ta_ID INT NOT NULL,
  Pro_ID INT NOT NULL,
  Em_ID INT NOT NULL,
  PRIMARY KEY (Ta_ID, Pro_ID, Em_ID),
  FOREIGN KEY (Ta_ID, Pro_ID) REFERENCES Task(Ta_ID, Pro_ID),
  FOREIGN KEY (Em_ID) REFERENCES Employee(Em_ID)
);

CREATE TABLE Installed_On
(
  C_ID INT NOT NULL,
  So_Id INT NOT NULL,
  PRIMARY KEY (C_ID, So_Id),
  FOREIGN KEY (C_ID) REFERENCES Computer(C_ID),
  FOREIGN KEY (So_Id) REFERENCES Software(So_Id)
);
