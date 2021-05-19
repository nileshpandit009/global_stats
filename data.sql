create table countries (
  id int primary key,
  name varchar(25) not null,
  no_of_states smallint not null,
  capital varchar(25) not null,
  status char(15) not null
);

create table population (
  id int primary key,
  year smallint not null,
  total decimal(8, 2),
  growth_rate decimal(8,2),
  density decimal(8,2),
  country_id int,
  foreign key (country_id) references countries(id)
);

create table environment (
  id int primary key,
  year smallint not null,
  forest_area decimal(8,2),
  co2_emission decimal(8,2),
  power_consumption decimal(8,2),
  country_id int,
  foreign key (country_id) references countries(id)
);

create table people (
  id int primary key,
  year smallint not null,
  sex_ratio decimal(8,2),
  literacy decimal(8,2),
  life_expectancy decimal(8,2),
  country_id int,
  foreign key (country_id) references countries(id)
);

create table gdp (
  id int primary key,
  year smallint not null,
  current decimal(8,2),
  growth decimal(8,2),
  country_id int,
  foreign key (country_id) references countries(id)
);

create table market (
  id int primary key,
  year smallint not null,
  tax_revenue decimal(8,2),
  imports decimal(8,2),
  exports decimal(8,2),
  country_id int,
  foreign key (country_id) references countries(id)
);

create table military (
  id int primary key,
  year smallint not null,
  active int,
  reserved int,
  country_id int,
  foreign key (country_id) references countries(id)
);


insert into countries values(1, 'India', 41, 'New Delhi', 'DEVELOPING');
insert into countries values(2, 'Japan', 48, 'Tokyo', 'DEVELOPED');
insert into countries values(3, 'France', 134, 'Paris', 'DEVELOPED');
insert into countries values(4, 'China', 34, 'Beijing', 'DEVELOPED');
insert into countries values(5, 'Korea South', 35, 'Seoul', 'DEVELOPING');
insert into countries values(6, 'Pakistan', 7, 'Islamabad', 'DEVELOPING');
insert into countries values(7, 'United Arab Emirates', 9, 'Abu Dhabi', 'DEVELOPED');
insert into countries values(8, 'United Kingdom', 114, 'London', 'DEVELOPED');
insert into countries values(9, 'United States', 60, 'Washington D.C.', 'DEVELOPED');



insert into population values (1, 2018, 1352.62, 1.0, 454.9, 1);
insert into population values (2, 2018, 126.53, -0.2, 347.1, 2);
insert into population values (3, 2018, 66.97, 0.2, 122.3, 3);
insert into population values (4, 2018, 1392.73, 0.5, 147.8, 4);
insert into population values (5, 2018, 51.61, 0.5, 529.2, 5);
insert into population values (6, 2018, 212.22, 2.1, 275.3, 6);
insert into population values (7, 2018, 9.63, 1.5, 135.6, 7);
insert into population values (8, 2018, 66.46, 0.6, 274.7, 8);
insert into population values (9, 2018, 326.69, 0.5, 35.7, 9);


insert into people values (1, 2018, 1.1, 74.04, 69, 1);
insert into people values (2, 2018, 1.06, 99.0, 84, 2);
insert into people values (3, 2018, 1.05, 99.0, 83, 3);
insert into people values (4, 2018, 1.13, 99.8, 77, 4);
insert into people values (5, 2018, 1.05, 97.9, 83, 5);
insert into people values (6, 2018, 1.09, 59.0, 67, 6);
insert into people values (7, 2018, 1.04, 93.23, 78, 7);
insert into people values (8, 2018, 1.05, 99.0, 81, 8);
insert into people values (9, 2018, 1.05, 99.0, 79, 9);


insert into environment values (1, 2018, 716.3, 1.82, 1107.0, 1);
insert into environment values (2, 2018, 249.4, 8.94, 8983.3, 2);
insert into environment values (3, 2018, 170.9, 6.89, 8119.2, 3);
insert into environment values (4, 2018, 2162.2, 7.18, 4212.4, 4);
insert into environment values (5, 2018, 63.1, 12.11, 10320.8, 5);
insert into environment values (6, 2018, 38.1, 0.99, 703.2, 6);
insert into environment values (7, 2018, 3.2, 22.04, 11029.3, 7);
insert into environment values (8, 2018, 31.7, 5.78, 5927.4, 8);
insert into environment values (9, 2018, 3098.0, 15.50, 13883.3, 9);

insert into gdp values (1, 2018, 2713.17, 6.1, 1);
insert into gdp values (2, 2018, 4954.81, 0.3, 2);
insert into gdp values (3, 2018, 2787.2, 1.8, 3);
insert into gdp values (4, 2018, 13894.82, 6.7, 4);
insert into gdp values (5, 2018, 1724.85, 2.9, 5);
insert into gdp values (6, 2018, 314.57, 5.8, 6);
insert into gdp values (7, 2018, 422.22, 1.2, 7);
insert into gdp values (8, 2018, 2860.67, 1.3, 8);
insert into gdp values (9, 2018, 20580.16, 2.9, 9);


insert into market values (1, 2018, 12.0, 24.0, 20.0, 1);
insert into market values (2, 2018, 15.3, 18, 19, 2);
insert into market values (3, 2018, 24.2, 33, 32, 3);
insert into market values (4, 2018, 9.1, 18, 19, 4);
insert into market values (5, 2018, 15.5, 37, 42, 5);
insert into market values (6, 2018, 2.4, 20, 9, 6);
insert into market values (7, 2018, 0.1, 67, 93, 7);
insert into market values (8, 2018, 25.6, 32, 31, 8);
insert into market values (9, 2018, 9.9, 15, 12, 9);

insert into military values (1, 2018, 1455550, 1155000, 1);
insert into military values (2, 2018, 247150, 56000, 2);
insert into military values (3, 2018, 203900, 36300, 3);
insert into military values (4, 2018, 2035000, 510000, 4);
insert into military values (5, 2018, 599000, 3100000, 5);
insert into military values (6, 2018, 653800, 0, 6);
insert into military values (7, 2018, 63000, 0, 7);
insert into military values (8, 2018, 148350, 80000, 8);
insert into military values (9, 2018, 1379800, 849450, 9);
