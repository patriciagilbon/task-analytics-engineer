# Analytics Engineer Task
Hello! :smiley:	
Please find all the implementation details below.

## Project Overview
This project implements a data transformation pipeline using dbt (Data Build Tool) that processes Globepay transactionss and creates analytical models for reporting.


## Table of Contents

1. [How to Run the Project](#how-to-run-the-project)
2. [Project Structure](#project-structure)
3. [Preliminary Data Exploration](#preliminary-data-exploration)
4. [Model Architecture and Lineage](#model-architecture-and-lineage)
5. [Key Features of the Project](#key-features-of-the-project)
6. [Documentation](#documentation)
7. [Testing](#testing)
8. [Macros](#macros)
9. [Future Enhancements](#future-enhancements)
10. [Assumptions](#assumptions)
11. [Challenges and Learnings](#challenges-and-learnings)


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
- `utilities`: Contains table that can serve other joins and aggregations.

| tables       | prefix |
| ------------ | ------ |
| staging      | stg    |
| intermediate | int    |

## 3. Preliminary Data Exploration

## 4. Model Architecture and Lineage

## 5. Key Features of the Project
### Packages Used
1. [Constraints Package](https://hub.getdbt.com/Snowflake-Labs/dbt_constraints/latest/) - to validate the uniqueness of primary keys, ensure foreign key constraints or unique keys. This has been applied to all the models.
2. [Meta Testing Package](https://hub.getdbt.com/tnightengale/dbt_meta_testing/latest/) - to validate documentation coverage, enforcing all models and fields are properly documented. To test run `dbt run-operation required_docs`

### SQLFluff for Linting
Following [dbt's recommendation](https://docs.getdbt.com/best-practices/how-we-style/2-how-we-style-our-sql), the project uses SQLFluff for linting. This should ensure readability and maintainability. All the rules are defined [here](https://docs.sqlfluff.com/en/stable/reference/rules.html). 
- To run this use the following command in the terminal `sqlfluff lint models`
- It is also possible to fix the errors by running `sqlfluff fix models`

### Style in dbt models
- The filed name `id` has been prefixed by what it is identifying (eg. id as ref_id)
- The `as` operator is used when aliasing a column or table
- When joining tables and referencing columns from both, prefer to reference the full table name 
- It is using table aliases in join conditions and not using initialisms (eg. “chargebacks” instead of "c”)
- Timestamps end with `_at`
- Dates end with `_date`
- Booleans are prefixed with `is_` or `has_`.

## 6. Documentation
### Jinja for Documentation Blocks
The project leverages Jinja with the creation of [documentation blocks](https://docs.getdbt.com/docs/build/documentation#using-docs-blocks) in the `.md` file extension of the models. These blocks provide a centralized way to define and manage documentation for models, columns, and their context. The documentation is referenced in the `.yml` files, ensuring consistency and maintainability.

#### Documentation Definition Workflow
- The documentation for a column is defined in the first model where the column appears (usually in the staging layer).
- The column descriptions are inherited throughout the transformation process, avoiding duplication and maintaining clarity.

#### About docs commands
We can visualize the documentation with two different commands: `dbt docs serve` & `dbt docs generate`
1. `dbt docs serve`: This command starts a webserver on port 8080 to serve your documentation locally and opens the documentation site in your default browser.

<img src="images/dbt_docs_serve.png" alt="Lineage graph for chargebacks model" width="600" height="400">

2. `dbt docs generate`: Produce the catalog.json file, which contains metadata about the tables and views produced by the models. This can be used on different data catalog tools.

## 7. Testing

## 8. Macros
The project includes the `convert_to_usd` macro, which converts an amount to USD. By centralizing this logic, we ensure consistency and avoid code duplication across models.

## 9. Future Enhancements
1. **Alerting**
- Freshness is currently not defined in the source configuration since the pipeline is connected to a CSV file in Snowflake, rather than a live database integration. Once a direct database connection is established, freshness checks can be added to the globepay/_globepay_sources.yml file.
- Freshness checks can be integrated with tools like Slack to send automated warnings if a table fails to meet freshness criteria. This proactive approach helps the team identify and troubleshoot issues in the data pipelines before they impact downstream processes.

2. **Materialization**
- For now there is only one mart in the project. When more marts start to be created it would be a good time to use `incremental` models to reduce build time and prevent `dbt run` to become too slow.

3. **CI/CD**
- Once connected to a production environment a continuous integration (CI) workflow needs to be implemented. This will run a series of checks before allowing the merge to production. From the existing implementation the checks that could be added to the CI jobs are:
- `sqlfluff lint models`
- `dbt build --select state:modified+`
- `dbt test`
- `dbt run-operation required_docs`
We can also add after freshness has been implemented:
- `dbt source freshness` 

## 10. Assumptions
- Given this data is related to transactions and changeback, I assumed that the primary stakeholders would be the Finance team. As a result, I placed this mart within the Finance folder. However, it could also be relevant to other teams, depending on organizational needs.

## 11. Challenges and Learnings