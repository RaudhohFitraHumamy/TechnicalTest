CREATE TABLE "FactMarket" (
  "date" date PRIMARY KEY,
  "location_id" int,
  "jenis_campaign" varchar,
  "count_registrant" int
);

CREATE TABLE "DimCampaign" (
  "jns_campaign_id" int PRIMARY KEY,
  "campaign_desc" varchar
);

CREATE TABLE "FactOrder" (
  "date" date PRIMARY KEY,
  "lokasi_id" int,
  "jenis_budidaya_id" int,
  "jml_customer" int,
  "jml_product" int,
  "jml_order" int,
  "jml_invoice" int,
  "total_sales" decimal
);

CREATE TABLE "DimInvoice" (
  "invoice_number" varchar PRIMARY KEY,
  "invoice_date" date,
  "payment_date" date
);

CREATE TABLE "DimDate" (
  "date" date PRIMARY KEY,
  "month" date,
  "year" date
);

CREATE TABLE "DimLocation" (
  "location_id" int PRIMARY KEY,
  "kabupaten_kota" varchar,
  "provinsi" varchar
);

CREATE TABLE "DimJenisBudidaya" (
  "budidaya_id" int PRIMARY KEY,
  "jenis_desc" varchar
);

CREATE TABLE "Dimcustomer" (
  "customer_id" int PRIMARY KEY,
  "customer_name" varchar,
  "customer_kabkota" varchar,
  "customer_provinsi" varchar
);

CREATE TABLE "DimProduct" (
  "product_id" int PRIMARY KEY,
  "product_name" varchar,
  "product_desc" varchar
);

CREATE TABLE "DimOrder" (
  "order_id" int PRIMARY KEY,
  "order_date" date,
  "total_sales" decimal
);

ALTER TABLE "FactOrder" ADD FOREIGN KEY ("date") REFERENCES "FactMarket" ("date");

ALTER TABLE "DimLocation" ADD FOREIGN KEY ("location_id") REFERENCES "FactMarket" ("location_id");

ALTER TABLE "DimCampaign" ADD FOREIGN KEY ("jns_campaign_id") REFERENCES "FactMarket" ("jenis_campaign");

ALTER TABLE "DimDate" ADD FOREIGN KEY ("date") REFERENCES "FactOrder" ("date");

ALTER TABLE "DimLocation" ADD FOREIGN KEY ("location_id") REFERENCES "FactOrder" ("lokasi_id");

ALTER TABLE "DimJenisBudidaya" ADD FOREIGN KEY ("budidaya_id") REFERENCES "FactOrder" ("jenis_budidaya_id");

ALTER TABLE "DimInvoice" ADD FOREIGN KEY ("invoice_number") REFERENCES "FactOrder" ("jml_invoice");

ALTER TABLE "Dimcustomer" ADD FOREIGN KEY ("customer_id") REFERENCES "FactOrder" ("jml_customer");

ALTER TABLE "DimProduct" ADD FOREIGN KEY ("product_id") REFERENCES "FactOrder" ("jml_product");

ALTER TABLE "DimOrder" ADD FOREIGN KEY ("order_id") REFERENCES "FactOrder" ("jml_order");

ALTER TABLE "Dimcustomer" ADD FOREIGN KEY ("customer_id") REFERENCES "FactMarket" ("count_registrant");
