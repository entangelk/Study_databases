문제 1 customername별로 주문 건수 표시

SELECT CS.CustomerName, count(OS.CustomerID) AS ORDER_COUNT
FROM Customers CS
JOIN Orders OS ON CS.CustomerID = OS.CustomerID
GROUP BY CS.CustomerName
ORDER BY CS.CustomerName ASC;

-- CustomerName	ORDER_COUNT
-- Alfreds Futterkiste	6
-- Ana Trujillo Emparedados y helados	4
-- Antonio Moreno Taquería	7
-- Around the Horn	13
-- B's Beverages	10
-- Berglunds snabbköp	18
-- Blauer See Delikatessen	7
-- Blondel père et fils	11
-- Bólido Comidas preparadas	3
-- Bon app'	17
-- Bottom-Dollar Marketse	14
-- Cactus Comidas para llevar	6
-- Centro comercial Moctezuma	1
-- Chop-suey Chinese	8
-- Comércio Mineiro	5
-- Consolidated Holdings	3
-- Die Wandernde Kuh	10
-- Drachenblut Delikatessend	6
-- Du monde entier	4
-- Eastern Connection	8
-- Ernst Handel	30
-- Familia Arquibaldo	7
-- Folies gourmandes	5
-- Folk och fä HB	19
-- France restauration	3
-- Franchi S.p.A.	6
-- Frankenversand	15
-- Furia Bacalhau e Frutos do Mar	8
-- Galería del gastrónomo	5
-- Godos Cocina Típica	10
-- Gourmet Lanchonetes	9
-- Great Lakes Food Market	11
-- GROSELLA-Restaurante	2
-- Hanari Carnes	14
-- HILARIÓN-Abastos	18
-- Hungry Coyote Import Store	5
-- Hungry Owl All-Night Grocers	19
-- Island Trading	10
-- Königlich Essen	14
-- La corne d'abondance	4
-- La maison d'Asie	14
-- Laughing Bacchus Wine Cellars	3
-- Lazy K Kountry Store	2
-- Lehmanns Marktstand	15
-- Let's Stop N Shop	4
-- LILA-Supermercado	14
-- LINO-Delicateses	12
-- Lonesome Pine Restaurant	8
-- Magazzini Alimentari Riuniti	10
-- Maison Dewey	7
-- Mère Paillarde	13
-- Morgenstern Gesundkost	5
-- North/South	3
-- Océano Atlántico Ltda.	5
-- Old World Delicatessen	10
-- Ottilies Käseladen	9
-- Pericles Comidas clásicas	6
-- Piccolo und mehr	10
-- Princesa Isabel Vinhoss	6
-- Que Delícia	9
-- Queen Cozinha	13
-- QUICK-Stop	28
-- Rancho grande	5
-- Rattlesnake Canyon Grocery	18
-- Reggiani Caseifici	12
-- Ricardo Adocicados	11
-- Richter Supermarkt	10
-- Romero y tomillo	5
-- Santé Gourmet	6
-- Save-a-lot Markets	31
-- Seven Seas Imports	9
-- Simons bistro	7
-- Spécialités du monde	4
-- Split Rail Beer & Ale	9
-- Suprêmes délices	12
-- The Big Cheese	4
-- The Cracker Box	3
-- Toms Spezialitäten	5
-- Tortuga Restaurante	10
-- Tradição Hipermercados	7
-- Trail's Head Gourmet Provisioners	3
-- Vaffeljernet	11
-- Victuailles en stock	10
-- Vins et alcools Chevalier	4
-- Wartian Herkku	15
-- Wellington Importadora	9
-- White Clover Markets	14
-- Wilman Kala	8
-- Wolski	7

문제 2 제품명, 가격, 주문 제품 갯수, 고객명 표시
SELECT PS.ProductName, PS.Price, COUNT(PS.ProductName) AS COUNT_PRODUCT, CS.CustomerName
FROM Customers CS
JOIN Orders OS ON CS.CustomerID = OS.CustomerID
JOIN OrderDetails OD ON OD.OrderID = OS.OrderID
JOIN Products PS ON PS.ProductID = OD.ProductID
GROUP BY PS.ProductName
ORDER BY CS.CustomerName ASC;

-- ProductName	Price	COUNT_PRODUCT	CustomerName
-- Wimmers gute Semmelknödel	33.25	30	B's Beverages
-- Aniseed Syrup	10.00	12	B's Beverages
-- Gula Malacca	19.45	24	Berglunds snabbköp
-- Vegie-spread	43.90	17	Berglunds snabbköp
-- Röd Kaviar	15.00	14	Berglunds snabbköp
-- Rhönbräu Klosterbier	7.75	46	Berglunds snabbköp
-- Alice Mutton	39.00	37	Blondel père et fils
-- Sir Rodney's Scones	10.00	39	Centro comercial Moctezuma
-- Gravad lax	26.00	6	Centro comercial Moctezuma
-- Guaraná Fantástica	4.50	51	Chop-suey Chinese
-- Pâté chinois	24.00	33	Chop-suey Chinese
-- Longlife Tofu	10.00	13	Chop-suey Chinese
-- Mascarpone Fabioli	32.00	15	Ernst Handel
-- Chocolade	12.75	6	Ernst Handel
-- Nord-Ost Matjeshering	25.89	32	Ernst Handel
-- Chef Anton's Gumbo Mix	21.35	10	Ernst Handel
-- Boston Crab Meat	18.40	41	Frankenversand
-- Tunnbröd	9.00	20	Frankenversand
-- Lakkalikööri	18.00	39	Frankenversand
-- Thüringer Rostbratwurst	123.79	32	GROSELLA-Restaurante
-- Gorgonzola Telino	12.50	51	Hanari Carnes
-- Chartreuse verte	18.00	30	Hanari Carnes
-- Maxilaku	20.00	21	Hanari Carnes
-- Jack's New England Clam Chowder	9.65	47	Hanari Carnes
-- Louisiana Fiery Hot Pepper Sauce	21.05	32	Hanari Carnes
-- Schoggi Schokolade	43.90	9	HILARIÓN-Abastos
-- Chef Anton's Cajun Seasoning	22.00	20	Hungry Owl All-Night Grocers
-- Grandma's Boysenberry Spread	25.00	12	Hungry Owl All-Night Grocers
-- NuNuCa Nuß-Nougat-Creme	14.00	18	Königlich Essen
-- Valkoinen suklaa	16.25	10	La maison d'Asie
-- Laughing Lumberjack Lager	14.00	10	Lehmanns Marktstand
-- Gudbrandsdalsost	36.00	31	LILA-Supermercado
-- Genen Shouyu	15.50	6	LILA-Supermercado
-- Gumbär Gummibärchen	31.23	32	LILA-Supermercado
-- Louisiana Hot Spiced Okra	17.00	8	Magazzini Alimentari Riuniti
-- Zaanse koeken	9.50	21	Mère Paillarde
-- Rössle Sauerkraut	45.60	33	Morgenstern Gesundkost
-- Tarte au sucre	49.30	48	Old World Delicatessen
-- Outback Lager	15.00	39	Old World Delicatessen
-- Filo Mix	7.00	29	Pericles Comidas clásicas
-- Steeleye Stout	18.00	36	Que Delícia
-- Sirop d'érable	28.50	24	QUICK-Stop
-- Chais	18.00	38	QUICK-Stop
-- Ikura	31.00	33	QUICK-Stop
-- Escargots de Bourgogne	13.25	18	Rattlesnake Canyon Grocery
-- Uncle Bob's Organic Dried Pears	30.00	29	Rattlesnake Canyon Grocery
-- Gnocchi di nonna Alice	38.00	50	Rattlesnake Canyon Grocery
-- Tourtière	7.45	36	Reggiani Caseifici
-- Scottish Longbreads	12.50	34	Reggiani Caseifici
-- Sasquatch Ale	14.00	19	Ricardo Adocicados
-- Spegesild	12.00	27	Ricardo Adocicados
-- Chang	19.00	44	Richter Supermarkt
-- Pavlova	17.45	43	Richter Supermarkt
-- Inlagd Sill	19.00	31	Richter Supermarkt
-- Raclette Courdavault	55.00	54	Richter Supermarkt
-- Teatime Chocolate Biscuits	9.20	37	Romero y tomillo
-- Røgede sild	9.50	14	Seven Seas Imports
-- Côte de Blaye	263.50	24	Split Rail Beer & Ale
-- Geitost	2.50	32	Suprêmes délices
-- Camembert Pierrot	34.00	51	Suprêmes délices
-- Sir Rodney's Marmalade	81.00	16	Suprêmes délices
-- Carnarvon Tigers	62.50	27	Tortuga Restaurante
-- Konbu	6.00	40	Tortuga Restaurante
-- Tofu	23.25	22	Tradição Hipermercados
-- Manjimup Dried Apples	53.00	39	Tradição Hipermercados
-- Gustaf's Knäckebröd	21.00	14	Victuailles en stock
-- Ravioli Angelo	19.50	23	Victuailles en stock
-- Fløtemysost	21.50	42	Vins et alcools Chevalier
-- Queso Manchego La Pastora	38.00	14	Wartian Herkku
-- Ipoh Coffee	46.00	28	Wartian Herkku
-- Mishi Kobe Niku	97.00	5	Wellington Importadora
-- Perth Pasties	32.80	30	Wellington Importadora
-- Original Frankfurter grüne Soße	13.00	38	Wellington Importadora
-- Northwoods Cranberry Sauce	40.00	13	White Clover Markets
-- Queso Cabrales	21.00	38	Wilman Kala
-- Singaporean Hokkien Fried Mee	14.00	30	Wilman Kala
-- Mozzarella di Giovanni	34.80	38	Wilman Kala

문제 3 가장 많이 주문 받은 회사 직원명과 갯수

SELECT SS.ShipperName,ES.LastNAME, ES.FirstName, COUNT(OS.EmployeeID) AS COUNT_SHIPPING
FROM Customers CS
JOIN Orders OS ON CS.CustomerID = OS.CustomerID
JOIN OrderDetails OD ON OD.OrderID = OS.OrderID
JOIN Products PS ON PS.ProductID = OD.ProductID
JOIN Shippers SS ON SS.ShipperID = OS.ShipperID
JOIN Employees ES ON ES.EmployeeID = OS.EmployeeID
GROUP BY OS.EmployeeID
ORDER BY COUNT_SHIPPING DESC
LIMIT 1;

-- ShipperName	LastNAME	FirstName	COUNT_SHIPPING
-- United Package	Peacock	Margaret	420