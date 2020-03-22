/* Table deletion START */
DROP TABLE IF EXISTS [dbo].[Order]
DROP TABLE IF EXISTS [dbo].[Task]
DROP TABLE IF EXISTS [dbo].[DiningTable]
DROP TABLE IF EXISTS [dbo].[Employee]
GO
/* Employee Table Creation START */

/* Employee Table Creation START */
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[Employee](
    [Employee_ID] [int] NOT NULL IDENTITY(2121,3) PRIMARY KEY,
    [F_Name] [varchar](50) NOT NULL,
    [L_Name] [varchar](50) NOT NULL,
    [Is_Manager] [bit] NOT NULL,
    [Is_Logged_In] [bit] DEFAULT 0,
    [Hire_Date] [date] NOT NULL,
    [Birth_Date] [date] NOT NULL,
    [Address] [varchar](50) NOT NULL,
    [Phone] [varchar](50) NOT NULL,
    [Token] [varchar](MAX) NOT NULL,
    [Salary] [decimal](19,2) NOT NULL,
    [Title] [varchar](50) NOT NULL
)
GO

INSERT INTO [dbo].[Employee] ( [F_Name], [L_Name], [Is_Manager], [Hire_Date], [Birth_Date], [Address], [Phone], [Token], [Salary], [Title] ) VALUES ('Best', 'Manager', 1, '2001-1-1', '2001-1-1', '123 Drive', '123-456-7890', '5z0ZYrqhDOm5nkK5oIEudg==', 14.20, 'Manager')
INSERT INTO [dbo].[Employee] ( [F_Name], [L_Name], [Is_Manager], [Hire_Date], [Birth_Date], [Address], [Phone], [Token], [Salary], [Title] ) VALUES ('Sam', 'Jackson', 0, '2001-2-2', '2001-2-2', '4389 Circle', '928-456-2354', '5z0ZYrqhDOm5nkK5oIEudg==', 8.80, 'SysAdmin')
INSERT INTO [dbo].[Employee] ( [F_Name], [L_Name], [Is_Manager], [Hire_Date], [Birth_Date], [Address], [Phone], [Token], [Salary], [Title] ) VALUES ('Iron', 'Man', 0, '2001-3-3', '2001-3-21', '390 Ave', '347-456-7890', '5z0ZYrqhDOm5nkK5oIEudg==', 10.0, 'Waiter')
INSERT INTO [dbo].[Employee] ( [F_Name], [L_Name], [Is_Manager], [Hire_Date], [Birth_Date], [Address], [Phone], [Token], [Salary], [Title] ) VALUES ('Black', 'Panther', 0, '2001-4-4', '2001-4-4', '123 Drive', '123-456-7890', '5z0ZYrqhDOm5nkK5oIEudg==', 14.20, 'Manager')
INSERT INTO [dbo].[Employee] ( [F_Name], [L_Name], [Is_Manager], [Hire_Date], [Birth_Date], [Address], [Phone], [Token], [Salary], [Title] ) VALUES ('John', 'Carter', 1, '2001-5-5', '2001-5-5', '4389 Circle', '928-456-2354', '5z0ZYrqhDOm5nkK5oIEudg==', 8.80, 'SysAdmin')
INSERT INTO [dbo].[Employee] ( [F_Name], [L_Name], [Is_Manager], [Hire_Date], [Birth_Date], [Address], [Phone], [Token], [Salary], [Title] ) VALUES ('Spider', 'Man', 0, '2001-6-6', '2001-6-6', '390 Ave', '347-456-7890', '5z0ZYrqhDOm5nkK5oIEudg==', 10.0, 'Waiter')
INSERT INTO [dbo].[Employee] ( [F_Name], [L_Name], [Is_Manager], [Hire_Date], [Birth_Date], [Address], [Phone], [Token], [Salary], [Title] ) VALUES ('Tony', 'Stark', 0, '2001-7-7', '2001-7-7', '123 Drive', '123-456-7890', '5z0ZYrqhDOm5nkK5oIEudg==', 14.20, 'Manager')
INSERT INTO [dbo].[Employee] ( [F_Name], [L_Name], [Is_Manager], [Hire_Date], [Birth_Date], [Address], [Phone], [Token], [Salary], [Title] ) VALUES ('The', 'Hulk', 0, '2001-8-8', '2001-8-8', '4389 Circle', '928-456-2354', '5z0ZYrqhDOm5nkK5oIEudg==', 8.80, 'SysAdmin')
INSERT INTO [dbo].[Employee] ( [F_Name], [L_Name], [Is_Manager], [Hire_Date], [Birth_Date], [Address], [Phone], [Token], [Salary], [Title] ) VALUES ('Speed', 'Racer', 0, '2001-9-9', '2001-9-9', '390 Ave', '347-456-7890', '5z0ZYrqhDOm5nkK5oIEudg==', 10.0, 'Waiter')
INSERT INTO [dbo].[Employee] ( [F_Name], [L_Name], [Is_Manager], [Hire_Date], [Birth_Date], [Address], [Phone], [Token], [Salary], [Title] ) VALUES ('Mary', 'Poppins', 0, '2001-10-10', '2001-10-10', '123 Drive', '123-456-7890', '5z0ZYrqhDOm5nkK5oIEudg==', 14.20, 'Manager')
INSERT INTO [dbo].[Employee] ( [F_Name], [L_Name], [Is_Manager], [Hire_Date], [Birth_Date], [Address], [Phone], [Token], [Salary], [Title] ) VALUES ('Toy', 'Story', 1, '2001-11-11', '2001-11-11', '4389 Circle', '928-456-2354', '5z0ZYrqhDOm5nkK5oIEudg==', 8.80, 'SysAdmin')
INSERT INTO [dbo].[Employee] ( [F_Name], [L_Name], [Is_Manager], [Hire_Date], [Birth_Date], [Address], [Phone], [Token], [Salary], [Title] ) VALUES ('Creepy', 'Guy', 0, '2001-12-12', '2001-12-12', '390 Ave', '347-456-7890', '5z0ZYrqhDOm5nkK5oIEudg==', 10.0, 'Waiter')
GO
/* Employee Table Creation END */

/* DiningTable Table Creation START */
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[DiningTable](
    [Dining_Table_ID] [varchar](20) NOT NULL PRIMARY KEY,
    [Employee_ID] [int] NOT NULL,
    [Seats] [int] NOT NULL,
    [Is_Active] [bit] NOT NULL,
    [Is_Occupied] [bit] NOT NULL,
    [Seating_Time] [time],
    [Reservation_Name] [varchar](MAX),
    [Has_Birthday] [bit] NOT NULL,
    [Special_Request] [varchar](MAX),
    FOREIGN KEY ([Employee_ID]) REFERENCES [dbo].[Employee] ([Employee_ID])
    ON DELETE CASCADE
    ON UPDATE CASCADE
)
GO

INSERT INTO [dbo].[DiningTable] ( [Dining_Table_ID], [Employee_ID], [Seats], [Is_Active], [Is_Occupied], [Seating_Time], [Reservation_Name], [Has_Birthday], [Special_Request] ) VALUES ('A1', 2121, 4, 1, 1, CONVERT(time, GETDATE()), 'Michael Goldenberg' , 0, 'My special request')
INSERT INTO [dbo].[DiningTable] ( [Dining_Table_ID], [Employee_ID], [Seats], [Is_Active], [Is_Occupied], [Seating_Time], [Reservation_Name], [Has_Birthday], [Special_Request] ) VALUES ('A2', 2124, 2, 1, 0, CONVERT(time, GETDATE()), '' , 1, 'Not a window')
INSERT INTO [dbo].[DiningTable] ( [Dining_Table_ID], [Employee_ID], [Seats], [Is_Active], [Is_Occupied], [Seating_Time], [Reservation_Name], [Has_Birthday], [Special_Request] ) VALUES ('A3', 2127, 8, 1, 1, CONVERT(time, GETDATE()), 'Harsh Gupta' , 1, 'Round Table')
INSERT INTO [dbo].[DiningTable] ( [Dining_Table_ID], [Employee_ID], [Seats], [Is_Active], [Is_Occupied], [Seating_Time], [Reservation_Name], [Has_Birthday], [Special_Request] ) VALUES ('B1', 2130, 4, 1, 1, CONVERT(time, GETDATE()), 'Natalie Portman' , 0, '')
INSERT INTO [dbo].[DiningTable] ( [Dining_Table_ID], [Employee_ID], [Seats], [Is_Active], [Is_Occupied], [Seating_Time], [Reservation_Name], [Has_Birthday], [Special_Request] ) VALUES ('B2', 2133, 2, 1, 0, CONVERT(time, GETDATE()), '' , 1, 'Not a window')
INSERT INTO [dbo].[DiningTable] ( [Dining_Table_ID], [Employee_ID], [Seats], [Is_Active], [Is_Occupied], [Seating_Time], [Reservation_Name], [Has_Birthday], [Special_Request] ) VALUES ('C1', 2136, 10, 0, 0, CONVERT(time, GETDATE()), 'Huge Mungos' , 1, 'Round Table')
INSERT INTO [dbo].[DiningTable] ( [Dining_Table_ID], [Employee_ID], [Seats], [Is_Active], [Is_Occupied], [Seating_Time], [Reservation_Name], [Has_Birthday], [Special_Request] ) VALUES ('D1', 2139, 2, 1, 0, CONVERT(time, GETDATE()), '' , 0, 'My special request')
INSERT INTO [dbo].[DiningTable] ( [Dining_Table_ID], [Employee_ID], [Seats], [Is_Active], [Is_Occupied], [Seating_Time], [Reservation_Name], [Has_Birthday], [Special_Request] ) VALUES ('E1', 2142, 1, 0, 0, CONVERT(time, GETDATE()), 'Pala Guma' , 1, 'Not a window')
INSERT INTO [dbo].[DiningTable] ( [Dining_Table_ID], [Employee_ID], [Seats], [Is_Active], [Is_Occupied], [Seating_Time], [Reservation_Name], [Has_Birthday], [Special_Request] ) VALUES ('E2', 2145, 3, 1, 1, CONVERT(time, GETDATE()), 'Ice W' , 1, 'Round Table')
INSERT INTO [dbo].[DiningTable] ( [Dining_Table_ID], [Employee_ID], [Seats], [Is_Active], [Is_Occupied], [Seating_Time], [Reservation_Name], [Has_Birthday], [Special_Request] ) VALUES ('OT', 2121, 0, 1, 0, CONVERT(time, GETDATE()), '' , 0, '')
GO
/* DiningTable Table Creation END */

/* Task Table Creation START */
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[Task](
    [Task_ID] [int] NOT NULL IDENTITY(1001,2) PRIMARY KEY,
    [Employee_ID] [int] NOT NULL,
    [Status] [varchar](MAX) NOT NULL,
    [Title] [varchar](MAX) NOT NULL,
    [Description] [text] NOT NULL,
    [Start_Time] [time] DEFAULT CONVERT(time, GETDATE()),
    [Finish_Time] [time], 
    [Total_Time] [time],
    [Task_Date] [date] DEFAULT CONVERT(date, GETDATE()),
    [Dining_Table_ID] [varchar](20) NOT NULL,
    FOREIGN KEY ([Employee_ID]) REFERENCES [dbo].[Employee] ([Employee_ID])
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
    FOREIGN KEY ([Dining_Table_ID]) REFERENCES [dbo].[DiningTable] ([Dining_Table_ID])
    ON DELETE CASCADE
    ON UPDATE CASCADE
)
GO

INSERT INTO [dbo].[Task] ( [Employee_ID], [Status], [Title], [Description], [Dining_Table_ID] ) VALUES (2124, 'Active', 'Sweep the floor', 'Sweep the floor that is near the assigned table', 'A1')
INSERT INTO [dbo].[Task] ( [Employee_ID], [Status], [Title], [Description], [Dining_Table_ID] ) VALUES (2124, 'Active', 'Cleanup table', 'Clean the assigned table', 'B1')
INSERT INTO [dbo].[Task] ( [Employee_ID], [Status], [Title], [Description], [Dining_Table_ID] ) VALUES (2124, 'Complete', 'Attend Customer', 'Attend the customer at the assigned table, haven''t attended customer', 'C1')
INSERT INTO [dbo].[Task] ( [Employee_ID], [Status], [Title], [Description], [Dining_Table_ID] ) VALUES (2127, 'Complete', 'Sweep the floor', 'Sweep the floor that is near the assigned table', 'B2')
INSERT INTO [dbo].[Task] ( [Employee_ID], [Status], [Title], [Description], [Dining_Table_ID] ) VALUES (2127, 'Active', 'Take out the trash', 'We need the trash to be taken out', 'OT')
INSERT INTO [dbo].[Task] ( [Employee_ID], [Status], [Title], [Description], [Dining_Table_ID] ) VALUES (2130, 'Active', 'Wash dishes', 'Wash the dirty dishes in the kitchen', 'OT')
INSERT INTO [dbo].[Task] ( [Employee_ID], [Status], [Title], [Description], [Dining_Table_ID] ) VALUES (2130, 'Active', 'Sweep the floor', 'Sweep the floor that is near the assigned table', 'A1')
INSERT INTO [dbo].[Task] ( [Employee_ID], [Status], [Title], [Description], [Dining_Table_ID] ) VALUES (2133, 'Active', 'Cleanup table', 'Clean the assigned table', 'B1')
INSERT INTO [dbo].[Task] ( [Employee_ID], [Status], [Title], [Description], [Dining_Table_ID] ) VALUES (2133, 'Complete', 'Attend Customer', 'Attend the customer at the assigned table, haven''t attended customer', 'C1')
INSERT INTO [dbo].[Task] ( [Employee_ID], [Status], [Title], [Description], [Dining_Table_ID] ) VALUES (2136, 'Complete', 'Sweep the floor', 'Sweep the floor that is near the assigned table', 'B2')
INSERT INTO [dbo].[Task] ( [Employee_ID], [Status], [Title], [Description], [Dining_Table_ID] ) VALUES (2136, 'Active', 'Take out the trash', 'We need the trash to be taken out', 'OT')
INSERT INTO [dbo].[Task] ( [Employee_ID], [Status], [Title], [Description], [Dining_Table_ID] ) VALUES (2139, 'Active', 'Wash dishes', 'Wash the dirty dishes in the kitchen', 'OT')
GO
/* DiningTable Table Creation END */


