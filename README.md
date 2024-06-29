## Development of a Cloud-Based Health Monitoring Dashboard Using Microsoft Power BI
## Development of a Cloudbased Dashboard
## Overview
This project is all about creating an highly scalable interactive dashboard for monitoring patient health conditions  and management of the database using a `Lung Cancer` dataset for its visualisation. The idea is to show how health organisation can manage vast amount of dataset in a secure and scalable manner, while maintaining adequate projection of Patients informtion.
## Introduction
Over the years, the healthcare sector has increasingly relied on information technology to enhance services and performance. Integrating information systems has significantly improved operational efficiency, service effectiveness, and care quality. Business intelligence (BI) tools and analytics are important tools, converting data into valuable insights for better decision-making. Dashboards is useed to as a key BI component, visualize critical metrics and key performance indicators (KPIs), aiding healthcare professionals in quicker diagnoses and patient engagement. This project explores the development and application of such dashboards, highlighting their benefits and uses in healthcare, particularly for performance monitoring and health condition tracking
## Peculiarity of the Project
Several past researchers have developed dashboards for monitoring health systems. However,this study has developed this dfashboard within the Amazon Web Services (AWS) management console. These resources where provisioned in the AWS console using Terraform which is an infrastructure as a code which is owned by HashiCorps.
## Overview to Terraform
The project improves cloud infrastructure provisioning and management using Terraform for a health monitoring dashboard. Traditional manual setup via the AWS console is inefficient for dynamic, frequently updated healthcare dashboards. Terraform, as Infrastructure as Code (IaC), automates and streamlines this process, ensuring consistent deployment and management of AWS resources like VPCs, subnets, and security groups. The approach involves writing configuration files, initializing the system, planning, and applying the setup, which facilitates scalable, repeatable, and error-free deployments. This method also supports code validation, testing, and documentation, enhancing efficiency and stability in managing healthcare data systems. 
[Terraform System](https://raw.githubusercontent.com/balqis91/Development-of-a-Cloud-Based-Health-Monitoring-Dashboard-Using-Microsoft-Power-BI-/a4cd2682bad672a3010799e318ae2cffffa891e9/Terraform%20Image.avif)
## Project Objectives
*The project objectives are outlined as follows*:

- *Develop a framework for efficiently designing a cloud-based dashboard using AWS resources and Power BI*
- *Utilize a data query script using SQL and configuration codes for effective data manipulation and implementation*.
- *Perform the Extract, Transform, and Load (ETL) process effectively*.
- *Deploy the database into the cloud programmatically*.
- *Implement a system for creating visualizations and interactive reports using Power BI*.
- *Test, evaluate, and validate the dashboard's performance against the existing system*​
## Implementation
Terraform script was used to provision several AWS Resourcess such as EC2, S3 Bucket, RDS etc. Microsoft SSMS was used for the database management and Power BI for Visualisation. 
[The Cloud Architeral Design](https://github.com/balqis91/Development-of-a-Cloud-Based-Health-Monitoring-Dashboard-Using-Microsoft-Power-BI-/blob/main/Cloud%20Architecture%20Design.png)
## The Data Modelling
After the successful deployment of the AWS resources and integration of the with the Database which is SQL server management studio, the Kpis spoecified in the Lung Cancer disease was used as a guideline for modelling and querying the dataset in the SSMS before the dashboard was created in the cloud. Access to the database was only granted to the database admisnistor in other to prevent unauthorised access from gaining access to the organisation database.
[Database Modelling](https://github.com/balqis91/Development-of-a-Cloud-Based-Health-Monitoring-Dashboard-Using-Microsoft-Power-BI-/blob/main/Modelling%20of%20the%20Lung%20Cancer%20Database.png)
## Dashboard Design
After successful Modelling of the Dataset, the data was import into Power Query for cleaning and transformation, before the dashnoard was finally designed. 

[This is the link to the final dashboard created using the AWS resources after all the three Terraform syntax has been carried out](https://app.powerbi.com/view?
r=eyJrIjoiMDI3Y2MwNmQtZWIyMC00YTAwLWJmOTYtMzQyMTU0OTFiOTE2IiwidCI6IjI1ZWI2OTYzLTRlYmEtNGUzOC1hODM2LWVjZTgyNjlkOGQyMyJ9

)
