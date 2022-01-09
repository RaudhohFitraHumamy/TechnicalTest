CREATE TABLE "Products" (
  "id" SERIAL PRIMARY KEY,
  "product_code" varchar,
  "name" varchar,
  "product_desc" varchar,
  "unitprice" decimal
);

CREATE TABLE "customers" (
  "id" SERIAL PRIMARY KEY,
  "name" varchar NOT NULL
);

CREATE TABLE "orders" (
  "id" SERIAL PRIMARY KEY,
  "order_number" varchar NOT NULL,
  "customer_id" int,
  "date" date
);

CREATE TABLE "order_lines" (
  "order_line_id" SERIAL PRIMARY KEY,
  "order_id" int,
  "product_id" int,
  "quantity" int,
  "usd_amount" decimal
);

CREATE TABLE "payment" (
  "payment_id" SERIAL PRIMARY KEY,
  "invoice_number" varchar NOT NULL,
  "order_id" int,
  "invoice_date" date,
  "payment_date" date
);

ALTER TABLE "orders" ADD FOREIGN KEY ("customer_id") REFERENCES "customers" ("id");

ALTER TABLE "order_lines" ADD FOREIGN KEY ("product_id") REFERENCES "Products" ("id");

ALTER TABLE "order_lines" ADD FOREIGN KEY ("order_id") REFERENCES "orders" ("id");

ALTER TABLE "payment" ADD FOREIGN KEY ("order_id") REFERENCES "orders" ("id");

CREATE INDEX "product_code" ON "Products" ("product_code");

CREATE UNIQUE INDEX ON "Products" ("id");

CREATE INDEX "order_number" ON "orders" ("order_number");

CREATE UNIQUE INDEX ON "orders" ("id");

CREATE INDEX "invoice" ON "payment" ("invoice_number");

CREATE UNIQUE INDEX ON "payment" ("payment_id");
