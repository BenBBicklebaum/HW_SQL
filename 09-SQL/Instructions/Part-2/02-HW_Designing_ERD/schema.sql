-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


-- Logical ERD
CREATE TABLE "Gym" (
    "ID" INTEGER   NOT NULL,
    "Gym_Name" VARCHAR   NOT NULL,
    "Address" VARCHAR   NOT NULL,
    "City" VARCHAR   NOT NULL,
    "Zipcode" VARCHAR   NOT NULL,
    CONSTRAINT "pk_Gym" PRIMARY KEY (
        "ID"
     )
);

CREATE TABLE "Trainers" (
    "ID" INTEGER   NOT NULL,
    "First_Name" VARCHAR   NOT NULL,
    "Last_Name" VARCHAR   NOT NULL,
    "Member_id" INT   NOT NULL,
    "Gym_ID" INT   NOT NULL,
    CONSTRAINT "pk_Trainers" PRIMARY KEY (
        "ID"
     )
);

CREATE TABLE "Members" (
    "ID" INTEGER   NOT NULL,
    "First_Name" VARCHAR   NOT NULL,
    "Last_Name" VARCHAR   NOT NULL,
    "Address" VARCHAR   NOT NULL,
    "City" VARCHAR   NOT NULL,
    "Payment_Info" INT   NOT NULL,
    "Gym_ID" INT   NOT NULL,
    "Trainer_ID" INT   NOT NULL,
    CONSTRAINT "pk_Members" PRIMARY KEY (
        "ID"
     )
);

CREATE TABLE "Payments" (
    "ID" INTEGER   NOT NULL,
    "CreditCard_Info" INTEGER   NOT NULL,
    "Billing_Zip" INTEGER   NOT NULL,
    "Member_id" INT   NOT NULL,
    CONSTRAINT "pk_Payments" PRIMARY KEY (
        "ID"
     )
);

ALTER TABLE "Trainers" ADD CONSTRAINT "fk_Trainers_Member_id" FOREIGN KEY("Member_id")
REFERENCES "Members" ("ID");

ALTER TABLE "Trainers" ADD CONSTRAINT "fk_Trainers_Gym_ID" FOREIGN KEY("Gym_ID")
REFERENCES "Gym" ("ID");

ALTER TABLE "Members" ADD CONSTRAINT "fk_Members_Payment_Info" FOREIGN KEY("Payment_Info")
REFERENCES "Payments" ("ID");

ALTER TABLE "Members" ADD CONSTRAINT "fk_Members_Gym_ID" FOREIGN KEY("Gym_ID")
REFERENCES "Gym" ("ID");

ALTER TABLE "Members" ADD CONSTRAINT "fk_Members_Trainer_ID" FOREIGN KEY("Trainer_ID")
REFERENCES "Trainers" ("ID");

ALTER TABLE "Payments" ADD CONSTRAINT "fk_Payments_Member_id" FOREIGN KEY("Member_id")
REFERENCES "Members" ("ID");

