# Gol-Gappay-SMS
Gol-Gappay Stall Management System (SQL) || COMP-213 (Database and SQL)

## Introduction

The **Gol-Gappay Stall Management System** is a database-driven application designed to efficiently manage various aspects of a gol-gappay (pani puri) stall business. It covers stall operations, employee management, inventory, transportation logistics, location scheduling, and financial tracking.

This system is built using **Python (Tkinter for GUI)** and **SQLite3** for the database, ensuring a lightweight and easily deployable solution.

---

## Features

### 1. **Stall Management**
   - Tracks stall locations, timings, and assignments.
   - Ensures stalls are well-maintained and appropriately stocked.
   - Manages stall seating and packaging options.

### 2. **Employee Management**
   - Manages employee details, including:
     - Employee ID
     - First & Last Name
     - Health Certificate Status
     - Job Role (Manager, Stall Manager, Driver, etc.)
   - Allows adding, updating, viewing, and deleting employees.

### 3. **Stock & Warehouse Management**
   - Keeps track of inventory stored in warehouses.
   - Ensures timely restocking and safe storage of ingredients.

### 4. **Transport & Delivery System**
   - Manages delivery vehicles, including:
     - Vehicle ID
     - License Plate
     - Fuel Capacity
     - Vehicle Type (Bike or Van)
   - Ensures efficient stock transportation.

### 5. **Furniture & Utensils Management**
   - Maintains information about furniture and utensils at each stall.
   - Tracks cleanliness, availability, and setup.

### 6. **Sales & Financial Management**
   - Keeps records of transactions, expenses, and revenue.
   - Helps monitor profit/loss margins.

---

## System Requirements

### **Software Requirements**
- Python 3.x
- SQLite3
- Required Python Libraries:
  - `tkinter`
  - `sqlite3`
  - `PIL` (for image handling)

### **Hardware Requirements**
- Minimum 4GB RAM
- 100MB of disk space
- Any standard Windows/Linux/macOS machine

---

## Database Schema

The system includes multiple relational tables:

### **Entity Tables**
| Table Name     | Primary Key | Other Fields |
|---------------|------------|--------------|
| Employee      | Emp_ID     | First_Name, Last_Name, Health_Cert, E_type |
| Stall        | Stall_ID    | Start_Time, End_Time |
| Locations    | Stall_ID    | Location (Street) |
| Furniture    | Furn_ID     | Lights, Colors, Banners, Cleaning Equip, Chairs, Tables, Spoons, Plates, Glass, Bowls |
| Warehouse    | WH_ID       | City, Street, Postal Code |
| Vehicles     | Vehicle_ID  | License Plate, Fuel Capacity, Type |

### **Relationship Tables**
| Relation Name        | Primary Key | Foreign Keys |
|----------------------|------------|--------------|
| Employee_Manages_Stall | Emp_ID, Stall_ID | Employee ID, Stall ID |
| Employee_Pays_Employee | Emp_ID | Salary, Type |
| Food_Sales_Expenses | Order_No | Profit/Loss |
| Employee_Serves_Food | Emp_ID, Order_No | Employee ID, Order Details |
| Warehouse_Stores_Food | WH_ID, Order_No | Warehouse ID, Order Number |
| Warehouse_Delivers_Vehicles | WH_ID, Vehicle_ID | Employee ID, Vehicle ID |

---

## Installation & Setup

### **Step 1: Install Python and Dependencies**
Ensure Python 3.x is installed, then install dependencies:

```bash
pip install pillow
```

### **Step 2: Clone or Download the Project**
```bash
git clone https://github.com/your-repo/stall-management-system.git
cd stall-management-system
```

### **Step 3: Run the Application**
```bash
python main.py
```

---

## How to Use

1. **Employee Management**
   - Add new employees using the "Add Employee" button.
   - View existing employees using "View Employees."
   - Update employee records using "Update Employee."
   - Remove employees with "Delete Employee."

2. **Stall Management**
   - Stalls are predefined in the database.
   - Their operating hours and locations are stored.

3. **Warehouse & Stock Management**
   - The database maintains stock availability.
   - Transport vehicles are assigned for deliveries.

4. **Viewing Records**
   - A GUI window displays all stored records in a tabular format.

---

## Transactions & Queries

### **Example Queries**
- Get all employees who are stall managers and have a health certificate:
  ```sql
  SELECT * FROM Employee WHERE E_type = 'Stall Manager' AND Health_Cert = 'True';
  ```
- Retrieve all vehicles sorted by fuel capacity:
  ```sql
  SELECT Vehicle_ID, LSC_plate FROM Vehicle ORDER BY Fuel_Cap DESC;
  ```
- Update stall end timings for those that start at 12:00 PM:
  ```sql
  UPDATE Stalls SET End_Time = '7:00 PM' WHERE Start_Time = '12:00 PM';
  ```

---

## Contributors

- **Abdullah Mehtab (241607845)**
- **Ali Abdul Aziz (241560709)**
- **Faizan Imtiaz Cheema (241605093)**

### **Supervised by:**
- **Ma’am Asma Basharat**

---

## Future Enhancements

- Implement **user authentication** (Admin & Employee roles).
- Add **real-time inventory tracking**.
- Improve UI with better styling and **data visualization**.
- Integrate **sales forecasting** with data analytics.

---

## License

This project is open-source and available under the **MIT License**.

---
