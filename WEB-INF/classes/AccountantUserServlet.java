import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.io.*;
import com.mysql.cj.jdbc.MysqlDataSource;
import com.mysql.cj.protocol.Resultset;
import java.sql.*;
import java.util.Properties;

public class AccountantUserServlet extends HttpServlet {
    
    private Connection connection; // User connection.
    private CallableStatement statement; // Sends commands to database.
	
	// Do post handle user commands.
	public void doPost (HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {

        String procedure = request.getParameter("procedure");
        
        if (procedure == "null")
        	procedure = "";
        
        String message = "";
        
        try {
        	getDBConnection();
        	
        	statement = null;
        	
        	if (procedure.equals("max")) {
        		
        		statement = connection.prepareCall("call Get_The_Maximum_Status_Of_All_Suppliers;");
        	}
        	else if (procedure.equals("sum")) {
        		
        		statement = connection.prepareCall("call Get_The_Sum_Of_All_Parts_Weights;");
        	}
        	else if (procedure.equals("count")) {
        		
        		statement = connection.prepareCall("call Get_The_Total_Number_Of_Shipments;");
        	}
        	else if (procedure.equals("most-workers")) {
        		
        		statement = connection.prepareCall("call Get_The_Name_Of_The_Job_With_The_Most_Workers;");
        	}
        	else {
        		
        		statement = connection.prepareCall("call List_The_Name_And_Status_Of_All_Suppliers;");
        	}
        	
        	statement.execute();
        	
        	ResultSet results = statement.getResultSet();
        	
        	ResultSetMetaData metaData = results.getMetaData();;
        	
        	message = ResultSetToHTML.getHtmlRows(results, metaData);
        	
        	statement.close();
        }
        catch (SQLException e) {
        	
        	message = "<tr><th id=\"fail\">Error executing the SQL statement:<br>" + e.getMessage() + "</th></td>";
        }
        
        HttpSession session = request.getSession();
        session.setAttribute("message", message);
        RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/accountantHome.jsp");
        dispatcher.forward(request, response);
    }
	
	// Gets connection to database.
	private void getDBConnection () {
		
		Properties properties = new Properties();
        FileInputStream filein = null;
        MysqlDataSource dataSource = null;
        
        try {
        	
        	filein = new FileInputStream("C:/Program Files/Apache Software Foundation/Tomcat 10.1/webapps/Project-4/WEB-INF/lib/accountant.properties");
        	
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
