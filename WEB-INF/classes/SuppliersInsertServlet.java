import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.io.*;
import com.mysql.cj.jdbc.MysqlDataSource;
import com.mysql.cj.protocol.Resultset;
import java.sql.*;
import java.util.Properties;

public class SuppliersInsertServlet extends HttpServlet {
    
    private Connection connection; // User connection.
    private PreparedStatement statement; // Sends commands to database.
    private int mysqlUpdateValue; // Returns value by update command.
	
	// Do post handle user commands.
	public void doPost (HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        
        String message = "";
        
        try {
        	getDBConnection();
        	
        	String snum = request.getParameter("snum");
    		String sname = request.getParameter("sname");
    		String status = request.getParameter("status");
    		String city = request.getParameter("city");
    		
    		String command = "Insert into suppliers values (?, ?, ?, ?);";
    		
    		statement = connection.prepareStatement(command);
    		
    		statement.setString(1, snum);
    		statement.setString(2, sname);
    		statement.setInt(3, Integer.parseInt(status));
    		statement.setString(4, city);
    		
    		mysqlUpdateValue = statement.executeUpdate();
    		
    		message = "<tr><th>New suppliers record: (" + snum + ", " + sname + ", " + status + ", " + city + ") - successfully entered into database.</th></tr>";
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
