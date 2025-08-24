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

## Best Practices for AWS Credentials with Terraform

**Do not hardcode the `profile` parameter in the Terraform provider block.**

Hardcoding the AWS profile in your Terraform configuration can reduce portability and flexibility, especially in collaborative or automated environments. Instead, prefer the following approaches:

### 1. Use Environment Variables
Set the AWS profile before running Terraform:
```sh
export AWS_PROFILE=your-sso-profile
```
This allows Terraform to use the correct credentials without changing the code.

### 2. Use SSO with AWS CLI
If you use AWS SSO, authenticate with:
```sh
aws sso login --profile your-sso-profile
```
Then, set the profile as shown above.

### 3. (Optional) Use a Terraform Variable for the Profile
For advanced use, you can define a variable in your Terraform code:
```hcl
variable "aws_profile" {
  type        = string
  default     = null
  description = "AWS CLI profile to use."
}

provider "aws" {
  region  = "us-east-2"
  profile = var.aws_profile
}
```
And run:
```sh
terraform plan -var="aws_profile=your-sso-profile"
```

**Summary:**
- Avoid hardcoding the profile in the provider block.
- Prefer environment variables or variables in Terraform for flexibility and security.
- This makes your code more portable and CI/CD friendly.

## License

See the [LICENSE](LICENSE) file for more details.
