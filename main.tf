terraform {
  required_providers {
    snowflake = {
      source  = "chanzuckerberg/snowflake"
      version = "0.25.17"
    }
  }

  backend "remote" {
    organization = "mike-smyth"

    workspaces {
      name = "gh-actions-demo"
    }
  }
}

provider "snowflake" {
}

resource "snowflake_database" "demo_db" {
  name    = "DEMO_DB"
  comment = "Database for Snowflake Terraform demo"
}

resource "snowflake_schema" "demo_schema" {
  database = snowflake_database.demo_db.name
  name     = "DEMO_SCHEMA"
  comment  = "Schema for Snowflake Terraform demo"
}

resource "snowflake_database" "mike_db" {
  name    = "MIKE_DB"
  comment = "Database for Snowflake Terraform demo"
}

resource "snowflake_schema" "mike_schema" {
  database = snowflake_database.demo_db.name
  name     = "MIKE_SCHEMA"
  comment  = "Schema for Snowflake Terraform demo"
}