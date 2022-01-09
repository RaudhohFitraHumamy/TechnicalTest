CREATE TABLE "FactOrders" (
  "date" date PRIMARY KEY,
  "count_order_id" int,
  "count_product_id" int,
  "total_payment" decimal,
  "count_customer_id" int,
  "quantity" int,
  "order_amount" decimal
);

CREATE TABLE "DimOrder" (
  "order_id" int PRIMARY KEY,
  "order_number" varchar
);

CREATE TABLE "DimOrderList" (
  "order_dtl_id" int PRIMARY KEY,
  "order_id" int,
  "order_product_id" int
);

CREATE TABLE "DimCustomer" (
  "id" int PRIMARY KEY,
  "name" varchar
);

CREATE TABLE "DimPayment" (
  "payment_id" int PRIMARY KEY,
  "payment_number" varchar,
  "payment_date" date,
  "invoice_date" date
);

CREATE TABLE "DimInvoice" (
  "invoice_id" int PRIMARY KEY,
  "invoice_number" varchar,
  "payment_date" date,
  "invoice_date" date
);

CREATE TABLE "DimProduct" (
  "product_id" int PRIMARY KEY,
  "product_name" varchar,
  "product_group_id" int
);

CREATE TABLE "DimProductGroup" (
  "group_id" int PRIMARY KEY,
  "group_name" varchar
);

ALTER TABLE "DimCustomer" ADD FOREIGN KEY ("id") REFERENCES "FactOrders" ("count_customer_id");

ALTER TABLE "DimPayment" ADD FOREIGN KEY ("payment_number") REFERENCES "FactOrders" ("total_payment");

ALTER TABLE "DimOrder" ADD FOREIGN KEY ("order_id") REFERENCES "FactOrders" ("count_order_id");

ALTER TABLE "DimOrderList" ADD FOREIGN KEY ("order_id") REFERENCES "DimOrder" ("order_id");

ALTER TABLE "DimProduct" ADD FOREIGN KEY ("product_id") REFERENCES "DimOrderList" ("order_product_id");

ALTER TABLE "DimProductGroup" ADD FOREIGN KEY ("group_id") REFERENCES "DimProduct" ("product_group_id");
