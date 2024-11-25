# Analytics Engineer Task
Hello! :smiley:	
Please find all the implementation details below.

## Project Overview
This project implements a data transformation pipeline using dbt (Data Build Tool) that processes Globepay transactions and creates analytical models for reporting.


## Table of Contents

1. [How to Run the Project](#how-to-run-the-project)
2. [Project Structure](#project-structure)
3. [Mart for Analysis](#mart-for-analysis)
4. [Key Features](#key-features)
5. [Assumptions](#assumptions)
6. [Challenges and Learnings](#challenges-and-learnings)
7. [Testing](#testing)
8. [Future Enhancements](#future-enhancements)


## 1. How to Run the Project
#### Prerequisites
You need to have python installed. 
Please verify it using the following commands:
```
python3 --version # For Mac/Linux
python --version # For Windows
```
If it is not installed:
- *Mac*: You can install Python via [Homebrew](https://brew.sh/) or use the built-in version of Python 3.
```
brew install python
```
- *Linux*: Python is likely already installed on most Linux distributions.
To install or update it:
```
sudo apt update
sudo apt install python3 python3-pip
```

Once Python is installed:
1. Navigate to the project path.
2. Run the following command to create a virtual environment (here it's called dbt-env):
```
python3 -m venv dbt-env # For Mac/Linux
python -m venv dbt-env # For Windows
```
3. Activate the virtual environment.
```
source dbt-env/bin/activate # For Mac/Linux
.\dbt-env\Scripts\activate # For Windows
```
4. Install the required packages.
```
pip install -r requirements.txt
```
5. Finally, use dbt debug command to test the connection. 

## 2. Project Structure
The structure of the project is based on the following
[dbt recommendation](https://docs.getdbt.com/best-practices/how-we-structure/1-guide-overview)
- `staging`: Contains a view from the raw data. Making only renaming if necessary or conversion to the correct datatype.
- `intermediate`: Contains working tables that remove complexity to the marts. They are not supposed to be requested. Materialized as ephemeral.
- `mart`: Contain the data to support a business unit. Materialized as tables.
- `utils`: Contains table that can serve other joins and aggregations.

| tables       | prefix |
| ------------ | ------ |
| staging      | stg    |
| intermediate | int    |

## 3. Mart for Analysis

## 4. Key Features
### Packages Used
1. [Constraints Package](https://hub.getdbt.com/Snowflake-Labs/dbt_constraints/latest/) - to validate the uniqueness of primary keys and ensure foreign key constraints. This has been applied to all the models.

### SQLFluff for Linting
Following [dbt's recommendation](https://docs.getdbt.com/best-practices/how-we-style/2-how-we-style-our-sql), the project uses SQLFluff for linting. This should ensure readability and maintainability. All the rules are defined [here](https://docs.sqlfluff.com/en/stable/reference/rules.html). 
- To run this use the following command in the terminal `sqlfluff lint models`
- It is also possible to fix the errors by running `sqlfluff fix models`

### Style in dbt models
- The filed name `id` has been prefixed by what it is identifying (eg. id as ref_id)
- The `as` operator is used when aliasing a column or table
- When joining tables and referencing columns from both, prefer to reference the full table name 
- It is using table aliases in join conditions and not using initialisms (eg. “chargeback” instead of "c”)
- Timestamps end with `_at`
- Dates end with `_date`
- Booleans are prefixed with `is_` or `has_`.

### Jinja for Documentation Blocks
The project leverages Jinja with the creation of [documentation blocks](https://docs.getdbt.com/docs/build/documentation#using-docs-blocks) in the `.md` file extension of the models. These are referenced in the schema.yml file. 
The documentation is defined in the first model the columns appear in loading order, only definying it one time.

## 5. Assumptions

## 6. Challenges and Learnings

## 7. Testing

## 8. Future Enhancements