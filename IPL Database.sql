-- IPL TOURNAMENT DBMS
create database IPL;
use IPL;
CREATE TABLE Player (
    PlayerId INT PRIMARY KEY,
    PlayerName VARCHAR(100),
    Role VARCHAR(50)
);
CREATE TABLE Team (
    TeamId INT PRIMARY KEY,
    TeamName VARCHAR(100)
);
CREATE TABLE PlaysFor (
    PlayerId INT,
    TeamId INT,
    PRIMARY KEY (PlayerId, TeamId),
    FOREIGN KEY (PlayerId) REFERENCES Player(PlayerId),
    FOREIGN KEY (TeamId) REFERENCES Team(TeamId)
);

CREATE TABLE Owner (
    OwnerId INT PRIMARY KEY,
    OwnerName VARCHAR(100)
);

CREATE TABLE OwnsBy (
    TeamId INT PRIMARY KEY,
    OwnerId INT,
    FOREIGN KEY (TeamId) REFERENCES Team(TeamId),
    FOREIGN KEY (OwnerId) REFERENCES Owner(OwnerId)
);
CREATE TABLE SupportStaff (
    StaffId INT PRIMARY KEY,
    TeamId INT,
    Role varchar(50),
    FOREIGN KEY (TeamId) REFERENCES Team(TeamId)
);
CREATE TABLE Venue (
    VenueId INT PRIMARY KEY,
    VenueName VARCHAR(100)
);

CREATE TABLE Matches (
    MatchId INT PRIMARY KEY,
    Team1Id INT,
    Team2Id INT,
    Date DATE,
    Toss varchar(50),
    Result VARCHAR(50),
    FOREIGN KEY (Team1Id) REFERENCES Team(TeamId),
    FOREIGN KEY (Team2Id) REFERENCES Team(TeamId)
);

CREATE TABLE PlaysAt (
    MatchId INT,
    VenueId INT,
    PRIMARY KEY (MatchId, VenueId),
    FOREIGN KEY (MatchId) REFERENCES Matches(MatchId),
    FOREIGN KEY (VenueId) REFERENCES Venue(VenueId)
);

CREATE TABLE IndividualScore (
    PlayerId INT,
    MatchId INT,
    Scored INT,
    Runs INT,
    Wickets INT,
    Catches INT,
    PRIMARY KEY (PlayerId, MatchId),
    FOREIGN KEY (PlayerId) REFERENCES Player(PlayerId),
    FOREIGN KEY (MatchId) REFERENCES Matches(MatchId)
);

INSERT INTO Player VALUES (1, 'Virat Kohli', 'Batsman');
INSERT INTO Player VALUES (2, 'Jasprit Bumrah', 'Bowler');
INSERT INTO Player VALUES (3, 'MS Dhoni', 'Wicketkeeper');
INSERT INTO Player VALUES (4, 'Rohit Sharma', 'Batsman');

select * from Player;

INSERT INTO Team VALUES (101, 'Royal Challengers Bangalore');
INSERT INTO Team VALUES (102, 'Chennai Super Kings');
INSERT INTO Team VALUES (103, 'Mumbai Indians');
select * from Team;

insert into PlaysFor
values
(1,101),
(2,103),
(3,102),
(4,103);
select * from PlaysFor;

