# ImburseAPI
## Table of contents
* [General info](#general-info)
* [Technologies](#technologies)
* [Scenario Outline](#scenario-outline)
* [Setup](#setup)
* [Execution](#execution)
* [Report](#report)

## General info
This is Imburse Rest API automation Test project to create automation tests against Order and Instruction management REST API.
	
## Technologies
Project is created with:
* Java RestAssure
* Maven
* BDD Framework

## Scenario-outline
* Order Creation Specification
 ```
 Cover Valid and Invalid scenarios
 ``` 
* Instruction Creation Specification
 ``` 
Cover Valid and Invalid scenarios
 ``` 
## Setup
To run this project, make sure Java and Maven should Installed and Java_Home and M2_Home system environment variable must be set in classpath

## Execution
download the project or clone the project
Open project directory in command prompt and run below command
```
$ mvn clean install
```
## Report
Open index.html in /target/cucumber-reports folders
