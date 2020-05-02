CREATE OR REPLACE Function get_random_only_numbers_varchar
(minimal number,maximal number)
   RETURN varchar2
IS
   str_number integer;
   str_varchar varchar2(50);
BEGIN
    str_number := dbms_random.value(minimal,maximal);
    str_varchar := TO_CHAR(str_number);
RETURN str_varchar;
END;
---------------------------------------------------------------------------------------------------
CREATE OR REPLACE Function get_random_agency_id
   RETURN integer
IS
   agency_id integer;
   agencies_number integer;
BEGIN
    select count(id) into agencies_number from agency;
    agency_id := dbms_random.value(2,agencies_number);
RETURN agency_id;
END;
---------------------------------------------------------------------------------------------------
CREATE OR REPLACE Function get_random_date
(date_from varchar2, date_to varchar2)
   RETURN date
IS
    random_date date;
BEGIN
    SELECT TO_DATE(
              TRUNC(
                   DBMS_RANDOM.VALUE(date_from,date_to)
                    ),'J'
               )into random_date FROM DUAL;
RETURN random_date;
END;
---------------------------------------------------------------------------------------------------
CREATE OR REPLACE Function get_random_car_id
   RETURN integer
IS
   car_id integer;
   cars_number integer;
BEGIN
    select count(id) into cars_number from Car;
    car_id := dbms_random.value(2,cars_number);
RETURN car_id;
END;
---------------------------------------------------------------------------------------------------
CREATE OR REPLACE Function get_random_model_by_company_index
(company_index number)
   RETURN varchar2
IS
car_models DOUBLE_TABSTR := DOUBLE_TABSTR(
TABSTR('Alhambra','Altea','Altea XL','Arosa','Cordoba','Cordoba Vario','Exeo',
'Ibiza','Ibiza ST','Exeo ST','Leon','Leon ST','Inca','Mii','Toledo'),
TABSTR('Captur','Clio','Clio Grandtour','Espace','Express','Fluence','Grand Espace',
'Grand Modus','Grand Scenic','Kadjar','Kangoo','Kangoo Express','Koleos','Laguna','Laguna Grandtour',
'Latitude','Mascott','Mégane','Mégane CC','Mégane Combi','Mégane Grandtour','Mégane Coupé','Mégane Scénic',
'Scénic','Talisman','Talisman Grandtour','Thalia','Twingo','Wind','Zoé'),
TABSTR('1007','107','106','108','2008','205','205 Cabrio',
'206','206 CC','206 SW','207','207 CC','207 SW','306','307',
'307 CC','307 SW','308','308 CC','308 SW','309','4007','4008',
'405','406','407','407 SW','5008','508','508 SW','605',
'806','607','807','Bipper','RCZ'),
TABSTR('Dokker','Duster','Lodgy','Logan','Logan MCV','Logan Van','Sandero',
'Solenza'),
TABSTR('Berlingo','C-Crosser','C-Elissée','C-Zero','C1','C2','C3',
'C3 Picasso','C4','C4 Aircross','C4 Cactus','C4 Coupé','C4 Grand Picasso','C4 Sedan','C5',
'C5 Break','C5 Tourer','C6','C8','DS3','DS4','DS5','Evasion',
'Jumper','Jumpy','Saxo','Nemo','Xantia','Xsara'),
TABSTR('Agila','Ampera','Antara','Astra','Astra cabrio','Astra caravan','Astra coupé',
'Calibra','Campo','Cascada','Corsa','Frontera','Insignia','Insignia kombi','Kadett',
'Meriva','Mokka','Movano','Omega','Signum','Vectra','Vectra Caravan','Vivaro',
'Vivaro Kombi','Zafira'),
TABSTR('145','146','147','155','156','156 Sportwagon','159',
'159 Sportwagon','164','166','4C','Brera','GTV','MiTo','Crosswagon',
'Spider','GT','Giulietta','Giulia'),
TABSTR('Favorit','Felicia','Citigo','Fabia','Fabia Combi','Fabia Sedan','Felicia Combi',
'Octavia','Octavia Combi','Roomster','Yeti','Rapid','Rapid Spaceback','Superb','Superb Combi'),
TABSTR('Alero','Aveo','Camaro','Captiva','Corvette','Cruze','Cruze SW',
'Epica','Equinox','Evanda','HHR','Kalos','Lacetti','Lacetti SW','Lumina',
'Malibu','Matiz','Monte Carlo','Nubira','Orlando','Spark','Suburban','Tacuma',
'Tahoe','Trax'),
TABSTR('911 Carrera','911 Carrera Cabrio','911 Targa','911 Turbo','924','944','997',
'Boxster','Cayenne','Cayman','Macan','Panamera'),
TABSTR('Accord','Accord Coupé','Accord Tourer','City','Civic','Civic Aerodeck','Civic Coupé',
'Civic Tourer','Civic Type R','CR-V','CR-X','CR-Z','FR-V','HR-V','Insight',
'Integra','Jazz','Legend','Prelude'),
TABSTR('BRZ','Forester','Impreza','Impreza Wagon','Justy','Legacy','Legacy Wagon',
'Legacy Outback','Levorg','Outback','SVX','Tribeca','Tribeca B9','XV'),
TABSTR('121','2','3','323','323 Combi','323 Coupé','323 F',
'5','6','6 Combi','626','626 Combi','B-Fighter','B2500','BT',
'CX-3','CX-5','CX-7','CX-9','Demio','MPV','MX-3','MX-5',
'MX-6','Premacy','RX-7','RX-8','Xedox 6'),
TABSTR('3000 GT','ASX','Carisma','Colt','Colt CC','Eclipse','Fuso canter',
'Galant','Galant Combi','Grandis','L200','L200 Pick up','L200 Pick up Allrad','L300','Lancer',
'Lancer Combi','Lancer Evo','Lancer Sportback','Outlander','Pajero','Pajeto Pinin','Pajero Pinin Wagon','Pajero Sport',
'Pajero Wagon','Space Star'),
TABSTR('CT','GS','GS 300','GX','IS','IS 200','IS 250 C',
'IS-F','LS','LX','NX','RC F','RX','RX 300','RX 400h',
'RX 450h','SC 430'),
TABSTR('4-Runner','Auris','Avensis','Avensis Combi','Avensis Van Verso','Aygo','Camry',
'Carina','Celica','Corolla','Corolla Combi','Corolla sedan','Corolla Verso','FJ Cruiser','GT86',
'Hiace','Hiace Van','Highlander','Hilux','Land Cruiser','MR2','Paseo','Picnic',
'Prius','RAV4','Sequoia','Starlet','Supra','Tundra','Urban Cruiser','Verso',
'Yaris','Yaris Verso'),
TABSTR('i3','i8','M3','M4','M5','M6','Rad 1',
'Rad 1 Cabrio','Rad 1 Coupé','Rad 2','Rad 2 Active Tourer','Rad 2 Coupé','Rad 2 Gran Tourer','Rad 3','Rad 3 Cabrio',
'Rad 3 Compact','Rad 3 Coupé','Rad 3 GT','Rad 3 Touring','Rad 4','Rad 4 Cabrio','Rad 4 Gran Coupé','Rad 5',
'Rad 5 GT','Rad 5 Touring','Rad 6','Rad 6 Cabrio','Rad 6 Coupé','Rad 6 Gran Coupé','Rad 7','Rad 8 Coupé',
'X1','X3','X4','X5','X6','Z3','Z3 Coupé','Z3 Roadster',
'Z4','Z4 Roadster'),
TABSTR('Amarok','Beetle','Bora','Bora Variant','Caddy','Caddy Van','Life',
'California','Caravelle','CC','Crafter','Crafter Van','Crafter Kombi','CrossTouran','Eos',
'Fox','Golf','Golf Cabrio','Golf Plus','Golf Sportvan','Golf Variant','Jetta','LT',
'Lupo','Multivan','New Beetle','New Beetle Cabrio','Passat','Passat Alltrack','Passat CC','Passat Variant',
'Passat Variant Van','Phaeton','Polo','Polo Van','Polo Variant','Scirocco','Sharan','T4',
'T4 Caravelle','T4 Multivan','T5','T5 Caravelle','T5 Multivan','T5 Transporter Shuttle','Tiguan','Touareg',
'Touran'),
TABSTR('Alto','Baleno','Baleno kombi','Grand Vitara','Grand Vitara XL-7','Ignis','Jimny',
'Kizashi','Liana','Samurai','Splash','Swift','SX4','SX4 Sedan','Vitara',
'Wagon R+'),
TABSTR('100 D','115','124','126','190','190 D','190 E',
'200 - 300','200 D','200 E','210 Van','210 kombi','310 Van','310 kombi','230 - 300 CE Coupé',
'260 - 560 SE','260 - 560 SEL','500 - 600 SEC Coupé','Trieda A','A','A L','AMG GT','Trieda B',
'Trieda C','C','C Sportcoupé','C T','Citan','CL','CL','CLA',
'CLC','CLK Cabrio','CLK Coupé','CLS','Trieda E','E','E Cabrio','E Coupé',
'E T','Trieda G','G Cabrio','GL','GLA','GLC','GLE','GLK',
'Trieda M','MB 100','Trieda R','Trieda S','S','S Coupé','SL','SLC',
'SLK','SLR','Sprinter'),
TABSTR('9-3','9-3 Cabriolet','9-3 Coupé','9-3 SportCombi','9-5','9-5 SportCombi','900',
'900 C','900 C Turbo','9000'),
TABSTR('100','100 Avant','80','80 Avant','80 Cabrio','90','A1',
'A2','A3','A3 Cabriolet','A3 Limuzina','A3 Sportback','A4','A4 Allroad','A4 Avant',
'A4 Cabriolet','A5','A5 Cabriolet','A5 Sportback','A6','A6 Allroad','A6 Avant','A7',
'A8','A8 Long','Q3','Q5','Q7','R8','RS4 Cabriolet','RS4/RS4 Avant',
'RS5','RS6 Avant','RS7','S3/S3 Sportback','S4 Cabriolet','S4/S4 Avant','S5/S5 Cabriolet','S6/RS6',
'S7','S8','SQ5','TT Coupé','TT Roadster','TTS'),
TABSTR('Avella','Besta','Carens','Carnival','Cee`d','Cee`d SW','Cerato',
'K 2500','Magentis','Opirus','Optima','Picanto','Pregio','Pride','Pro Cee`d',
'Rio','Rio Combi','Rio sedan','Sephia','Shuma','Sorento','Soul','Sportage',
'Venga'),
TABSTR('109','Defender','Discovery','Discovery Sport','Freelander','Range Rover','Range Rover Evoque',
'Range Rover Sport'),
TABSTR('Avenger','Caliber','Challenger','Charger','Grand Caravan','Journey','Magnum',
'Nitro','RAM','Stealth','Viper'),
TABSTR('300 C','300 C Touring','300 M','Crossfire','Grand Voyager','LHS','Neon',
'Pacifica','Plymouth','PT Cruiser','Sebring','Sebring Convertible','Stratus','Stratus Cabrio','Town & Country',
'Voyager'),
TABSTR('Aerostar','B-Max','C-Max','Cortina','Cougar','Edge','Escort',
'Escort Cabrio','Escort kombi','Explorer','F-150','F-250','Fiesta','Focus','Focus C-Max',
'Focus CC','Focus kombi','Fusion','Galaxy','Grand C-Max','Ka','Kuga','Maverick',
'Mondeo','Mondeo Combi','Mustang','Orion','Puma','Ranger','S-Max','Sierra',
'Street Ka','Tourneo Connect','Tourneo Custom','Transit','Transit','Transit Bus','Transit Connect LWB','Transit Courier',
'Transit Custom','Transit kombi','Transit Tourneo','Transit Valnik','Transit Van','Transit Van 350','Windstar'),
TABSTR('H2','H3'),
TABSTR('Accent','Atos','Atos Prime','Coupé','Elantra','Galloper','Genesis',
'Getz','Grandeur','H 350','H1','H1 Bus','H1 Van','H200','i10',
'i20','i30','i30 CW','i40','i40 CW','ix20','ix35','ix55',
'Lantra','Matrix','Santa Fe','Sonata','Terracan','Trajet','Tucson','Veloster'),
TABSTR('EX','FX','G','G Coupé','M','Q','QX'),
TABSTR('Daimler','F-Pace','F-Type','S-Type','Sovereign','X-Type','X-type Estate',
'XE','XF','XJ','XJ12','XJ6','XJ8','XJ8','XJR',
'XK','XK8 Convertible','XKR','XKR Convertible'),
TABSTR('Cherokee','Commander','Compass','Grand Cherokee','Patriot','Renegade','Wrangler'),
TABSTR('100 NX','200 SX','350 Z','350 Z Roadster','370 Z','Almera','Almera Tino',
'Cabstar E - T','Cabstar TL2 Valnik','e-NV200','GT-R','Insterstar','Juke','King Cab','Leaf',
'Maxima','Maxima QX','Micra','Murano','Navara','Note','NP300 Pickup','NV200',
'NV400','Pathfinder','Patrol','Patrol GR','Pickup','Pixo','Primastar','Primastar Combi',
'Primera','Primera Combi','Pulsar','Qashqai','Serena','Sunny','Terrano','Tiida',
'Trade','Vanette Cargo','X-Trail'),
TABSTR('240','340','360','460','850','850 kombi','C30',
'C70','C70 Cabrio','C70 Coupé','S40','S60','S70','S80','S90',
'V40','V50','V60','V70','V90','XC60','XC70','XC90'),
TABSTR('Espero','Kalos','Lacetti','Lanos','Leganza','Lublin','Matiz',
'Nexia','Nubira','Nubira kombi','Racer','Tacuma','Tico'),
TABSTR('1100','126','500','500L','500X','850','Barchetta',
'Brava','Cinquecento','Coupé','Croma','Doblo','Doblo Cargo','Doblo Cargo Combi','Ducato',
'Ducato Van','Ducato Kombi','Ducato Podvozok','Florino','Florino Combi','Freemont','Grande Punto','Idea',
'Linea','Marea','Marea Weekend','Multipla','Palio Weekend','Panda','Panda Van','Punto',
'Punto Cabriolet','Punto Evo','Punto Van','Qubo','Scudo','Scudo Van','Scudo Kombi','Sedici',
'Seicento','Stilo','Stilo Multiwagon','Strada','Talento','Tipo','Ulysse','Uno',
'X1/9'),
TABSTR('Cooper','Cooper Cabrio','Cooper Clubman','Cooper D','Cooper D Clubman','Cooper S','Cooper S Cabrio',
'Cooper S Clubman','Countryman','Mini One','One D'),
TABSTR('200','214','218','25','400','414','416',
'620','75'),
TABSTR('Cabrio','City-Coupé','Compact Pulse','Forfour','Fortwo cabrio','Fortwo coupé','Roadster'));

car_model varchar2(50);
model_index integer;
BEGIN
    model_index := dbms_random.value(1,car_models(company_index).count);
    car_model := car_models(company_index)(model_index);
    
RETURN car_model;
END;
----------------------------------------------------------------------------------------------------------------
CREATE OR REPLACE Function get_last_car_id
   RETURN number
IS
   last_id integer;
BEGIN
    SELECT MAX(id)into last_id FROM Car;
RETURN last_id ;
END;
----------------------------------------------------------------------------------------------------------------
CREATE OR REPLACE Function get_last_agency_id
    RETURN number
IS
   last_id integer;
BEGIN
    SELECT MAX(id)into last_id FROM Agency;
RETURN last_id ;
END;
----------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------
CREATE OR REPLACE Function get_last_rental_id
    RETURN number
IS
   last_id integer;
BEGIN
    SELECT MAX(id)into last_id FROM Rental;
RETURN last_id ;
END;
----------------------------------------------------------------------------------------------------------------
CREATE OR REPLACE Function get_unique_email
   RETURN varchar2
IS
    unique_email varchar2(100);
    prefix_length number(2);
    prefix varchar2(50);
    email_number number(1):= 1;
BEGIN
     --musza byc rozne
    while (email_number != 0)
    loop
        prefix_length := dbms_random.value(4,15);
        prefix := dbms_random.string('a',prefix_length);
        unique_email := CONCAT(prefix,'@elka.pl');
        SELECT count(id) into email_number FROM Customer where Email = unique_email;
    end loop;
RETURN unique_email;
END;
----------------------------------------------------------------------------------------------------------------
CREATE OR REPLACE Function get_unique_nick
   RETURN varchar2
IS
    unique_nick varchar2(100);
    nick_length number(2);
    nick_number number(1):= 1;
BEGIN
     --nick has to be unique
    while (nick_number != 0)
    loop
        nick_length := dbms_random.value(6,15);
        unique_nick := dbms_random.string('l',nick_length);
        SELECT count(id) into nick_number FROM Customer where Nick = unique_nick;
    end loop;
RETURN unique_nick;
END;
-----------------------------------------------------------------------------------------
CREATE OR REPLACE Function get_random_employee_id
   RETURN integer
IS
   employee_id integer;
   employees_number integer;
BEGIN
    select count(id) into employees_number from Employee;
    employee_id := dbms_random.value(1,employees_number);
RETURN employee_id;
END;
-----------------------------------------------------------------------------------------
CREATE OR REPLACE Function get_random_customer_id
   RETURN integer
IS
   customer_id integer;
   customwers_number integer;
BEGIN
    select count(id) into customwers_number from Customer;
    customer_id := dbms_random.value(1,customwers_number);
RETURN customer_id;
END;
-----------------------------------------------------------------------------------------
CREATE OR REPLACE Function get_random_rental_id_by_customer_id
(customer_id integer)
   RETURN integer
IS
     rentals_ids  TABINT;
BEGIN
    select Id
    BULK COLLECT INTO rentals_ids
    FROM Rental
    WHERE customer_id = customer_id
    order by dbms_random.value;
    
RETURN rentals_ids(1);
END;
-----------------------------------------------------------------------------------------
CREATE OR REPLACE Function get_car_id_by_rental_id
(rental_id integer)
   RETURN integer
IS
     car_id integer;
BEGIN
    select Car_id into car_id
    FROM Rental
    WHERE Id = rental_id;
RETURN car_id;
END;
-----------------------------------------------------------------------------------------
CREATE OR REPLACE Function get_rental_start_date_by_rental_id
(rental_id integer)
   RETURN date
IS
     start_date date;
BEGIN
    select start_date into start_date
    FROM Rental
    WHERE Id = rental_id;
RETURN start_date;
END;