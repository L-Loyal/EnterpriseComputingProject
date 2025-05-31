import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.io.*;
import com.mysql.cj.jdbc.MysqlDataSource;
import com.mysql.cj.protocol.Resultset;
import java.sql.*;
import java.util.Properties;

public class JobsInsertServlet extends HttpServlet {
    
    private Connection connection; // User connection.
    private PreparedStatement statement; // Sends commands to database.
    private int mysqlUpdateValue; // Returns value by update command.
	
	// Do post handle user commands.
	public void doPost (HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        
        String message = "";
        
        try {
        	getDBConnection();
        	
        	String jnum = request.getParameter("jnum");
    		String jname = request.getParameter("jname");
    		String numWorkers = request.getParameter("numworkers");
    		String city = request.getParameter("city");
    		
    		String command = "Insert into jobs values (?, ?, ?, ?);";
    		
    		statement = connection.prepareStatement(command);
    		
    		statement.setString(1, jnum);
    		statement.setString(2, jname);
    		statement.setInt(3, Integer.parseInt(numWorkers));
    		statement.setString(4, city);
    		
    		mysqlUpdateValue = statement.executeUpdate();
    		
    		message = "<tr><th>New job record: (" + jnum + ", " + jname + ", " + numWorkers + ", " + city + ") - successfully entered into database.</th></tr>";
        }
        catch (SQLException e) {
        	
        	message = "<tr><th id=\"fail\">Error executing the SQL statement:<br>" + e.getMessage() + "</th></td>";
        }
        catch (Exception e) {
        	
        	message = "<tr><th>" + e.getMessage() + "</th></tr>";
        }
        HttpSession session = request.getSession();
        session.setAttribute("message", message);
        RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/dataentryHome.jsp");
        dispatcher.forward(request, response);
    }
	
	// Gets connection to database.
	private void getDBConnection () {
		
		Properties properties = new Properties();
        FileInputStream filein = null;
        MysqlDataSource dataSource = null;
        
        try {
        	
        	filein = new FileInputStream("C:/Program Files/Apache Software Foundation/Tomcat 10.1/webapps/Project-4/WEB-INF/lib/data-entry.properties");
        	
        	properties.load(filein);
        	dataSource = new MysqlDataSource();
        	dataSource.setURL(properties.getProperty("MYSQL_DB_URL"));
	        dataSource.setUser(properties.getProperty("MYSQL_DB_USERNAME"));
	        dataSource.setPassword(properties.getProperty("MYSQL_DB_PASSWORD"));
        	
	        connection = dataSource.getConnection();
        }
        catch (SQLException e) {
        	e.printStackTrace();
        }
        catch (IOException e) {
        	e.printStackTrace();
        }
	}
}
