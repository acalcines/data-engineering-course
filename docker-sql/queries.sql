Question 3
SELECT count(*)
FROM trips
WHERE lpep_pickup_datetime >= '2019-09-18' AND lpep_dropoff_datetime < '2019-09-19'

Question 4 
SELECT lpep_pickup_datetime, trip_distance
FROM trips
ORDER by trip_distance DESC
LIMIT 1

Question 5 
SELECT "Borough", SUM("total_amount") AS total
FROM
trips t
INNER JOIN zones z ON z."LocationID" = t."PULocationID"
WHERE lpep_pickup_datetime >= '2019-09-18' AND lpep_dropoff_datetime < '2019-09-19'
GROUP BY "Borough"
HAVING SUM(total_amount) > 50000
ORDER BY total DESC
LIMIT 3

Question 6
SELECT zoff."Zone", MAX(tip_amount) AS tip
FROM
trips t
INNER JOIN zones zup ON zup."LocationID" = t."PULocationID"
INNER JOIN zones zoff ON zoff."LocationID" = t."DOLocationID"
where "lpep_pickup_datetime" > '2019-08-31' AND 
lpep_dropoff_datetime < '2019-10-01' AND
zup."Zone" = 'Astoria'
group by zoff."Zone"
order by tip desc
limit 1