# Terraform Boilerplate

This project is a boilerplate that integrates a Java (Spring Boot) application with infrastructure as code using Terraform.

## Overview

- **Backend:** Java 17+ with Spring Boot
- **Infrastructure:** Terraform (`infraestructure/` folder)
- **Dependency Management:** Maven
- **Containerization:** Dockerfile included

## Project Structure

```
├── Dockerfile                  # Application containerization
├── infraestructure/            # Terraform files for infrastructure
│   └── main.tf
├── src/
│   ├── main/
│   │   ├── java/caioneves05/terraform_boilerplate/app/  # Java source code
│   │   │   ├── TerraformBoilerplateApplication.java
│   │   │   └── controller/ApiController.java
│   │   │   └── dtos/TimestampResponse.java
│   │   └── resources/           # Configurations and static resources
│   │       ├── application.properties
│   │       ├── static/
│   │       └── templates/
│   └── test/java/caioneves05/terraform_boilerplate/     # Automated tests
│       └── TerraformBoilerplateApplicationTests.java
├── pom.xml                     # Maven configuration
├── LICENSE
├── HELP.md
└── readme.md                   # This file
```

## Prerequisites

- Java 17+
- Maven 3.8+
- Docker (optional)
- Terraform 1.0+

## How to Run the Application

1. **Build:**
   ```sh
   ./mvnw clean package
   ```
2. **Run:**
   ```sh
   java -jar target/terraform-boilerplate-0.0.1-SNAPSHOT.jar
   ```
3. **Via Docker:**
   ```sh
   docker build -t terraform-boilerplate .
   docker run -p 8080:8080 terraform-boilerplate
   ```

## How to Run the Tests

```sh
./mvnw test
```

## Infrastructure with Terraform

1. Go to the `infraestructure/` folder:
   ```sh
   cd infraestructure
   ```
2. Initialize Terraform:
   ```sh
   terraform init
   ```
3. Preview the execution plan:
   ```sh
   terraform plan
   ```
4. Apply the infrastructure:
   ```sh
   terraform apply
   ```

> **Attention:** Review the Terraform files before applying them in production.

## License

See the [LICENSE](LICENSE) file for more details.
