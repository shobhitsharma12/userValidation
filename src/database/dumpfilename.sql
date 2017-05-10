-- MySQL dump 10.13  Distrib 5.7.16, for osx10.11 (x86_64)
--
-- Host: localhost    Database: testdb
-- ------------------------------------------------------
-- Server version	5.7.16

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `AGENCY`
--

DROP TABLE IF EXISTS `AGENCY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `AGENCY` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `ADDRESS` varchar(255) NOT NULL,
  `CITY` varchar(30) NOT NULL,
  `COUNTRY` varchar(30) NOT NULL,
  `NAME` varchar(64) NOT NULL,
  `PHONE` varchar(20) NOT NULL,
  `POS` varchar(5) NOT NULL,
  `PROVINCE` varchar(64) NOT NULL,
  `SABREPCC` varchar(20) DEFAULT NULL,
  `STATUS` varchar(30) NOT NULL,
  `ZIPCODE` varchar(15) NOT NULL,
  `VERSION` bigint(20) DEFAULT NULL,
  `MARKUP_ID` bigint(20) DEFAULT NULL,
  `ETICKET_RIGHTS` varchar(1) NOT NULL DEFAULT 'N',
  `SKYROUTE_COMMI` varchar(25) DEFAULT NULL,
  `SKYROUTE_COMMI_TYPE` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `unique_agency_phone` (`PHONE`),
  KEY `FK_AG_MA_P0` (`MARKUP_ID`),
  CONSTRAINT `FK_AG_MA_P0` FOREIGN KEY (`MARKUP_ID`) REFERENCES `MARKUP` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=1000 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AGENCY`
--

LOCK TABLES `AGENCY` WRITE;
/*!40000 ALTER TABLE `AGENCY` DISABLE KEYS */;
INSERT INTO `AGENCY` VALUES (999,'CT','YUL','CA','Agency X','8605474357','CA','ANY','12T4','ACTIVE','51236',1,999,'N',NULL,NULL);
/*!40000 ALTER TABLE `AGENCY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AGENCYREGISTRATION`
--

DROP TABLE IF EXISTS `AGENCYREGISTRATION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `AGENCYREGISTRATION` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `AGENCY_NAME` varchar(255) NOT NULL,
  `AGENCY_PHONE` varchar(20) NOT NULL,
  `AGENCY_ADDRESS` varchar(255) NOT NULL,
  `AGENCY_CITY` varchar(30) NOT NULL,
  `AGENCY_COUNTRY` varchar(30) NOT NULL,
  `AGENCY_PROVINCE` varchar(64) NOT NULL,
  `AGENCY_ZIPCODE` varchar(15) NOT NULL,
  `SABREPCC` varchar(20) DEFAULT NULL,
  `AGENCYADMIN_FNAME` varchar(64) NOT NULL,
  `AGENCYADMIN_LNAME` varchar(64) NOT NULL,
  `AGENCYADMIN_TITLE` varchar(30) NOT NULL,
  `AGENCYADMIN_PHONE` varchar(20) DEFAULT NULL,
  `AGENCYADMIN_FAX` varchar(20) DEFAULT NULL,
  `AGENCYADMIN_EMAIL` varchar(255) NOT NULL,
  `STATUS` varchar(30) NOT NULL,
  `VERSION` bigint(20) DEFAULT NULL,
  `IS_SUBSCRIBED` varchar(1) DEFAULT NULL,
  `PROMO_CODE` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AGENCYREGISTRATION`
--

LOCK TABLES `AGENCYREGISTRATION` WRITE;
/*!40000 ALTER TABLE `AGENCYREGISTRATION` DISABLE KEYS */;
/*!40000 ALTER TABLE `AGENCYREGISTRATION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AGENCYTIER`
--

DROP TABLE IF EXISTS `AGENCYTIER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `AGENCYTIER` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `ETICKETRIGHTS` varchar(255) DEFAULT NULL,
  `MAXCOMMISSION` int(11) DEFAULT NULL,
  `MINCOMMISSION` int(11) DEFAULT NULL,
  `name` varchar(64) DEFAULT NULL,
  `STATUS` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AGENCYTIER`
--

LOCK TABLES `AGENCYTIER` WRITE;
/*!40000 ALTER TABLE `AGENCYTIER` DISABLE KEYS */;
INSERT INTO `AGENCYTIER` VALUES (1,'',100,75,'PLATINUM','active'),(2,'',75,54,'GOLD','active'),(3,'',50,25,'SILVER','active'),(4,NULL,7,5,'OLDONE','INACTIVE'),(5,NULL,20,5,'DIAMOND','ACTIVE');
/*!40000 ALTER TABLE `AGENCYTIER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AI`
--

DROP TABLE IF EXISTS `AI`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `AI` (
  `carrier` varchar(2) NOT NULL,
  `incentive_pct` int(2) DEFAULT NULL,
  `incentive_dlrs` int(2) DEFAULT NULL,
  `agt_share_pct` int(2) DEFAULT NULL,
  PRIMARY KEY (`carrier`),
  UNIQUE KEY `carrier` (`carrier`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AI`
--

LOCK TABLES `AI` WRITE;
/*!40000 ALTER TABLE `AI` DISABLE KEYS */;
INSERT INTO `AI` VALUES ('AA',4,2,21),('AB',3,20,25),('AC',4,2,21),('AF',4,0,25),('AI',6,2,20),('BA',3,0,25),('CX',2,0,25),('DL',7,0,25),('ET',8,0,25),('EY',5,0,25),('FI',4,0,25),('LH',4,0,25),('LO',4,0,25),('MS',2,12,15),('S4',4,2,21),('SG',4,0,25),('SN',4,2,22),('TK',4,2,21),('TP',4,2,21),('TS',4,2,21),('UA',7,0,25),('VS',5,0,25),('WS',3,0,25),('WW',4,2,21);
/*!40000 ALTER TABLE `AI` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AIRLINE`
--

DROP TABLE IF EXISTS `AIRLINE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `AIRLINE` (
  `AIRLINE_CD` varchar(5) NOT NULL,
  `AIRLINE_NAME` varchar(100) DEFAULT NULL,
  `CREATE_DTTM` datetime DEFAULT NULL,
  `LAST_UPD_DTTM` datetime DEFAULT NULL,
  `VERSION` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`AIRLINE_CD`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AIRLINE`
--

LOCK TABLES `AIRLINE` WRITE;
/*!40000 ALTER TABLE `AIRLINE` DISABLE KEYS */;
/*!40000 ALTER TABLE `AIRLINE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AIRPORT`
--

DROP TABLE IF EXISTS `AIRPORT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `AIRPORT` (
  `AIRPORT_CD` varchar(5) NOT NULL,
  `AIRPORT_NAME` varchar(255) NOT NULL,
  `COUNTRY_CD` varchar(5) DEFAULT NULL,
  PRIMARY KEY (`AIRPORT_CD`),
  KEY `FK_AI_CO_P0` (`COUNTRY_CD`),
  CONSTRAINT `FK_AI_CO_P0` FOREIGN KEY (`COUNTRY_CD`) REFERENCES `COUNTRY` (`COUNTRY_CD`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AIRPORT`
--

LOCK TABLES `AIRPORT` WRITE;
/*!40000 ALTER TABLE `AIRPORT` DISABLE KEYS */;
INSERT INTO `AIRPORT` VALUES ('AAL','Aalborg','DK'),('ABE','Allentown/Bethlehem','US'),('ABJ','Abidjan','CI'),('ABQ','Albuquerque, Albuquerque Intl','US'),('ABX','Albury','AU'),('ABZ','Aberdeen, Dyce','GB'),('ACA','Acapulco','MX'),('ACC','Accra','GH'),('ACT','Waco','US'),('ADD','Addis Abeba','ET'),('ADL','Adelaide','AU'),('AEX','Alexandria','US'),('AGA','Agadir','MA'),('AGP','Malaga','ES'),('AKL','Auckland','NZ'),('ALA','Almaty','KZ'),('ALB','Albany','US'),('ALC','Alicante','ES'),('ALG','Algiers, Houari Boumedienne ','DZ'),('ALP','Aleppo','SY'),('AMA','Amarillo','US'),('AMD','Ahmedabad, Sardar Vallabhbhai Patel Int\'l','IN'),('AMM','Amman, Queen Alia Intl ','JO'),('AMS','Amsterdam, Amsterdam-Schiphol ','NL'),('ANC','Anchorage, Ted Stevens Anchorage Intl ','US'),('ANU','Antigua, V. C. Bird Intl ','AG'),('AOI','Ancona','IT'),('ARM','Armidale','AU'),('ARN','Stockholm, Arlanda','SE'),('ASP','Alice Springs','AU'),('ASU','Asuncion, Paraguay','PY'),('ATH','Athens, E. Venizelos','GR'),('ATL','Atlanta, Hartsfield-Jackson Atlanta Intl ','US'),('ATQ','Amritsar, India - Amritsar','IN'),('AUA','Aruba, Reina Beatrix','AW'),('AUH','Abu Dhabi','AE'),('AUS','Austin, Austin-Bergstrom Intl ','US'),('AVL','Asheville','US'),('AVP','Wilkes-Barre','US'),('AVV','Avalon','AU'),('AYQ','Ayers Rock','AU'),('AZS','Samaná El Catey Intl','DO'),('BAH','Bahrain','BH'),('BAQ','Barranquilla','CO'),('BCN','Barcelona','ES'),('BDA','Bermuda','BM'),('BDL','Hartford, Bradley Intl ','US'),('BEG','Belgrade','RS'),('BER','Berlin, Brandenburg Intl','DE'),('BES','Brest','FR'),('BEY','Beirut','LB'),('BFD','Bradford','US'),('BGA','Bucaramanga','CO'),('BGF','Bullfrog Basin','US'),('BGI','Bridgetown, Grantley Adams Intl ','BB'),('BGO','Bergen','NO'),('BHD','Belfast','GB'),('BHM','Birmingham','US'),('BIL','Billings','US'),('BIO','Bilbao','ES'),('BJM','Bujumbura','BI'),('BKK','Bangkok, Suvarnabhumi Intl ','TH'),('BLL','Billund','DK'),('BLQ','Bologna','IT'),('BLR','Bengaluru','IN'),('BNA','Nashville','US'),('BNE','Brisbane','AU'),('BNK','Ballina','AU'),('BOD','Bordeaux','FR'),('BOG','Bogota, Eldorado','CO'),('BOI','Boise, Boise Air Term. (Gowen Field)','US'),('BOM','Mumbai, Chhatrapati Shivaji Intl ','IN'),('BOS','Boston, Logan Intl ','US'),('BPT','Beamont','US'),('BQN','Aguadilla, Rafael Hernandez','PR'),('BRE','Bremen','DE'),('BRI','Bari','IT'),('BRN','Berne','CH'),('BRO','Brownsville','US'),('BRU','Brussels, Luchthaven-Brussel','BE'),('BSB','Brasilia, Presidente Juscelino Kubitschek','BR'),('BSL','Basel, EuroAirport Basel-Mulhouse-Freiburg','CH'),('BTR','Baton Rouge','US'),('BTS','Bratislava','SK'),('BTV','Burlington','US'),('BUD','Budapest, Ferihegy','HU'),('BUF','Buffalo, Buffalo Niagara Intl ','US'),('BUR','Burbank, Bob Hope ','US'),('BWI','Baltimore, International Thurgood Marshall Airport','US'),('CAE','Columbia','US'),('CAI','Cairo','EG'),('CAN','Guangzhou','CN'),('CBR','Canberra','AU'),('CCC','Cayo Coco','CU'),('CCS','Caracas, Simon Bolivar Intl','VE'),('CCU','Kolkata','IN'),('CDG','Paris, Charles de Gaulle','FR'),('CEB','Cebu Mactan International','PH'),('CFS','Coffs Harbour','AU'),('CGK','Jakarta, Soekarno-Hatta Intl','ID'),('CGN','Cologne, Cologne Bonn ','DE'),('CGQ','Changchun','CN'),('CHC','Christchurch','NZ'),('CHS','Charleston, Charleston Intl','US'),('CID','Cedar Rapids','US'),('CKG','Chongqing','CN'),('CKY','Conakry','GN'),('CLE','Cleveland, Hopkins Intl','US'),('CLL','College Station','US'),('CLO','Cali, Alfonso B. Aragon','CO'),('CLT','Charlotte, Charlotte Douglas Intl','US'),('CMB','Colombo, Bandaranayake','LK'),('CMH','Columbus, Port Columbus Intl ','US'),('CMN','Casablanca','MA'),('CNS','Cairns','AU'),('COS','Colorado Springs','US'),('CPH','Copenhagen','DK'),('CPT','Cape Town','ZA'),('CRP','Corpus Christi','US'),('CTA','Catania, Fontanarossa','IT'),('CTG','Cartagena, Rafael Nuñez','CO'),('CTS','Sapporo, New Chitose','JP'),('CTU','Chengdu','CN'),('CUN','Cancun','MX'),('CUR','Curacao, Hato International Airport','CW'),('CUZ','Cuzco, Peru','PE'),('CVG','Cincinnati/Northern Kentucky','US'),('CYO','Cayo Largo del Sur','CU'),('CZM','Cozumel','MX'),('DAC','Dhaka, Zia Intl','BD'),('DAM','Damascus','SY'),('DAR','Dar Es Salaam','TZ'),('DAY','Dayton, James Cox Dayton Intl','US'),('DBO','Dubbo','AU'),('DCA','Washington, R.Reagan National','US'),('DEL','Delhi, Indira Gandhi Intl','IN'),('DEN','Denver','US'),('DFW','Dallas, Dallas Ft. Worth','US'),('DGO','Durango, Guadalupe Victoria','MX'),('DKR','Dakar','SN'),('DLA','Douala','CM'),('DLC','Dalian','CN'),('DME','Moscow, Domodedovo','RU'),('DMM','Dammam, King Fahd Intl','SA'),('DOH','Doha','QA'),('DOK','Donetsk','UA'),('DRS','Dresden','DE'),('DRT','Del Rio','US'),('DRW','Darwin','AU'),('DSM','Des Moines','US'),('DTW','Detroit, Detroit Metropolitan Wayne County ','US'),('DUB','Dublin','IE'),('DUJ','Dubois','US'),('DUS','Düsseldorf','DE'),('DXB','Dubai','AE'),('EBB','Entebbe','UG'),('EDI','Edinburgh','GB'),('ELP','El Paso','US'),('ERI','Erie','US'),('ESB','Ankara','TR'),('EUG','Eugene','US'),('EVN','Yerevan','AM'),('EWR','New York, Newark','US'),('EZE','Buenos Aires, Ministro Pistarini','AR'),('FAO','Faro','PT'),('FAT','Fresno','US'),('FCO','Rome, Leonardo da Vinci Intl (Fiumicino)','IT'),('FDF','Fort-de-France, Lamentin','MQ'),('FDH','Friedrichshafen','DE'),('FIH','Kinshasa','CD'),('FKL','Franklin','US'),('FLL','Fort Lauderdale','US'),('FLR','Florence','IT'),('FMO','Muenster','DE'),('FNA','Freetown','SL'),('FNT','Flint','US'),('FOC','Fuzhou','CN'),('FRA','Frankfurt','DE'),('FRU','Bishkek','KG'),('FUK','Fukuoka','JP'),('FWA','Fort Wayne','US'),('GCM','Grand Cayman, Owen Roberts Intl','KY'),('GDL','Guadalajara','MX'),('GDN','Gdansk, Rebiechowo','PL'),('GEG','Spokane','US'),('GGT','George Town, Exuma Intl','BS'),('GIG','Rio de Janeiro','BR'),('GJT','Grand Junction','US'),('GLA','Glasgow','GB'),('GND','Grenada, Point Salines Intl ','GD'),('GOA','Genoa','IT'),('GOT','Gothenburg, Göteborg-Landvetter','SE'),('GPT','Gulfport','US'),('GRK','Ile Killeen, Gray Army Air Field','US'),('GRR','Grand Rapids, Gerald R. Ford Intl','US'),('GRU','Sao Paulo, Guarulhos Intl','BR'),('GRZ','Graz, Thalerhof','AT'),('GSO','Greensboro/High Point, Piedmont Triad Intl','US'),('GSP','Greenville','US'),('GUA','Guatemala City, Guatemala','GT'),('GVA','Geneva, Genève-Cointrin ','CH'),('GYD','Baku','AZ'),('GYE','Guayaquil','EC'),('HAJ','Hannover','DE'),('HAM','Hamburg, Fuhlsbuettel','DE'),('HAN','Hanoi, Noibai Intl','VN'),('HAV','Havana, José Marti Intl ','CU'),('HBA','Hobart','AU'),('HEL','Helsinki, Helsinki-Vantaa ','FI'),('HET','Hohhot','CN'),('HGH','Hangzhou','CN'),('HKG','Hong Kong','HK'),('HKT','Phuket International Airport - Thailand','TH'),('HNL','Oahu/Honolulu','US'),('HOG','Holguin, Frank Pais','CU'),('HOQ','Hof','DE'),('HPN','New York, Westchester County','US'),('HRB','Harbin','CN'),('HRL','Harlingen','US'),('HSV','Huntsville','US'),('HTI','Hamilton Island','AU'),('HUX','Huatulco','MX'),('HYD','Hyderabad','IN'),('IAD','Washington, Dulles','US'),('IAH','Houston, G. Bush Intercont.','US'),('ICN','Seoul, Incheon Intl','KR'),('ICT','Wichita, Mid-Continent','US'),('IKA','Tehran','IR'),('IND','Indianapolis','US'),('INN','Innsbruck, Kranebitten','AT'),('INV','Inverness','GB'),('IST','Istanbul','TR'),('ITH','Ithaca Tompkins','US'),('ITM','Osaka, Itami Intl','JP'),('JAC','Jackson, Jackson Hole Airport','US'),('JAN','Jackson','US'),('JAX','Jacksonville','US'),('JED','Jeddah','SA'),('JER','Jersey','GB'),('JFK','New York, John F Kennedy Intl','US'),('JHW','Jamestown','US'),('JNB','Johannesburg','ZA'),('KBP','Kiev, Borispol ','UA'),('KGL','Kigali','RW'),('KHI','Karachi Jinnah Int\'l','PK'),('KIN','Kingston','JM'),('KIX','Osaka, Kansai Intl','JP'),('KLU','Klagenfurt, Alpe Adria ','AT'),('KMG','Kunming','CN'),('KOA','Kona/Kailua, Keahole','US'),('KRK','Krakow, J. Paul II Balice Intl','PL'),('KRT','Khartoum','SD'),('KUL','Kuala Lumpur','MY'),('KWI','Kuwait City','KW'),('LAD','Luanda','AO'),('LAS','Las Vegas, Mc Carran Intl','US'),('LAX','Los Angeles','US'),('LBA','Leeds, Leeds/Bradford ','GB'),('LBB','Lubbock','US'),('LCH','Lake Charles','US'),('LED','St. Petersburg, Pulkovo','RU'),('LEJ','Leipzig, Halle','DE'),('LFT','Lafayette','US'),('LFW','Lome','TG'),('LGA','New York, LaGuardia','US'),('LGW','London Gatwick','UK'),('LHR','London, Heathrow','GB'),('LIM','Lima, Jorge Chavez Intl','PE'),('LIN','Milan, Linate','IT'),('LIR','Liberia','CR'),('LIS','Lisbon','PT'),('LIT','Little Rock','US'),('LNZ','Linz, Blue Danube ','AT'),('LOS','Lagos','NG'),('LPB','La Paz, Bolivia','BO'),('LRD','Laredo','US'),('LRM','La Romana, Casa de Campo Intl','DO'),('LUG','Lugano/Agno','CH'),('LUX','Luxemburg','LU'),('LWB','Lewisburg','US'),('LYS','Lyon','FR'),('MAA','Chennai','IN'),('MAD','Madrid, Barajas ','ES'),('MAF','Midland Odessa','US'),('MAN','Manchester','GB'),('MBJ','Montego Bay, Sangster Intl','JM'),('MCI','Kansas City','US'),('MCO','Orlando','US'),('MCT','Muscat','OM'),('MCY','Sunshine Coast','AU'),('MDE','Medellin, José Maria Córdova','CO'),('MDT','Harrisburg','US'),('MEL','Melbourne','AU'),('MEM','Memphis','US'),('MEX','Mexico City, Benito Juarez','MX'),('MFE','Mcallen','US'),('MGA','Managua, Augusto C. Sandino','NI'),('MHT','Manchester','US'),('MIA','Miami','US'),('MID','Merida','MX'),('MKE','Milwaukee, General Mitchell Intl','US'),('MLA','Malta','MT'),('MLM','Morelia','MX'),('MLU','Monroe','US'),('MME','Teesside, Durham Tees Valley','GB'),('MNL','Manila','PH'),('MOB','Mobile','US'),('MPL','Montpellier','FR'),('MRS','Marseille','FR'),('MRY','Monterey','US'),('MRZ','Moree','AU'),('MSP','Minneapolis, St. Paul Intl','US'),('MSY','New Orleans','US'),('MTY','Monterrey','MX'),('MUC','Munich, Franz Josef Strauss ','DE'),('MVD','Montevideo, Uruguay','UY'),('MXP','Milan, Malpensa','IT'),('MYR','Myrtle Beach','US'),('MZT','Mazatlan','MX'),('NAG','Nagpur Dr.Ambedkar Int\'l','IN'),('NAP','Naples','IT'),('NAS','Nassau','BS'),('NBO','Nairobi','KE'),('NCE','Nice','FR'),('NCL','Newcastle','UK'),('NGO','Nagoya, Centrair (Central Japan Intl)','JP'),('NKG','Nanjing','CN'),('NRT','Tokyo, Narita','JP'),('NSI','Yaounde Nsimalen Intl','CM'),('NTE','Nantes','FR'),('NTL','Newcastle','AU'),('NUE','Nuremberg','DE'),('OAK','Oakland, Metropolitan Oak Intl','US'),('OAX','Oaxaca','MX'),('OGG','Maui/Kahului','US'),('OKA','Okinawa, Naha','JP'),('OKC','Oklahoma City, Will Rogers World','US'),('OMA','Omaha, Eppley Airfield','US'),('ONT','Ontario','US'),('OOL','Gold Coast','AU'),('OPO','Oporto','PT'),('ORD','Chicago, OHare Intl','US'),('ORF','Norfolk','US'),('ORY','Paris, Orly','FR'),('OSL','Oslo','NO'),('OTP','Bucharest, Henri Coanda Intl ','RO'),('OUA','Ouagadougou','BF'),('PAD','Paderborn','DE'),('PAP','Port-au-Prince, Mais Gate','HT'),('PBI','West Palm Beach','US'),('PDX','Portland','US'),('PEK','Beijing','CN'),('PER','Perth','AU'),('PHL','Philadelphia','US'),('PHX','Phoenix, Sky Harbor Intl','US'),('PIT','Pittsburgh','US'),('PLS','Providenciales','TC'),('PMI','Palma, Palma Mallorca','ES'),('PMO','Palermo, Punta Raisi','IT'),('PNQ','Lohegaon, Poona','IN'),('PNS','Pensacola','US'),('POA','Porto Alegre','BR'),('POP','Puerto Plata, La Union','DO'),('POZ','Poznan','PL'),('PQQ','Port Macquarie','AU'),('PRG','Prague, Ruzyne','CZ'),('PSA','Pisa','IT'),('PSP','Palm Springs','US'),('PTP','Pointe-à-Pitre, Pôle Caraïbes','GP'),('PTY','Panama Tocumen, Panama','PA'),('PUF','Pau','FR'),('PUJ','Punta Cana','DO'),('PUS','Busan, Gimhae','KR'),('PVD','Providence, Theodore Francis','US'),('PVG','Shanghai, Pu Dong','CN'),('PVR','Puerto Vallarta, Ordaz','MX'),('PWM','Portland','US'),('RAK','Menara','MA'),('RDU','Raleigh/Durham','US'),('REC','Recife - Guararapes/Gilberto Freyre Intl Airport','BR'),('REG','Reggio Calabria','IT'),('RIC','Richmond','US'),('RIX','Riga','LV'),('RNO','Reno, Tahoe Intl','US'),('ROA','Roanoke ','US'),('ROC','Rochester, Monroe County','US'),('RSW','Fort Myers, Southwest Florida Intl','US'),('RUH','Riyadh','SA'),('SAL','San Salvador, Comalapa Intl','SV'),('SAN','San Diego, Lindbergh Field S. Diego','US'),('SAP','San Pedro Sula, Honduras','HN'),('SAT','San Antonio','US'),('SAV','Savannah','US'),('SBA','Santa Barbara','US'),('SBN','South Bend','US'),('SBZ','Sibiu','RO'),('SCL','Santiago, Arturo Merino Benitez','CL'),('SDF','Louisville','US'),('SEA','Seattle, Seattle/Tacoma Intl','US'),('SFO','San Francisco','US'),('SGN','Ho Chi Minh City, Tan Son Nhat Intl','VN'),('SHE','Shenyang','CN'),('SHV','Shreveport','US'),('SIN','Singapore, Changi','SG'),('SJC','San José, Mineta San José Intl','US'),('SJD','San José del Cabo, Los Cabos Intl','MX'),('SJO','San José, Juan Santamaría Intl','CR'),('SJU','San Juan, Luis Muñoz Marin Intl','PR'),('SKB','Basseterre, Robert L Bradshaw Intl','KN'),('SLC','Salt Lake City','US'),('SMF','Sacramento','US'),('SNA','Orange County','US'),('SNU','Santa Clara','CU'),('SOF','Sofia','BG'),('SRQ','Sarasota','US'),('SSA','Salvador','BR'),('STL','St. Louis, Lambert-St. Louis Intl','US'),('STR','Stuttgart, Echterdingen','DE'),('STT','St. Thomas, Cyril E. King','VI'),('SUF','Lamezia Terme, S Eufemia','IT'),('SVG','Stavanger, Sola','NO'),('SVO','Moscow, Sheremetyevo','RU'),('SVX','Ekaterinburg','RU'),('SXB','Strasbourg','FR'),('SXM','St. Maarten, Princess Juliana Intl','SX'),('SYD','Sydney, Kingsford Smith','AU'),('SYR','Syracuse, Hancock Intl','US'),('SZG','Salzburg, W.A. Mozart','AT'),('SZX','Shenzhen','CN'),('TAO','Qingdao','CN'),('TBS','Tbilisi, Novo Alexeyevka','GE'),('TGU','Tegucigalpa, Honduras','HN'),('TIA','Tirana','AL'),('TLS','Toulouse','FR'),('TLV','Tel Aviv, Ben Gurion Intl','IL'),('TMW','Tamworth','AU'),('TPA','Tampa','US'),('TPE','Taipei, Taiwan Taoyuan Intl','TW'),('TRN','Turin','IT'),('TRS','Trieste','IT'),('TSV','Townsville','AU'),('TUL','Tulsa','US'),('TUN','Tunis','TN'),('TUS','Tucson','US'),('TXL','Berlin, Tegel','DE'),('TYR','Tyler','US'),('TYS','Knoxville','US'),('UIO','Quito','EC'),('UVF','St. Lucia, Hewanorra Intl','LC'),('VCE','Venice, Marco Polo','IT'),('VCT','Victoria','US'),('VER','Veracruz','MX'),('VIE','Vienna, Schwechat Intl','AT'),('VLC','Valencia','ES'),('VPS','Walton Beach','US'),('VRA','Varadero, Juan Gualberto Gomez','CU'),('VRN','Verona','IT'),('VSA','Villahermosa','MX'),('VVI','Santa Cruz, Viru Viru Airport, Bolivia','BO'),('WAW','Warsaw, F. Chopin','PL'),('WGA','WaggaWagga','AU'),('WLG','Wellington','NZ'),('WNZ','Wenzhou','CN'),('WRO','Wroclaw, Strachowice','PL'),('WUH','Wuhan','CN'),('XIY','Xian','CN'),('XMN','Xiamen','CN'),('XNA','Fayetteville, Northwest Arkansas Regional','US'),('YAM','Sault Ste. Marie','CA'),('YBC','Baie Comeau','CA'),('YBG','Bagotville','CA'),('YBL','Campbell River','CA'),('YCD','Nanaimo','CA'),('YCG','Castlegar','CA'),('YDF','Deer Lake','CA'),('YEG','Edmonton','CA'),('YFB','Iqaluit','CA'),('YFC','Fredericton','CA'),('YGK','Kingston','CA'),('YGP','Gaspe','CA'),('YGR','Iles de la Madeleine','CA'),('YHZ','Halifax','CA'),('YKA','Kamloops','CA'),('YLW','Kelowna','CA'),('YMM','Fort McMurray','CA'),('YMT','Chibougamau','CA'),('YNT','Yantai','CN'),('YOW','Ottawa','CA'),('YPR','Prince Rupert, Digby Island','CA'),('YQB','Quebec City, Jean Lesage Intl','CA'),('YQG','Windsor','CA'),('YQL','Lethbridge','CA'),('YQM','Moncton','CA'),('YQQ','Comox, Comox Valley','CA'),('YQR','Regina','CA'),('YQT','Thunder Bay','CA'),('YQU','Grande Prairie','CA'),('YQX','Gander','CA'),('YQY','Sydney','CA'),('YQZ','Quesnel','CA'),('YRT','Rankin Inlet','CA'),('YSB','Sudbury','CA'),('YSJ','Saint John','CA'),('YTS','Timmins','CA'),('YTZ','Toronto, Billy Bishop Toronto City Airport','CA'),('YUL','Montreal, P.-E.-Trudeau Intl','CA'),('YUY','Rouyn-Noranda','CA'),('YVO','Val dOr','CA'),('YVR','Vancouver','CA'),('YWG','Winnipeg','CA'),('YWK','Wabush','CA'),('YWL','Williams Lake','CA'),('YXC','Cranbrook','CA'),('YXE','Saskatoon, J.G. Diefenbaker Intl','CA'),('YXH','Medicine Hat','CA'),('YXJ','Fort St John','CA'),('YXS','Prince George','CA'),('YXT','Terrace','CA'),('YXU','London, London Intl','CA'),('YXY','Whitehorse','CA'),('YYB','North Bay','CA'),('YYC','Calgary','CA'),('YYD','Smithers','CA'),('YYF','Penticton','CA'),('YYG','Charlottetown','CA'),('YYJ','Victoria','CA'),('YYR','Goose Bay','CA'),('YYT','St. Johns','CA'),('YYY','Mont Joli','CA'),('YYZ','Toronto, Pearson Intl','CA'),('YZF','Yellowknife','CA'),('YZP','Sandspit','CA'),('YZR','Sarnia','CA'),('YZV','Sept-Îles','CA'),('ZAG','Zagreb','HR'),('ZBF','Bathurst, Bathurst Regional','CA'),('ZIH','Ixtapa/Zihuatanejo','MX'),('ZRH','Zurich, Flughafen Zürich-Kloten','CH');
/*!40000 ALTER TABLE `AIRPORT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AUDITDB`
--

DROP TABLE IF EXISTS `AUDITDB`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `AUDITDB` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `CHANGERNAME` varchar(255) DEFAULT NULL,
  `created` datetime NOT NULL,
  `details` varchar(255) DEFAULT NULL,
  `ip` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AUDITDB`
--

LOCK TABLES `AUDITDB` WRITE;
/*!40000 ALTER TABLE `AUDITDB` DISABLE KEYS */;
INSERT INTO `AUDITDB` VALUES (1,'i.skyroutetravel@gmail.com','2016-12-22 09:25:02','for user:abc@gmail.com agency tier:GOLD set by:i.skyroutetravel@gmail.com','0:0:0:0:0:0:0:1'),(2,'i.skyroutetravel@gmail.com','2016-12-22 09:25:07','for user:i.skyroutetravel@gmail.com agency tier:PLATINUM set by:i.skyroutetravel@gmail.com','0:0:0:0:0:0:0:1'),(3,'i.skyroutetravel@gmail.com','2016-12-22 09:25:11','for user:i.ankitkumar11@gmail.com agency tier:SILVER set by:i.skyroutetravel@gmail.com','0:0:0:0:0:0:0:1'),(4,'i.skyroutetravel@gmail.com','2016-12-22 09:25:21','for user:manishthakur.in@gmail.com agency tier:GOLD set by:i.skyroutetravel@gmail.com','0:0:0:0:0:0:0:1'),(5,'i.skyroutetravel@gmail.com','2016-12-22 09:25:26','for user:i.ravipanwar@gmail.com agency tier:PLATINUM set by:i.skyroutetravel@gmail.com','0:0:0:0:0:0:0:1'),(6,'i.skyroutetravel@gmail.com','2016-12-22 09:25:52','for user:vishalmahajan.mca@gmail.com agency tier:GOLD set by:i.skyroutetravel@gmail.com','0:0:0:0:0:0:0:1'),(7,'i.skyroutetravel@gmail.com','2016-12-23 17:49:15','for user:i.ankitkumar11@gmail.com agency tier:PLATINUM set by:i.skyroutetravel@gmail.com','0:0:0:0:0:0:0:1'),(8,'i.skyroutetravel@gmail.com','2017-01-02 15:03:52','for user:abc@gmail.com agency tier:PLATINUM set by:i.skyroutetravel@gmail.com','0:0:0:0:0:0:0:1'),(9,'i.skyroutetravel@gmail.com','2017-01-02 15:04:00','for user:abc@gmail.com agency tier:SILVER set by:i.skyroutetravel@gmail.com','0:0:0:0:0:0:0:1'),(10,'i.skyroutetravel@gmail.com','2017-02-02 18:40:43','for user:manishthakur.in@gmail.com agency tier:PLATINUM set by:i.skyroutetravel@gmail.com',NULL),(11,'i.skyroutetravel@gmail.com','2017-02-02 18:40:52','for user:vishalmahajan.mca@gmail.com agency tier:SILVER set by:i.skyroutetravel@gmail.com',NULL),(12,'i.skyroutetravel@gmail.com','2017-02-02 18:40:52','agency tier:GOLD changed by:i.skyroutetravel@gmail.com','0:0:0:0:0:0:0:1'),(13,'i.skyroutetravel@gmail.com','2017-02-02 18:41:13','agency tier:OLDONE changed by:i.skyroutetravel@gmail.com','0:0:0:0:0:0:0:1'),(14,'i.skyroutetravel@gmail.com','2017-02-02 18:41:31','agency tier:OLDONE changed by:i.skyroutetravel@gmail.com','0:0:0:0:0:0:0:1'),(15,'i.skyroutetravel@gmail.com','2017-02-02 18:41:46','agency tier:OLDONE changed by:i.skyroutetravel@gmail.com','0:0:0:0:0:0:0:1'),(16,'i.skyroutetravel@gmail.com','2017-02-06 20:08:08','agency tier:DIAMOND changed by:i.skyroutetravel@gmail.com','0:0:0:0:0:0:0:1'),(17,'i.skyroutetravel@gmail.com','2017-02-13 17:23:21','agency tier:DIAMOND changed by:i.skyroutetravel@gmail.com','0:0:0:0:0:0:0:1');
/*!40000 ALTER TABLE `AUDITDB` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `BEAT_PRICE_REQUEST`
--

DROP TABLE IF EXISTS `BEAT_PRICE_REQUEST`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BEAT_PRICE_REQUEST` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `TRIP_TYPE` varchar(20) DEFAULT NULL,
  `NO_OF_ADULTS` int(11) DEFAULT NULL,
  `NO_OF_CHILDREN` int(11) DEFAULT NULL,
  `NO_OF_INFANTS` int(11) DEFAULT NULL,
  `AIRLINE` varchar(100) DEFAULT NULL,
  `TRAVEL_CLASS` varchar(20) DEFAULT NULL,
  `CONNECTING_VIA` varchar(100) DEFAULT NULL,
  `DIRECT_FLIGHT` bit(1) DEFAULT NULL,
  `BEAT_PRICE` varchar(50) DEFAULT NULL,
  `SOURCE` varchar(200) DEFAULT NULL,
  `FIRST_NAME` varchar(50) DEFAULT NULL,
  `LAST_NAME` varchar(50) DEFAULT NULL,
  `EMAIL` varchar(50) DEFAULT NULL,
  `PHONE` varchar(20) DEFAULT NULL,
  `STATUS` varchar(50) DEFAULT NULL,
  `AGENT_ID` bigint(20) DEFAULT NULL,
  `COMMENT` varchar(255) DEFAULT NULL,
  `REPLIED_BY` bigint(20) DEFAULT NULL,
  `REPLY` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BEAT_PRICE_REQUEST`
--

LOCK TABLES `BEAT_PRICE_REQUEST` WRITE;
/*!40000 ALTER TABLE `BEAT_PRICE_REQUEST` DISABLE KEYS */;
INSERT INTO `BEAT_PRICE_REQUEST` VALUES (1,'RETURN',1,0,0,'','ECONOMY','','\0','850','Expedia','Krishnan','Srinivasan','krishnan@voyzant.com','9057529900','PENDING',999,'',0,NULL);
/*!40000 ALTER TABLE `BEAT_PRICE_REQUEST` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `BOOKING_HISTORY`
--

DROP TABLE IF EXISTS `BOOKING_HISTORY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BOOKING_HISTORY` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `REVIEW_ID` bigint(20) DEFAULT NULL,
  `RESPONSE` varchar(500) DEFAULT NULL,
  `BOOKING_DATE` datetime DEFAULT NULL,
  `SEARCH_ID` bigint(20) DEFAULT '0',
  `PAYMENT_MODE` varchar(50) DEFAULT NULL,
  `IS_API_BOOKING` varchar(3) DEFAULT NULL,
  `PNR` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FKAAAA626E6E60E075` (`SEARCH_ID`),
  KEY `FKAAAA626E122BD915` (`REVIEW_ID`),
  CONSTRAINT `FKAAAA626E122BD915` FOREIGN KEY (`REVIEW_ID`) REFERENCES `REVIEW_HISTORY` (`ID`),
  CONSTRAINT `FKAAAA626E6E60E075` FOREIGN KEY (`SEARCH_ID`) REFERENCES `SEARCH_HISTORY` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BOOKING_HISTORY`
--

LOCK TABLES `BOOKING_HISTORY` WRITE;
/*!40000 ALTER TABLE `BOOKING_HISTORY` DISABLE KEYS */;
INSERT INTO `BOOKING_HISTORY` VALUES (1,13,'SUCCESS','2016-12-21 10:02:13',20,'NONE','NO','HKSXHX'),(2,19,'SUCCESS','2016-12-21 22:53:56',23,'NONE','NO','IGHWRH'),(3,19,'SUCCESS','2016-12-21 23:00:40',23,'NONE','NO','IHYSBU'),(4,32,'SUCCESS','2016-12-23 22:13:09',30,'NONE','NO','ITBNVR'),(5,43,'SUCCESS','2017-01-03 14:04:28',34,'NONE','NO','OBQYDF'),(6,44,'SUCCESS','2017-01-03 14:52:19',35,'NONE','NO','OBVVAG'),(7,45,'SUCCESS','2017-01-03 15:20:17',36,'NONE','NO','OBWNED'),(8,60,'SUCCESS','2017-02-03 13:53:32',46,'NONE','NO','AVNKYV'),(9,64,'SUCCESS','2017-02-03 14:03:49',46,'NONE','NO','DFPKLG'),(10,67,'SUCCESS','2017-02-03 16:07:29',50,'NONE','NO','AWHHWZ'),(11,70,'SUCCESS','2017-02-06 11:21:55',53,'NONE','NO','ESSLAL'),(12,76,'SUCCESS','2017-02-06 20:43:10',55,'NONE','NO','AJCKDG'),(13,85,'SUCCESS','2017-02-13 17:18:16',59,'NONE','NO','FEKKXF');
/*!40000 ALTER TABLE `BOOKING_HISTORY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `COUNTRY`
--

DROP TABLE IF EXISTS `COUNTRY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `COUNTRY` (
  `COUNTRY_CD` varchar(5) NOT NULL,
  `COUNTRY_NAME` varchar(200) NOT NULL,
  PRIMARY KEY (`COUNTRY_CD`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `COUNTRY`
--

LOCK TABLES `COUNTRY` WRITE;
/*!40000 ALTER TABLE `COUNTRY` DISABLE KEYS */;
INSERT INTO `COUNTRY` VALUES ('AD','Andorra'),('AE','United Arab Emirates'),('AF','Afghanistan'),('AG','Antigua and Barbuda'),('AI','Anguilla'),('AL','Albania'),('AM','Armenia'),('AO','Angola'),('AQ','Antarctica'),('AR','Argentina'),('AS','American Samoa'),('AT','Austria'),('AU','Australia'),('AW','Aruba'),('AZ','Azerbaijan'),('BA','Bosnia-Herzegovina'),('BB','Barbados'),('BD','Bangladesh'),('BE','Belgium'),('BF','Burkina Faso'),('BG','Bulgaria'),('BH','Bahrain'),('BI','Burundi'),('BJ','Benin'),('BM','Bermuda'),('BN','Brunei'),('BO','Bolivia'),('BQ','Bonaire, Saint Eustatius and Saba'),('BR','Brazil'),('BS','Bahamas'),('BT','Bhutan'),('BV','Bouvet Islands'),('BW','Botswana'),('BY','Belarus'),('BZ','Belize'),('CA','Canada'),('CC','Cocos (Keeling) Islands'),('CD','Democratic Republic of Congo'),('CF','Central African Republic'),('CG','Congo'),('CH','Switzerland'),('CI','Ivory Coast'),('CK','Cook Islands'),('CL','Chile'),('CM','Cameroon'),('CN','China'),('CO','Colombia'),('CR','Costa Rica'),('CU','Cuba'),('CV','Cape Verde'),('CW','Curacao'),('CX','Christmas Island (Indian Ocean)'),('CY','Cyprus'),('CZ','Czech Republic'),('DE','Germany'),('DJ','Djibouti'),('DK','Denmark'),('DM','Dominica'),('DO','Dominican Republic'),('DZ','Algeria'),('EC','Ecuador'),('EE','Estonia'),('EG','Egypt'),('ER','Eritrea'),('ES','Spain'),('ET','Ethiopia'),('FI','Finland'),('FJ','Fiji'),('FK','Falkland Islands'),('FM','Micronesia'),('FO','Faroe Islands'),('FR','France'),('GA','Gabon'),('GB','United Kingdom'),('GD','Grenada'),('GE','Georgia'),('GF','French Guyana'),('GH','Ghana'),('GI','Gibraltar'),('GL','Greenland'),('GM','Gambia'),('GN','Guinea'),('GP','Guadeloupe'),('GQ','Equatorial Guinea'),('GR','Greece'),('GS','South Georgia and Sandwich Islands'),('GT','Guatemala'),('GU','Guam'),('GW','Guinea Bissau'),('GY','Guyana'),('HK','Hong Kong'),('HM','Heard And McDonald Islands'),('HN','Honduras'),('HR','Croatia'),('HT','Haiti'),('HU','Hungary'),('ID','Indonesia'),('IE','Ireland'),('IL','Israel'),('IN','India'),('IO','British Indian Ocean Territory'),('IQ','Iraq'),('IR','Islamic Republic Of Iran'),('IS','Iceland'),('IT','Italy'),('JM','Jamaica'),('JO','Jordan'),('JP','Japan'),('KE','Kenya'),('KG','Kyrgyzstan'),('KH','Cambodia'),('KI','Kiribati'),('KM','Comoros'),('KN','St. Kitts and Nevis'),('KP','Dem.Peoples Rep.(North Korea)'),('KR','Republic of Korea (South Korea)'),('KW','Kuwait'),('KY','Cayman Islands'),('KZ','Kazakhstan'),('LA','Laos'),('LB','Lebanon'),('LC','Saint Lucia'),('LI','Liechtenstein'),('LK','Sri Lanka'),('LR','Liberia'),('LS','Lesotho'),('LT','Lithuania'),('LU','Luxemburg'),('LV','Latvia'),('LY','Libya'),('MA','Morocco'),('MC','Monaco'),('MD','Moldova'),('MG','Madagascar'),('MH','Marshall Islands'),('MK','Macedonia'),('ML','Mali'),('MM','Myanmar'),('MN','Mongolia'),('MO','Macau'),('MP','Northern Mariana Islands'),('MQ','Martinique'),('MR','Mauritania'),('MS','Montserrat'),('MT','Malta'),('MU','Mauritius'),('MV','Maldives'),('MW','Malawi'),('MX','Mexico'),('MY','Malaysia'),('MZ','Mozambique'),('NA','Namibia'),('NC','New Caledonia'),('NE','Niger'),('NF','Norfolk Island'),('NG','Nigeria'),('NI','Nicaragua'),('NL','Netherlands'),('NO','Norway'),('NP','Nepal'),('NR','Nauru'),('NU','Niue'),('NZ','New Zealand'),('OM','Oman'),('PA','Panama'),('PE','Peru'),('PF','French Polynesia'),('PG','Papua New Guinea'),('PH','Philippines'),('PK','Pakistan'),('PL','Poland'),('PM','St. Pierre and Miquelon'),('PN','Pitcairn Island'),('PR','Puerto Rico'),('PT','Portugal'),('PW','Palau'),('PY','Paraguay'),('QA','Qatar'),('RE','Reunion Island'),('RO','Romania'),('RS','Serbia'),('RU','Russia'),('RW','Rwanda'),('SA','Saudi Arabia'),('SB','Solomon Islands'),('SC','Seychelles'),('SD','Sudan'),('SE','Sweden'),('SG','Singapore'),('SH','St. Helena'),('SI','Slovenia'),('SJ','Svalbard and Jan Mayen Island'),('SK','Slovakia'),('SL','Sierra Leone'),('SM','San Marino'),('SN','Senegal'),('SO','Somalia'),('SR','Suriname'),('ST','Sao Tome and Principe'),('SV','El Salvador'),('SX','Saint Maarten (Dutch Part)'),('SY','Syrian Arab Republic'),('SZ','Swaziland'),('TC','Turks And Caicos Islands'),('TD','Chad'),('TF','French Southern Territories'),('TG','Togo'),('TH','Thailand'),('TJ','Tajikistan'),('TK','Tokelau'),('TM','Turkmenistan'),('TN','Tunisia'),('TO','Tonga'),('TP','East Timor'),('TR','Turkey'),('TT','Trinidad and Tobago'),('TV','Tuvalu'),('TW','Taiwan'),('TZ','Tanzania'),('UA','Ukraine'),('UG','Uganda'),('UK','United Kingdom'),('UM','U.S. Minor Outlying Islands'),('US','USA'),('UY','Uruguay'),('UZ','Uzbekistan'),('VA','Vatican City State'),('VC','St. Vincent and the Grenadines'),('VE','Venezuela'),('VG','British Virgin Islands'),('VI','Us Virgin Islands'),('VN','Vietnam'),('VU','Vanuatu'),('WS','Samoa'),('YT','Mayotte'),('ZA','South Africa'),('ZM','Zambia'),('ZR','Zaire'),('ZW','Zimbabwe');
/*!40000 ALTER TABLE `COUNTRY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DATABASECHANGELOG`
--

DROP TABLE IF EXISTS `DATABASECHANGELOG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DATABASECHANGELOG` (
  `ID` varchar(63) NOT NULL,
  `AUTHOR` varchar(63) NOT NULL,
  `FILENAME` varchar(200) NOT NULL,
  `DATEEXECUTED` datetime NOT NULL,
  `ORDEREXECUTED` int(11) NOT NULL,
  `EXECTYPE` varchar(10) NOT NULL,
  `MD5SUM` varchar(35) DEFAULT NULL,
  `DESCRIPTION` varchar(255) DEFAULT NULL,
  `COMMENTS` varchar(255) DEFAULT NULL,
  `TAG` varchar(255) DEFAULT NULL,
  `LIQUIBASE` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`ID`,`AUTHOR`,`FILENAME`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DATABASECHANGELOG`
--

LOCK TABLES `DATABASECHANGELOG` WRITE;
/*!40000 ALTER TABLE `DATABASECHANGELOG` DISABLE KEYS */;
INSERT INTO `DATABASECHANGELOG` VALUES ('1.0.0.1','rahul','classpath:com/buymytrip/db/changelog/db.changelog-1.0.0.xml','2016-11-06 17:15:40',1,'EXECUTED','3:d6bb6f43ac4fbb84340059dd2d55b69b','Create Table (x4)','Creating Agency, Registration and User Tables',NULL,'2.0.5'),('1.0.0.10','Vishal','classpath:com/buymytrip/db/changelog/db.changelog-1.0.0.xml','2016-11-06 17:15:43',10,'EXECUTED','3:c87cbaf6934cb9ca3faa26fcc8dba07d','Add Column, Add Not-Null Constraint, Add Default Value','Adding new column to Agency Table with default value N',NULL,'2.0.5'),('1.0.0.11','rahul','classpath:com/buymytrip/db/changelog/db.changelog-1.0.0.xml','2016-11-06 17:15:43',11,'EXECUTED','3:8ea30ae1d194678c399f35d980d1ff05','Add Column','Adding new column to TO_EMAIL table for attempts',NULL,'2.0.5'),('1.0.0.13','Vishal','classpath:com/buymytrip/db/changelog/db.changelog-1.0.0.xml','2016-11-06 17:15:43',12,'EXECUTED','3:fc8b6ce4d3aff595489cede895cd87ed','Drop Column, Add Column','dropping and recreating \n		    EXPIRY_DATE for DATETIME data type in Development',NULL,'2.0.5'),('1.0.0.14','vishal','classpath:com/buymytrip/db/changelog/db.changelog-1.0.0.xml','2016-11-06 17:15:43',13,'EXECUTED','3:6fa0acea66633a3cb05fe3279f68623d','Add Column (x2)','Adding new Column PAX and INFANT',NULL,'2.0.5'),('1.0.0.15','vishal','classpath:com/buymytrip/db/changelog/db.changelog-1.0.0.xml','2016-11-06 17:15:43',14,'EXECUTED','3:39e01ed66ce0558fc73a041f27c1d041','Add Column (x2)','Adding new Columns TOTAL_FARE and PAYMENT_TYPE',NULL,'2.0.5'),('1.0.0.16','vishal','classpath:com/buymytrip/db/changelog/db.changelog-1.0.0.xml','2016-11-06 17:15:43',15,'EXECUTED','3:06c4c4151d950d06ebd90f89ab3ef620','Add Column','Adding new Column CURRENCY_CODE',NULL,'2.0.5'),('1.0.0.17','vishal','classpath:com/buymytrip/db/changelog/db.changelog-1.0.0.xml','2016-11-06 17:15:43',16,'EXECUTED','3:02b3a5bbc3b00615a8a8c1039b5faf20','Create Table','Creating SYSTEM_PROPERTIES Tables',NULL,'2.0.5'),('1.0.0.18','rahul','classpath:com/buymytrip/db/changelog/db.changelog-1.0.0.xml','2016-11-06 17:15:43',17,'EXECUTED','3:2e7635ff30cab58049e04a3919d25ad4','Add Column','Adding new Column PASWD_EXPIRED to USERS table',NULL,'2.0.5'),('1.0.0.19','rahul','classpath:com/buymytrip/db/changelog/db.changelog-1.0.0.xml','2016-11-06 17:15:43',18,'EXECUTED','3:9bfcde4a881ac54d6aed42eeee25abde','Add Column','Adding new Columns for RULE table',NULL,'2.0.5'),('1.0.0.2','rahul','classpath:com/buymytrip/db/changelog/db.changelog-1.0.0.xml','2016-11-06 17:15:40',2,'EXECUTED','3:ff100e56185c0c1345b543ed2c6db91e','Create Table (x5)','Creating Airport and POS tables',NULL,'2.0.5'),('1.0.0.20','ManishThakur','classpath:com/buymytrip/db/changelog/db.changelog-1.0.0.xml','2016-11-06 17:15:43',19,'EXECUTED','3:4d4a46ec02fd5937d6efde1bfd638f56','Add Unique Constraint, Drop Unique Constraint','Making Agency Phone Unique and removing Agency Name Unique constraints',NULL,'2.0.5'),('1.0.0.21','Ankit','classpath:com/buymytrip/db/changelog/db.changelog-1.0.0.xml','2016-11-06 17:15:43',20,'EXECUTED','3:1face9e0d7b4433ca28decaa5fd57ccd','Add Column','Adding the column Departure Date in table PNR_Details',NULL,'2.0.5'),('1.0.0.22','Shubhra','classpath:com/buymytrip/db/changelog/db.changelog-1.0.0.xml','2016-11-06 17:15:43',21,'EXECUTED','3:1bcc29d885b158cbf34574baa993d74d','Create Table (x5)','',NULL,'2.0.5'),('1.0.0.23','Shubhra','classpath:com/buymytrip/db/changelog/db.changelog-1.0.0.xml','2016-11-06 17:15:43',22,'EXECUTED','3:6ae049d65b6fd3c00074c0e6fe037999','Add Column, Drop Column','deleting column GROUP_TOUR_ITINERARY from GROUP_REQUEST and add column EXTENSION to table  GROUP_CONTACT_DETAILS',NULL,'2.0.5'),('1.0.0.24','Shubhra','classpath:com/buymytrip/db/changelog/db.changelog-1.0.0.xml','2016-11-06 17:15:44',23,'EXECUTED','3:72ac01a87e781985a3cf5ed50e374788','Add Column','adding column GROUP_TYPE to GROUP_REQUEST',NULL,'2.0.5'),('1.0.0.25','Shubhra','classpath:com/buymytrip/db/changelog/db.changelog-1.0.0.xml','2016-11-06 17:15:44',24,'EXECUTED','3:fb4d14c81627dd8e7a2335609fb3b5e2','Create Table','new table GROUP_REQUEST_COMMENT',NULL,'2.0.5'),('1.0.0.26','Shubhra','classpath:com/buymytrip/db/changelog/db.changelog-1.0.0.xml','2016-11-06 17:15:44',25,'EXECUTED','3:23bdb34619585baeb963f32b72aa2909','Add Column','Adding column for additional email',NULL,'2.0.5'),('1.0.0.27','Shubhra','classpath:com/buymytrip/db/changelog/db.changelog-1.0.0.xml','2016-11-06 17:15:44',26,'EXECUTED','3:b54b68b31b48cbc3f611fb701140b191','Add Column','Adding column for trip type',NULL,'2.0.5'),('1.0.0.28','Shubhra','classpath:com/buymytrip/db/changelog/db.changelog-1.0.0.xml','2016-11-06 17:15:44',27,'EXECUTED','3:8e108a6f277a5082d878b9ddb30fb397','Add Column','Adding column agent id in table GROUP_REQUEST',NULL,'2.0.5'),('1.0.0.29','Shubhra','classpath:com/buymytrip/db/changelog/db.changelog-1.0.0.xml','2016-11-06 17:15:44',28,'EXECUTED','3:04159adb7118a838c0b2e636d41ea29c','Modify data type','Modifying column type',NULL,'2.0.5'),('1.0.0.3','rahul','classpath:com/buymytrip/db/changelog/db.changelog-1.0.0.xml','2016-11-06 17:15:40',3,'EXECUTED','3:1af24681fa8c20fa0297c18ec7426542','Create Table','Creating PNR Details tables',NULL,'2.0.5'),('1.0.0.30','Shubhra','classpath:com/buymytrip/db/changelog/db.changelog-1.0.0.xml','2016-11-06 17:15:44',29,'EXECUTED','3:14043d9a924e86c84c5142db0170778e','Create Table','',NULL,'2.0.5'),('1.0.0.31','Shubhra','classpath:com/buymytrip/db/changelog/db.changelog-1.0.0.xml','2016-11-06 17:15:44',30,'EXECUTED','3:d7a7e69387537f266559ad079e751ab4','Create Table (x3)','table created for saving BOOKING HISTORY',NULL,'2.0.5'),('1.0.0.32','Shubhra','classpath:com/buymytrip/db/changelog/db.changelog-1.0.0.xml','2016-11-06 17:15:44',31,'EXECUTED','3:7dedc777ad4038dd3de40a05e8e8ac69','Add Column (x2)','Column for pnr id',NULL,'2.0.5'),('1.0.0.33','Shubhra','classpath:com/buymytrip/db/changelog/db.changelog-1.0.0.xml','2016-11-06 17:15:44',32,'EXECUTED','3:e24d720eba35d5453686e98940d81867','Add Column, Drop Column, Add Column','Column added for search details',NULL,'2.0.5'),('1.0.0.34','Shubhra','classpath:com/buymytrip/db/changelog/db.changelog-1.0.0.xml','2016-11-06 17:15:44',33,'EXECUTED','3:fb82eb863ff0d53bb875ad4e995711b4','Add Column (x2)','',NULL,'2.0.5'),('1.0.0.35','Shubhra','classpath:com/buymytrip/db/changelog/db.changelog-1.0.0.xml','2016-11-06 17:15:44',34,'EXECUTED','3:823394fb29b322bb6e51cdfafce455d7','Add Column','',NULL,'2.0.5'),('1.0.0.36','Shubhra','classpath:com/buymytrip/db/changelog/db.changelog-1.0.0.xml','2016-11-06 17:15:44',35,'EXECUTED','3:e21800c424a7b3304317a5d6ebb4548f','Create Table, Drop Column (x2)','',NULL,'2.0.5'),('1.0.0.37','Shubhra','classpath:com/buymytrip/db/changelog/db.changelog-1.0.0.xml','2016-11-06 17:15:44',36,'EXECUTED','3:4ec97a71e42136bbc91e718b8a2dd8c9','Create Table (x6)','',NULL,'2.0.5'),('1.0.0.38','Shubhra','classpath:com/buymytrip/db/changelog/db.changelog-1.0.0.xml','2016-11-06 17:15:45',37,'EXECUTED','3:282327c18d024c6cb77dd6d525db3caf','Add Column','',NULL,'2.0.5'),('1.0.0.39','Shubhra','classpath:com/buymytrip/db/changelog/db.changelog-1.0.0.xml','2016-11-06 17:15:45',38,'EXECUTED','3:03bf7d4cfa54563d56a3125fbe0903cd','Drop Column, Add Column (x5)','',NULL,'2.0.5'),('1.0.0.4','rahul','classpath:com/buymytrip/db/changelog/db.changelog-1.0.0.xml','2016-11-06 17:15:40',4,'EXECUTED','3:33faef8bcf8f8263f3dcede8dc8c7c84','Create Table','Creating Email Related tables.',NULL,'2.0.5'),('1.0.0.40','Shubhra','classpath:com/buymytrip/db/changelog/db.changelog-1.0.0.xml','2016-11-06 17:15:45',39,'EXECUTED','3:9cb4cab8a192593ce0fded9a543c5974','Add Column','Remarks column added to redeemed points details',NULL,'2.0.5'),('1.0.0.41','Shubhra','classpath:com/buymytrip/db/changelog/db.changelog-1.0.0.xml','2016-11-06 17:15:45',40,'EXECUTED','3:a432f61cfc2fdf4857d438dc68688cfe','Create Table','',NULL,'2.0.5'),('1.0.0.42','Ankit','classpath:com/buymytrip/db/changelog/db.changelog-1.0.0.xml','2016-11-06 17:15:45',41,'EXECUTED','3:63c9bc13dfb74a7c937a17a2b40ca8d6','Add Column','Adding the columns PNR secondary PNR owner primary and secondary',NULL,'2.0.5'),('1.0.0.43','Shubhra','classpath:com/buymytrip/db/changelog/db.changelog-1.0.0.xml','2016-11-06 17:15:45',42,'EXECUTED','3:d2a2d7dbe5368635705b5b80fee83f00','Add Column (x2), Create Table','Adding subscription column in USERS',NULL,'2.0.5'),('1.0.0.44','Shubhra','classpath:com/buymytrip/db/changelog/db.changelog-1.0.0.xml','2016-11-06 17:15:45',43,'EXECUTED','3:52d8494ab96b415a3e86b00d03dee845','Add Column','',NULL,'2.0.5'),('1.0.0.45','Shubhra','classpath:com/buymytrip/db/changelog/db.changelog-1.0.0.xml','2016-11-06 17:15:45',44,'EXECUTED','3:88e74bbffc792f801ba2e30208b37aa3','Add Column','',NULL,'2.0.5'),('1.0.0.46','Jitender','classpath:com/buymytrip/db/changelog/db.changelog-1.0.0.xml','2016-11-06 17:15:45',45,'EXECUTED','3:ac3bd077485b3095e9ccb24549069ec7','Add Column (x3), Create Table','Adding PNR column in the table BOOKING_HISTORY to store PNRs',NULL,'2.0.5'),('1.0.0.47','Jitender','classpath:com/buymytrip/db/changelog/db.changelog-1.0.0.xml','2016-11-06 17:15:45',46,'EXECUTED','3:80f9d1694f48e313aa4db8fe7843304f','Add Column (x4)','Adding COMMI_AMT column in PNR_DETAILS to store Commission Amount',NULL,'2.0.5'),('1.0.0.48','Shubhra','classpath:com/buymytrip/db/changelog/db.changelog-1.0.0.xml','2016-11-06 17:15:45',47,'EXECUTED','3:adcf6d4fea3536d374997223cd0420f3','Create Table (x2)','Tables for beat the price feature',NULL,'2.0.5'),('1.0.0.49','Shubhra','classpath:com/buymytrip/db/changelog/db.changelog-1.0.0.xml','2016-11-06 17:15:45',48,'EXECUTED','3:dbb6f783840b940c80b35d5ed5fc12b8','Add Column','Adding COMMENT column in BEAT_PRICE_REQUEST',NULL,'2.0.5'),('1.0.0.5','rahul','classpath:com/buymytrip/db/changelog/db.changelog-1.0.0.xml','2016-11-06 17:15:40',5,'EXECUTED','3:d0b83eafc3ff34c3f58d8ac9ce07793a','Create Table (x11)','Creating Markup and Rules Tables',NULL,'2.0.5'),('1.0.0.50','Jitender','classpath:com/buymytrip/db/changelog/db.changelog-1.0.0.xml','2016-11-06 17:15:46',49,'EXECUTED','3:9c358d0a04097c4ec21fc10eb8b59d6d','Add Column','Adding FILE_NAME column in GROUP_REQUEST table',NULL,'2.0.5'),('1.0.0.51','Jitender','classpath:com/buymytrip/db/changelog/db.changelog-1.0.0.xml','2016-11-06 17:15:46',50,'EXECUTED','3:7934408f431669f9168b60df50b38473','Add Column','Adding SKYROUTE_COMMI column in AGENCY table',NULL,'2.0.5'),('1.0.0.52','Jitender','classpath:com/buymytrip/db/changelog/db.changelog-1.0.0.xml','2016-11-06 17:15:46',51,'EXECUTED','3:afca5930b38f67c0aaf8cf898c3edb78','Add Column','Adding GROUP_COMMI column in USERS table',NULL,'2.0.5'),('1.0.0.53','Jitender','classpath:com/buymytrip/db/changelog/db.changelog-1.0.0.xml','2016-11-06 17:15:46',52,'EXECUTED','3:753f0dfcc3c15bf2652c2a4581ab8a19','Add Column','Adding SKYROUTE_COMMI_TYPE column in AGENCY table',NULL,'2.0.5'),('1.0.0.54','Jitender','classpath:com/buymytrip/db/changelog/db.changelog-1.0.0.xml','2016-11-06 17:15:46',53,'EXECUTED','3:837c5dcad449d812630b4159d4679a0d','Add Column','Adding GROUP_COMMI_TYPE column in USERS table',NULL,'2.0.5'),('1.0.0.6','rahul','classpath:com/buymytrip/db/changelog/db.changelog-1.0.0.xml','2016-11-06 17:15:42',6,'EXECUTED','3:65c8d729c2fddf329a899b07d0f55e62','Add Column (x17)','Adding FK Reference Columns',NULL,'2.0.5'),('1.0.0.7','rahul','classpath:com/buymytrip/db/changelog/db.changelog-1.0.0.xml','2016-11-06 17:15:42',7,'EXECUTED','3:891a809f9c235f2acbc5615066a55ae8','Modify data type','',NULL,'2.0.5'),('1.0.0.8','rahul','classpath:com/buymytrip/db/changelog/db.changelog-1.0.0.xml','2016-11-06 17:15:42',8,'EXECUTED','3:b2944e313504411c0299e1622d976404','Drop Not-Null Constraint','',NULL,'2.0.5'),('1.0.0.9','vishal','classpath:com/buymytrip/db/changelog/db.changelog-1.0.0.xml','2016-11-06 17:15:43',9,'EXECUTED','3:2b18375e5085c2b540382a554283e0ca','Create Table','Adding exclude airline table',NULL,'2.0.5'),('data.1','rahul','classpath:com/buymytrip/db/changelog/db.changelog-data.xml','2016-11-06 17:15:46',54,'EXECUTED','3:eb87c151bcc484109ab45b04d810b712','Insert Row (x239)','Adding Country Data',NULL,'2.0.5'),('data.11','Ankit','classpath:com/buymytrip/db/changelog/db.changelog-data.xml','2016-11-06 17:15:48',60,'EXECUTED','3:5625523018a25e7e48a24c5c714bd727','Insert Row','Adding Sample AC2U PNR Details',NULL,'2.0.5'),('data.12','Shubhra','classpath:com/buymytrip/db/changelog/db.changelog-data.xml','2016-11-06 17:15:48',61,'EXECUTED','3:0cbf51a6d74c4608db103a83a39e5671','Insert Row (x2)','Adding Sample User with role AGENCYETICKETADM (issue ticket for all agencies)',NULL,'2.0.5'),('data.13','shubhra','classpath:com/buymytrip/db/changelog/db.changelog-data.xml','2016-11-06 17:15:48',62,'EXECUTED','3:8adeedac70e875e1475a44a20aa152ef','Insert Row (x4)','Adding new Airports',NULL,'2.0.5'),('data.14','shubhra','classpath:com/buymytrip/db/changelog/db.changelog-data.xml','2016-11-06 17:15:48',63,'EXECUTED','3:3dccb0154694380f42b264a132558694','Insert Row','Adding new Airports',NULL,'2.0.5'),('data.15','shubhra','classpath:com/buymytrip/db/changelog/db.changelog-data.xml','2016-11-06 17:15:48',64,'EXECUTED','3:6b8aa2b7575a3a1b211483687f212a53','Update Data','Role changed',NULL,'2.0.5'),('data.16','shubhra','classpath:com/buymytrip/db/changelog/db.changelog-data.xml','2016-11-06 17:15:48',65,'EXECUTED','3:bd15f34b04a23b59170b812078cd2a45','Insert Row (x2)','Adding new Airports',NULL,'2.0.5'),('data.17','shubhra','classpath:com/buymytrip/db/changelog/db.changelog-data.xml','2016-11-06 17:15:48',66,'EXECUTED','3:344c34fd536da4ef1a8130ee161b9c92','Insert Row (x2)','Adding new Airports',NULL,'2.0.5'),('data.2','rahul','classpath:com/buymytrip/db/changelog/db.changelog-data.xml','2016-11-06 17:15:47',55,'EXECUTED','3:7c8dc5d53fad9deb34db2f653920b731','Insert Row (x529)','Adding Airport Data.',NULL,'2.0.5'),('data.3','rahul','classpath:com/buymytrip/db/changelog/db.changelog-data.xml','2016-11-06 17:15:48',56,'EXECUTED','3:a08572842ebf9fef09faa73f898d8d48','Insert Row (x211)','Adding Dev POS Data.',NULL,'2.0.5'),('data.4','rahul','classpath:com/buymytrip/db/changelog/db.changelog-data.xml','2016-11-06 17:15:48',57,'EXECUTED','3:0d67e1e3c3108f5fdd2aee210208ba9c','Insert Row (x20)','Adding Markup Data.',NULL,'2.0.5'),('data.5','rahul','classpath:com/buymytrip/db/changelog/db.changelog-data.xml','2016-11-06 17:15:48',58,'EXECUTED','3:0d0acb063d65ce06f76cd9bc6efb4497','Insert Row (x13)','Adding Agency and User Data',NULL,'2.0.5'),('data.6','rahul','classpath:com/buymytrip/db/changelog/db.changelog-data.xml','2016-11-06 17:15:48',59,'EXECUTED','3:9ba99c2c84de1014341910639c404394','Insert Row (x12)','Adding Sample PNR Details',NULL,'2.0.5');
/*!40000 ALTER TABLE `DATABASECHANGELOG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DATABASECHANGELOGLOCK`
--

DROP TABLE IF EXISTS `DATABASECHANGELOGLOCK`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DATABASECHANGELOGLOCK` (
  `ID` int(11) NOT NULL,
  `LOCKED` tinyint(1) NOT NULL,
  `LOCKGRANTED` datetime DEFAULT NULL,
  `LOCKEDBY` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DATABASECHANGELOGLOCK`
--

LOCK TABLES `DATABASECHANGELOGLOCK` WRITE;
/*!40000 ALTER TABLE `DATABASECHANGELOGLOCK` DISABLE KEYS */;
INSERT INTO `DATABASECHANGELOGLOCK` VALUES (1,0,NULL,NULL);
/*!40000 ALTER TABLE `DATABASECHANGELOGLOCK` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `EXCLUDE_AIRLINE`
--

DROP TABLE IF EXISTS `EXCLUDE_AIRLINE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `EXCLUDE_AIRLINE` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `AIRLINE_CD` varchar(200) NOT NULL,
  `VERSION` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `EXCLUDE_AIRLINE`
--

LOCK TABLES `EXCLUDE_AIRLINE` WRITE;
/*!40000 ALTER TABLE `EXCLUDE_AIRLINE` DISABLE KEYS */;
/*!40000 ALTER TABLE `EXCLUDE_AIRLINE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FEATURE_UPDATE`
--

DROP TABLE IF EXISTS `FEATURE_UPDATE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `FEATURE_UPDATE` (
  `FEATURE_CD` varchar(10) NOT NULL,
  `UPDATE_DTTM` datetime NOT NULL,
  PRIMARY KEY (`FEATURE_CD`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FEATURE_UPDATE`
--

LOCK TABLES `FEATURE_UPDATE` WRITE;
/*!40000 ALTER TABLE `FEATURE_UPDATE` DISABLE KEYS */;
INSERT INTO `FEATURE_UPDATE` VALUES ('MARKUP','2016-12-01 22:52:32');
/*!40000 ALTER TABLE `FEATURE_UPDATE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FLIGHT_INFO`
--

DROP TABLE IF EXISTS `FLIGHT_INFO`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `FLIGHT_INFO` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `REVIEW_ID` bigint(20) DEFAULT NULL,
  `FLIGHT_NUMBER` bigint(20) DEFAULT NULL,
  `DEPARTURE_DATE` datetime DEFAULT NULL,
  `ARRIVAL_DATE` datetime DEFAULT NULL,
  `DEPARTING_AIRPORT` varchar(10) DEFAULT NULL,
  `ARRIVAL_AIRPORT` varchar(10) DEFAULT NULL,
  `OPERATING_AIRLINE` varchar(10) DEFAULT NULL,
  `MARKETING_AIRLINE` varchar(10) DEFAULT NULL,
  `BOUND_SEQUENCE` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FKC8C2631D122BD915` (`REVIEW_ID`),
  CONSTRAINT `FKC8C2631D122BD915` FOREIGN KEY (`REVIEW_ID`) REFERENCES `REVIEW_HISTORY` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FLIGHT_INFO`
--

LOCK TABLES `FLIGHT_INFO` WRITE;
/*!40000 ALTER TABLE `FLIGHT_INFO` DISABLE KEYS */;
INSERT INTO `FLIGHT_INFO` VALUES (1,1,602,'2017-03-09 20:10:00','2017-03-10 06:25:00','YYZ','KEF','FI','FI',1),(2,1,450,'2017-03-10 08:10:00','2017-03-10 11:15:00','KEF','LHR','FI','FI',1),(3,1,451,'2017-03-18 12:40:00','2017-03-18 15:40:00','LHR','KEF','FI','FI',2),(4,1,603,'2017-03-18 17:00:00','2017-03-18 18:55:00','KEF','YYZ','FI','FI',2),(5,2,128,'2017-03-09 18:00:00','2017-03-10 05:30:00','YYZ','DUB','EI','BA',1),(6,2,154,'2017-03-10 07:35:00','2017-03-10 09:15:00','DUB','LHR','EI','BA',1),(7,2,99,'2017-03-18 17:05:00','2017-03-18 21:15:00','LHR','YYZ','BA','BA',2),(8,3,602,'2017-03-09 20:10:00','2017-03-10 06:25:00','YYZ','KEF','FI','FI',1),(9,3,454,'2017-03-10 16:30:00','2017-03-10 19:30:00','KEF','LHR','FI','FI',1),(10,3,451,'2017-03-18 12:40:00','2017-03-18 15:40:00','LHR','KEF','FI','FI',2),(11,3,603,'2017-03-18 17:00:00','2017-03-18 18:55:00','KEF','YYZ','FI','FI',2),(12,4,128,'2017-03-09 18:00:00','2017-03-10 05:30:00','YYZ','DUB','EI','EI',1),(13,4,833,'2017-03-10 08:45:00','2017-03-10 10:15:00','DUB','LHR','BA','EI',1),(14,4,830,'2017-03-18 08:15:00','2017-03-18 09:35:00','LHR','DUB','BA','EI',2),(15,4,129,'2017-03-18 13:45:00','2017-03-18 17:15:00','DUB','YYZ','EI','EI',2),(16,5,602,'2017-03-18 21:10:00','2017-03-19 06:25:00','YYZ','KEF','FI','FI',1),(17,5,454,'2017-03-19 16:30:00','2017-03-19 19:30:00','KEF','LHR','FI','FI',1),(18,5,451,'2017-03-27 13:10:00','2017-03-27 15:10:00','LHR','KEF','FI','FI',2),(19,5,603,'2017-03-27 17:00:00','2017-03-27 18:55:00','KEF','YYZ','FI','FI',2),(20,6,128,'2017-03-18 19:00:00','2017-03-19 05:30:00','YYZ','DUB','EI','EI',1),(21,6,154,'2017-03-19 07:35:00','2017-03-19 09:15:00','DUB','LHR','EI','EI',1),(22,6,153,'2017-03-27 08:50:00','2017-03-27 10:10:00','LHR','DUB','EI','EI',2),(23,6,129,'2017-03-27 13:35:00','2017-03-27 16:10:00','DUB','YYZ','EI','EI',2),(24,7,4323,'2017-03-18 06:30:00','2017-03-18 08:03:00','YYZ','LGA','AA','BA',1),(25,7,112,'2017-03-18 19:35:00','2017-03-19 06:25:00','JFK','LHR','BA','BA',1),(26,7,117,'2017-03-27 08:30:00','2017-03-27 11:10:00','LHR','JFK','BA','BA',2),(27,7,4367,'2017-03-27 15:20:00','2017-03-27 17:15:00','JFK','YYZ','AA','BA',2),(28,8,92,'2017-03-18 19:30:00','2017-03-19 06:25:00','YYZ','LHR','BA','BA',1),(29,8,117,'2017-03-27 08:30:00','2017-03-27 11:10:00','LHR','JFK','BA','BA',2),(30,8,4367,'2017-03-27 15:20:00','2017-03-27 17:15:00','JFK','YYZ','AA','BA',2),(31,9,6287,'2017-03-18 10:25:00','2017-03-18 12:04:00','YYZ','JFK','DL','KL',1),(32,9,401,'2017-03-18 20:30:00','2017-03-19 07:35:00','JFK','LHR','DL','KL',1),(33,9,1018,'2017-03-27 14:45:00','2017-03-27 16:55:00','LHR','AMS','KL','KL',2),(34,9,695,'2017-03-27 17:55:00','2017-03-27 19:50:00','AMS','YYZ','KL','KL',2),(35,10,233,'2017-03-18 19:40:00','2017-03-19 07:55:00','YYZ','AMS','9W','9W',1),(36,10,423,'2017-03-20 07:30:00','2017-03-20 07:50:00','AMS','LHR','BA','BA',1),(37,10,428,'2017-03-27 06:40:00','2017-03-27 09:05:00','LHR','AMS','BA','BA',2),(38,10,234,'2017-03-27 11:20:00','2017-03-27 13:40:00','AMS','YYZ','9W','9W',2),(39,11,602,'2017-03-18 21:10:00','2017-03-19 06:25:00','YYZ','KEF','FI','FI',1),(40,11,450,'2017-03-19 08:10:00','2017-03-19 11:15:00','KEF','LHR','FI','FI',1),(41,11,451,'2017-03-27 13:10:00','2017-03-27 15:10:00','LHR','KEF','FI','FI',2),(42,11,603,'2017-03-27 17:00:00','2017-03-27 18:55:00','KEF','YYZ','FI','FI',2);
/*!40000 ALTER TABLE `FLIGHT_INFO` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `GROUP_AIR_NEED_INFO`
--

DROP TABLE IF EXISTS `GROUP_AIR_NEED_INFO`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `GROUP_AIR_NEED_INFO` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `REQUESTED_PRICE` varchar(50) DEFAULT NULL,
  `PREFERED_CARRIER` varchar(255) DEFAULT NULL,
  `SPECIAL_MEAL_PLANS` varchar(255) DEFAULT NULL,
  `SPECIAL_BAGGAGE_NEEDS` varchar(255) DEFAULT NULL,
  `OTHER_SPECIAL_NEEDS` varchar(255) DEFAULT NULL,
  `TRIP_TYPE` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `GROUP_AIR_NEED_INFO`
--

LOCK TABLES `GROUP_AIR_NEED_INFO` WRITE;
/*!40000 ALTER TABLE `GROUP_AIR_NEED_INFO` DISABLE KEYS */;
/*!40000 ALTER TABLE `GROUP_AIR_NEED_INFO` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `GROUP_AIR_NEED_INFO_DETAILS`
--

DROP TABLE IF EXISTS `GROUP_AIR_NEED_INFO_DETAILS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `GROUP_AIR_NEED_INFO_DETAILS` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `NO_OF_ADULTS` int(11) DEFAULT NULL,
  `NO_OF_CHILDREN` int(11) DEFAULT NULL,
  `NO_OF_INFANTS` int(11) DEFAULT NULL,
  `DEPARTURE_DATE` datetime DEFAULT NULL,
  `DEPARTURE_CITY` varchar(100) DEFAULT NULL,
  `DESTINATION_CITY` varchar(100) DEFAULT NULL,
  `FLEXIBILITY` bit(1) DEFAULT NULL,
  `AIR_NEED_INFO_ID` bigint(20) DEFAULT NULL,
  `DEPARTURE_TIME` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK6CD44EE5E127E750` (`AIR_NEED_INFO_ID`),
  CONSTRAINT `FK6CD44EE5E127E750` FOREIGN KEY (`AIR_NEED_INFO_ID`) REFERENCES `GROUP_AIR_NEED_INFO` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `GROUP_AIR_NEED_INFO_DETAILS`
--

LOCK TABLES `GROUP_AIR_NEED_INFO_DETAILS` WRITE;
/*!40000 ALTER TABLE `GROUP_AIR_NEED_INFO_DETAILS` DISABLE KEYS */;
/*!40000 ALTER TABLE `GROUP_AIR_NEED_INFO_DETAILS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `GROUP_CONTACT_DETAILS`
--

DROP TABLE IF EXISTS `GROUP_CONTACT_DETAILS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `GROUP_CONTACT_DETAILS` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `TITLE` varchar(50) DEFAULT NULL,
  `FIRST_NAME` varchar(50) DEFAULT NULL,
  `LAST_NAME` varchar(50) DEFAULT NULL,
  `CONTACT_TYPE` varchar(50) DEFAULT NULL,
  `EMAIL` varchar(50) DEFAULT NULL,
  `BUSINESS_PHONE` varchar(50) DEFAULT NULL,
  `MOBILE_PHONE` varchar(50) DEFAULT NULL,
  `HOME_PHONE` varchar(50) DEFAULT NULL,
  `ADDRESS_1` varchar(255) DEFAULT NULL,
  `ADDRESS_2` varchar(255) DEFAULT NULL,
  `CITY` varchar(50) DEFAULT NULL,
  `PROVINCE` varchar(50) DEFAULT NULL,
  `POSTAL_CODE` varchar(50) DEFAULT NULL,
  `COUNTRY` varchar(50) DEFAULT NULL,
  `EXTENSION` varchar(20) DEFAULT NULL,
  `ADDITIONAL_EMAIL` varchar(50) NOT NULL DEFAULT 'NA',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `GROUP_CONTACT_DETAILS`
--

LOCK TABLES `GROUP_CONTACT_DETAILS` WRITE;
/*!40000 ALTER TABLE `GROUP_CONTACT_DETAILS` DISABLE KEYS */;
/*!40000 ALTER TABLE `GROUP_CONTACT_DETAILS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `GROUP_REQUEST`
--

DROP TABLE IF EXISTS `GROUP_REQUEST`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `GROUP_REQUEST` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `GROUP_NAME` varchar(50) DEFAULT NULL,
  `STATUS` varchar(50) DEFAULT NULL,
  `CONTACT_DETAILS_ID` bigint(20) DEFAULT NULL,
  `TRAVEL_AGENCY_INFO_ID` bigint(20) DEFAULT NULL,
  `AIR_NEED_INFO_ID` bigint(20) DEFAULT NULL,
  `GROUP_TYPE` varchar(100) DEFAULT NULL,
  `AGENT_ID` bigint(20) DEFAULT '0',
  `FILE_NAME` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FKFA40548FE127E750` (`AIR_NEED_INFO_ID`),
  KEY `FKFA40548F335D766F` (`CONTACT_DETAILS_ID`),
  KEY `FKFA40548FA470DA1A` (`TRAVEL_AGENCY_INFO_ID`),
  CONSTRAINT `FKFA40548F335D766F` FOREIGN KEY (`CONTACT_DETAILS_ID`) REFERENCES `GROUP_CONTACT_DETAILS` (`ID`),
  CONSTRAINT `FKFA40548FA470DA1A` FOREIGN KEY (`TRAVEL_AGENCY_INFO_ID`) REFERENCES `GROUP_TRAVEL_AGENCY_INFO` (`ID`),
  CONSTRAINT `FKFA40548FE127E750` FOREIGN KEY (`AIR_NEED_INFO_ID`) REFERENCES `GROUP_AIR_NEED_INFO` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `GROUP_REQUEST`
--

LOCK TABLES `GROUP_REQUEST` WRITE;
/*!40000 ALTER TABLE `GROUP_REQUEST` DISABLE KEYS */;
/*!40000 ALTER TABLE `GROUP_REQUEST` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `GROUP_REQUEST_COMMENT`
--

DROP TABLE IF EXISTS `GROUP_REQUEST_COMMENT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `GROUP_REQUEST_COMMENT` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `GROUP_ID` bigint(20) DEFAULT NULL,
  `USER_ID` bigint(20) DEFAULT NULL,
  `COMMENT` longtext,
  PRIMARY KEY (`ID`),
  KEY `FKF0E7768FCA9E9374` (`GROUP_ID`),
  CONSTRAINT `FKF0E7768FCA9E9374` FOREIGN KEY (`GROUP_ID`) REFERENCES `GROUP_REQUEST` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `GROUP_REQUEST_COMMENT`
--

LOCK TABLES `GROUP_REQUEST_COMMENT` WRITE;
/*!40000 ALTER TABLE `GROUP_REQUEST_COMMENT` DISABLE KEYS */;
/*!40000 ALTER TABLE `GROUP_REQUEST_COMMENT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `GROUP_TRAVEL_AGENCY_INFO`
--

DROP TABLE IF EXISTS `GROUP_TRAVEL_AGENCY_INFO`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `GROUP_TRAVEL_AGENCY_INFO` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `AGENCY_IATA_NUMBER` varchar(255) DEFAULT NULL,
  `AGENCY_NAME` varchar(255) DEFAULT NULL,
  `ADDRESS_1` varchar(255) DEFAULT NULL,
  `ADDRESS_2` varchar(255) DEFAULT NULL,
  `CITY` varchar(50) DEFAULT NULL,
  `PROVINCE` varchar(50) DEFAULT NULL,
  `POSTAL_CODE` varchar(50) DEFAULT NULL,
  `COUNTRY` varchar(50) DEFAULT NULL,
  `AGENCY_PHONE` varchar(50) DEFAULT NULL,
  `AGENCY_FAX` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `GROUP_TRAVEL_AGENCY_INFO`
--

LOCK TABLES `GROUP_TRAVEL_AGENCY_INFO` WRITE;
/*!40000 ALTER TABLE `GROUP_TRAVEL_AGENCY_INFO` DISABLE KEYS */;
/*!40000 ALTER TABLE `GROUP_TRAVEL_AGENCY_INFO` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `MARKUP`
--

DROP TABLE IF EXISTS `MARKUP`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `MARKUP` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(50) NOT NULL,
  `POS` varchar(10) NOT NULL,
  `STATUS` varchar(30) NOT NULL,
  `VERSION` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `NAME` (`NAME`)
) ENGINE=InnoDB AUTO_INCREMENT=1001 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MARKUP`
--

LOCK TABLES `MARKUP` WRITE;
/*!40000 ALTER TABLE `MARKUP` DISABLE KEYS */;
INSERT INTO `MARKUP` VALUES (999,'DEFAULT_CA','CA','ACTIVE',1),(1000,'TEST','CA','ACTIVE',0);
/*!40000 ALTER TABLE `MARKUP` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ORIGIN_DESTINATION_OPTIONS`
--

DROP TABLE IF EXISTS `ORIGIN_DESTINATION_OPTIONS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ORIGIN_DESTINATION_OPTIONS` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `ORIGIN` varchar(100) DEFAULT NULL,
  `DESTINATION` varchar(100) DEFAULT NULL,
  `DEPARTURE_DATE` datetime DEFAULT NULL,
  `DEPARTURE_TIME` varchar(50) DEFAULT NULL,
  `BEAT_PRICE_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK415BE49452015F1F` (`BEAT_PRICE_ID`),
  CONSTRAINT `FK415BE49452015F1F` FOREIGN KEY (`BEAT_PRICE_ID`) REFERENCES `BEAT_PRICE_REQUEST` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ORIGIN_DESTINATION_OPTIONS`
--

LOCK TABLES `ORIGIN_DESTINATION_OPTIONS` WRITE;
/*!40000 ALTER TABLE `ORIGIN_DESTINATION_OPTIONS` DISABLE KEYS */;
INSERT INTO `ORIGIN_DESTINATION_OPTIONS` VALUES (1,'Toronto, Pearson Int\'l, Ontario (YYZ)','London, Heathrow, United Kingdom (LHR)','2017-03-09 00:00:00','ANY',1),(2,'London, Heathrow, United Kingdom (LHR)','Toronto, Pearson Int\'l, Ontario (YYZ)','2017-03-18 00:00:00','ANY',1);
/*!40000 ALTER TABLE `ORIGIN_DESTINATION_OPTIONS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PNR_DETAILS`
--

DROP TABLE IF EXISTS `PNR_DETAILS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PNR_DETAILS` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `PNR` varchar(30) NOT NULL,
  `FNAME` varchar(64) NOT NULL,
  `LNAME` varchar(64) NOT NULL,
  `PNR_STATUS` varchar(30) NOT NULL,
  `PNR_CREATION_TIME` datetime NOT NULL,
  `ORIGIN` varchar(5) NOT NULL,
  `DESTINATION` varchar(5) NOT NULL,
  `DISCOUNT` double DEFAULT NULL,
  `MARKUP` double DEFAULT NULL,
  `THIRD_PARTY_MARKUP` double DEFAULT NULL,
  `VERSION` bigint(20) DEFAULT NULL,
  `AGNCY_PNR_DTLS_ID` bigint(20) DEFAULT NULL,
  `USER_PNR_DTLS_ID` bigint(20) DEFAULT NULL,
  `EXPIRY_DATE` datetime DEFAULT NULL,
  `PAX` bigint(20) DEFAULT NULL,
  `INFANT` bigint(20) DEFAULT NULL,
  `TOTAL_FARE` double DEFAULT NULL,
  `PAYMENT_TYPE` varchar(20) DEFAULT NULL,
  `CURRENCY_CODE` varchar(3) DEFAULT NULL,
  `DEPARTURE_DATE` datetime DEFAULT NULL,
  `AGENCY_ADULT_POINTS` varchar(100) DEFAULT NULL,
  `AGENCY_CHILD_POINTS` varchar(100) DEFAULT NULL,
  `AGENT_ADULT_POINTS` varchar(100) DEFAULT NULL,
  `AGENT_CHILD_POINTS` varchar(100) DEFAULT NULL,
  `PNR_SEC` varchar(30) DEFAULT NULL,
  `PNR_OWNER_PRI` varchar(30) DEFAULT NULL,
  `PNR_OWNER_SEC` varchar(30) DEFAULT NULL,
  `DISC_PERC` varchar(50) DEFAULT NULL,
  `COMMI_PERC` varchar(50) DEFAULT NULL,
  `DISC_AMT` varchar(50) DEFAULT NULL,
  `COMMI_AMT` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_PN_AG_P0` (`AGNCY_PNR_DTLS_ID`),
  KEY `FK_PN_US_P0` (`USER_PNR_DTLS_ID`),
  CONSTRAINT `FK_PN_AG_P0` FOREIGN KEY (`AGNCY_PNR_DTLS_ID`) REFERENCES `AGENCY` (`ID`),
  CONSTRAINT `FK_PN_US_P0` FOREIGN KEY (`USER_PNR_DTLS_ID`) REFERENCES `USERS` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=1013 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PNR_DETAILS`
--

LOCK TABLES `PNR_DETAILS` WRITE;
/*!40000 ALTER TABLE `PNR_DETAILS` DISABLE KEYS */;
INSERT INTO `PNR_DETAILS` VALUES (987,'PNRPRI','Test','Test','BOOKED','2014-06-20 10:10:10','YUL','YYZ',NULL,NULL,NULL,1,999,998,'2014-10-31 10:40:10',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'ABCSEC','AC','WS',NULL,NULL,NULL,NULL),(988,'AOYNJC','Vishal','Mahajan','BOOKED','2012-10-01 10:10:10','YUL','YVR',NULL,NULL,NULL,1,999,995,'2012-12-31 10:40:10',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(989,'KPAECL','Vishal','Mahajan','BOOKED','2012-10-01 10:10:10','YUL','YVR',NULL,NULL,NULL,1,999,995,'2012-12-31 10:40:10',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(990,'GKOUJJ','Ankit','Kumar','BOOKED','2012-09-10 10:10:10','YYZ','YYC',NULL,NULL,NULL,1,999,994,'2012-12-01 10:40:10',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(991,'NPOMAG','Test','Test','CANCELLED','2012-10-10 10:10:10','YUL','YYZ',NULL,NULL,NULL,2,999,998,'2012-10-31 10:40:10',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(992,'YIFBOZ','Test','Test','BOOKED','2012-10-10 10:10:10','YUL','YYZ',NULL,NULL,NULL,1,999,998,'2012-10-31 10:40:10',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(993,'GRQHPR','Test','Test','BOOKED','2012-10-10 10:10:10','YUL','YYZ',NULL,NULL,NULL,1,999,998,'2012-10-31 10:40:10',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(994,'KXWIMD','Test','Test','BOOKED','2012-10-10 10:10:10','YUL','YYZ',NULL,NULL,NULL,1,999,998,'2012-10-31 10:40:10',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(995,'KJBMIL','Test','Test','BOOKED','2012-10-10 10:10:10','YUL','YYZ',NULL,NULL,NULL,1,999,998,'2012-10-31 10:40:10',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(996,'ZVLMGT','Test','Test','CANCELLED','2012-10-10 10:10:10','YUL','YYZ',NULL,NULL,NULL,2,999,998,'2012-10-31 10:40:10',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(997,'GJZBMF','Test','Test','BOOKED','2012-10-10 10:10:10','YUL','YYZ',NULL,NULL,NULL,1,999,998,'2012-10-31 10:40:10',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(998,'GJDWOE','Test','Test','BOOKED','2012-10-10 10:10:10','YUL','YYZ',NULL,NULL,NULL,1,999,998,'2012-10-31 10:40:10',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(999,'MYIGZH','Test','Test','BOOKED','2012-10-10 10:10:10','YUL','YYZ',NULL,NULL,NULL,1,999,998,'2012-10-31 10:40:10',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1000,'HKSXHX','A MR','ABC','BOOKED','2016-12-20 22:31:00','YYZ','LGW',0,35,NULL,0,999,999,'2016-12-20 23:59:00',1,0,433.66,NULL,NULL,'2016-12-23 21:30:00','0','0','0','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1001,'IGHWRH','AB MR','ABC','BOOKED','2016-12-21 11:23:00','YYZ','LGW',0,35,NULL,0,999,999,'2016-12-21 23:59:00',1,0,355.66,NULL,NULL,'2016-12-23 06:30:00','0','0','0','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1002,'IHYSBU','AB MR','ABC','BOOKED','2016-12-21 11:30:00','YYZ','LGW',0,35,NULL,0,999,999,'2016-12-21 23:59:00',1,0,355.66,NULL,NULL,'2016-12-23 06:30:00','0','0','0','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1003,'ITBNVR','ABC MR','AB','BOOKED','2016-12-23 10:42:00','YYZ','LHR',0,35,NULL,0,999,999,'2016-12-23 23:59:00',1,0,1269.75,NULL,NULL,'2016-12-25 20:10:00','0','0','0','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1004,'OBQYDF','BB MR','AA','BOOKED','2017-01-03 02:34:00','LGW','YYZ',0,35,NULL,0,999,999,'2017-01-03 23:59:00',1,0,601.1,NULL,NULL,'2017-01-04 12:30:00','0','0','0','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1005,'OBVVAG','A MR','A','BOOKED','2017-01-03 03:22:00','LGW','YYZ',0,35,NULL,0,999,999,'2017-01-03 23:59:00',1,0,601.1,NULL,NULL,'2017-01-04 12:30:00','0','0','0','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1006,'OBWNED','B MR','A','BOOKED','2017-01-03 03:50:00','LHR','YYZ',0,35,NULL,0,999,999,'2017-01-03 23:59:00',1,0,1013.25,NULL,NULL,'2017-01-04 11:25:00','0','0','0','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1007,'AVNKYV','AB MR','AA','BOOKED','2017-02-03 02:23:00','YYZ','LHR',0,35,NULL,0,999,999,'2017-02-06 03:22:00',1,0,921.08,NULL,NULL,'2017-02-06 20:10:00','0','0','0','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1008,'DFPKLG','LOT MR','LOT','BOOKED','2017-02-03 02:33:00','YYZ','LHR',0,35,NULL,0,999,999,'2017-02-05 03:33:00',1,0,1007.01,NULL,NULL,'2017-02-06 22:10:00','0','0','0','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1009,'AWHHWZ','TRY MR','THIRD','BOOKED','2017-02-03 04:37:00','YYZ','LHR',0,35,NULL,0,999,999,'2017-02-03 23:59:00',1,0,1007.01,NULL,NULL,'2017-02-05 22:10:00','0','0','0','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1010,'ESSLAL','A MR','ABC','BOOKED','2017-02-05 23:51:00','YYZ','LHR',0,35,NULL,0,999,999,'2017-02-07 23:59:00',1,0,913.3,NULL,NULL,'2017-02-17 20:40:00','0','0','0','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1011,'AJCKDG','TEST MR','ABC','BOOKED','2017-02-06 09:12:00','YYZ','LHR',0,35,NULL,0,999,999,'2017-02-07 23:59:00',1,0,913.3,NULL,NULL,'2017-02-17 20:40:00','0','0','0','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1012,'FEKKXF','BB MR','AA','BOOKED','2017-02-13 05:48:00','YYZ','LHR',0,35,NULL,0,999,999,'2017-02-14 06:47:00',1,0,921.31,NULL,NULL,'2017-02-14 20:10:00','0','0','0','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `PNR_DETAILS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `POS`
--

DROP TABLE IF EXISTS `POS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `POS` (
  `POS_CD` varchar(10) NOT NULL,
  `VERSION` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`POS_CD`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `POS`
--

LOCK TABLES `POS` WRITE;
/*!40000 ALTER TABLE `POS` DISABLE KEYS */;
INSERT INTO `POS` VALUES ('CA',1);
/*!40000 ALTER TABLE `POS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `POS_DOM`
--

DROP TABLE IF EXISTS `POS_DOM`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `POS_DOM` (
  `DOM_AIR_CD` varchar(5) NOT NULL,
  `POS_CD` varchar(10) DEFAULT NULL,
  KEY `FK_PD_PO_P0` (`POS_CD`),
  CONSTRAINT `FK_PD_PO_P0` FOREIGN KEY (`POS_CD`) REFERENCES `POS` (`POS_CD`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `POS_DOM`
--

LOCK TABLES `POS_DOM` WRITE;
/*!40000 ALTER TABLE `POS_DOM` DISABLE KEYS */;
INSERT INTO `POS_DOM` VALUES ('YAM','CA'),('YBC','CA'),('YBG','CA'),('YBL','CA'),('YCD','CA'),('YCG','CA'),('YDF','CA'),('YEG','CA'),('YFB','CA'),('YFC','CA'),('YGK','CA'),('YGP','CA'),('YGR','CA'),('YHZ','CA'),('YKA','CA'),('YLW','CA'),('YMM','CA'),('YMT','CA'),('YOW','CA'),('YPR','CA'),('YQB','CA'),('YQG','CA'),('YQL','CA'),('YQM','CA'),('YQQ','CA'),('YQR','CA'),('YQT','CA'),('YQU','CA'),('YQX','CA'),('YQY','CA'),('YQZ','CA'),('YRT','CA'),('YSB','CA'),('YSJ','CA'),('YTS','CA'),('YTZ','CA'),('YUL','CA'),('YUY','CA'),('YVO','CA'),('YVR','CA'),('YWG','CA'),('YWK','CA'),('YWL','CA'),('YXC','CA'),('YXE','CA'),('YXH','CA'),('YXJ','CA'),('YXS','CA'),('YXT','CA'),('YXU','CA'),('YXY','CA'),('YYB','CA'),('YYC','CA'),('YYD','CA'),('YYF','CA'),('YYG','CA'),('YYJ','CA'),('YYR','CA'),('YYT','CA'),('YYY','CA'),('YYZ','CA'),('YZF','CA'),('YZP','CA'),('YZR','CA'),('YZV','CA'),('ZBF','CA');
/*!40000 ALTER TABLE `POS_DOM` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `POS_TRANS`
--

DROP TABLE IF EXISTS `POS_TRANS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `POS_TRANS` (
  `TRANS_AIR_CD` varchar(5) NOT NULL,
  `POS_CD` varchar(10) DEFAULT NULL,
  KEY `FK_PT_PO_P0` (`POS_CD`),
  CONSTRAINT `FK_PT_PO_P0` FOREIGN KEY (`POS_CD`) REFERENCES `POS` (`POS_CD`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `POS_TRANS`
--

LOCK TABLES `POS_TRANS` WRITE;
/*!40000 ALTER TABLE `POS_TRANS` DISABLE KEYS */;
INSERT INTO `POS_TRANS` VALUES ('ABE','CA'),('ABQ','CA'),('ACT','CA'),('AEX','CA'),('ALB','CA'),('AMA','CA'),('ANC','CA'),('ATL','CA'),('AUS','CA'),('AVL','CA'),('AVP','CA'),('BDL','CA'),('BFD','CA'),('BHM','CA'),('BIL','CA'),('BNA','CA'),('BOI','CA'),('BOS','CA'),('BPT','CA'),('BRO','CA'),('BTR','CA'),('BTV','CA'),('BUF','CA'),('BUR','CA'),('BWI','CA'),('CAE','CA'),('CHS','CA'),('CID','CA'),('CLE','CA'),('CLL','CA'),('CLT','CA'),('CMH','CA'),('COS','CA'),('CRP','CA'),('CVG','CA'),('DAY','CA'),('DCA','CA'),('DEN','CA'),('DFW','CA'),('DRT','CA'),('DSM','CA'),('DTW','CA'),('DUJ','CA'),('ELP','CA'),('ERI','CA'),('EUG','CA'),('EWR','CA'),('FAT','CA'),('FKL','CA'),('FLL','CA'),('FNT','CA'),('FWA','CA'),('GEG','CA'),('GJT','CA'),('GPT','CA'),('GRK','CA'),('GRR','CA'),('GSO','CA'),('GSP','CA'),('HNL','CA'),('HPN','CA'),('HRL','CA'),('HSV','CA'),('IAD','CA'),('IAH','CA'),('ICT','CA'),('IND','CA'),('ITH','CA'),('JAC','CA'),('JAN','CA'),('JAX','CA'),('JFK','CA'),('JHW','CA'),('KOA','CA'),('LAS','CA'),('LAX','CA'),('LBB','CA'),('LCH','CA'),('LFT','CA'),('LGA','CA'),('LIT','CA'),('LRD','CA'),('LWB','CA'),('MAF','CA'),('MCI','CA'),('MCO','CA'),('MDT','CA'),('MEM','CA'),('MFE','CA'),('MHT','CA'),('MIA','CA'),('MKE','CA'),('MLU','CA'),('MOB','CA'),('MRY','CA'),('MSP','CA'),('MSY','CA'),('MYR','CA'),('OAK','CA'),('OGG','CA'),('OKC','CA'),('OMA','CA'),('ONT','CA'),('ORD','CA'),('ORF','CA'),('PBI','CA'),('PDX','CA'),('PHL','CA'),('PHX','CA'),('PIT','CA'),('PNS','CA'),('PSP','CA'),('PVD','CA'),('PWM','CA'),('RDU','CA'),('RIC','CA'),('RNO','CA'),('ROA','CA'),('ROC','CA'),('RSW','CA'),('SAN','CA'),('SAT','CA'),('SAV','CA'),('SBA','CA'),('SBN','CA'),('SDF','CA'),('SEA','CA'),('SFO','CA'),('SHV','CA'),('SJC','CA'),('SLC','CA'),('SMF','CA'),('SNA','CA'),('SRQ','CA'),('STL','CA'),('SYR','CA'),('TPA','CA'),('TUL','CA'),('TUS','CA'),('TYR','CA'),('TYS','CA'),('VCT','CA'),('VPS','CA'),('XNA','CA');
/*!40000 ALTER TABLE `POS_TRANS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REVIEW_HISTORY`
--

DROP TABLE IF EXISTS `REVIEW_HISTORY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `REVIEW_HISTORY` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `SEARCH_ID` bigint(20) DEFAULT NULL,
  `RESPONSE` varchar(500) DEFAULT NULL,
  `REVIEW_DATE` datetime DEFAULT NULL,
  `SERVICE_PROVIDER` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FKD6E82A8D6E60E075` (`SEARCH_ID`),
  CONSTRAINT `FKD6E82A8D6E60E075` FOREIGN KEY (`SEARCH_ID`) REFERENCES `SEARCH_HISTORY` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=86 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REVIEW_HISTORY`
--

LOCK TABLES `REVIEW_HISTORY` WRITE;
/*!40000 ALTER TABLE `REVIEW_HISTORY` DISABLE KEYS */;
INSERT INTO `REVIEW_HISTORY` VALUES (1,6,'Seats are sold out. Please select another Itinerary.','2016-11-21 17:04:41','SABRE'),(2,6,'Seats are sold out. Please select another Itinerary.','2016-11-21 17:05:23','SABRE'),(3,7,'Seats are sold out. Please select another Itinerary.','2016-12-01 19:21:27','SABRE'),(4,7,'Seats are sold out. Please select another Itinerary.','2016-12-01 19:22:02','SABRE'),(5,8,'Seats are sold out. Please select another Itinerary.','2016-12-20 15:46:15','SABRE'),(6,8,'Seats are sold out. Please select another Itinerary.','2016-12-20 15:51:08','SABRE'),(7,8,'Seats are sold out. Please select another Itinerary.','2016-12-20 15:48:34','SABRE'),(8,8,'Seats are sold out. Please select another Itinerary.','2016-12-20 15:49:07','SABRE'),(9,8,'Seats are sold out. Please select another Itinerary.','2016-12-20 15:50:07','SABRE'),(10,8,'Seats are sold out. Please select another Itinerary.','2016-12-20 15:50:38','SABRE'),(11,8,'Seats are sold out. Please select another Itinerary.','2016-12-20 15:51:39','SABRE'),(13,20,'SUCCESS','2016-12-21 10:00:19','SABRE'),(14,21,'SUCCESS','2016-12-21 21:10:22','SABRE'),(15,21,'SUCCESS','2016-12-21 21:33:48','SABRE'),(16,21,'com.sabre.universalservices.base.exception.ApplicationTimeoutException: errors.mom.USG_NO_RESPONSE_FROM_MOM_SERVICE_PROVIDER_IN_TIME','2016-12-21 21:47:48','SABRE'),(17,22,'SUCCESS','2016-12-21 22:00:48','SABRE'),(18,22,'SUCCESS','2016-12-21 22:50:47','SABRE'),(19,23,'SUCCESS','2016-12-21 22:52:18','SABRE'),(20,24,'SUCCESS','2016-12-22 09:14:31','SABRE'),(21,25,'SUCCESS','2016-12-22 15:42:44','SABRE'),(22,26,'SUCCESS','2016-12-22 16:26:26','SABRE'),(23,26,'SUCCESS','2016-12-22 16:28:04','SABRE'),(24,26,'SUCCESS','2016-12-22 17:14:46','SABRE'),(25,27,'SUCCESS','2016-12-23 17:42:03','SABRE'),(26,28,'SUCCESS','2016-12-23 21:33:36','SABRE'),(27,28,'SUCCESS','2016-12-23 21:34:40','SABRE'),(28,28,'SUCCESS','2016-12-23 21:35:20','SABRE'),(29,28,'SUCCESS','2016-12-23 21:37:16','SABRE'),(30,29,'SUCCESS','2016-12-23 21:41:46','SABRE'),(31,29,'SUCCESS','2016-12-23 21:42:27','SABRE'),(32,30,'SUCCESS','2016-12-23 22:10:20','SABRE'),(33,31,'SUCCESS','2016-12-30 14:56:39','SABRE'),(34,31,'SUCCESS','2016-12-30 15:05:13','SABRE'),(35,31,'SUCCESS','2016-12-30 16:56:14','SABRE'),(36,32,'Seats are sold out. Please select another Itinerary.','2016-12-30 17:04:00','SABRE'),(37,32,'Seats are sold out. Please select another Itinerary.','2016-12-30 17:05:11','SABRE'),(38,33,'SUCCESS','2016-12-30 17:07:17','SABRE'),(39,33,'SUCCESS','2016-12-30 17:13:05','SABRE'),(40,33,'SUCCESS','2016-12-30 17:28:40','SABRE'),(41,34,'SUCCESS','2017-01-02 16:02:53','SABRE'),(42,34,'SUCCESS','2017-01-02 16:15:22','SABRE'),(43,34,'SUCCESS','2017-01-02 16:57:32','SABRE'),(44,35,'SUCCESS','2017-01-03 14:48:11','SABRE'),(45,36,'SUCCESS','2017-01-03 15:18:20','SABRE'),(46,42,'SUCCESS','2017-01-04 18:34:33','SABRE'),(47,42,'SUCCESS','2017-01-04 18:36:09','SABRE'),(48,43,'SUCCESS','2017-01-04 18:38:40','SABRE'),(49,43,'SUCCESS','2017-01-04 18:39:28','SABRE'),(50,43,'SUCCESS','2017-01-04 18:41:01','SABRE'),(51,44,'SUCCESS','2017-02-02 14:15:31','SABRE'),(52,44,'SUCCESS','2017-02-02 14:16:37','SABRE'),(53,45,'SUCCESS','2017-02-03 13:09:41','SABRE'),(54,46,'SUCCESS','2017-02-03 13:17:51','SABRE'),(55,46,'SUCCESS','2017-02-03 13:29:17','SABRE'),(56,46,'SUCCESS','2017-02-03 13:38:56','SABRE'),(57,46,'com.buymytrip.exceptions.SystemException: Unable to connect to backend services. Please try later.','2017-02-03 13:45:23','SABRE'),(58,46,'com.buymytrip.exceptions.SystemException: Unable to connect to backend services. Please try later.','2017-02-03 13:45:29','SABRE'),(59,46,'SUCCESS','2017-02-03 13:45:47','SABRE'),(60,46,'SUCCESS','2017-02-03 13:48:28','SABRE'),(61,46,'SUCCESS','2017-02-03 13:54:20','SABRE'),(62,46,'SUCCESS','2017-02-03 13:57:58','SABRE'),(63,46,'SUCCESS','2017-02-03 14:00:17','SABRE'),(64,46,'SUCCESS','2017-02-03 14:01:38','SABRE'),(65,48,'SUCCESS','2017-02-03 15:57:53','SABRE'),(66,49,'SUCCESS','2017-02-03 16:00:20','SABRE'),(67,50,'SUCCESS','2017-02-03 16:05:02','SABRE'),(68,53,'SUCCESS','2017-02-06 10:57:54','SABRE'),(69,53,'SUCCESS','2017-02-06 11:03:10','SABRE'),(70,53,'SUCCESS','2017-02-06 11:19:17','SABRE'),(71,53,'com.buymytrip.exceptions.SystemException: Unable to connect to backend services. Please try later.','2017-02-06 11:23:18','SABRE'),(72,53,'com.buymytrip.exceptions.SystemException: Unable to connect to backend services. Please try later.','2017-02-06 11:23:53','SABRE'),(73,53,'com.buymytrip.exceptions.SystemException: Unable to connect to backend services. Please try later.','2017-02-06 11:24:01','SABRE'),(74,53,'SUCCESS','2017-02-06 11:24:17','SABRE'),(75,54,'SUCCESS','2017-02-06 20:23:00','SABRE'),(76,55,'SUCCESS','2017-02-06 20:41:19','SABRE'),(77,56,'SUCCESS','2017-02-07 15:44:09','SABRE'),(78,57,'SUCCESS','2017-02-07 15:51:59','SABRE'),(79,57,'SUCCESS','2017-02-07 15:54:42','SABRE'),(80,58,'SUCCESS','2017-02-07 15:56:48','SABRE'),(81,58,'SUCCESS','2017-02-07 15:58:06','SABRE'),(82,58,'SUCCESS','2017-02-07 15:59:25','SABRE'),(83,58,'SUCCESS','2017-02-07 16:05:40','SABRE'),(84,58,'SUCCESS','2017-02-07 16:09:03','SABRE'),(85,59,'SUCCESS','2017-02-13 17:15:34','SABRE');
/*!40000 ALTER TABLE `REVIEW_HISTORY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REWARD_POINTS_AWARDED`
--

DROP TABLE IF EXISTS `REWARD_POINTS_AWARDED`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `REWARD_POINTS_AWARDED` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `PARTICIPANT_ID` bigint(20) DEFAULT NULL,
  `TICKET_ISSUE_DATE` datetime DEFAULT NULL,
  `PNR_NUMBER` varchar(100) DEFAULT NULL,
  `TICKET_NUMBER` varchar(100) DEFAULT NULL,
  `INVOICE_NUMBER` varchar(100) DEFAULT NULL,
  `SOURCE_ID` bigint(20) DEFAULT NULL,
  `REMARKS` longtext,
  PRIMARY KEY (`ID`),
  KEY `FKEBB5DB50C8AB4B7E` (`PARTICIPANT_ID`),
  CONSTRAINT `FKEBB5DB50C8AB4B7E` FOREIGN KEY (`PARTICIPANT_ID`) REFERENCES `REWARD_PROGRAM_USER` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REWARD_POINTS_AWARDED`
--

LOCK TABLES `REWARD_POINTS_AWARDED` WRITE;
/*!40000 ALTER TABLE `REWARD_POINTS_AWARDED` DISABLE KEYS */;
/*!40000 ALTER TABLE `REWARD_POINTS_AWARDED` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REWARD_POINTS_REDEEMED`
--

DROP TABLE IF EXISTS `REWARD_POINTS_REDEEMED`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `REWARD_POINTS_REDEEMED` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `PARTICIPANT_ID` bigint(20) DEFAULT NULL,
  `POINTS_REDEEMED` bigint(20) DEFAULT NULL,
  `REDEMPION_DATE` datetime DEFAULT NULL,
  `REMARKS` longtext,
  PRIMARY KEY (`ID`),
  KEY `FKBD314A07C8AB4B7E` (`PARTICIPANT_ID`),
  CONSTRAINT `FKBD314A07C8AB4B7E` FOREIGN KEY (`PARTICIPANT_ID`) REFERENCES `REWARD_PROGRAM_USER` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REWARD_POINTS_REDEEMED`
--

LOCK TABLES `REWARD_POINTS_REDEEMED` WRITE;
/*!40000 ALTER TABLE `REWARD_POINTS_REDEEMED` DISABLE KEYS */;
/*!40000 ALTER TABLE `REWARD_POINTS_REDEEMED` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REWARD_POINT_DETAILS`
--

DROP TABLE IF EXISTS `REWARD_POINT_DETAILS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `REWARD_POINT_DETAILS` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `REWARD_POINT_ID` bigint(20) DEFAULT NULL,
  `PAYMENT_REFERNCE` varchar(100) DEFAULT NULL,
  `POINTS_AWARDED` bigint(20) DEFAULT NULL,
  `CREATION_DATE` datetime DEFAULT NULL,
  `PASSANGER_TYPE` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK60CB6943AE8085FB` (`REWARD_POINT_ID`),
  CONSTRAINT `FK60CB6943AE8085FB` FOREIGN KEY (`REWARD_POINT_ID`) REFERENCES `REWARD_POINTS_AWARDED` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REWARD_POINT_DETAILS`
--

LOCK TABLES `REWARD_POINT_DETAILS` WRITE;
/*!40000 ALTER TABLE `REWARD_POINT_DETAILS` DISABLE KEYS */;
/*!40000 ALTER TABLE `REWARD_POINT_DETAILS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REWARD_POINT_DOWNLOAD_HISTORY`
--

DROP TABLE IF EXISTS `REWARD_POINT_DOWNLOAD_HISTORY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `REWARD_POINT_DOWNLOAD_HISTORY` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `AGENT_ID` bigint(20) DEFAULT NULL,
  `START_DATE` datetime DEFAULT NULL,
  `END_DATE` datetime DEFAULT NULL,
  `ADDITIONAL_PNR` varchar(500) DEFAULT NULL,
  `DOWNLOAD_DATE` datetime DEFAULT NULL,
  `STATUS` varchar(10) DEFAULT NULL,
  `REDEMPTION_DATE` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REWARD_POINT_DOWNLOAD_HISTORY`
--

LOCK TABLES `REWARD_POINT_DOWNLOAD_HISTORY` WRITE;
/*!40000 ALTER TABLE `REWARD_POINT_DOWNLOAD_HISTORY` DISABLE KEYS */;
/*!40000 ALTER TABLE `REWARD_POINT_DOWNLOAD_HISTORY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REWARD_PROGRAM_ENROLLMENT`
--

DROP TABLE IF EXISTS `REWARD_PROGRAM_ENROLLMENT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `REWARD_PROGRAM_ENROLLMENT` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `AGENT_ID` bigint(20) DEFAULT NULL,
  `FIRST_NAME` varchar(50) DEFAULT NULL,
  `LAST_NAME` varchar(50) DEFAULT NULL,
  `ADDRESS` varchar(200) DEFAULT NULL,
  `PHONE` varchar(50) DEFAULT NULL,
  `CITY` varchar(50) DEFAULT NULL,
  `PROVINCE` varchar(50) DEFAULT NULL,
  `COUNTRY` varchar(50) DEFAULT NULL,
  `POSTAL_CODE` varchar(50) DEFAULT NULL,
  `EMAIL` varchar(50) DEFAULT NULL,
  `STATUS` varchar(10) DEFAULT NULL,
  `AGENCY_PHONE` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REWARD_PROGRAM_ENROLLMENT`
--

LOCK TABLES `REWARD_PROGRAM_ENROLLMENT` WRITE;
/*!40000 ALTER TABLE `REWARD_PROGRAM_ENROLLMENT` DISABLE KEYS */;
/*!40000 ALTER TABLE `REWARD_PROGRAM_ENROLLMENT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REWARD_PROGRAM_USER`
--

DROP TABLE IF EXISTS `REWARD_PROGRAM_USER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `REWARD_PROGRAM_USER` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `AGENT_ID` bigint(20) DEFAULT NULL,
  `FIRST_NAME` varchar(50) DEFAULT NULL,
  `LAST_NAME` varchar(50) DEFAULT NULL,
  `FOURTH_LINE_EMBOSSING` varchar(100) DEFAULT NULL,
  `ACTIVATION_CODE` varchar(50) DEFAULT NULL,
  `ADDRESS_LINE_1` varchar(200) DEFAULT NULL,
  `ADDRESS_LINE_2` varchar(200) DEFAULT NULL,
  `PHONE` varchar(50) DEFAULT NULL,
  `CITY` varchar(50) DEFAULT NULL,
  `PROVINCE` varchar(50) DEFAULT NULL,
  `COUNTRY` varchar(50) DEFAULT NULL,
  `POSTAL_CODE` varchar(50) DEFAULT NULL,
  `EMAIL` varchar(50) DEFAULT NULL,
  `LANGUAGE` varchar(10) DEFAULT 'EN',
  `CURRENCY` varchar(10) DEFAULT 'CAD',
  `CARD` varchar(100) DEFAULT NULL,
  `EXPIRY_DATE` varchar(20) DEFAULT NULL,
  `START_DATE` datetime DEFAULT NULL,
  `PROGRAM_DETAILS_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FKAD40DBD6F2497F65` (`PROGRAM_DETAILS_ID`),
  CONSTRAINT `FKAD40DBD6F2497F65` FOREIGN KEY (`PROGRAM_DETAILS_ID`) REFERENCES `USER_PROGRAM_DETAILS` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REWARD_PROGRAM_USER`
--

LOCK TABLES `REWARD_PROGRAM_USER` WRITE;
/*!40000 ALTER TABLE `REWARD_PROGRAM_USER` DISABLE KEYS */;
/*!40000 ALTER TABLE `REWARD_PROGRAM_USER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RULE`
--

DROP TABLE IF EXISTS `RULE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `RULE` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `TRIPTYPE` varchar(50) DEFAULT NULL,
  `RANGESTART` double DEFAULT NULL,
  `RANGEEND` double DEFAULT NULL,
  `DISCOUNT_ADT` double DEFAULT NULL,
  `DISCOUNTTYPE_ADT` varchar(5) DEFAULT NULL,
  `DISCOUNT_CHD` double DEFAULT NULL,
  `DISCOUNTTYPE_CHD` varchar(5) DEFAULT NULL,
  `DISCOUNT_INF` double DEFAULT NULL,
  `DISCOUNTTYPE_INF` varchar(5) DEFAULT NULL,
  `COMMISSION_ADT` double NOT NULL,
  `COMMISSIONTYPE_ADT` varchar(5) DEFAULT NULL,
  `COMMISSION_CHD` double NOT NULL,
  `COMMISSIONTYPE_CHD` varchar(5) DEFAULT NULL,
  `COMMISSION_INF` double NOT NULL,
  `COMMISSIONTYPE_INF` varchar(5) DEFAULT NULL,
  `EFFECTIVE_DT` datetime DEFAULT NULL,
  `EXPIRY_DT` datetime DEFAULT NULL,
  `DEP_PRIM_TIME_START` varchar(4) DEFAULT NULL,
  `DEP_PRIM_TIME_END` varchar(4) DEFAULT NULL,
  `RET_PRIM_TIME_START` varchar(4) DEFAULT NULL,
  `RET_PRIM_TIME_END` varchar(4) DEFAULT NULL,
  `SEQUENCE` bigint(20) NOT NULL,
  `VERSION` bigint(20) DEFAULT NULL,
  `RULE_CRITERIA_ID` bigint(20) DEFAULT NULL,
  `DEP_DATE_RANGE_START` datetime DEFAULT NULL,
  `DEP_DATE_RANGE_END` datetime DEFAULT NULL,
  `RET_DATE_RANGE_START` datetime DEFAULT NULL,
  `RET_DATE_RANGE_END` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_RU_RC_P0` (`RULE_CRITERIA_ID`),
  CONSTRAINT `FK_RU_RC_P0` FOREIGN KEY (`RULE_CRITERIA_ID`) REFERENCES `RULE_CRITERIA` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=1003 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RULE`
--

LOCK TABLES `RULE` WRITE;
/*!40000 ALTER TABLE `RULE` DISABLE KEYS */;
INSERT INTO `RULE` VALUES (993,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,25,'AMT',15,'AMT',5,'AMT',NULL,NULL,NULL,NULL,NULL,NULL,10,0,994,NULL,NULL,NULL,NULL),(994,'Return',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,30,'AMT',20,'AMT',10,'AMT',NULL,NULL,'1500','1600','0700','0800',10,0,996,NULL,NULL,NULL,NULL),(995,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,35,'AMT',25,'AMT',15,'AMT',NULL,NULL,NULL,NULL,NULL,NULL,10,0,997,NULL,NULL,NULL,NULL),(996,'Return',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,30,'AMT',20,'AMT',10,'AMT',NULL,NULL,NULL,NULL,NULL,NULL,20,0,998,NULL,NULL,NULL,NULL),(997,'OneWay',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,30,'AMT',20,'AMT',10,'AMT',NULL,NULL,'0600','0630',NULL,NULL,10,0,998,NULL,NULL,NULL,NULL),(998,'OneWay',100,200,NULL,NULL,NULL,NULL,NULL,NULL,35,'AMT',25,'PERC',15,'AMT',NULL,NULL,NULL,NULL,NULL,NULL,10,0,995,NULL,NULL,NULL,NULL),(999,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,25,'AMT',15,'AMT',5,'AMT',NULL,NULL,NULL,NULL,NULL,NULL,10,0,999,NULL,NULL,NULL,NULL),(1000,NULL,NULL,NULL,0,'AMT',0,'AMT',0,'AMT',0,'AMT',0,'AMT',0,'AMT',NULL,NULL,NULL,NULL,NULL,NULL,10,0,1000,NULL,NULL,NULL,NULL),(1001,NULL,NULL,NULL,0,'AMT',0,'AMT',0,'AMT',0,'AMT',0,'AMT',0,'AMT',NULL,NULL,NULL,NULL,NULL,NULL,10,0,1001,NULL,NULL,NULL,NULL),(1002,NULL,NULL,NULL,0,'AMT',0,'AMT',0,'AMT',0,'AMT',0,'AMT',0,'AMT',NULL,NULL,NULL,NULL,NULL,NULL,10,0,1002,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `RULE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RULE_CRITERIA`
--

DROP TABLE IF EXISTS `RULE_CRITERIA`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `RULE_CRITERIA` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `MARKET` varchar(10) NOT NULL,
  `SEQUENCE` bigint(20) NOT NULL,
  `VERSION` bigint(20) DEFAULT NULL,
  `MARKUP_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_RC_MA_P0` (`MARKUP_ID`),
  CONSTRAINT `FK_RC_MA_P0` FOREIGN KEY (`MARKUP_ID`) REFERENCES `MARKUP` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=1003 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RULE_CRITERIA`
--

LOCK TABLES `RULE_CRITERIA` WRITE;
/*!40000 ALTER TABLE `RULE_CRITERIA` DISABLE KEYS */;
INSERT INTO `RULE_CRITERIA` VALUES (994,'TRANS',10,0,999),(995,'DOM',30,0,999),(996,'INT',20,0,999),(997,'INT',10,0,999),(998,'DOM',20,0,999),(999,'DOM',10,0,999),(1000,'DOM',10,0,1000),(1001,'TRANS',10,0,1000),(1002,'INT',10,0,1000);
/*!40000 ALTER TABLE `RULE_CRITERIA` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RULE_CRITERIA_AIRLINE`
--

DROP TABLE IF EXISTS `RULE_CRITERIA_AIRLINE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `RULE_CRITERIA_AIRLINE` (
  `AIRLINE` varchar(10) DEFAULT NULL,
  `RULE_CRITERIA_ID` bigint(20) DEFAULT NULL,
  KEY `FK_RA_RC_P0` (`RULE_CRITERIA_ID`),
  CONSTRAINT `FK_RA_RC_P0` FOREIGN KEY (`RULE_CRITERIA_ID`) REFERENCES `RULE_CRITERIA` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RULE_CRITERIA_AIRLINE`
--

LOCK TABLES `RULE_CRITERIA_AIRLINE` WRITE;
/*!40000 ALTER TABLE `RULE_CRITERIA_AIRLINE` DISABLE KEYS */;
/*!40000 ALTER TABLE `RULE_CRITERIA_AIRLINE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RULE_CRITERIA_CABIN`
--

DROP TABLE IF EXISTS `RULE_CRITERIA_CABIN`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `RULE_CRITERIA_CABIN` (
  `CABIN` varchar(10) DEFAULT NULL,
  `RULE_CRITERIA_ID` bigint(20) DEFAULT NULL,
  KEY `FK_RCC_RC_P0` (`RULE_CRITERIA_ID`),
  CONSTRAINT `FK_RCC_RC_P0` FOREIGN KEY (`RULE_CRITERIA_ID`) REFERENCES `RULE_CRITERIA` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RULE_CRITERIA_CABIN`
--

LOCK TABLES `RULE_CRITERIA_CABIN` WRITE;
/*!40000 ALTER TABLE `RULE_CRITERIA_CABIN` DISABLE KEYS */;
INSERT INTO `RULE_CRITERIA_CABIN` VALUES ('Y',998),('K',998);
/*!40000 ALTER TABLE `RULE_CRITERIA_CABIN` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RULE_CRITERIA_CLASS`
--

DROP TABLE IF EXISTS `RULE_CRITERIA_CLASS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `RULE_CRITERIA_CLASS` (
  `CLASS` varchar(10) DEFAULT NULL,
  `RULE_CRITERIA_ID` bigint(20) DEFAULT NULL,
  KEY `FK_RCL_RC_P0` (`RULE_CRITERIA_ID`),
  CONSTRAINT `FK_RCL_RC_P0` FOREIGN KEY (`RULE_CRITERIA_ID`) REFERENCES `RULE_CRITERIA` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RULE_CRITERIA_CLASS`
--

LOCK TABLES `RULE_CRITERIA_CLASS` WRITE;
/*!40000 ALTER TABLE `RULE_CRITERIA_CLASS` DISABLE KEYS */;
/*!40000 ALTER TABLE `RULE_CRITERIA_CLASS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RULE_CRITERIA_DESTINATION`
--

DROP TABLE IF EXISTS `RULE_CRITERIA_DESTINATION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `RULE_CRITERIA_DESTINATION` (
  `DESTINATION` varchar(10) DEFAULT NULL,
  `RULE_CRITERIA_ID` bigint(20) DEFAULT NULL,
  KEY `FK_RD_RC_P0` (`RULE_CRITERIA_ID`),
  CONSTRAINT `FK_RD_RC_P0` FOREIGN KEY (`RULE_CRITERIA_ID`) REFERENCES `RULE_CRITERIA` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RULE_CRITERIA_DESTINATION`
--

LOCK TABLES `RULE_CRITERIA_DESTINATION` WRITE;
/*!40000 ALTER TABLE `RULE_CRITERIA_DESTINATION` DISABLE KEYS */;
INSERT INTO `RULE_CRITERIA_DESTINATION` VALUES ('YYC',998),('YYZ',998);
/*!40000 ALTER TABLE `RULE_CRITERIA_DESTINATION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RULE_CRITERIA_FAREBASIS`
--

DROP TABLE IF EXISTS `RULE_CRITERIA_FAREBASIS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `RULE_CRITERIA_FAREBASIS` (
  `FAREBASIS` varchar(10) DEFAULT NULL,
  `RULE_CRITERIA_ID` bigint(20) DEFAULT NULL,
  KEY `FK_RF_RC_P0` (`RULE_CRITERIA_ID`),
  CONSTRAINT `FK_RF_RC_P0` FOREIGN KEY (`RULE_CRITERIA_ID`) REFERENCES `RULE_CRITERIA` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RULE_CRITERIA_FAREBASIS`
--

LOCK TABLES `RULE_CRITERIA_FAREBASIS` WRITE;
/*!40000 ALTER TABLE `RULE_CRITERIA_FAREBASIS` DISABLE KEYS */;
INSERT INTO `RULE_CRITERIA_FAREBASIS` VALUES ('T2002B',998);
/*!40000 ALTER TABLE `RULE_CRITERIA_FAREBASIS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RULE_CRITERIA_ORIGIN`
--

DROP TABLE IF EXISTS `RULE_CRITERIA_ORIGIN`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `RULE_CRITERIA_ORIGIN` (
  `ORIGIN` varchar(10) DEFAULT NULL,
  `RULE_CRITERIA_ID` bigint(20) DEFAULT NULL,
  KEY `FK_RO_RC_P0` (`RULE_CRITERIA_ID`),
  CONSTRAINT `FK_RO_RC_P0` FOREIGN KEY (`RULE_CRITERIA_ID`) REFERENCES `RULE_CRITERIA` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RULE_CRITERIA_ORIGIN`
--

LOCK TABLES `RULE_CRITERIA_ORIGIN` WRITE;
/*!40000 ALTER TABLE `RULE_CRITERIA_ORIGIN` DISABLE KEYS */;
INSERT INTO `RULE_CRITERIA_ORIGIN` VALUES ('YUL',998);
/*!40000 ALTER TABLE `RULE_CRITERIA_ORIGIN` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RULE_FARETYPE`
--

DROP TABLE IF EXISTS `RULE_FARETYPE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `RULE_FARETYPE` (
  `FARETYPE` varchar(10) DEFAULT NULL,
  `RULE_ID` bigint(20) DEFAULT NULL,
  KEY `FK_RF_RU_P0` (`RULE_ID`),
  CONSTRAINT `FK_RF_RU_P0` FOREIGN KEY (`RULE_ID`) REFERENCES `RULE` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RULE_FARETYPE`
--

LOCK TABLES `RULE_FARETYPE` WRITE;
/*!40000 ALTER TABLE `RULE_FARETYPE` DISABLE KEYS */;
/*!40000 ALTER TABLE `RULE_FARETYPE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SEARCH_HISTORY`
--

DROP TABLE IF EXISTS `SEARCH_HISTORY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SEARCH_HISTORY` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `AGENT_ID` bigint(20) DEFAULT NULL,
  `AGENCY_ID` bigint(20) DEFAULT NULL,
  `ORIGIN` varchar(100) DEFAULT NULL,
  `DESTINATION` varchar(100) DEFAULT NULL,
  `DEPARTURE_DATE` datetime DEFAULT NULL,
  `RETURN_DATE` datetime DEFAULT NULL,
  `TRIP_TYPE` varchar(50) DEFAULT NULL,
  `NO_OF_ADULTS` int(11) DEFAULT NULL,
  `NO_OF_CHILDREN` int(11) DEFAULT NULL,
  `NO_OF_INFANTS` int(11) DEFAULT NULL,
  `RESPONSE` varchar(500) DEFAULT NULL,
  `SEARCH_DATE` datetime DEFAULT NULL,
  `AIRLINE` varchar(100) DEFAULT NULL,
  `IS_DIRECT_FLIGHT` tinyint(4) DEFAULT '0',
  `CABIN_TYPE` varchar(50) DEFAULT NULL,
  `RETURN_ORIGIN` varchar(50) DEFAULT NULL,
  `RETURN_DESTINATION` varchar(50) DEFAULT NULL,
  `PNR` varchar(50) DEFAULT NULL,
  `SERVICE_TYPE` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FKBAA848DD8C8457E3` (`AGENCY_ID`),
  KEY `FKBAA848DDC59C1EE9` (`AGENT_ID`),
  CONSTRAINT `FKBAA848DD8C8457E3` FOREIGN KEY (`AGENCY_ID`) REFERENCES `AGENCY` (`ID`),
  CONSTRAINT `FKBAA848DDC59C1EE9` FOREIGN KEY (`AGENT_ID`) REFERENCES `USERS` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SEARCH_HISTORY`
--

LOCK TABLES `SEARCH_HISTORY` WRITE;
/*!40000 ALTER TABLE `SEARCH_HISTORY` DISABLE KEYS */;
INSERT INTO `SEARCH_HISTORY` VALUES (1,999,999,'YUL','YYZ','2016-11-10 00:10:00','2016-11-15 00:10:00','RETURN',1,0,0,'Exception occured in flight search controller - null','2016-11-07 17:20:08','',0,'ECONOMY','YYZ','YUL',NULL,'Normal Search'),(2,999,999,'YUL','YYZ','2016-11-10 00:10:00','2016-11-15 00:10:00','RETURN',1,0,0,'Exception occured in flight search controller - null','2016-11-07 17:21:35','',0,'ECONOMY','YYZ','YUL',NULL,'Normal Search'),(3,999,999,'YUL','LHR','2016-11-10 00:10:00','2016-11-16 00:10:00','RETURN',1,0,0,'Exception occured in flight search controller - null','2016-11-07 17:23:40','',0,'ECONOMY','LHR','YUL',NULL,'Normal Search'),(4,999,999,'YUL','YYZ','2016-11-16 00:10:00',NULL,'ONE_WAY',1,0,0,'Exception occured in flight search controller - null','2016-11-07 17:26:04','',0,'ECONOMY',NULL,NULL,NULL,'Normal Search'),(5,999,999,'YUL','YYZ','2016-11-20 00:10:00',NULL,'ONE_WAY',1,0,0,'SUCCESS','2016-11-07 17:27:24','',0,'ECONOMY',NULL,NULL,NULL,'Normal Search'),(6,999,999,'YYZ','LHR','2017-03-09 00:10:00','2017-03-18 00:10:00','RETURN',1,0,0,'SUCCESS','2016-11-21 17:03:58','',0,'ECONOMY','LHR','YYZ',NULL,'Normal Search'),(7,999,999,'YYZ','LHR','2017-03-09 00:10:00','2017-03-18 00:10:00','RETURN',1,0,0,'SUCCESS','2016-12-01 19:20:47','',0,'ECONOMY','LHR','YYZ',NULL,'Normal Search'),(8,999,999,'YYZ','LHR','2017-03-18 00:10:00','2017-03-27 00:10:00','RETURN',1,0,0,'SUCCESS','2016-12-20 15:45:42','',0,'ECONOMY','LHR','YYZ',NULL,'Normal Search'),(19,999,999,'YTZ','LHR','2016-12-22 00:10:00',NULL,'ONE_WAY',1,0,0,'SUCCESS','2016-12-21 09:42:12','',0,'ECONOMY',NULL,NULL,NULL,'Normal Search'),(20,999,999,'YTZ','LHR','2016-12-23 00:10:00',NULL,'ONE_WAY',1,0,0,'SUCCESS','2016-12-21 09:54:29','',0,'ECONOMY',NULL,NULL,NULL,'Normal Search'),(21,999,999,'YTZ','LHR','2016-12-23 00:10:00',NULL,'ONE_WAY',1,0,0,'SUCCESS','2016-12-21 21:09:58','',0,'ECONOMY',NULL,NULL,NULL,'Normal Search'),(22,999,999,'YTZ','LHR','2016-12-23 00:10:00',NULL,'ONE_WAY',1,0,0,'SUCCESS','2016-12-21 22:00:25','',0,'ECONOMY',NULL,NULL,NULL,'Normal Search'),(23,999,999,'YTZ','LHR','2016-12-23 00:10:00',NULL,'ONE_WAY',1,0,0,'SUCCESS','2016-12-21 22:51:48','',0,'ECONOMY',NULL,NULL,NULL,'Normal Search'),(24,999,999,'YTZ','LHR','2016-12-27 00:10:00',NULL,'ONE_WAY',1,0,0,'SUCCESS','2016-12-22 09:14:13','',0,'ECONOMY',NULL,NULL,NULL,'Normal Search'),(25,999,999,'YTZ','LHR','2016-12-27 00:10:00',NULL,'ONE_WAY',1,0,0,'SUCCESS','2016-12-22 15:42:14','',0,'ECONOMY',NULL,NULL,NULL,'Normal Search'),(26,999,999,'YTZ','LHR','2016-12-27 00:10:00','2016-12-31 00:10:00','RETURN',1,0,0,'SUCCESS','2016-12-22 16:05:20','',0,'ECONOMY','LHR','YTZ',NULL,'Normal Search'),(27,999,999,'YTZ','LHR','2016-12-24 00:10:00','2016-12-29 00:10:00','RETURN',1,0,0,'SUCCESS','2016-12-23 17:41:40','',0,'ECONOMY','LHR','YTZ',NULL,'Normal Search'),(28,999,999,'YTZ','LHR','2016-12-28 00:10:00',NULL,'ONE_WAY',1,0,0,'SUCCESS','2016-12-23 21:32:59','',0,'ECONOMY',NULL,NULL,NULL,'Normal Search'),(29,999,999,'YTZ','LHR','2016-12-25 00:10:00','2016-12-30 00:10:00','RETURN',1,0,0,'SUCCESS','2016-12-23 21:40:52','',0,'ECONOMY','LHR','YTZ',NULL,'Normal Search'),(30,999,999,'YYZ','LHR','2016-12-25 00:10:00','2016-12-29 00:10:00','RETURN',1,0,0,'SUCCESS','2016-12-23 22:09:31','',0,'ECONOMY','LHR','YYZ',NULL,'Normal Search'),(31,999,999,'LHR','YTZ','2017-01-02 00:10:00','2017-01-05 00:10:00','RETURN',1,0,0,'SUCCESS','2016-12-30 14:54:22','',0,'ECONOMY','YTZ','LHR',NULL,'Normal Search'),(32,999,999,'LHR','YTZ','2017-01-02 00:10:00','2017-02-06 00:10:00','RETURN',1,0,0,'SUCCESS','2016-12-30 17:01:27','',0,'ECONOMY','YTZ','LHR',NULL,'Normal Search'),(33,999,999,'LHR','YYZ','2017-01-02 00:10:00','2017-01-06 00:10:00','RETURN',1,0,0,'SUCCESS','2016-12-30 17:06:46','',0,'ECONOMY','YYZ','LHR',NULL,'Normal Search'),(34,999,999,'LHR','YYZ','2017-01-04 00:10:00','2017-01-11 00:10:00','RETURN',1,0,0,'SUCCESS','2017-01-02 16:02:27','',0,'ECONOMY','YYZ','LHR',NULL,'Normal Search'),(35,999,999,'LHR','YYZ','2017-01-04 00:10:00','2017-01-09 00:10:00','RETURN',1,0,0,'SUCCESS','2017-01-03 14:47:36','',0,'ECONOMY','YYZ','LHR',NULL,'Normal Search'),(36,999,999,'LHR','YYZ','2017-01-04 00:10:00','2017-01-08 00:10:00','RETURN',1,0,0,'SUCCESS','2017-01-03 15:17:47','',0,'ECONOMY','YYZ','LHR',NULL,'Normal Search'),(37,999,999,'LHR','YYZ','2017-01-05 00:10:00','2017-01-19 00:10:00','RETURN',1,0,0,'SUCCESS','2017-01-04 15:30:36','',0,'ECONOMY','YYZ','LHR',NULL,'Normal Search'),(38,999,999,'LHR','YYZ','2017-01-05 00:10:00','2017-01-14 00:10:00','RETURN',1,0,0,'SUCCESS','2017-01-04 15:33:38','',0,'ECONOMY','YYZ','LHR',NULL,'Normal Search'),(39,999,999,'LHR','YYZ','2017-01-05 00:10:00','2017-01-12 00:10:00','RETURN',1,0,0,'SUCCESS','2017-01-04 15:38:12','',0,'ECONOMY','YYZ','LHR',NULL,'Normal Search'),(40,999,999,'LHR','YYZ','2017-01-10 00:10:00','2017-01-12 00:10:00','RETURN',1,0,0,'SUCCESS','2017-01-04 15:52:54','',0,'ECONOMY','YYZ','LHR',NULL,'Normal Search'),(41,999,999,'LHR','YYZ','2017-01-11 00:10:00','2017-01-25 00:10:00','RETURN',1,0,0,'SUCCESS','2017-01-04 18:30:13','',0,'ECONOMY','YYZ','LHR',NULL,'Normal Search'),(42,999,999,'LHR','YYZ','2017-01-06 00:10:00','2017-01-11 00:10:00','RETURN',1,0,0,'SUCCESS','2017-01-04 18:34:05','',0,'ECONOMY','YYZ','LHR',NULL,'Normal Search'),(43,999,999,'JFK','BOM','2017-01-06 00:10:00','2017-01-12 00:10:00','RETURN',1,0,0,'SUCCESS','2017-01-04 18:38:28','',0,'ECONOMY','BOM','JFK',NULL,'Normal Search'),(44,999,999,'YYZ','LHR','2017-02-05 00:10:00','2017-02-10 00:10:00','RETURN',1,0,0,'SUCCESS','2017-02-02 14:14:07','',0,'ECONOMY','LHR','YYZ',NULL,'Normal Search'),(45,999,999,'YYZ','LHR','2017-02-05 00:10:00','2017-02-12 00:10:00','RETURN',1,0,0,'SUCCESS','2017-02-03 13:08:56','',0,'ECONOMY','YYZ',NULL,NULL,'Normal Search'),(46,999,999,'YYZ','LHR','2017-02-06 00:10:00','2017-02-12 00:10:00','RETURN',1,0,0,'SUCCESS','2017-02-03 13:15:10','',0,'ECONOMY','LHR','YYZ',NULL,'Normal Search'),(47,999,999,'YYZ','LHR','2017-02-16 00:10:00','2017-02-22 00:10:00','RETURN',1,0,0,'SUCCESS','2017-02-03 15:54:20','',0,'ECONOMY','LHR','YYZ',NULL,'Normal Search'),(48,999,999,'YYZ','LHR','2017-02-05 00:10:00','2017-02-12 00:10:00','RETURN',1,0,0,'SUCCESS','2017-02-03 15:56:14','',0,'ECONOMY','YYZ',NULL,NULL,'Normal Search'),(49,999,999,'YYZ','LHR','2017-02-05 00:10:00','2017-02-12 00:10:00','RETURN',1,0,0,'SUCCESS','2017-02-03 16:00:02','',0,'ECONOMY','LHR','YYZ',NULL,'Normal Search'),(50,999,999,'YYZ','LHR','2017-02-05 00:10:00','2017-02-12 00:10:00','RETURN',1,0,0,'SUCCESS','2017-02-03 16:04:27','',0,'ECONOMY','LHR','YYZ',NULL,'Normal Search'),(51,999,999,'YYZ','LHR','2017-02-05 00:10:00','2017-02-12 00:10:00','RETURN',1,0,0,'SUCCESS','2017-02-03 19:01:12','',0,'ECONOMY','LHR','YYZ',NULL,'Normal Search'),(52,999,999,'YYZ','LHR','2017-02-17 00:10:00','2017-02-24 00:10:00','RETURN',1,0,0,'Exception occured in flight search controller - null','2017-02-06 10:55:28','',0,'ECONOMY','LHR','YYZ',NULL,'Normal Search'),(53,999,999,'YYZ','LHR','2017-02-17 00:10:00','2017-02-24 00:10:00','RETURN',1,0,0,'SUCCESS','2017-02-06 10:57:08','',0,'ECONOMY','LHR','YYZ',NULL,'Normal Search'),(54,999,999,'YYZ','LHR','2017-02-17 00:10:00','2017-02-24 00:10:00','RETURN',1,0,0,'SUCCESS','2017-02-06 20:22:25','',0,'ECONOMY','LHR','YYZ',NULL,'Normal Search'),(55,999,999,'YYZ','LHR','2017-02-17 00:10:00','2017-02-24 00:10:00','RETURN',1,0,0,'SUCCESS','2017-02-06 20:40:53','',0,'ECONOMY','LHR','YYZ',NULL,'Normal Search'),(56,999,999,'YYZ','LHR','2017-02-17 00:10:00',NULL,'ONE_WAY',1,0,0,'SUCCESS','2017-02-07 15:05:49','',0,'ECONOMY',NULL,NULL,NULL,'Normal Search'),(57,999,999,'YYZ','LHR','2017-02-17 00:10:00',NULL,'ONE_WAY',1,0,0,'SUCCESS','2017-02-07 15:49:53','',0,'ECONOMY',NULL,NULL,NULL,'Normal Search'),(58,999,999,'YYZ','LHR','2017-02-17 00:10:00','2017-02-24 00:10:00','RETURN',1,0,0,'SUCCESS','2017-02-07 15:56:29','',0,'ECONOMY','LHR','YYZ',NULL,'Normal Search'),(59,999,999,'YYZ','LHR','2017-02-14 00:10:00','2017-02-21 00:10:00','RETURN',1,0,0,'SUCCESS','2017-02-13 17:15:07','',0,'ECONOMY','LHR','YYZ',NULL,'Normal Search');
/*!40000 ALTER TABLE `SEARCH_HISTORY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SERVICE_PROVIDER`
--

DROP TABLE IF EXISTS `SERVICE_PROVIDER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SERVICE_PROVIDER` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `SEARCH_ID` bigint(20) DEFAULT NULL,
  `NAME` varchar(100) DEFAULT NULL,
  `RESPONSE` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FKCDFAEC5B6E60E075` (`SEARCH_ID`),
  CONSTRAINT `FKCDFAEC5B6E60E075` FOREIGN KEY (`SEARCH_ID`) REFERENCES `SEARCH_HISTORY` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SERVICE_PROVIDER`
--

LOCK TABLES `SERVICE_PROVIDER` WRITE;
/*!40000 ALTER TABLE `SERVICE_PROVIDER` DISABLE KEYS */;
INSERT INTO `SERVICE_PROVIDER` VALUES (1,5,'SABRE','SUCCESS'),(2,6,'SABRE','SUCCESS'),(3,7,'SABRE','SUCCESS'),(4,8,'SABRE','SUCCESS'),(10,5,'SABRE','SUCCESS');
/*!40000 ALTER TABLE `SERVICE_PROVIDER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SYSTEM_PROPERTIES`
--

DROP TABLE IF EXISTS `SYSTEM_PROPERTIES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SYSTEM_PROPERTIES` (
  `PROPERTY_KEY` varchar(50) NOT NULL,
  `PROPERTY_VALUE` varchar(2000) DEFAULT NULL,
  PRIMARY KEY (`PROPERTY_KEY`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SYSTEM_PROPERTIES`
--

LOCK TABLES `SYSTEM_PROPERTIES` WRITE;
/*!40000 ALTER TABLE `SYSTEM_PROPERTIES` DISABLE KEYS */;
INSERT INTO `SYSTEM_PROPERTIES` VALUES ('application.eticket.admin.group','i.skyroutetravel@gmail.com'),('application.inclusiveflights','SB_GEN'),('enable.ac.int','true'),('enable.ws.int','true'),('markup.application.isactive','false'),('max.flights.dom','false'),('max.flights.int','true'),('max.flights.trans','false');
/*!40000 ALTER TABLE `SYSTEM_PROPERTIES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TO_EMAIL`
--

DROP TABLE IF EXISTS `TO_EMAIL`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TO_EMAIL` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `REL_ID` bigint(20) DEFAULT NULL,
  `USER_ID` varchar(255) DEFAULT NULL,
  `ADDT_INFO` varchar(2000) DEFAULT NULL,
  `EMAIL_TYPE` varchar(50) NOT NULL,
  `STATUS` varchar(30) DEFAULT NULL,
  `IS_VALID` varchar(1) DEFAULT NULL,
  `ERROR` varchar(255) DEFAULT NULL,
  `VERSION` bigint(20) DEFAULT NULL,
  `ATTEMPTS` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TO_EMAIL`
--

LOCK TABLES `TO_EMAIL` WRITE;
/*!40000 ALTER TABLE `TO_EMAIL` DISABLE KEYS */;
INSERT INTO `TO_EMAIL` VALUES (1,1,NULL,NULL,'BEAT_PRICE_REQUEST','ERROR','N',NULL,4,3),(2,1000,'i.skyroutetravel@gmail.com',NULL,'EMAIL_BOOKING','ERROR','N',NULL,4,3),(3,1001,'i.skyroutetravel@gmail.com',NULL,'EMAIL_BOOKING','ERROR','N',NULL,4,3),(4,1002,'i.skyroutetravel@gmail.com',NULL,'EMAIL_BOOKING','ERROR','N',NULL,4,3),(5,1003,'i.skyroutetravel@gmail.com',NULL,'EMAIL_BOOKING','ERROR','N',NULL,4,3),(6,1004,'i.skyroutetravel@gmail.com',NULL,'EMAIL_BOOKING','ERROR','N',NULL,4,3),(7,1005,'i.skyroutetravel@gmail.com',NULL,'EMAIL_BOOKING','ERROR','N',NULL,4,3),(8,1006,'i.skyroutetravel@gmail.com',NULL,'EMAIL_BOOKING','ERROR','N',NULL,4,3),(9,1007,'i.skyroutetravel@gmail.com',NULL,'EMAIL_BOOKING','ERROR','N',NULL,4,3),(10,1008,'i.skyroutetravel@gmail.com',NULL,'EMAIL_BOOKING','ERROR','N',NULL,4,3),(11,1009,'i.skyroutetravel@gmail.com',NULL,'EMAIL_BOOKING','ERROR','N',NULL,4,3),(12,1010,'i.skyroutetravel@gmail.com',NULL,'EMAIL_BOOKING','ERROR','N',NULL,4,3),(13,1011,'i.skyroutetravel@gmail.com',NULL,'EMAIL_BOOKING','ERROR','N',NULL,4,3),(14,1012,'i.skyroutetravel@gmail.com',NULL,'EMAIL_BOOKING','ERROR','N',NULL,4,3);
/*!40000 ALTER TABLE `TO_EMAIL` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USERPROFILE`
--

DROP TABLE IF EXISTS `USERPROFILE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `USERPROFILE` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `FNAME` varchar(64) NOT NULL,
  `LNAME` varchar(64) NOT NULL,
  `TITLE` varchar(20) DEFAULT NULL,
  `PHONE` varchar(20) DEFAULT NULL,
  `FAX` varchar(20) DEFAULT NULL,
  `EMAIL` varchar(255) NOT NULL,
  `VERSION` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `EMAIL` (`EMAIL`)
) ENGINE=InnoDB AUTO_INCREMENT=1000 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USERPROFILE`
--

LOCK TABLES `USERPROFILE` WRITE;
/*!40000 ALTER TABLE `USERPROFILE` DISABLE KEYS */;
INSERT INTO `USERPROFILE` VALUES (993,'Abc','Abc','Agent','','','abc@gmail.com',0),(994,'Ankit','Kumar','Owner','','','i.ankitkumar11@gmail.com',0),(995,'Vishal','Mahajan','Manager','','','vishalmahajan.mca@gmail.com',0),(996,'Rahul','Gupta','Manager','','','guptaair12@gmail.com',0),(997,'Manish','Thakur','Supervisor','','','manishthakur.in@gmail.com',0),(998,'Ravi','Panwar','Manager','','','i.ravipanwar@gmail.com',0),(999,'Admin','Admin','Super Admin','','','i.skyroutetravel@gmail.com',0);
/*!40000 ALTER TABLE `USERPROFILE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USERS`
--

DROP TABLE IF EXISTS `USERS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `USERS` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `USERNAME` varchar(255) NOT NULL,
  `PASSWORD` varchar(255) NOT NULL,
  `USERTYPE` varchar(50) NOT NULL,
  `ENABLED` varchar(1) NOT NULL,
  `ACCT_EXPIRED` varchar(1) NOT NULL,
  `CRED_EXPIRED` varchar(1) NOT NULL,
  `LOCKED` varchar(1) NOT NULL,
  `VERSION` bigint(20) DEFAULT NULL,
  `AGENCY_ID` bigint(20) DEFAULT NULL,
  `PROFILE_ID` bigint(20) DEFAULT NULL,
  `PASSWD_EXPIRED` varchar(1) DEFAULT NULL,
  `IS_SUBSCRIBED` varchar(1) DEFAULT NULL,
  `GROUP_COMMI` varchar(25) DEFAULT NULL,
  `GROUP_COMMI_TYPE` varchar(25) DEFAULT NULL,
  `TIERLOCK` tinyint(1) DEFAULT '0',
  `AGENCYTIERID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `USERNAME` (`USERNAME`),
  KEY `FK_US_AG_P0` (`AGENCY_ID`),
  KEY `FK_US_PR_P0` (`PROFILE_ID`),
  KEY `FK4D495E86AC0DE12` (`AGENCYTIERID`),
  CONSTRAINT `FK4D495E86AC0DE12` FOREIGN KEY (`AGENCYTIERID`) REFERENCES `AGENCYTIER` (`id`),
  CONSTRAINT `FK_US_AG_P0` FOREIGN KEY (`AGENCY_ID`) REFERENCES `AGENCY` (`ID`),
  CONSTRAINT `FK_US_PR_P0` FOREIGN KEY (`PROFILE_ID`) REFERENCES `USERPROFILE` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=1000 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USERS`
--

LOCK TABLES `USERS` WRITE;
/*!40000 ALTER TABLE `USERS` DISABLE KEYS */;
INSERT INTO `USERS` VALUES (993,'abc@gmail.com','$2a$10$NjggN0KxshVVaxnh3vjTq.ZNwhZFFUhssVDpRXT8BvooIsZqlNSv6','AGENCYETICKETADM','Y','N','N','N',4,999,993,NULL,NULL,NULL,NULL,0,3),(994,'i.ankitkumar11@gmail.com','$2a$10$a4bW.oKPzOY60hoggh5K3OlWdw4bwpB8bvXmNDC0bu5F2J9N1gKva','AGENT','Y','N','N','N',3,999,994,NULL,NULL,NULL,NULL,0,1),(995,'vishalmahajan.mca@gmail.com','$2a$10$.fZ5xGPJhkK1JcjM1T02l.HKZ9fE12uHB5pRox36t.1Wj6e3Eubxm','AGENT','Y','N','N','N',3,999,995,NULL,NULL,NULL,NULL,0,3),(996,'guptaair12@gmail.com','$2a$10$pE5KKRkni8VBV/fNPwjV4OJnQzxGheHzaathWlsxSs41sLDPgbb2W','AGENT','Y','N','N','N',1,NULL,996,NULL,NULL,NULL,NULL,0,NULL),(997,'manishthakur.in@gmail.com','$2a$10$vARIipVw2Jjo0qBRvY7/cOq45RaI0QH2zLdzexh3kakE97R9n3ySO','AGENT','Y','N','N','N',3,999,997,NULL,NULL,NULL,NULL,0,1),(998,'i.ravipanwar@gmail.com','$2a$10$9ILEiEWBqS.VwTElSSdUPebXqeSvj3daNOUJZBJ2ReAp85IfQy4V2','AGENCYADMAGNT','Y','N','N','N',2,999,998,NULL,NULL,NULL,NULL,0,1),(999,'i.skyroutetravel@gmail.com','$2a$10$NjggN0KxshVVaxnh3vjTq.ZNwhZFFUhssVDpRXT8BvooIsZqlNSv6','SUPERADMINAGENCY','Y','N','N','N',2,999,999,NULL,NULL,NULL,NULL,0,1);
/*!40000 ALTER TABLE `USERS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_PROGRAM_DETAILS`
--

DROP TABLE IF EXISTS `USER_PROGRAM_DETAILS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `USER_PROGRAM_DETAILS` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `POINTS_REWARDED` bigint(20) DEFAULT NULL,
  `POINTS_REDEEMED` bigint(20) DEFAULT NULL,
  `BALANCE_REWARD_POINT` bigint(20) DEFAULT NULL,
  `REWARD_AMOUNT` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_PROGRAM_DETAILS`
--

LOCK TABLES `USER_PROGRAM_DETAILS` WRITE;
/*!40000 ALTER TABLE `USER_PROGRAM_DETAILS` DISABLE KEYS */;
/*!40000 ALTER TABLE `USER_PROGRAM_DETAILS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_PROMO_SUBSCRIPTION`
--

DROP TABLE IF EXISTS `USER_PROMO_SUBSCRIPTION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `USER_PROMO_SUBSCRIPTION` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `USER_ID` bigint(20) DEFAULT NULL,
  `PROMO_CODE` varchar(100) DEFAULT NULL,
  `CREATE_DTTM` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FKE4A6976165457863` (`USER_ID`),
  CONSTRAINT `FKE4A6976165457863` FOREIGN KEY (`USER_ID`) REFERENCES `USERS` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_PROMO_SUBSCRIPTION`
--

LOCK TABLES `USER_PROMO_SUBSCRIPTION` WRITE;
/*!40000 ALTER TABLE `USER_PROMO_SUBSCRIPTION` DISABLE KEYS */;
/*!40000 ALTER TABLE `USER_PROMO_SUBSCRIPTION` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-02-13 18:34:04
