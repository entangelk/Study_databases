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

SELECT SP.SupplierName, SUM(PS.Price*OD.Quantity) AS HOWMUCH
FROM Products PS
JOIN Suppliers SP ON PS.SupplierID = SP.SupplierID
JOIN OrderDetails OD ON OD.ProductID = PS.ProductID
JOIN Orders OS ON OS.OrderID = OD.OrderID
GROUP BY SP.SupplierID
ORDER BY HOWMUCH ASC
LIMIT 3
;


-- SupplierName	HOWMUCH
-- Refrescos Americanas LTDA	5062.50
-- Zaanse Snoepfabriek	6367.00
-- Escargots Nouveaux	7075.50


문제 3 배송 회사별 총 배송 건수와 총 제품 금액 정보

SELECT SS.ShipperName, COUNT(OS.OrderID) AS COUNT_ORDERS, SUM(PS.Price*OD.Quantity) AS HOWMUCH
FROM Products PS
JOIN Suppliers SP ON PS.SupplierID = SP.SupplierID
JOIN OrderDetails OD ON OD.ProductID = PS.ProductID
JOIN Orders OS ON OS.OrderID = OD.OrderID
JOIN Shippers SS ON SS.ShipperID = OS.ShipperID
GROUP BY OS.ShipperID
ORDER BY HOWMUCH ASC
;

-- ShipperName	COUNT_ORDERS	HOWMUCH
-- Speedy Express	646	395931.17
-- Federal Shipping	645	442546.25
-- United Package	864	610889.89

문제 4 제품 회사별 총 판매액과 정보

SELECT SP.SupplierName, SUM(PS.Price*OD.Quantity) AS TOTAL_INCOME, SP.ContactName, SP.Address, SP.City, SP.PostalCode, SP.Country
FROM Products PS
JOIN Suppliers SP ON PS.SupplierID = SP.SupplierID
JOIN OrderDetails OD ON OD.ProductID = PS.ProductID
JOIN Orders OS ON OS.OrderID = OD.OrderID
JOIN Shippers SS ON SS.ShipperID = OS.ShipperID
GROUP BY SP.SupplierID
ORDER BY TOTAL_INCOME ASC
;


-- SupplierName	TOTAL_INCOME	ContactName	Address	City	PostalCode	Country
-- Refrescos Americanas LTDA	5062.50	Carlos Diaz	Av. das Americanas 12.890	São Paulo	5442	Brazil
-- Zaanse Snoepfabriek	6367.00	Dirk Luchte	Verkoop Rijnweg 22	Zaandam	9999 ZZ	Netherlands
-- Escargots Nouveaux	7075.50	Marie Delamare	22, rue H. Voiron	Montceau	71300	France
-- Lyngbysild	11402.00	Niels Petersen	Lyngbysild Fiskebakken 10	Lyngby	2800	Denmark
-- PB Knäckebröd AB	12528.00	Lars Peterson	Kaloadagatan 13	Göteborg	S-345 67	Sweden
-- Nord-Ost-Fisch Handelsgesellschaft mbH	15844.68	Sven Petersen	Frahmredder 112a	Cuxhaven	27478	Germany
-- Mayumi's	16630.00	Mayumi Ohno	92 Setsuko Chuo-ku	Osaka	545	Japan
-- Svensk Sjöföda AB	22940.00	Michael Björn	Brovallavägen 231	Stockholm	S-123 45	Sweden
-- Bigfoot Breweries	25554.00	Cheryl Saylor	3400 - 8th Avenue Suite 210	Bend	97101	USA
-- Ma Maison	27296.75	Jean-Guy Lauzon	2960 Rue St. Laurent	Montréal	H1J 1C3	Canada
-- Cooperativa de Quesos 'Las Cabras'	27898.00	Antonio del Valle Saavedra	Calle del Rosal 4	Oviedo	33007	Spain
-- New England Seafood Cannery	29761.85	Robb Merchant	Order Processing Dept. 2100 Paul Revere Blvd.	Boston	02134	USA
-- Karkki Oy	31876.75	Anne Heikkonen	Valtakatu 12	Lappeenranta	53120	Finland
-- Tokyo Traders	35187.00	Yoshi Nagase	9-8 Sekimai Musashino-shi	Tokyo	100	Japan
-- New Orleans Cajun Delights	36073.55	Shelley Burke	P.O. Box 78934	New Orleans	70117	USA
-- Exotic Liquid	38267.00	Charlotte Cooper	49 Gilbert St.	Londona	EC1 4SD	UK
-- Heli Süßwaren GmbH & Co. KG	43991.69	Petra Winkler	Tiergartenstraße 5	Berlin	10785	Germany
-- Grandma Kelly's Homestead	45295.00	Regina Murphy	707 Oxford Rd.	Ann Arbor	48104	USA
-- Leka Trading	48127.45	Chandra Leka	471 Serangoon Loop, Suite #402	Singapore	0512	Singapore
-- Norske Meierier	50317.00	Beate Vileid	Hatlevegen 5	Sandvika	1320	Norway
-- Specialty Biscuits, Ltd.	52152.10	Peter Wilson	29 King's Way	Manchester	M14 GSD	UK
-- Formaggi Fortini s.r.l.	55015.30	Elio Rossi	Viale Dante, 75	Ravenna	48100	Italy
-- Pasta Buttini s.r.l.	56457.00	Giovanni Giudici	Via dei Gelsomini, 153	Salerno	84100	Italy
-- Forêts d'érables	70577.40	Chantal Goulet	148 rue Chasseur	Ste-Hyacinthe	J2S 7S8	Canada
-- G'day, Mate	74139.60	Wendy Mackenzie	170 Prince Edward Parade Hunter's Hill	Sydney	2042	Australia
-- Pavlova, Ltd.	123827.10	Ian Devling	74 Rose St. Moonie Ponds	Melbourne	3058	Australia
-- Gai pâturage	135898.00	Eliane Noz	Bat. B 3, rue des Alpes	Annecy	74000	France
-- Plutzer Lebensmittelgroßmärkte AG	165370.59	Martin Bein	Bogenallee 51	Frankfurt	60439	Germany
-- Aux joyeux ecclésiastiques	178434.50	Guylène Nodier	203, Rue des Francs-Bourgeois	Paris	75004	France

문제 5 카테고리별 판매 합계 정보

SELECT CT.CategoryName, SUM(PS.Price*OD.Quantity) AS TOTAL_SELL, CT.Description
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
-- Grains/Cereals	106848.00	Breads, crackers, pasta, and cereal
-- Produce	111395.00	Dried fruit and bean curd
-- Condiments	122343.00	Sweet and savory sauces, relishes, spreads, and seasonings
-- Seafood	149059.53	Seaweed and fish
-- Confections	190328.54	Desserts, candies, and sweet breads
-- Meat/Poultry	190682.69	Prepared meats
-- Dairy Products	269128.30	Cheeses
-- Beverages	309582.25	Soft drinks, coffees, teas, beers, and ales