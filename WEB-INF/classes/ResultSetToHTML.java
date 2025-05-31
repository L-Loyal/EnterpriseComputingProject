import java.sql.*;

public class ResultSetToHTML {
    
    public static synchronized String getHtmlRows (ResultSet results, ResultSetMetaData metaData) throws SQLException {
    	
    	String message;
    	
    	int columnCount = metaData.getColumnCount();
		
		message = "<tr>";
		
		for (int i = 1; i <= columnCount; i++) {
			
			message += "<th>" + metaData.getColumnName(i) + "</th>";
		}
		
		message += "</tr>";
		
		while (results.next()) {
			
			message += "<tr>";
			
			for (int i = 1; i <= columnCount; i++) {
				message += "<td>" + results.getString(i) + "</td>";
			}
			
			message += "</tr>";
		}
		
		return message;
   }
}