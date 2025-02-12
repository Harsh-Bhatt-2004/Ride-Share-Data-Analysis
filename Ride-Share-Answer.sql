#####  BASIC LEVEL  ######

(1.)  SELECT DISTINCT pickup_location FROM RIDES;

->    SELECT COUNT(DISTINCT(pickup_location)) FROM RIDES;

(2.)  SELECT COUNT(ride_id) FROM RIDES;

        OR

      SELECT COUNT(*) FROM RIDES;

(3.)  SELECT AVG(ride_duration) FROM RIDES;

(4.)  SELECT driver_id, driver_name, SUM(earnings) AS Total_Earnings FROM DRIVERS GROUP BY driver_id ORDER BY Total_Earnings DESC LIMIT 5;

(5.)  SELECT payment_method, COUNT(ride_id) AS "TOTAL RIDES" FROM RIDES GROUP BY payment_method;

(6.)  SELECT * FROM RIDES WHERE fare_amount > 20;

(7.)  SELECT pickup_location, COUNT(ride_id) AS "HIGH_RIDES" FROM RIDES GROUP BY pickup_location ORDER BY ride_id DESC LIMIT 1;

(8.)  SELECT AVG(fare_amount) AS "AVERAGE_FARE_AMOUNT" FROM RIDES;

(9.)  SELECT driver_id, driver_name, AVG(rating) AS AVERAGE_RATE FROM DRIVERS GROUP BY driver_id ORDER BY AVERAGE_RATE DESC LIMIT 10;

(10.)  SELECT SUM(earnings) AS TOT_EARN FROM DRIVERS;

(11.)  SELECT COUNT(ride_id) AS "CASH_PAID" FROM RIDES WHERE payment_method = "CASH";

(12.)  SELECT COUNT(ride_id) AS "TOT_RIDES", AVG(ride_distance) AS "AVERAGE_DIST", pickup_location FROM RIDES WHERE pickup_location = "Dhanbad";

(13.)  SELECT * FROM RIDES WHERE ride_distance < 10;

# Displaying The Top 10....
(14.)  SELECT passenger_id, COUNT(ride_id) FROM RIDES GROUP BY passenger_id ORDER BY COUNT(ride_id) DESC LIMIT 10; 

(15.)  SELECT driver_id, COUNT(ride_id) AS TOTAL_RIDES FROM RIDES GROUP BY driver_id ORDER BY TOTAL_RIDES DESC;

# Below We Can Also Use The ID's To Identify More Data With The Payment Method.
(16.)  SELECT payment_method FROM RIDES WHERE pickup_location = "Gandhinagar";

# Below Due To There Is No Rides Having The Distance More Than 10 That's Why We Find The Data less Than 10.....
(17.)  SELECT ride_id, AVG(fare_amount) AS AVG_AMT FROM RIDES WHERE ride_distance < 10;

(18.)  SELECT driver_id, driver_name, total_rides FROM DRIVERS ORDER BY total_rides DESC;

(19.)  SELECT AVG(r.fare_amount) AS average_fare FROM RIDES r JOIN PASSENGERS p ON r.passenger_id = p.passenger_id WHERE 
       p.rating > 4;

(20.)  SELECT * FROM RIDES WHERE pickup_location = dropoff_location;


#####  INTERMEDIATE LEVEL  ######


(1.)  SELECT passenger_id, COUNT(DISTINCT pickup_location) AS TOT_PICKUP FROM RIDES GROUP BY passenger_id HAVING TOT_PICKUP >=300;

(2.) SELECT AVG(fare_amount) AS average_fare FROM RIDES WHERE DAYOFWEEK(ride_date) IN (2, 3, 4, 5, 6);

# Because of the Error We Can Find The Distace Which Is Greater Than 9.
(3.)  SELECT DISTINCT driver_id, ride_distance FROM RIDES WHERE ride_distance > 9;

(4.)  SELECT driver_id, SUM(earnings) FROM DRIVERS WHERE driver_id IN (SELECT driver_id FROM RIDES GROUP BY driver_id HAVING COUNT(*) > 100) ORDER BY driver_id;

(5.)  SELECT * FROM RIDES WHERE fare_amount < (SELECT AVG(fare_amount) FROM RIDES);

(6.)  SELECT AVG(rating) FROM DRIVERS WHERE driver_id IN (SELECT driver_id FROM RIDES WHERE payment_method = "credit card" or payment_method = "cash");

            OR

        SELECT driver_id, AVG(rating) FROM DRIVERS WHERE driver_id IN (SELECT driver_id FROM RIDES WHERE payment_method IN ('CASH', 'CREDIT CARD') GROUP BY driver_id HAVING COUNT(DISTINCT payment_method) = 2) GROUP BY driver_id;

(7.)  SELECT p.passenger_id, p.passenger_name, SUM(r.fare_amount) AS total_spending FROM PASSENGERS p JOIN RIDES r ON p.passenger_id = r.passenger_id GROUP BY p.passenger_id, p.passenger_name ORDER BY total_spending DESC LIMIT 3;

(8.)  SELECT MONTH(ride_date) AS month, AVG(fare_amount) AS average_fare FROM RIDES
      GROUP BY MONTH(ride_date)
      ORDER BY month;

(9.)  SELECT pickup_location, dropoff_location, COUNT(*) AS common_pairs FROM RIDES GROUP BY pickup_location, dropoff_location ORDER BY common_pairs DESC LIMIT 3;              #

(10.) SELECT driver_id, SUM(earnings) AS total_earn FROM DRIVERS GROUP BY driver_id ORDER BY total_earn DESC;

(11.)  SELECT DISTINCT p.passenger_id, p.name FROM RIDES r JOIN PASSENGERS p ON r.passenger_id = p.passenger_id
       WHERE DATE(r.ride_date) = DATE(p.signup_date);

(12.)  SELECT driver_id, AVG(earnings) AS avg_earn FROM DRIVERS GROUP BY driver_id ORDER BY avg_earn DESC;

(13.)  SELECT ride_id, AVG(ride_distance) FROM RIDES WHERE ride_distance < (SELECT AVG(ride_distance) FROM RIDES) GROUP BY ride_id;

                # Very Similar.....

-> SELECT ride_id, ride_distnace FROM RIDES WHERE ride_distance < (SELECT AVG(ride_distance) FROM RIDES);


(14.)  SELECT driver_id, COUNT(*) AS ride_count FROM RIDES
       GROUP BY driver_id
       ORDER BY ride_count ASC LIMIT 1;

(15.)  SELECT AVG(fare_amount) FROM RIDES WHERE passenger_id IN (SELECT passenger_id FROM PASSENGERS GROUP BY passenger_id ORDER BY COUNT(passenger_id) >= 20);

(16.)  SELECT pickup_location, AVG(fare_amount) AS avg_famt FROM RIDES GROUP BY pickup_location ORDER BY avg_famt DESC;

(17.)  SELECT AVG(rating) FROM DRIVERS WHERE driver_id IN (SELECT driver_id FROM passengers GROUP BY driver_id HAVING COUNT(driver_id) >= 100);

(18.)  SELECT passenger_id, pickup_location, COUNT(DISTINCT pickup_location) AS tot_pick_loc FROM RIDES GROUP BY passenger_id HAVING tot_pick_loc >= 5;

                # OR

->     SELECT passenger_id, passenger_id, COUNT(DISTINCT pickup_location) AS pick_loc FROM RIDES GROUP BY passenger_id HAVING pick_loc >= 300;

(19.)  SELECT passenger_id, AVG(fare_amount) FROM RIDES WHERE passenger_id IN (SELECT passenger_id FROM PASSENGERS WHERE rating > 4);

(20.)  SELECT ride_id, ride_duration, pickup_location FROM RIDES WHERE ride_duration = (SELECT MIN(ride_duration) FROM RIDES);



######## ADVANCE LEVEL ......#


(1.)   SELECT driver_id, driver_name FROM DRIVERS WHERE driver_id NOT IN (SELECT DISTINCT driver_id FROM RIDES WHERE pickup_location NOT IN (SELECT DISTINCT pickup_location FROM RIDES));


(2.)   SELECT AVG(fare_amount) AS avg_fare_amt FROM RIDES WHERE passenger_id IN (SELECT passenger_id FROM PASSENGERS WHERE total_spent > 300);


(3.)   SELECT driver_id, driver_name, AVG(earnings) as avg_earn FROM DRIVERS GROUP BY driver_id ORDER BY avg_earn ASC LIMIT 5;


(4.)   SELECT SUM(fare_amount) FROM RIDES WHERE passenger_id IN (SELECT passenger_id FROM RIDES GROUP BY passenger_id HAVING COUNT(DISTINCT payment_method));


(5.)   SELECT ride_id, passenger_id, fare_amount FROM RIDES WHERE fare_amount > (SELECT AVG(fare_amount) FROM RIDES);

                                # OR
        SELECT * FROM RIDES WHERE fare_amount > (SELECT AVG(fare_amount) FROM RIDES);

(6.)   SELECT DISTINCT d.driver_id, d.name FROM RIDES r JOIN DRIVERS d ON r.driver_id = d.driver_id
       WHERE DATE(r.ride_date) = DATE(d.join_date);


(7.)   SELECT AVG(fare_amount) FROM RIDES WHERE passenger_id IN (SELECT passenger_id FROM RIDES GROUP BY passenger_id HAVING COUNT(DISTINCT payment_method));


(8.)   SELECT pickup_location, AVG(fare_amount) AS avg_fare, ((AVG(fare_amount) - overall_avg_fare) / overall_avg_fare) * 100 
       AS percentage_increase FROM RIDES,(SELECT AVG(fare_amount) AS overall_avg_fare FROM rides) AS overall_avg
       GROUP BY pickup_location
       ORDER BY percentage_increase DESC LIMIT 1;


(9.)   SELECT * FROM RIDES WHERE pickup_location = dropoff_location;


(10.)   SELECT AVG(rating) FROM DRIVERS WHERE driver_id IN (SELECT DISTINCT driver_id FROM RIDES GROUP BY driver_id HAVING COUNT(DISTINCT pickup_location));                    

        # NOT NECESSARY TO USE 'DISTINCT driver_id' IN SECOND SUB QUERY.....

                        # OR

        SELECT AVG(rating) FROM DRIVERS WHERE driver_id IN (SELECT DISTINCT driver_id FROM RIDES GROUP BY driver_id HAVING COUNT(DISTINCT pickup_location) > 1);
