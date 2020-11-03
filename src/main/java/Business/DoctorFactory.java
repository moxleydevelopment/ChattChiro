/*
 * Timothy Wolf
 */

package Business;

import java.net.URI;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.HashMap;
import java.util.Map;

/**
 * @author Timothy
 */
public class DoctorFactory {
    public Map<String, Doctor> getDoctors() throws Exception {
        Map<String, Doctor> doctorMap = new HashMap();
        try {
            Connection con;
            Class.forName("org.postgresql.Driver");
             if( "/app".equals(System.getenv("HOME"))){
                    URI dbUri = new URI(System.getenv("DATABASE_URL"));
                    String username = dbUri.getUserInfo().split(":")[0];
                    String dbPassword = dbUri.getUserInfo().split(":")[1];
                    String dbUrl = "jdbc:postgresql://" + dbUri.getHost() + ':' + dbUri.getPort() + dbUri.getPath();
                    con = DriverManager.getConnection(dbUrl, username, dbPassword);
                 }else{
                     con = DriverManager.getConnection("jdbc:postgresql://localhost/postgres", "postgres", "root");
                 }

            System.out.println("Connected to DB.");

            Statement statement = con.createStatement();
            String sql = "SELECT * FROM \"Chiropractor\"";
            ResultSet rs = statement.executeQuery(sql);
            while (rs.next()){
                String doctId = rs.getString(1);
                String password = rs.getString(2);
                String firstName = rs.getString(3);
                String lastName = rs.getString(4);
                String email = rs.getString(5);
                String officeNum = rs.getString(6);
                Doctor newDoctor = new Doctor(doctId, password, firstName, lastName, email, officeNum);
                doctorMap.put(doctId, newDoctor);
            }
            con.close();
            return doctorMap;
        } catch (Exception e){
                throw e;
        }
    }
}
