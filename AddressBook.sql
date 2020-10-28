
#UC1 Creating Database

create database address_book
    -> ;


#UC2 Creating table with fields
     create table address_book
    -> (
    -> firstname VARCHAR(150) NOT NULL,
    -> lastname VARCHAR(150) NOT NULL,
    -> address VARCHAR(150) NOT NULL,
    -> city VARCHAR(150) NOT NULL,
    -> state VARCHAR(150) NOT NULL,
    -> zip VARCHAR(8) NOT NULL,
    -> phone VARCHAR(10) NOT NULL,
    -> email VARCHAR(150) NOT NULL,
    -> PRIMARY KEY (firstname)
    -> );

   #UC3 Inserting values into table
   INSERT INTO address_book (firstname, lastname, address, city, state, email) VALUES ('Mayuri', 'Pattanayak', '40/3C', 'Kol', 'WB', 'xyz@gmail.com');
   INSERT INTO address_book  (firstname, lastname, address, city, state, email) VALUES ('Arka', 'Dey', '39/1B', 'Kol', 'WB', 'abc@gmail.com');
   INSERT INTO address_book(firstname, lastname, address, city, state, email) VALUES ('Shawnak', 'Mondal', '77/A', 'Kol', 'WB', 'xyzw@gmail.com');
   INSERT INTO address_book  (firstname, lastname, address, city, state, email)) VALUES ('Sayak', 'Mondal', '77/B, 'Delhi', 'NCR', 'wxyz@gmail.com');

      alter table address_book
    -> add zip
    -> VARCHAR(8)
    -> after state
    -> ;
     alter table address_book
    -> add phone
    -> VARCHAR(10)
    -> after state
    -> ;

    #UC4 Updating a row based on column value
     update address_book
    -> set address='77/C'
    -> where firstname='Shawnak'
    -> ;


    #UC5 deleting a row by column value
     delete from address_book
    -> where firstname='Judo'
    -> ;


    #UC6 Retrieving contacts based on city/state
    select * from address_book where city='Kol';
    select * from address_book where state='WB';


    #UC7 Retrieving count of contacts based pn city name/ state name
     select count(*),city as Count_Of_Contacts from address_book
    -> group by city;

     select count(*),state as Count_Of_Contacts from address_book
    -> group by state
    -> ;


    #UC8 Selecting sorted list

     select * from address_book where city='Kol'
    -> order by firstname;




    #UC9 Adding two columns

     alter table address_book
    -> add type VARCHAR(20) NOT NULL
    -> ;
     alter table address_book
    -> add name VARCHAR(20) NOT NULL
    -> ;



    #UC10 Retrieving count by type
    select count(*),type as Count_Of_Contacts from address_book
    -> group by type
    -> ;

    

    #UC11 Inserting values of both Family and Friend type

    INSERT INTO `address_book`.`address_book` (`firstname`, `lastname`, `address`, `city`, `state`, `zip`, `phone`, `email`, `name`, `type`) VALUES ('Nayan', 'Guha', '66/9A', 'Mumbai', 'Maharashtra', '899934', '8906547890', 'naya@gmail.com', 'Shibpur', 'Family');
    INSERT INTO `address_book`.`address_book` (`firstname`, `lastname`, `address`, `city`, `state`, `zip`, `phone`, `email`, `name`, `type`) VALUES ('Sachin', 'Guha', '66/90A', 'Mumbai', 'Maharashtra', '899394', '8906547780', 'sach@gmail.com', 'JU', 'Friend');



alter table address_book
    -> add type_id VARCHAR(2)
    -> after name
    -> ;



 update address_book
    -> set type_id='Fr'
    -> where city='Mumbai' or city='Delhi'
    -> ;



     select firstname from address_book,typename
    -> where address_book.type_id=typename.typeid
    -> and
    -> typename.typename='Friend'
    -> ;

     create table typename
    -> ( typeid VARCHAR(2) ,
    -> typename VARCHAR(100),
    -> Foreign Key(typeid) references address_book(type_id)
    -> );