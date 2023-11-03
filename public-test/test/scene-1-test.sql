DROP TABLE IF EXISTS BigCustomer;
DROP TABLE IF EXISTS NormalCustomer;

SET @time1 = CURRENT_TIMESTAMP(6);
CALL EvaluateDiscountedSales("2015-01-01", "2016-01-01", 30, 300000, "Parksbury", "Lake Jessicaview", "Chen, Smith and Ingram", "Blair, Porter and Brown");
SET @time2 = CURRENT_TIMESTAMP(6);
SET @dur_without_index = TIMESTAMPDIFF(MICROSECOND, @time1, @time2);

-- Check BigCustomer and NormalCustomer then

DROP TABLE IF EXISTS BigCustomerComp;
DROP TABLE IF EXISTS NormalCustomerComp;
CREATE TABLE BigCustomerComp Like BigCustomer;
CREATE TABLE NormalCustomerComp Like NormalCustomer;

INSERT INTO BigCustomerComp (`cname`,`total_cost`) VALUES ('Laura Solis',127757365);
INSERT INTO BigCustomerComp (`cname`,`total_cost`) VALUES ('Ryan Massey',121018160);
INSERT INTO BigCustomerComp (`cname`,`total_cost`) VALUES ('Mindy Smith',123833115);
INSERT INTO BigCustomerComp (`cname`,`total_cost`) VALUES ('Ashley Deleon',121531842);
INSERT INTO BigCustomerComp (`cname`,`total_cost`) VALUES ('Jonathan Jimenez',116027295);
INSERT INTO BigCustomerComp (`cname`,`total_cost`) VALUES ('Christopher Nicholson',130106395);
INSERT INTO BigCustomerComp (`cname`,`total_cost`) VALUES ('Robert Jackson',125936711);
INSERT INTO BigCustomerComp (`cname`,`total_cost`) VALUES ('Jay Gates',123168723);
INSERT INTO BigCustomerComp (`cname`,`total_cost`) VALUES ('Brandon Turner',129351468);
INSERT INTO BigCustomerComp (`cname`,`total_cost`) VALUES ('Michael Mitchell',118323844);
INSERT INTO BigCustomerComp (`cname`,`total_cost`) VALUES ('Jacob Graham',109837036);
INSERT INTO BigCustomerComp (`cname`,`total_cost`) VALUES ('Sydney Thomas',120046603);
INSERT INTO BigCustomerComp (`cname`,`total_cost`) VALUES ('Mandy Perez',123628176);
INSERT INTO BigCustomerComp (`cname`,`total_cost`) VALUES ('Evan Cantu',141933435);
INSERT INTO BigCustomerComp (`cname`,`total_cost`) VALUES ('Chris Potter',120194491);
INSERT INTO BigCustomerComp (`cname`,`total_cost`) VALUES ('John Shaw',118403753);
INSERT INTO BigCustomerComp (`cname`,`total_cost`) VALUES ('Dwayne Hardin',111015679);
INSERT INTO BigCustomerComp (`cname`,`total_cost`) VALUES ('Joel Villarreal',125062836);
INSERT INTO BigCustomerComp (`cname`,`total_cost`) VALUES ('Joshua Holmes',130127959);
INSERT INTO BigCustomerComp (`cname`,`total_cost`) VALUES ('Patricia Chung',112784125);
INSERT INTO BigCustomerComp (`cname`,`total_cost`) VALUES ('Ronald Cruz',124102385);
INSERT INTO BigCustomerComp (`cname`,`total_cost`) VALUES ('Molly Blanchard',120739405);
INSERT INTO BigCustomerComp (`cname`,`total_cost`) VALUES ('Zachary Brown',123456690);
INSERT INTO BigCustomerComp (`cname`,`total_cost`) VALUES ('Angel Singleton',129525224);
INSERT INTO BigCustomerComp (`cname`,`total_cost`) VALUES ('Alexander Dickerson',134455140);
INSERT INTO BigCustomerComp (`cname`,`total_cost`) VALUES ('Eric Ortega',122495378);
INSERT INTO BigCustomerComp (`cname`,`total_cost`) VALUES ('Leah Murray MD',126906971);
INSERT INTO BigCustomerComp (`cname`,`total_cost`) VALUES ('Corey Wells',130458094);
INSERT INTO BigCustomerComp (`cname`,`total_cost`) VALUES ('Amy Meadows',118829664);
INSERT INTO BigCustomerComp (`cname`,`total_cost`) VALUES ('Randall Williams MD',127520345);
INSERT INTO BigCustomerComp (`cname`,`total_cost`) VALUES ('Brandon Lee',125201033);
INSERT INTO BigCustomerComp (`cname`,`total_cost`) VALUES ('Johnny Moses',135056733);
INSERT INTO BigCustomerComp (`cname`,`total_cost`) VALUES ('Andre Chapman',130369944);
INSERT INTO BigCustomerComp (`cname`,`total_cost`) VALUES ('Alyssa Hill',108531639);
INSERT INTO BigCustomerComp (`cname`,`total_cost`) VALUES ('Chloe Brown',113560907);
INSERT INTO BigCustomerComp (`cname`,`total_cost`) VALUES ('Jesse Potts',126260466);
INSERT INTO BigCustomerComp (`cname`,`total_cost`) VALUES ('Mark Duncan',113488988);
INSERT INTO BigCustomerComp (`cname`,`total_cost`) VALUES ('Robert Nielsen',126697019);
INSERT INTO BigCustomerComp (`cname`,`total_cost`) VALUES ('Garrett Morrison',115838023);
INSERT INTO BigCustomerComp (`cname`,`total_cost`) VALUES ('Dorothy Johnson',113797679);
INSERT INTO BigCustomerComp (`cname`,`total_cost`) VALUES ('Larry Chang',138165277);
INSERT INTO BigCustomerComp (`cname`,`total_cost`) VALUES ('Cristina Gibson',117668173);
INSERT INTO BigCustomerComp (`cname`,`total_cost`) VALUES ('Maria Ross',136455567);
INSERT INTO BigCustomerComp (`cname`,`total_cost`) VALUES ('Jordan Small',118051008);
INSERT INTO BigCustomerComp (`cname`,`total_cost`) VALUES ('Mark Neal',121188291);
INSERT INTO BigCustomerComp (`cname`,`total_cost`) VALUES ('Lisa Rodriguez',120087188);
INSERT INTO BigCustomerComp (`cname`,`total_cost`) VALUES ('Sandy Spencer',125102108);
INSERT INTO BigCustomerComp (`cname`,`total_cost`) VALUES ('Kayla King',116544257);
INSERT INTO BigCustomerComp (`cname`,`total_cost`) VALUES ('Susan Long',122692885);
INSERT INTO BigCustomerComp (`cname`,`total_cost`) VALUES ('Mr. Christopher Parker',132409967);
INSERT INTO BigCustomerComp (`cname`,`total_cost`) VALUES ('Ashley Phillips',112046853);
INSERT INTO BigCustomerComp (`cname`,`total_cost`) VALUES ('Andrea Tyler',123803565);
INSERT INTO BigCustomerComp (`cname`,`total_cost`) VALUES ('Thomas Wright',124010316);
INSERT INTO BigCustomerComp (`cname`,`total_cost`) VALUES ('Richard Mitchell',116538985);
INSERT INTO BigCustomerComp (`cname`,`total_cost`) VALUES ('Jesse Huang',131702346);
INSERT INTO BigCustomerComp (`cname`,`total_cost`) VALUES ('Henry Blake',119727700);
INSERT INTO BigCustomerComp (`cname`,`total_cost`) VALUES ('Mr. Alexander Acosta',131381659);
INSERT INTO BigCustomerComp (`cname`,`total_cost`) VALUES ('David Maxwell',126719845);
INSERT INTO BigCustomerComp (`cname`,`total_cost`) VALUES ('Reginald Coleman',124137182);
INSERT INTO BigCustomerComp (`cname`,`total_cost`) VALUES ('Trevor Collins',119071516);
INSERT INTO BigCustomerComp (`cname`,`total_cost`) VALUES ('Mitchell Rios',137513982);
INSERT INTO BigCustomerComp (`cname`,`total_cost`) VALUES ('Tina Smith',135420079);
INSERT INTO BigCustomerComp (`cname`,`total_cost`) VALUES ('Stephanie Johnson',111046627);
INSERT INTO BigCustomerComp (`cname`,`total_cost`) VALUES ('Melanie Watson',129516195);
INSERT INTO BigCustomerComp (`cname`,`total_cost`) VALUES ('Karen Cantu',121154146);
INSERT INTO BigCustomerComp (`cname`,`total_cost`) VALUES ('Susan Chang',119114421);
INSERT INTO BigCustomerComp (`cname`,`total_cost`) VALUES ('Kenneth Browning',113305945);
INSERT INTO BigCustomerComp (`cname`,`total_cost`) VALUES ('Janice Walker',120633354);
INSERT INTO BigCustomerComp (`cname`,`total_cost`) VALUES ('Jennifer Chan',139904158);
INSERT INTO BigCustomerComp (`cname`,`total_cost`) VALUES ('William Klein',136323951);
INSERT INTO BigCustomerComp (`cname`,`total_cost`) VALUES ('David Lee',140569178);
INSERT INTO BigCustomerComp (`cname`,`total_cost`) VALUES ('Karen Williams',111851624);
INSERT INTO BigCustomerComp (`cname`,`total_cost`) VALUES ('Paul Young',123275109);
INSERT INTO BigCustomerComp (`cname`,`total_cost`) VALUES ('Michael Skinner',132952907);
INSERT INTO BigCustomerComp (`cname`,`total_cost`) VALUES ('Marissa Smith',119589544);
INSERT INTO BigCustomerComp (`cname`,`total_cost`) VALUES ('Brian Barrett',133695965);
INSERT INTO BigCustomerComp (`cname`,`total_cost`) VALUES ('Kimberly Leonard',119755733);
INSERT INTO BigCustomerComp (`cname`,`total_cost`) VALUES ('Robert Hernandez',119139799);
INSERT INTO BigCustomerComp (`cname`,`total_cost`) VALUES ('David Garcia',126137032);
INSERT INTO BigCustomerComp (`cname`,`total_cost`) VALUES ('George Johnson',116868337);
INSERT INTO BigCustomerComp (`cname`,`total_cost`) VALUES ('Jesse Graves',116740700);
INSERT INTO BigCustomerComp (`cname`,`total_cost`) VALUES ('Tracy Edwards',122672999);
INSERT INTO BigCustomerComp (`cname`,`total_cost`) VALUES ('William Mercado',123807651);
INSERT INTO BigCustomerComp (`cname`,`total_cost`) VALUES ('Austin Roberson',129649413);
INSERT INTO BigCustomerComp (`cname`,`total_cost`) VALUES ('Sandra King',136737960);
INSERT INTO BigCustomerComp (`cname`,`total_cost`) VALUES ('Megan King',132506352);
INSERT INTO BigCustomerComp (`cname`,`total_cost`) VALUES ('Brandon Rangel',123207374);
INSERT INTO BigCustomerComp (`cname`,`total_cost`) VALUES ('Mariah Stokes',135824483);
INSERT INTO BigCustomerComp (`cname`,`total_cost`) VALUES ('Mark Greene',126238841);
INSERT INTO BigCustomerComp (`cname`,`total_cost`) VALUES ('Yvette Martin',126795595);
INSERT INTO BigCustomerComp (`cname`,`total_cost`) VALUES ('Kelly Thomas',123432416);

INSERT INTO `NormalCustomerComp` (`cname`,`total_cost`) VALUES ('Sherry Turner',122353610);
INSERT INTO `NormalCustomerComp` (`cname`,`total_cost`) VALUES ('Steven Velasquez',137001410);
INSERT INTO `NormalCustomerComp` (`cname`,`total_cost`) VALUES ('Jonathon Dixon',134057848);
INSERT INTO `NormalCustomerComp` (`cname`,`total_cost`) VALUES ('Daniel Harris',144945702);
INSERT INTO `NormalCustomerComp` (`cname`,`total_cost`) VALUES ('Edward Hall',141522944);
INSERT INTO `NormalCustomerComp` (`cname`,`total_cost`) VALUES ('Rachel Anderson',132875053);
INSERT INTO `NormalCustomerComp` (`cname`,`total_cost`) VALUES ('Sharon Kidd',129879003);
INSERT INTO `NormalCustomerComp` (`cname`,`total_cost`) VALUES ('Christopher Baker',129891854);
INSERT INTO `NormalCustomerComp` (`cname`,`total_cost`) VALUES ('Felicia Hernandez',128152515);

SELECT 
    IF(
        (SELECT COUNT(*) FROM BigCustomerComp NATURAL JOIN BigCustomer)=(SELECT COUNT(*) FROM BigCustomerComp),
        "PASS", "FAIL"
    ) AS "CHECK BigCustomer",
    IF(
        (SELECT COUNT(*) FROM NormalCustomerComp NATURAL JOIN NormalCustomer)=(SELECT COUNT(*) FROM NormalCustomerComp),
        "PASS", "FAIL"
    ) AS "CHECK NormalCustomer" ;

DROP TABLE IF EXISTS BigCustomer;
DROP TABLE IF EXISTS NormalCustomer;
