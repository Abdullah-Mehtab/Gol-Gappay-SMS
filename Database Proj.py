import tkinter as tk
from tkinter import ttk
from tkinter import messagebox
from PIL import Image, ImageTk
import sqlite3
import os

class StallManagementSystem(tk.Tk):
    def __init__(self):
        super().__init__()

        self.title("Stall Management System")
        self.geometry("1020x640")

        # Set the window icon
        self.icon = ImageTk.PhotoImage(Image.open("icon.png"))
        self.tk.call('wm', 'iconphoto', self._w, self.icon)

        # Disable resizing
        self.resizable(False, False)

        # Set the background image
        # self.background = ImageTk.PhotoImage(Image.open("background.jpg"))
        # tk.Label(self, image=self.background).place(x=0, y=0, relwidth=1, relheight=1)

        # Set the title image
        self.title_image = ImageTk.PhotoImage(Image.open("title.png"))
        tk.Label(self, image=self.title_image).place(x=400, y=5)
        
        title_label = tk.Label(self, text="Gol-Gappay Stall System", font=("Helvetica", 24))
        title_label.place(x=350,y=180)
        # Creating a connection to the database
        self.conn = sqlite3.connect('stall_management_system.db')
        self.c = self.conn.cursor()

        # Creating the tables
        self.c.execute('''CREATE TABLE IF NOT EXISTS Employee(
                            Emp_ID INTEGER PRIMARY KEY,
                            First_Name VARCHAR(255) NOT NULL,
                            Last_Name VARCHAR(255) NOT NULL,
                            Health_Cert VARCHAR(255) NOT NULL,
                            E_type VARCHAR(255) NOT NULL
                        )''')
            # Create the Stalls table if it does not exist
        self.c.execute("""CREATE TABLE IF NOT EXISTS Stalls (
                            Stall_ID INTEGER PRIMARY KEY,
                            Start_Time TEXT NOT NULL,
                            End_Time TEXT NOT NULL
                        )""")

        self.c.execute("""CREATE TABLE IF NOT EXISTS Stall_Location (
                            Stall_ID INTEGER,
                            Locationn TEXT NOT NULL,
                            FOREIGN KEY (Stall_ID) REFERENCES Stalls(Stall_ID)
                        )""")

        self.c.execute("""CREATE TABLE IF NOT EXISTS Warehouse (
                            Warehouse_ID INTEGER PRIMARY KEY,
                            City TEXT NOT NULL,
                            Street TEXT NOT NULL,
                            Postal_Code INTEGER NOT NULL
                        )""")

        self.c.execute("""CREATE TABLE IF NOT EXISTS Vehicle (
                            Vehicle_ID INTEGER PRIMARY KEY,
                            LSC_plate TEXT NOT NULL,
                            Fuel_Cap INTEGER NOT NULL,
                            typee TEXT NOT NULL
                        )""")

        # Inserting initial data into the Employee table
        initial_emp = [(1 , 'Abdullah', 'Mehtab', 'True' , 'Manager'), 
                       (2 , 'Faizan'  , 'Cheema', 'True' , 'Stall Manager'), 
                       (3 , 'Ali'     , 'Aziz'  , 'False', 'Driver'),
                       (4 , 'Shahrez' , 'Malik' , 'True' , 'Stall Manager'),
                       (5 , 'Yamna'   , 'Hassan', 'True' , 'Stall Manager'),
                       (6 , 'Ahmed'   , 'Mehtab', 'False' ,'Driver'),
                       (7 , 'Bunty'   , 'Baaji' , 'False' ,'Driver'),
                       (8 , 'Seerat'  , 'Roshan', 'True'  ,'Stall Manager'),
                       (9 , 'Shehzaad', 'Obaid' , 'True'  ,'Stall Manager'),
                       (10, 'Ali'     , 'Gajnu' , 'False' ,'Driver'),
                       (11, 'Laiba'   , 'Hassan', 'True'  ,'Stall Manager'),
                       (12, 'Humas'   , 'Butt'  , 'True'  ,'Driver'),
                       (13, 'Chota'   , 'Bheem' , 'True'  ,'Stall Manager'),
                       (14, 'Nobita'  , 'Nobi'  , 'False' ,'Null')]
        
        initial_stall = [(1, '12:00 pm', '5:00 pm'),
                        (2, '7:00 am', '3:00 pm'),
                        (3, '3:00 pm', '8:00 pm'),
                        (4, '12:00 pm', '3:00 pm'),
                        (5, '9:00 am', '5:00 pm'),
                        (6, '12:00 pm', '7:00 pm'),
                        (7, '8:00 pm', '12:00 am')]

        if os.path.exists('stall_management_system.db') == False:
            # Insert into Employee
            self.c.executemany("INSERT INTO Employee (Emp_ID, First_Name, Last_Name, Health_Cert, E_type) VALUES (?, ?, ?, ?, ?)", initial_emp)
            # Insert into Stalls 
            self.c.executemany("INSERT INTO Stalls (Stall_ID, Start_Time, End_Time) VALUES (?,?,?)", initial_stall)
        self.conn.commit()

        # Creating the UI elements
        tk.Label(self, text="").grid(row=0, column=0)
        tk.Label(self, text="").grid(row=1, column=0)
        tk.Label(self, text="").grid(row=2, column=0)
        tk.Label(self, text="").grid(row=3, column=0)
        tk.Label(self, text="").grid(row=5, column=0)
        tk.Label(self, text="").grid(row=6, column=0)
        tk.Label(self, text="").grid(row=7, column=0)
        tk.Label(self, text="").grid(row=8, column=0)
        tk.Label(self, text="").grid(row=9, column=0)
        tk.Label(self, text="").grid(row=10, column=0)
        tk.Label(self, text="").grid(row=11, column=0)
        tk.Label(self, text="").grid(row=12, column=0)


        tk.Label(self, text="Employee ID:").grid(row=13, column=0)
        self.emp_id = tk.Entry(self)
        self.emp_id.grid(row=13, column=1)

        tk.Label(self, text="First Name:").grid(row=14, column=0)
        self.first_name = tk.Entry(self)
        self.first_name.grid(row=14, column=1)

        tk.Label(self, text="Last Name:").grid(row=15, column=0)
        self.last_name = tk.Entry(self)
        self.last_name.grid(row=15, column=1)

        tk.Label(self, text="Health Cert:").grid(row=16, column=0)
        self.health_cert = tk.Entry(self)
        self.health_cert.grid(row=16, column=1)

        tk.Label(self, text="Employee Type:").grid(row=17, column=0)
        self.e_type = tk.Entry(self)
        self.e_type.grid(row=17, column=1)

        tk.Button(self, text="Add Employee", command=self.add_employee).grid(row=18, column=0)
        tk.Button(self, text="View Employees", command=self.view_employees).grid(row=18, column=1)
        tk.Button(self, text="Update Employee", command=self.update_employee).grid(row=19, column=0)
        tk.Button(self, text="Delete Employee", command=self.delete_employee).grid(row=19, column=1)

    def add_employee(self):
        emp_id = self.emp_id.get()
        first_name = self.first_name.get()
        last_name = self.last_name.get()
        health_cert = self.health_cert.get()
        e_type = self.e_type.get()

        self.c.execute("INSERT INTO Employee (Emp_ID, First_Name, Last_Name, Health_Cert, E_type) VALUES (?, ?, ?, ?, ?)", (emp_id, first_name, last_name, health_cert, e_type))
        self.conn.commit()
        messagebox.showinfo("Success", "Employee added successfully!")

    def view_employees(self):
        self.c.execute("SELECT * FROM Employee")
        employees = self.c.fetchall()

        # Creating a new window to display the employees
        employee_window = tk.Toplevel(self)
        employee_window.title("Employees")

        # Creating a TreeView to display the data as a table
        tree = ttk.Treeview(employee_window)
        tree["columns"] = ("Emp_ID", "First_Name", "Last_Name", "Health_Cert", "E_type")
        tree.heading("Emp_ID", text="Employee ID")
        tree.heading("First_Name", text="First Name")
        tree.heading("Last_Name", text="Last Name")
        tree.heading("Health_Cert", text="Health Cert")
        tree.heading("E_type", text="Employee Type")
        tree.column("Emp_ID", width=100)
        tree.column("First_Name", width=150)
        tree.column("Last_Name", width=150)
        tree.column("Health_Cert", width=150)
        tree.column("E_type", width=150)

        for employee in employees:
            tree.insert("", "end", values=employee)
        tree.pack()

    def update_employee(self):
        emp_id = self.emp_id.get()
        first_name = self.first_name.get()
        last_name = self.last_name.get()
        health_cert = self.health_cert.get()
        e_type = self.e_type.get()

        self.c.execute("UPDATE Employee SET First_Name = ?, Last_Name = ?, Health_Cert = ?, E_type = ? WHERE Emp_ID = ?", (first_name, last_name, health_cert, e_type, emp_id))
        self.conn.commit()
        messagebox.showinfo("Success", "Employee updated successfully!")

    def delete_employee(self):
        emp_id = self.emp_id.get()

        self.c.execute("DELETE FROM Employee WHERE Emp_ID = ?", (emp_id,))
        self.conn.commit()
        messagebox.showinfo("Success", "Employee deleted successfully!")

if __name__ == "__main__":
    app = StallManagementSystem()
    app.mainloop()
