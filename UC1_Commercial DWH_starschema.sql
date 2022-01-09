CREATE TABLE "FactOrders" (
  "date" date PRIMARY KEY,
  "count_order_id" int,
  "count_product_id" int,
  "total_payment" decimal,
  "count_customer_id" int,
  "quantity" int,
  "order_amount" decimal
);

CREATE TABLE "DimCustomer" (
  "id" int PRIMARY KEY,
  "name" varchar
);

CREATE TABLE "DimPayment" (
  "payment_number" varchar PRIMARY KEY,
  "invoice_number" varchar,
  "payment_date" date,
  "invoice_date" date
);

CREATE TABLE "DimProduct" (
  "product_id" int PRIMARY KEY,
  "product_name" varchar
);

ALTER TABLE "DimProduct" ADD FOREIGN KEY ("product_id") REFERENCES "FactOrders" ("count_product_id");

ALTER TABLE "DimCustomer" ADD FOREIGN KEY ("id") REFERENCES "FactOrders" ("count_customer_id");

ALTER TABLE "DimPayment" ADD FOREIGN KEY ("payment_number") REFERENCES "FactOrders" ("total_payment");
