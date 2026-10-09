# Data Warehouse - The Ultimate Guide | Case Study

## 📌 Project Overview

This project is a hands-on case study completed as part of the [Data Warehouse - The Ultimate Guide](https://www.udemy.com/share/106v7i3@humc71l4vTV0OjGSQwGr4IrfwsKF6KiCoeNZPlou9sO38Kq_0VVL0b4VNBJIZLUfeQ==/) course on Udemy.

The project focuses on building a Data Warehouse using **SQL Server Integration Services (SSIS)**, implementing ETL pipelines, incremental loading, and dimensional modeling to organize data for analytical reporting.

## 🏗️ Data Warehouse Architecture

The project follows a layered architecture consisting of:

- **Staging Layer:** Stores raw source data as it is received, without applying transformations or modifying the original values.
- **Core Layer:** Processes and transforms staged data before loading it into the Data Warehouse.
- **Fact and Dimension Tables:** Organizes the processed data into a dimensional model for analysis and reporting.

## 🗂️ Data Modeling

The project applies **Dimensional Modeling** by organizing data into fact and dimension tables, establishing relationships between sales transactions and descriptive attributes.

### Dimension Tables

- **`dim_product`**: Stores product-related attributes and implements **Slowly Changing Dimension (SCD) Type 1**. When an existing product attribute changes, the old value is overwritten with the new value, without maintaining historical versions of the record.

- **`dim_payments`**: A **Junk Dimension** containing two columns: `payment` and `loyalty_card`. These attributes are combined into a single dimension to simplify the dimensional model.

- **`dim_date`**: A Date Dimension generated dynamically using the minimum and maximum dates available in the source data, covering the required date range for time-based analysis.

### Fact Table

- **`sales`**: Stores sales-related measures and connects to the relevant dimensions, allowing sales analysis by product, payment method, loyalty card status, and date.

## 🔄 ETL Process Using SSIS

The ETL pipeline is implemented using SSIS packages to extract, load, and transform data across the different layers.

### Key ETL Features

- **Raw Data Staging:** Source data is initially loaded into the Staging Layer as raw data, without any transformations or changes.
- **Data Transformation:** Staged data is processed in the Core Layer before being loaded into the target Data Warehouse tables.
- **Incremental Loading:** The ETL process loads only new data during subsequent loads, avoiding unnecessary full reloads of the dataset.
- **SCD Type 1:** Product attribute changes overwrite existing values in `dim_product`, without preserving previous versions.
- **Dynamic Date Dimension:** The `dim_date` table is generated based on the minimum and maximum dates in the source data.
- **Junk Dimension:** The `dim_payments` table combines `payment` and `loyalty_card` into one dimension.

## 🛠️ Technologies Used

- SQL Server Integration Services (SSIS)
- Microsoft SQL Server
- SQL
- ETL and Incremental Loading
- Data Warehousing
- Dimensional Modeling
- Slowly Changing Dimensions (SCD Type 1)
- Junk Dimensions

## 🎯 Key Learning Outcomes

Through this case study, I gained practical experience in:

- Designing a layered Data Warehouse architecture.
- Loading raw data into staging tables before transformation.
- Building ETL pipelines using SSIS.
- Implementing incremental data loading.
- Applying SCD Type 1 to manage product attribute changes.
- Generating a Date Dimension dynamically from source date boundaries.
- Designing fact and dimension tables.
- Implementing a Junk Dimension for payment and loyalty card attributes.

## 📚 Course Information

**Course:** Data Warehouse - The Ultimate Guide

**Platform:** Udemy

🔗 [View the Course on Udemy](https://www.udemy.com/share/106v7i3@humc71l4vTV0OjGSQwGr4IrfwsKF6KiCoeNZPlou9sO38Kq_0VVL0b4VNBJIZLUfeQ==/)

*This repository represents the practical application of Data Warehousing and ETL concepts learned throughout the course.*

