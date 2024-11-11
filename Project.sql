/*Topic : Library Management System 
You are going to build a project based on Library Management System.
It keeps track of all information about books in the library, their cost, status and total number of books available in the library. 

1)Create a database named library and following TABLES in the database:
1. Branch 2. Employee 3. Books 4. Customer 5. IssueStatus 6. ReturnStatus */

create database library;
use library;
/* Table -1 :Branch , 
   Attributes: 
   Branch_no - Set as PRIMARY KEY 
   Manager_Id 
   Branch_address 
   Contact_no
*/
create table Branch(
					Branch_no int primary key,
                    Manager_Id varchar(5),
                    Branch_address varchar(25),
                    Contact_no int
                    );
insert into Branch values 
						(101, 'M101', '123 Main St', 90999),
						(102, 'M102', '456 Elm St', 98867),
						(103, 'M103', '789 Oak St', 88678),
						(104, 'M104', '567 Pine St', 99886),
						(105, 'M105', '890 Maple St', 98868);
	
select * from Branch;

/*Table 2- Employee,
Attributes:
 Emp_Id – Set as PRIMARY KEY,
 Emp_name,
 Position,
 Salary,
 *Branch_no - Set as FOREIGN KEY and it refer Branch_no in Branch table
 */
 
create table Employee(
					Emp_Id int primary key,
                    Emp_name varchar(25) not null,
                    Position varchar(25) not null,
                    Salary decimal(10,2) not null
                    );
insert into Employee values 
				(01, 'John Doe', 'Manager', 60000.00),
				(02, 'Jane Smith', 'Clerk', 45000.00),
				(03, 'Mike Johnson', 'Librarian', 55000.00),
				(04, 'Emily Davis', 'Assistant', 40000.00),
				(05, 'Sarah Brown', 'Assistant', 42000.00),
				(06, 'Michelle Ramirez', 'Assistant', 43000.00),
				(07, 'Michael Thompson', 'Manager', 62000.00),
				(08, 'Jessica Taylor', 'Clerk', 46000.00),
				(09, 'Daniel Anderson', 'Librarian', 57000.00),
				(10, 'Laura Martinez', 'Assistant', 41000.00);
alter table Employee add column Branch_no int;
alter table Employee add foreign key (Branch_no) references Branch(Branch_no);
UPDATE employee SET Branch_no = 101 WHERE Emp_Id =1;
UPDATE employee SET Branch_no = 101 WHERE Emp_Id =2;
UPDATE employee SET Branch_no = 101 WHERE Emp_Id =3;
UPDATE employee SET Branch_no = 101 WHERE Emp_Id =4;
UPDATE employee SET Branch_no = 102 WHERE Emp_Id =5;
UPDATE employee SET Branch_no = 103 WHERE Emp_Id =6;
UPDATE employee SET Branch_no = 102 WHERE Emp_Id =7;
UPDATE employee SET Branch_no = 102 WHERE Emp_Id=8;
UPDATE employee SET Branch_no = 102 WHERE Emp_Id =9;
UPDATE employee SET Branch_no = 104 WHERE Emp_Id =10;

select * from Employee;

/*Table 3-Books
Attributes :
ISBN - Set as PRIMARY KEY ,
Book_title ,
Category ,
Rental_Price ,
Status [Give yes if book available and no if book not available] 
Author ,
Publisher
*/

create table Books 
			(
			ISBN VARCHAR(10) PRIMARY KEY,
			Book_title VARCHAR(50),
			Category VARCHAR(30),
			Rental_Price DECIMAL(10,2),
			Status ENUM('Yes','No'),
			Author VARCHAR(30),
			Publisher VARCHAR(30)
			);
insert into Books values
			('ISBN101', 'Aadujeevitham', 'Fiction', 170, 'Yes', 'Benyamin', 'DC Books'),
			('ISBN102', 'The Alchemist', 'Fiction', 250, 'Yes', 'Paulo Coelho', 'HarperOne'),
			('ISBN103', 'India A History', 'History', 235, 'Yes', 'John Keay', 'Okhla Books'),
			('ISBN104', 'Five point someone', 'Fiction', 170, 'Yes', 'Chetan Bhagat', 'Rupa'),
			('ISBN105', 'Think and Grow Rich','Finance', 200, 'No', 'Napoleon Hill', 'Fingerprint'),
			('ISBN106', 'The Rise of Ancient Egypt', 'History', 350, 'Yes', 'Toby Wilkinson', 'Olympia Press'),
			('ISBN107', 'Wings of Fire', 'Autobiography', 350, 'Yes', 'A P J Abdul Kalam', 'Universities Press');
select * from Books;

/* Table 4- Customer
Attributes : Customer_Id - Set as PRIMARY KEY 
Customer_name 
Customer_address 
Reg_date
*/
CREATE TABLE Customer
(
Customer_Id varchar(10) primary key,
Customer_name varchar(30),
Customer_address varchar(30),
Reg_date date
);
insert into Customer values
('C101', 'Alice Johnson', '123 Main St', '2021-05-15'),
('C102', 'Bob Smith', '456 Elm St', '2021-06-20'),
('C103', 'Carol Davis', '789 Oak St', '2021-07-10'),
('C104', 'Dave Wilson', '567 Pine St', '2021-08-05'),
('C105', 'Eve Brown', '890 Maple St', '2021-09-25'),
('C106', 'Frank Thomas', '234 Cedar St', '2021-10-15'),
('C107', 'Grace Taylor', '345 Walnut St', '2021-11-20'),
('C108', 'Henry Anderson', '456 Birch St', '2021-12-10'),
('C109', 'Ivy Martinez', '567 Oak St', '2022-01-05'),
('C110', 'Jack Wilson', '678 Pine St', '2022-02-25');
select * from Customer;

/*Table 5 -IssueStatus 
Attributes: Issue_Id - Set as PRIMARY KEY 
Issued_cust – Set as FOREIGN KEY and it refer customer_id in CUSTOMER table 
Issued_book_name 
Issue_date 
Isbn_book – Set as FOREIGN KEY and it should refer isbn in BOOKS table
 */
 CREATE TABLE IssueStatus
(
	Issue_Id varchar(10) primary key,
	Issued_cust varchar(30),
	Issued_book_name varchar(50),
	Issue_date date,
	Isbn_book varchar(15),
    foreign key (Issued_cust) references Customer(Customer_Id),
    foreign key (Isbn_book) references Books(ISBN)
    );
insert into IssueStatus values
	('I101','C101','Aadujeevitham','2023-05-01','ISBN101'),
    ('I102','C102','The Alchemist','2023-06-05','ISBN102'),
    ('I103','C103','India A History','023-04-28','ISBN103'),
    ('I104','C104','Five point someone','2023-02-25','ISBN104'),
    ('I105','C105','Think and Grow Rich','2023-01-30','ISBN105'),
    ('I106','C106','The Rise of Ancient Egypt','2023-05-10','ISBN106'),
    ('I107','C107','Wings of Fire','2023-04-10','ISBN107');
    select * from IssueStatus;

/*Table 6-ReturnStatus
Attributes: Return_Id - Set as PRIMARY KEY 
Return_cust 
Return_book_name 
Return_date 
Isbn_book2 - Set as FOREIGN KEY and it should refer isbn in BOOKS table
*/
CREATE TABLE ReturnStatus
(
Return_id varchar(10) primary key,
Return_cust varchar(30),
Return_book_name varchar(50),
Return_date date,
ISBN_book2 varchar(25),
FOREIGN KEY (isbn_book2) REFERENCES Books(ISBN)
);

insert into ReturnStatus values
			('R101','C1','Aadujeevitham','2023-05-20','ISBN101'),
            ('R102','C2','The Alchemist','2023-07-05','ISBN102'),
            ('R103','C3','India A History','2023-05-18','ISBN103'),
            ('R104','C4','Five point someone','2023-03-23','ISBN104'),
            ('R105','C5','Think and Grow Rich','2023-03-20','ISBN105'),
            ('R106','C6','The Rise of Ancient Egypt','2023-06-10','ISBN106'),
            ('R107','C7','Wings of Fire','2023-05-05','ISBN107');
select * from ReturnStatus;

/* Write the queries for the following : */

/* 1. Retrieve the book title, category, and rental price of all available books. */

select Book_title,Category,Rental_Price from Books where Status = 'Yes' ;

/* 2. List the employee names and their respective salaries in descending order of salary. */

select Emp_name, Salary from employee order by Salary desc;

/* 3. Retrieve the book titles and the corresponding customers who have issued those books. */

SELECT issuestatus.Issued_book_name, customer.Customer_name FROM issuestatus INNER JOIN
customer on issuestatus.Issued_cust = customer.Customer_Id;

/*4. Display the total count of books in each category. */

select Category, count(Book_title) from Books group by Category;

/*5. Retrieve the employee names and their positions for the employees whose salaries are above Rs.50,000. */

select Emp_name, Position from Employee where Salary > 50000;

/*6. List the customer names who registered before 2022-01-01 and have not issued any books yet.  */

select customer_name from customer where Reg_date < '2022-01-01' and Customer_Id not in
(select issued_cust from issuestatus);


/*7. Display the branch numbers and the total count of employees in each branch. */

select Branch_no,count(Emp_Id) from Employee group by Branch_no ;

/*8. Display the names of customers who have issued books in the month of June 2023. */

select customer.Customer_name from customer inner join issuestatus on
customer.Customer_Id = issuestatus.Issued_cust where issuestatus.Issue_date >= '2023-06-01' and 
issuestatus.Issue_date <= '2023-06-30';

/* 9. Retrieve book_title from book table containing history.*/

select Book_title from Books where Book_title like '%History%' ;

/*10.Retrieve the branch numbers along with the count of employees for branches having more than 3 employees*/

select Branch_no, COUNT(Emp_Id) from employee group by Branch_no having COUNT(Emp_Id) > 3;

/* 1. Retrieve the names of employees who manage branches and their respective branch addresses. */

select employee.Emp_name, branch.Branch_address  from employee inner join Branch on  
employee.Branch_no = Branch.Branch_no where Position = 'Manager';

/* 12. Display the names of customers who have issued books with a rental price higher than Rs. 25. */
 
 select Customer.Customer_name, books.Rental_Price from Customer inner join IssueStatus on 
 IssueStatus.Issued_cust = Customer.Customer_Id inner join Books on 
 Books.ISBN = IssueStatus.Isbn_book where Rental_Price > 25 ;
  




				