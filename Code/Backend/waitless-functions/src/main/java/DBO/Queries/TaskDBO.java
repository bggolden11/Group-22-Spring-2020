package DBO.Queries;

import Models.GetLoggedInEmployee;
import Models.Task;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class TaskDBO implements DBO{

    /**
     *
     * @param employeeId employee ID of the user you would like to assign the task to
     * @param message What the current task is
     * @return The TaskId of the create task
     * @throws SQLException Error with the Sql database
     */
    public String createTask(String employeeId, String message) throws SQLException {
        Connection connection = null;
        connection = DriverManager.getConnection(url);
        String schema = connection.getSchema();
        System.out.println("Successful connection - Schema: " + schema);
        String selectSql = "INSERT INTO Task"
                + "(Employee_ID, Status, Message, Start_Time)"
                + "OUTPUT Inserted.Task_ID "
                + "VALUES ('" + employeeId + "', '" + "Active" + "', '" + message + "', " + "GETDATE());\n";

        try (Statement statement = connection.createStatement();
        ResultSet resultSet = statement.executeQuery(selectSql)){

            // Print results from select statement
            if (!resultSet.next()) {
                throw new SQLException();
            } else {
                return resultSet.getString(1);
            }
        }
        finally {
            connection.close();
        }
    }

    /**
     *
     * @param taskId The task ID to update
     * @param employeeToAssignId the employee Id to change the task to
     * @throws SQLException Error connecting to SQL database
     */
    public void updateTaskUser(String taskId, String employeeToAssignId) throws SQLException {
        Connection connection = null;
        connection = DriverManager.getConnection(url);
        String schema = connection.getSchema();
        System.out.println("Successful connection - Schema: " + schema);
        String selectSql = "UPDATE Task "
                + "SET Employee_ID = " + employeeToAssignId + " "
                + "WHERE Task_ID = " + taskId + ";\n";
        try {
            Statement statement = connection.createStatement();
            statement.executeUpdate(selectSql);
        }
        finally {
            connection.close();
        }
    }

    /**
     *
     * @param employeeID employee Id you would like to get the tasks for
     * @return lists of tasks corresponding to that employee Id
     * @throws SQLException error connecting to SQL DB
     */
    public List<Task> getTaskBasedOnEmployeeID(String employeeID) throws SQLException {
        List<Task> tasks = new ArrayList<>();
        Connection connection = null;
        connection = DriverManager.getConnection(url);
        String schema = connection.getSchema();
        System.out.println("Successful connection - Schema: " + schema);
        String selectSql = "SELECT * "
                + "FROM Task "
                + "WHERE Employee_ID = " + employeeID + ";\n";

        try (Statement statement = connection.createStatement();
             ResultSet resultSet = statement.executeQuery(selectSql)) {

            while(resultSet.next()){
                tasks.add(new Task(resultSet.getString(1),
                        resultSet.getString(2),
                        resultSet.getString(3),
                        resultSet.getString(4),
                        resultSet.getTime(5),
                        resultSet.getTime(6)));
            }
            return tasks;

        } finally {
            connection.close();
        }
    }
}
