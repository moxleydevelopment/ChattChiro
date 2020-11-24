package Business;

import java.lang.reflect.Array;
import java.net.URI;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.time.LocalDate;
import java.util.HashMap;
import java.util.Map;

public class Availability {
    public static boolean getAvailability(String doctId, String date) throws Exception{
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
            
            Statement statement = con.createStatement();
            String sql = "SELECT available FROM \"Availability\" where \"docID\" = '" + doctId + "' AND date = '" + date + "'";
            //System.out.println(sql);
            ResultSet rs = statement.executeQuery(sql);
            if(rs.next()){
                String result = rs.getString(1);
                if ("Y".equals(result)){
                    con.close();
                    //System.out.println("DB = Y,  returning true");
                    return true;
                } else{
                    con.close();
                    //System.out.println("DB = N (or other), returning false");
                    return false;
                }
            } else {
                con.close();
                //System.out.println("No results found, returning false");
                return false;
            }
            
        } catch (Exception e){
            if (e.toString().contains("ResultSet is empty")) {
                //System.out.println("ResultSet empty, returning false");
                return false;
            } else {
                System.out.println(e);
                //System.out.println("Some other error, returning false");
                return false;
            }
        }
    }

    public static Map<String, Map<String, Boolean>> getAvailabilityBetweenDates(LocalDate startDate, LocalDate endDate) throws Exception{
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
            String sql = "SELECT * FROM \"Availability\" where date BETWEEN '" + startDate + "' AND '" + endDate + "'";
            Map<String, Map<String, Boolean>> availabilityMap = new HashMap<String, Map<String, Boolean>>();
            ResultSet rs = statement.executeQuery(sql);
            int count = 0;
            while (rs.next()){
                String docID = rs.getString(1);
                String date = rs.getString(2);
                String available = rs.getString(3);

                if (availabilityMap.containsKey(docID)){
                    availabilityMap.get(docID).put(date, "Y".equals(available) ? true : false);
                    //System.out.println("Key exists, adding: " + date + ", " + available);
                    count += 1;
                } else {
                    availabilityMap.put(docID, new HashMap<String, Boolean>());
                    availabilityMap.get(docID).put(date, "Y".equals(available) ? true : false);
                    count += 1;
                    //System.out.println("Key does not exist (" + docID + "), creating then adding: " + date + ", " + available);
                }
            }
            System.out.println("Read " + count + " availabilities.");
            return availabilityMap;
            
        } catch (Exception e){
            if (e.toString().contains("ResultSet is empty")) {
            } else {
                System.out.println(e);
            }
        }
        return null;
    }
}
