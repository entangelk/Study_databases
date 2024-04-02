문제 1 비 진성고객 리스트 

SELECT CS.CustomerName, COUNT(OS.CustomerID) AS COUNT_ORDER
FROM Customers CS
LEFT JOIN Orders OS ON CS.CustomerID = OS.CustomerID
GROUP BY CS.CustomerName
HAVING COUNT_ORDER <= 1
;

-- CustomerName	COUNT_ORDER
-- Centro comercial Moctezuma	1
-- FISSA Fabrica Inter. Salchichas S.A.	0
-- Paris spécialités	0

문제 2 판매자 중 수익 낮은 순위자 3명 정보, 총 판매액

SELECT SP.SupplierName, SUM(PS.Price) AS HOWMUCH
FROM Products PS
JOIN Suppliers SP ON PS.SupplierID = SP.SupplierID
JOIN OrderDetails OD ON OD.ProductID = PS.ProductID
JOIN Orders OS ON OS.OrderID = OD.OrderID
GROUP BY SP.SupplierID
ORDER BY HOWMUCH ASC
LIMIT 3
;

-- SupplierName	HOWMUCH
-- Refrescos Americanas LTDA	229.50
-- Escargots Nouveaux	238.50
-- Zaanse Snoepfabriek	276.00


문제 3 배송 회사별 총 배송 건수와 총 제품 금액 정보

SELECT SS.ShipperName, COUNT(OS.OrderID) AS COUNT_ORDERS, SUM(PS.Price) AS HOWMUCH
FROM Products PS
JOIN Suppliers SP ON PS.SupplierID = SP.SupplierID
JOIN OrderDetails OD ON OD.ProductID = PS.ProductID
JOIN Orders OS ON OS.OrderID = OD.OrderID
JOIN Shippers SS ON SS.ShipperID = OS.ShipperID
GROUP BY OS.ShipperID
ORDER BY HOWMUCH ASC
;

-- ShipperName	COUNT_ORDERS	HOWMUCH
-- Speedy Express	646	16687.15
-- Federal Shipping	645	18002.63
-- United Package	864	25539.64

문제 4 제품 회사별 총 판매액과 정보

SELECT SP.SupplierName, SUM(PS.Price) AS TOTAL_INCOME, SP.ContactName, SP.Address, SP.City, SP.PostalCode, SP.Country
FROM Products PS
JOIN Suppliers SP ON PS.SupplierID = SP.SupplierID
JOIN OrderDetails OD ON OD.ProductID = PS.ProductID
JOIN Orders OS ON OS.OrderID = OD.OrderID
JOIN Shippers SS ON SS.ShipperID = OS.ShipperID
GROUP BY SP.SupplierID
ORDER BY TOTAL_INCOME ASC
;

-- SupplierName	TOTAL_INCOME	ContactName	Address	City	PostalCode	Country
-- Refrescos Americanas LTDA	229.50	Carlos Diaz	Av. das Americanas 12.890	São Paulo	5442	Brazil
-- Escargots Nouveaux	238.50	Marie Delamare	22, rue H. Voiron	Montceau	71300	France
-- Zaanse Snoepfabriek	276.00	Dirk Luchte	Verkoop Rijnweg 22	Zaandam	9999 ZZ	Netherlands
-- Lyngbysild	457.00	Niels Petersen	Lyngbysild Fiskebakken 10	Lyngby	2800	Denmark
-- PB Knäckebröd AB	474.00	Lars Peterson	Kaloadagatan 13	Göteborg	S-345 67	Sweden
-- Nord-Ost-Fisch Handelsgesellschaft mbH	828.48	Sven Petersen	Frahmredder 112a	Cuxhaven	27478	Germany
-- Mayumi's	844.50	Mayumi Ohno	92 Setsuko Chuo-ku	Osaka	545	Japan
-- Svensk Sjöföda AB	955.00	Michael Björn	Brovallavägen 231	Stockholm	S-123 45	Sweden
-- Bigfoot Breweries	1054.00	Cheryl Saylor	3400 - 8th Avenue Suite 210	Bend	97101	USA
-- Ma Maison	1060.20	Jean-Guy Lauzon	2960 Rue St. Laurent	Montréal	H1J 1C3	Canada
-- New England Seafood Cannery	1207.95	Robb Merchant	Order Processing Dept. 2100 Paul Revere Blvd.	Boston	02134	USA
-- Karkki Oy	1284.50	Anne Heikkonen	Valtakatu 12	Lappeenranta	53120	Finland
-- Cooperativa de Quesos 'Las Cabras'	1330.00	Antonio del Valle Saavedra	Calle del Rosal 4	Oviedo	33007	Spain
-- New Orleans Cajun Delights	1463.10	Shelley Burke	P.O. Box 78934	New Orleans	70117	USA
-- Tokyo Traders	1638.00	Yoshi Nagase	9-8 Sekimai Musashino-shi	Tokyo	100	Japan
-- Exotic Liquid	1640.00	Charlotte Cooper	49 Gilbert St.	Londona	EC1 4SD	UK
-- Heli Süßwaren GmbH & Co. KG	1646.46	Petra Winkler	Tiergartenstraße 5	Berlin	10785	Germany
-- Grandma Kelly's Homestead	1690.00	Regina Murphy	707 Oxford Rd.	Ann Arbor	48104	USA
-- Norske Meierier	2099.00	Beate Vileid	Hatlevegen 5	Sandvika	1320	Norway
-- Leka Trading	2174.80	Chandra Leka	471 Serangoon Loop, Suite #402	Singapore	0512	Singapore
-- Pasta Buttini s.r.l.	2348.50	Giovanni Giudici	Via dei Gelsomini, 153	Salerno	84100	Italy
-- Formaggi Fortini s.r.l.	2439.90	Elio Rossi	Viale Dante, 75	Ravenna	48100	Italy
-- Specialty Biscuits, Ltd.	2451.40	Peter Wilson	29 King's Way	Manchester	M14 GSD	UK
-- Forêts d'érables	3050.40	Chantal Goulet	148 rue Chasseur	Ste-Hyacinthe	J2S 7S8	Canada
-- G'day, Mate	3254.00	Wendy Mackenzie	170 Prince Edward Parade Hunter's Hill	Sydney	2042	Australia
-- Gai pâturage	4704.00	Eliane Noz	Bat. B 3, rue des Alpes	Annecy	74000	France
-- Pavlova, Ltd.	5212.15	Ian Devling	74 Rose St. Moonie Ponds	Melbourne	3058	Australia
-- Aux joyeux ecclésiastiques	6864.00	Guylène Nodier	203, Rue des Francs-Bourgeois	Paris	75004	France
-- Plutzer Lebensmittelgroßmärkte AG	7314.08	Martin Bein	Bogenallee 51	Frankfurt	60439	Germany        

문제 5 카테고리별 판매 합계 정보

SELECT CT.CategoryName, SUM(PS.Price) AS TOTAL_SELL, CT.Description
FROM Products PS
JOIN Suppliers SP ON PS.SupplierID = SP.SupplierID
JOIN OrderDetails OD ON OD.ProductID = PS.ProductID
JOIN Orders OS ON OS.OrderID = OD.OrderID
JOIN Shippers SS ON SS.ShipperID = OS.ShipperID
JOIN Categories CT ON CT.CategoryID = PS.CategoryID
GROUP BY CT.CategoryID
ORDER BY TOTAL_SELL ASC
;

        
-- CategoryName	TOTAL_SELL	Description
-- Grains/Cereals	4443.00	Breads, crackers, pasta, and cereal
-- Condiments	4887.20	Sweet and savory sauces, relishes, spreads, and seasonings
-- Produce	5083.30	Dried fruit and bean curd
-- Seafood	6637.43	Seaweed and fish
-- Meat/Poultry	7933.48	Prepared meats
-- Confections	8073.11	Desserts, candies, and sweet breads
-- Dairy Products	10572.90	Cheeses
-- Beverages	12599.00	Soft drinks, coffees, teas, beers, and ales