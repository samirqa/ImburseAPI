# ImburseAPI
## Table of contents
* [General info](#general-info)
* [Technologies](#technologies)
* [Scenario Outline](#scenario-outline)
* [Setup](#setup)
* [Execution](#execution)
* [Report](#report)

## General info
This is Imburse Rest API automation Test project to create automation tests against our Order and Instruction management REST API.
	
## Technologies
Project is created with:
* Java RestAsure
* Maven
* BDD Framework

## Scenario-outline
Order Creation Specification
•	Order reference, which is mandatory
•	Order reference can contain the following characters:
o	alphanumeric character (a-zA-Z)
o	. (dot)
o	- (dash)
o	_ (underscore)
•	Order reference cannot be longer than 50 characters
•	Order reference must be unique and cannot be reused
•	Order metadata is a dictionary that:
o	Key can be any string character - but limited to 100 characters
o	Value can be any string character - but limited to 100 characters
o	Cannot have duplicate keys
o	Cannot have a null value for a key

Instruction Creation Specification

An Instruction tells the platform to either Credit or Debit, and will contain the following fields:
•	Instruction Reference, which is mandatory
•	Instruction reference can contain the following characters:
o	alphanumeric character (a-zA-Z)
o	. (dot)
o	- (dash)
o	_ (underscore)
•	Instruction reference cannot be longer than 50 characters
•	Customer reference is mandatory
•	Customer reference can contain the following characters:
o	alphanumeric character (a-zA-Z)
o	. (dot)
o	- (dash)
o	_ (underscore)
•	Customer reference cannot be longer than 50 characters
•	Amount should be formatted as a valid money value that is positive and only 2 decimal places e.g. 6.99.
•	Currency is mandatory and must match the ISO 4217 currency alphabetic code or numeric code e.g. United Kingdom would be GBP or 826. See below which currency to use.
•	Country is mandatory and must match the ISO 3166 Alpha 2 only alphabetic code e.g. United Kingdom would be GB. See below what country to use.
•	“Settle By Date” must conform to the following date format: “yyyy-MM-dd”. 
•	Direction is mandatory and should only be “DEBIT” - case sensitive
•	Scheme ID must be valid and exists (use supplied value below)
	
## Setup
To run this project, make sure Java and Maven should Installed and Java_Home and M2_Home system environment variable must be set in classpath

## Execution
download the project or clone the project
Open project directory in command prompt and run below command
```
$ mvn clean install

## Report
Open index.html in /target/cucumber-reports folders
