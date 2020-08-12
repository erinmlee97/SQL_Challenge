-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


-- Physical Model
CREATE TABLE "Departments" (
    "dept_id" INT   NOT NULL,
    "dept_no" VARCHAR(10)   NOT NULL,
    "dept_name" VARCHAR(25)   NOT NULL,
    CONSTRAINT "pk_Departments" PRIMARY KEY (
        "dept_id"
     )
);

CREATE TABLE "Department_Employee" (
    "empo_no" INT   NOT NULL,
    "dept_no" VARCHAR(10)   NOT NULL,
    CONSTRAINT "pk_Department_Employee" PRIMARY KEY (
        "empo_no"
     )
);

CREATE TABLE "Department_Manager" (
    "empo_no" INT   NOT NULL,
    "dept_no" VARCHAR(10)   NOT NULL,
    CONSTRAINT "pk_Department_Manager" PRIMARY KEY (
        "empo_no"
     )
);

CREATE TABLE "Employees" (
    "empo_no" INT   NOT NULL,
    "empo_title_id" VARCHAR(10)   NOT NULL,
    "birth_date" VARCHAR(12)   NOT NULL,
    "first_name" VARCHAR(20)   NOT NULL,
    "last_name" VARCHAR(20)   NOT NULL,
    "sex" VARCHAR(10)   NOT NULL,
    "hire_date" VARCHAR(12)   NOT NULL,
    CONSTRAINT "pk_Employees" PRIMARY KEY (
        "empo_no"
     )
);

CREATE TABLE "Salaries" (
    "empo_no" INT   NOT NULL,
    "salary" INT   NOT NULL,
    CONSTRAINT "pk_Salaries" PRIMARY KEY (
        "empo_no"
     )
);

CREATE TABLE "Titles" (
    "title_id" VARCHAR(10)   NOT NULL,
    "title" VARCHAR(30)   NOT NULL,
    CONSTRAINT "pk_Titles" PRIMARY KEY (
        "title_id"
     )
);

ALTER TABLE "Department_Employee" ADD CONSTRAINT "fk_Department_Employee_empo_no" FOREIGN KEY("empo_no")
REFERENCES "Employees" ("empo_no");

ALTER TABLE "Department_Employee" ADD CONSTRAINT "fk_Department_Employee_dept_no" FOREIGN KEY("dept_no")
REFERENCES "Departments" ("dept_no");

ALTER TABLE "Department_Manager" ADD CONSTRAINT "fk_Department_Manager_empo_no" FOREIGN KEY("empo_no")
REFERENCES "Employees" ("empo_no");

ALTER TABLE "Department_Manager" ADD CONSTRAINT "fk_Department_Manager_dept_no" FOREIGN KEY("dept_no")
REFERENCES "Departments" ("dept_no");

ALTER TABLE "Employees" ADD CONSTRAINT "fk_Employees_empo_title_id" FOREIGN KEY("empo_title_id")
REFERENCES "Titles" ("title_id");

ALTER TABLE "Salaries" ADD CONSTRAINT "fk_Salaries_empo_no" FOREIGN KEY("empo_no")
REFERENCES "Employees" ("empo_no");

