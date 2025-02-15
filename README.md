# Simple Insurance Database

This project is a straightforward and simple database designed for managing data related to an insurance company. It is built using PostgreSQL and includes basic tables for handling branches, clients, agents, insurance types, and contracts. The database is designed to ensure data integrity through constraints, foreign keys, and validation rules.

## Database Schema
The database consists of the following tables:

- branches: Stores information about company branches.
- clients: Contains details about clients, including personal information.
- agents: Stores information about insurance agents and their associated branches.
- insurance_types: Lists the types of insurance offered by the company.
- contracts: Tracks insurance contracts, linking clients, agents, branches, and insurance types.


## How to Use

1. **Set Up the Database**:
    - Run create_tables.sql to create the tables and define their structure.
    - Use insert_tables.sql to populate the tables with sample data.

1. **Check Data Integrity**:
    - Execute check_bd.sql to validate the data and identify inconsistencies or errors.

1. **Explore the Data**:
    - Use select_tables.sql to view the contents of all tables.
    - Run scheme_connections.sql to see how the tables are connected through foreign keys.

1. **Clean Up**:
    - If needed, use delete_tables.sql to drop all tables and start over.