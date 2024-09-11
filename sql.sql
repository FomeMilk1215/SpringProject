CREATE DATABASE mydatabase;

USE mydatabase;

CREATE TABLE numbers (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    number INT NOT NULL
);
show tables;

create table customer_information(
	customer_idx int auto_increment primary key,
	customer_name varchar(50) not null,
	customer_password varchar(50) not null,
	customer_email varchar(50) not null
);

create table athlete_information(
	athlete_idx int auto_increment primary key,
	athlete_name varchar(50) not null,
	athlete_age int not null,
	athlete_agency varchar(50),
	athlete_weight int not null,
	athlete_height int not null,
	athlete_winrate varchar(50)
);

create table time_information(
	time_idx int auto_increment primary key,
	athlete_idx int,
	`date` date,
	`round` int,
	enforcement varchar(50),
	foreign key (athlete_idx) references athlete_information(athlete_idx)
);

create table buy_information (
    race_number INT AUTO_INCREMENT PRIMARY KEY,
    win_type  int NOT NULL,
    athlete_idx INT,
    betting_money INT NOT NULL,
    dividends INT NOT NULL,
    refunds INT not null,
    foreign key (athlete_idx) references athlete_information(athlete_idx),
    foreign key (win_type) references betting_type(bet_type_id)
    
);

create table betting_type(
	bet_type_id int auto_increment primary key,
	bet_type_name ENUM('단승식', '연승식', '쌍승식', '복승식', '복연승식', '삼봉승식') NOT NULL
);



create table winner_information(
	winner_idx int auto_increment primary key,
	customer_idx int not null,
	race_number int not null,
	win_type int not null,
	betting_money int not null,
	dividends int not null,
	refunds int not null,
	foreign key (customer_idx) references customer_information(customer_idx),
	foreign key (race_number) references buy_information(race_number),
	foreign key (win_type) references betting_type(bet_type_id)
);




 