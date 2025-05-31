import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.io.*;
import com.mysql.cj.jdbc.MysqlDataSource;
import com.mysql.cj.protocol.Resultset;
import java.sql.*;
import java.util.Properties;

public class ClientUserServlet extends HttpServlet {
    
    private Connection connection; // User connection.
    private Statement statement; // Sends commands to database.
    private int mysqlUpdateValue; // Returns value by update command.
	
	// Do post handle user commands.
	public void doPost (HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {

        String sqlStatement = request.getParameter("sqlStatement");
        
        String message = "";
        
        try {
        	getDBConnection();
        	
        	statement = connection.createStatement();
        	
        	boolean isSelect = false;
        	
        	isSelect = sqlStatement.toUpperCase().trim().contains("SELECT");
        	
        	if (isSelect) {
        		
        		ResultSet results = statement.executeQuery(sqlStatement);
        		
        		ResultSetMetaData metaData = results.getMetaData();
        		
        		message = ResultSetToHTML.getHtmlRows(results, metaData);
        	}
        	else { // Update command is not allowed for client user.
        			
        		mysqlUpdateValue = statement.executeUpdate(sqlStatement);
        			
        		message = "<tr><th>The statement executed successfully. A total of " + mysqlUpdateValue + " row(s) were updated.<br>Business Logic Not Triggered!</th></tr>";
        	}
        	
        	statement.close();
        }
        catch (SQLException e) {
        	
        	message = "<tr><th id=\"fail\">Error executing the SQL statement:<br>" + e.getMessage() + "</th></td>";
        }
        
        HttpSession session = request.getSession();
        session.setAttribute("message", message);
        RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/clientHome.jsp");
        dispatcher.forward(request, response);
    }
	
	// Gets connection to database.
	private void getDBConnection () {
		
		Properties properties = new Properties();
        FileInputStream filein = null;
        MysqlDataSource dataSource = null;
        
        try {
        	
        	filein = new FileInputStream("C:/Program Files/Apache Software Foundation/Tomcat 10.1/webapps/Project-4/WEB-INF/lib/client.properties");
        	
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
