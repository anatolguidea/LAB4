create table cumparatori (
    cumparatorID int auto_increment primary key ,
    nume varchar(255) not null ,
    prenume varchar(255) not null ,
    email varchar(255) unique not null ,
    telefon varchar(15),
    adresa varchar(255)
);

create table comenzi (
    comandaID int auto_increment primary key,
    datacomenzii date not null,
    totalcomanda decimal(10, 2) not null,
    produs varchar(255) not null,
    cantitate int not null,
    cumparatorID int not null,
    foreign key (cumparatorID) references cumparatori(cumparatorID)
);

create table students (
    personID int unique not null ,
    lastname varchar (255) not null ,
    firstname varchar(255) not null ,
    address varchar(255),
    city varchar(255)
);

-- insert cumparatori
insert into cumparatori (nume, prenume, email, telefon, adresa)
values
    ('Smith', 'John', 'john.smith@example.com', '1234567890', '123 Main St'),
    ('Doe', 'Jane', 'jane.doe@example.com', '9876543210', '456 Elm St'),
    ('Johnson', 'David', 'david.j@example.com', '5555555555', '789 Oak St'),
    ('Williams', 'Sarah', 'sarah.w@example.com', '6666666666', '101 Pine St'),
    ('Brown', 'Michael', 'michael.brown@example.com', '1111111111', '789 Park Ave'),
    ('Wilson', 'Linda', 'linda.w@example.com', '2222222222', '567 Maple St'),
    ('Jones', 'Robert', 'robert.j@example.com', '3333333333', '321 Birch St');

-- insert comenzi
insert into comenzi (datacomenzii, totalcomanda, produs, cantitate, cumparatorID)
values
    ('2023-11-01', round(rand() * 100, 2), 'Produs A', floor(rand() * 10) + 1, 1),
    ('2023-11-02', round(rand() * 100, 2), 'Produs A', floor(rand() * 10) + 1, 2),
    ('2023-11-03', round(rand() * 100, 2), 'Produs A', floor(rand() * 10) + 1, 3),
    ('2023-11-06', round(rand() * 100, 2), 'Produs A', floor(rand() * 10) + 1, 4),
    ('2023-11-06', round(rand() * 100, 2), 'Produs E', floor(rand() * 10) + 1, 5),
    ('2023-11-06', round(rand() * 100, 2), 'Produs F', floor(rand() * 10) + 1, 6),
    ('2023-11-06', round(rand() * 100, 2), 'Produs G', floor(rand() * 10) + 1, 7),
    ('2023-11-01', round(rand() * 100, 2), 'Produs h', floor(rand() * 10) + 1, 1),
    ('2023-11-02', round(rand() * 100, 2), 'Produs i', floor(rand() * 10) + 1, 1),
    ('2023-11-03', round(rand() * 100, 2), 'Produs j', floor(rand() * 10) + 1, 1);

-- insert students
insert into students (personID, lastname, firstname, address, city)
values
    (5, 'Popa', 'Ion', 'Str. Alba Iulia 20', 'Oradea'),
    (6, 'Mihai', 'Ana', 'Str. Dorobanti 3', 'Brasov'),
    (7, 'Stanescu', 'Anatol', 'Str. Gheorghe Doja 12', 'Constanta'),
    (8, 'Neagu', 'Elena', 'Str. Vasile Lupu 8', 'Ploiesti');

-- selects
select * from cumparatori;
select cumparatorID from cumparatori;

select * from comenzi;
select produs from comenzi;

select * from students;
select * from students order by lastname, firstname;

-- delets
delete from cumparatori where nume = 'Jones';
delete from cumparatori where telefon = '2222222222';

delete from students where lastname = 'Neagu';
delete from students where city = 'Ploiesti';

delete from comenzi where cumparatorID = 7;

-- updates
update cumparatori set nume = 'Guidea' where prenume = 'Sarah';
update cumparatori set telefon = '0745678901' where nume = 'Brown' and prenume = 'Michael';

update students set city = 'Chisinau' where lastname = 'Popa' and firstname = 'Ion';
update students set lastname = 'Guidea' where personID = 8;

update comenzi set produs = 'Apa' where cumparatorID = 4;

select *
from comenzi inner join cumparatori
on comenzi.cumparatorID = cumparatori.cumparatorID;

select cumparatori.nume, cumparatori.prenume, comenzi.produs , comenzi.datacomenzii
from comenzi inner join cumparatori
on comenzi.cumparatorID = cumparatori.cumparatorID where comenzi.datacomenzii='2023-11-06';

select *
from comenzi left join cumparatori
on comenzi.cumparatorID = cumparatori.cumparatorID;

select cumparatori.email, cumparatori.telefon
from comenzi left join cumparatori
on comenzi.cumparatorID = cumparatori.cumparatorID where comenzi.datacomenzii='2023-11-06';

select *
from comenzi right join cumparatori
on comenzi.cumparatorID = cumparatori.cumparatorID;

select cumparatori.adresa
from comenzi right join cumparatori
on comenzi.cumparatorID = cumparatori.cumparatorID where comenzi.produs='Produs A';

select *
from comenzi cross join cumparatori
on comenzi.cumparatorID = cumparatori.cumparatorID;

select cumparatori.nume, cumparatori.prenume, cumparatori.telefon
from comenzi cross join cumparatori
on comenzi.cumparatorID = cumparatori.cumparatorID where cumparatori.adresa='101 Pine St';

drop table comenzi;
drop table cumparatori;
drop table students;
