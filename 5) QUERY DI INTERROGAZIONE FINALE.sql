# 1) Verificare che i campi definiti come PK siano univoci. 
# In altre parole, scrivi una query per determinare l’univocità dei valori di ciascuna PK (una query per tabella implementata).

# ho pensato di scrivere questa query per verificare l'univocità delle primary key da me stabilite
# il concetto è che SQL contenterà quante volte la PK è presente nelle righe della tabella, se è univoca tale conteggio dovrebbe essere 1
# quindi raggruppando per la primary key ed impostando il filtro con HAVING quello che ottengo se la chiave primaria è univoca è una tabella con 0 record
# qualora la i campi da me definiti come PK non dovessero essere univoci questa query mi restituirà tutti gli attributi che appaiono più di una volta

# CATEGORY
SELECT categoryID, COUNT(categoryID) AS N_of_Category
FROM category
GROUP BY categoryID
HAVING COUNT(categoryID) > 1;

# COUNTRY
SELECT countryID, COUNT(countryID) AS N_of_Country
FROM country
GROUP BY countryID
HAVING COUNT(countryID) > 1;

# PRODUCT
SELECT productID, COUNT(productID) AS N_of_Product
FROM product
GROUP BY productID
HAVING COUNT(productID) > 1;

# REGION
SELECT regionID, COUNT(regionID) AS N_of_Region
FROM region
GROUP BY regionID
HAVING COUNT(regionID) > 1;

# SALES
SELECT salesID, COUNT(salesID) AS N_of_Sales
FROM sales
GROUP BY salesID
HAVING COUNT(salesID) > 1;

# 2) Esporre l’elenco delle transazioni indicando nel result set il codice documento, la data, 
# il nome del prodotto, la categoria del prodotto, il nome dello stato, il nome della regione di vendita 
# e un campo booleano valorizzato in base alla condizione che siano passati più di 180 giorni dalla data vendita o meno 
# (>180 -> True, <= 180 -> False)

SELECT s.salesID, p.product_name, c.category_name, co.country_name, r.region_name, sales_date, DATEDIFF(CURDATE(),sales_date) AS giorni_passati,
CASE 
    WHEN DATEDIFF(CURDATE(), s.sales_date) > 180 THEN TRUE
    ELSE FALSE
  END AS oltre_180_giorni
FROM sales s
JOIN product p ON s.productID = p.productID
JOIN category c ON p.categoryID = c.categoryID
JOIN country co ON s.countryID = co.countryID
JOIN region r ON co.regionID = r.regionID;

# 3) Esporre l’elenco dei prodotti che hanno venduto, in totale, una quantità maggiore della media delle vendite realizzate nell’ultimo anno censito. 
# (ogni valore della condizione deve risultare da una query e non deve essere inserito a mano). Nel result set devono comparire solo il codice prodotto e il totale venduto.

SELECT productID, quantity
FROM sales
GROUP BY productID, quantity
HAVING quantity > (SELECT ROUND(AVG(quantity),2) FROM sales)
;

# 4) Esporre l’elenco dei soli prodotti venduti e per ognuno di questi il fatturato totale per anno. 
SELECT product_name, SUM(price * quantity) AS total, YEAR(sales_date) AS year
FROM sales s
JOIN product p ON s.productID = p.productID
GROUP BY product_name, YEAR(sales_date);

# 5) Esporre il fatturato totale per stato per anno. Ordina il risultato per data e per fatturato decrescente.
SELECT country_name, SUM(price * quantity) AS total, YEAR(sales_date) AS year
FROM sales s
JOIN product p ON s.productID = p.productID
JOIN country c ON s.countryID = c.countryID
GROUP BY country_name, YEAR(sales_date)
ORDER BY year, total DESC;



