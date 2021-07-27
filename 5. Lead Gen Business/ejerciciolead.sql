USE lead_gen_buisness;
 
SELECT * FROM billing;
SELECT * FROM clients;
SELECT * FROM leads;
SELECT * FROM sites;


SELECT Date,TotalAllowance 
FROM Calculation 
WHERE EmployeeId=1 AND Date >= '2011/02/25' AND Date < '2011/02/28';      

-- Consultas
-- 1. ¿Qué consulta ejecutaría para obtener los ingresos totales para marzo de 2012?

SELECT * FROM billing;

SELECT MONTHNAME(charged_datetime), SUM(amount) AS 'revenue'
FROM billing
WHERE charged_datetime BETWEEN  '2012/02/29' AND '2012/04/01'
GROUP BY MONTHNAME(charged_datetime);

-- 2. ¿Qué consulta ejecutaría para obtener los ingresos totales recaudados del cliente con una identificación de 2?
S
ELECT * FROM billing;

SELECT client_id, SUM(amount) AS 'total_revenue'
FROM billing
WHERE client_id=2
GROUP BY client_id;

-- 3. ¿Qué consulta ejecutaría para obtener todos los sitios que posee client = 10?

SELECT * FROM sites;

SELECT domain_name, client_id
FROM sites
WHERE client_id=10;

-- 4. ¿Qué consulta ejecutaría para obtener el número total de sitios creados por mes por año para el cliente con una identificación de 1? ¿Qué pasa con el cliente = 20?

SELECT * from sites;

SELECT client_id, COUNT(*) AS number_of_websites, DATE_FORMAT(created_datetime,'%M') month_created, DATE_FORMAT(created_datetime'%Y') year_created
FROM sites 
WHERE client_id=1
GROUP BY client_id, month_created, year_created;

SELECT * from clients;

SELECT client_id, COUNT(*) AS number_of_websites, DATE_FORMAT(created_datetime,'%M') month_created, DATE_FORMAT(created_datetime'%Y') year_created
FROM sites 
WHERE client_id=20
GROUP BY client_id, month_created, year_created;

-- 5. ¿Qué consulta ejecutaría para obtener el número total de clientes potenciales generados para cada uno de los sitios entre el 1 de enero de 2011 y el 15 de febrero de 2011?

SELECT sites.domain_name AS website, count(leads_id) as number_of_leads, DATE_FORMAT(leads.registered_datetime, '%M %e %Y')
FROM sites, leads
WHERE sites.site_id=leads.site_id AND leads.registered_datetime BETWEEN '2011-1-1' AND '2011-2-15'
GROUP BY sites.domain_name, leads.registered_datetime;

SELECT sites.domain_name AS website, count(leads_id) as number_of_leads, CONCAT(MONTHNAME(leads.registered_datetime),DAY(leads.registered_datetime), leads.registered_datetime)
FROM sites, leads
WHERE sites.site_id=leads.site_id AND leads.registered_datetime BETWEEN '2011-1-1' AND '2011-2-15'
GROUP BY sites.domain_name, leads.registered_datetime;

-- 6. ¿Qué consulta ejecutaría para obtener una lista de nombres de clientes y el número total de clientes potenciales que hemos generado para cada uno de nuestros clientes entre el 1 de enero de 2011 y el 31 de diciembre de 2011?

-- 7. ¿Qué consulta ejecutaría para obtener una lista de nombres de clientes y el número total de clientes potenciales que hemos generado para cada cliente cada mes entre los meses 1 y 6 del año 2011?

-- 8. ¿Qué consulta ejecutaría para obtener una lista de nombres de clientes y el número total de clientes potenciales que hemos generado para cada uno de los sitios de nuestros clientes entre el 1 de enero de 2011 y el 31 de diciembre de 2011? Solicite esta consulta por ID de cliente. Presente una segunda consulta que muestre todos los clientes, los nombres del sitio y el número total de clientes potenciales generados en cada sitio en todo momento.

-- 9. Escriba una sola consulta que recupere los ingresos totales recaudados de cada cliente para cada mes del año. Pídalo por ID de cliente.

-- 10. Escriba una sola consulta que recupere todos los sitios que posee cada cliente. Agrupe los resultados para que cada fila muestre un nuevo cliente. Se volverá más claro cuando agregue un nuevo campo llamado 'sitios' que tiene todos los sitios que posee el cliente. (SUGERENCIA: use GROUP_CONCAT)