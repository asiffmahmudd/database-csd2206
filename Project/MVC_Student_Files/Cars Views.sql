
CREATE OR REPLACE VIEW carsV1 AS
    SELECT car_make, car_model, model_year, color, odometer, cost_price
    FROM h_cars;

   
CREATE OR REPLACE VIEW carsV2 AS
    SELECT dealer_name, dealer_city, car_make, car_model, model_year, color, odometer, cost_price, first_name || ' ' || last_name AS previous_owner
    FROM h_cars
    JOIN h_car_dealers USING( dealer_id )
    JOIN h_car_owners ON( previous_owner = owner_id) ;


SELECT * FROM carsv1;
