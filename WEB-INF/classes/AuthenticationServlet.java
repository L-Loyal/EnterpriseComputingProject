import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.io.*;
import com.mysql.cj.jdbc.MysqlDataSource;
import com.mysql.cj.protocol.Resultset;
import java.sql.*;
import java.util.Properties;

public class AuthenticationServlet extends HttpServlet {
    
    private Connection connection; // User connection.
    private PreparedStatement statement; // Sends commands to database.
	
	// Do post handle user commands.
	public void doPost (HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {

        String username = request.getParameter("username");
        
        String password = request.getParameter("password");
        
        String message = "";
        
        try {
        	getDBConnection();
        	
        	statement = connection.prepareStatement("select * from usercredentials where login_username = ? and login_password = ?;");
        	
        	statement.setString(1, username);
        	
        	statement.setString(2, password);
        	
        	ResultSet rs = statement.executeQuery();
        	
        	// Redirection decision tree.
        	if (rs.next()) { // Meaning the credentials were found in the database.
        		
        		if (username.equals("root")) {
        			
        			response.sendRedirect("/Project-4/rootHome.jsp");
        		}
        		else if (username.equals("client")) {
        			
        			response.sendRedirect("/Project-4/clientHome.jsp");
        		}
        		else if (username.equals("dataentryuser")) {
        			
        			response.sendRedirect("/Project-4/dataentryHome.jsp");
        		}
        		else {
        			response.sendRedirect("/Project-4/accountantHome.jsp");
        		}
        	}
        	else {
        		
        		response.sendRedirect("/Project-4/errorpage.html");
        	}
        	
        	statement.close();
        }
        catch (SQLException e) {
        	
        	message = "<tr><th id=\"fail\">Error executing the SQL statement:<br>" + e.getMessage() + "</th></td>";
        }
    }
	
	// Gets connection to database.
	private void getDBConnection () {
		
		Properties properties = new Properties();
        FileInputStream filein = null;
        MysqlDataSource dataSource = null;
        
        try {
        	
        	filein = new FileInputStream("C:/Program Files/Apache Software Foundation/Tomcat 10.1/webapps/Project-4/WEB-INF/lib/system.properties");
        	
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
