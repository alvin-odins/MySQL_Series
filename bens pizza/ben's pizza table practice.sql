-- ben's pizza business schema

CREATE DATABASE pizza_ben;

CREATE TABLE "orders" (
  "row_id" int NOT NULL,
  "order_id" varchar(10) NOT NULL,
  "created_at" date NOT NULL,
  "quantity" int NOT NULL,
  "delivery" boolean NOT NULL,
  "cust_id" int NOT NULL,
  "add_id" int NOT NULL,
  "item_id" varchar(15) NOT NULL,
	PRIMARY KEY (row_id)
);

CREATE TABLE "customers" (
  "customer_id" int NOT NULL,
  "customer_first_name" varchar(50) NOT NULL,
  "customer_last_name" varchar(50) NOT NULL,
	PRIMARY KEY(customer_id)
);

CREATE TABLE "address" (
  "address_id" int NOT NULL,
  "delivery_address1" varchar(200) NOT NULL,
  "delivery_address2" varchar(200) NOT NULL,
  "delivery_city" varchar(50) NOT NULL,
  "delivery_zipcode" varchar(20) NOT NULL,
	PRIMARY KEY(address_id)
);

CREATE TABLE "item" (
  "item_id" varchar(15) NOT NULL,
  "sku" varchar(50) NOT NULL,
  "item_name" varchar(100) NOT NULL,
  "item_category" varchar(100) NOT NULL,
  "item_size" varchar(20) NOT NULL,
  "item_price" decimal(10,2) NOT NULL,
	PRIMARY KEY(item_id)
);        

CREATE TABLE "recipe" (
  "row_id" int NOT NULL,
  "recipe_id" varchar(50) NOT NULL,
  "ing_id" varchar(15) NOT NULL,
  "quantity" int NOT NULL,
	PRIMARY KEY(row_id)
);

CREATE TABLE "ingredients" (
  "ing_id" varchar(15) NOT NULL,
  "ing_name" varchar(20) NOT NULL,
  "ing_weight" int NOT NULL,
  "ing_measurements" varchar(10) NOT NULL,
  "ing_price" decimal(20,5) NOT NULL,
	PRIMARY KEY(ing_id)
);

CREATE TABLE "inventory" (
  "inv_id" int NOT NULL,
  "item_id" varchar(15) NOT NULL,
  "quantity" int NOT NULL,
	PRIMARY KEY(inv_id)
);

CREATE TABLE "rotations" (
  "row_id" int NOT NULL,
  "rota_id" varchar(15) NOT NULL,
  "date" date NOT NULL,
  "shift_id" varchar(15) NOT NULL,
  "staff_id" varchar(20) NOT NULL,
	PRIMARY KEY(row_id)
);

CREATE TABLE "staff" (
  "staff_id" varchar(20) NOT NULL,
  "first_name" varchar(50) NOT NULL,
  "last_name" varchar(50) NOT NULL,
  "position" varchar(50) NOT NULL,
  "hourly_rate" decimal(5,2) NOT NULL,
	 --PRIMARY KEY(staff_id)
);

CREATE TABLE "shifts" (
  "shift_id" varchar(15) NOT NULL,
  "day_of_week" varchar(10) NOT NULL,
  "start_time" time NOT NULL,
  "end_time" time NOT NULL,
	PRIMARY KEY(shift_id)
);

ALTER TABLE "orders" ADD FOREIGN KEY ("cust_id") REFERENCES "customers" ("customer_id");

ALTER TABLE "orders" ADD FOREIGN KEY ("add_id") REFERENCES "address" ("address_id");

ALTER TABLE "orders" ADD FOREIGN KEY ("item_id") REFERENCES "item" ("item_id");

-- error
ALTER TABLE "recipe" ADD FOREIGN KEY ("recipe_id") REFERENCES "item" ("item_sku");

ALTER TABLE "recipe" ADD FOREIGN KEY ("ing_id") REFERENCES "ingredients" ("ing_id");

-- error
ALTER TABLE "inventory" ADD FOREIGN KEY ("item_id") REFERENCES "recipe" ("ing_id");

-- error
ALTER TABLE "rotations" ADD FOREIGN KEY ("date") REFERENCES "orders" ("created_at");

ALTER TABLE "rotations" ADD FOREIGN KEY ("shift_id") REFERENCES "shifts" ("shift_id");

ALTER TABLE "rotations" ADD FOREIGN KEY ("staff_id") REFERENCES "staff" ("staff_id");


INSERT INTO "public"."shifts" ("shift_id", "day_of_week", "start_time", "end_time") VALUES ('sh0001', 'Monday', to_timestamp('10:30:00', 'HH24:MI:SS'), to_timestamp('14:00:00', 'HH24:MI:SS')),('sh0002', 'Monday', to_timestamp('18:30:00', 'HH24:MI:SS'), to_timestamp('23:00:00', 'HH24:MI:SS')),('sh0003', 'Tuesday', to_timestamp('10:30:00', 'HH24:MI:SS'), to_timestamp('14:00:00', 'HH24:MI:SS')),('sh0004', 'Tuesday', to_timestamp('18:30:00', 'HH24:MI:SS'), to_timestamp('23:00:00', 'HH24:MI:SS')),('sh0005', 'Wednesday', to_timestamp('10:30:00', 'HH24:MI:SS'), to_timestamp('14:00:00', 'HH24:MI:SS')),('sh0006', 'Wednesday', to_timestamp('18:30:00', 'HH24:MI:SS'), to_timestamp('23:00:00', 'HH24:MI:SS')),('sh0007', 'Thursday', to_timestamp('10:30:00', 'HH24:MI:SS'), to_timestamp('14:00:00', 'HH24:MI:SS')),('sh0008', 'Thursday', to_timestamp('18:30:00', 'HH24:MI:SS'), to_timestamp('23:00:00', 'HH24:MI:SS')),('sh0009', 'Friday', to_timestamp('10:30:00', 'HH24:MI:SS'), to_timestamp('14:00:00', 'HH24:MI:SS')),('sh0010', 'Friday', to_timestamp('18:30:00', 'HH24:MI:SS'), to_timestamp('23:00:00', 'HH24:MI:SS')),('sh0011', 'Saturday', to_timestamp('10:30:00', 'HH24:MI:SS'), to_timestamp('14:00:00', 'HH24:MI:SS')),('sh0012', 'Saturday', to_timestamp('18:30:00', 'HH24:MI:SS'), to_timestamp('23:00:00', 'HH24:MI:SS')),('sh0013', 'Sunday', to_timestamp('10:30:00', 'HH24:MI:SS'), to_timestamp('14:00:00', 'HH24:MI:SS')),('sh0014', 'Sunday', to_timestamp('18:30:00', 'HH24:MI:SS'), to_timestamp('23:00:00', 'HH24:MI:SS'))




