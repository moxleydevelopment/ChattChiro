package Business;

/**
 * Nicholas Hall, Timothy Wolf, Donya Moxley, Jason Fleurival, Benjamin Ard
 * CIST2931
 * Team 3
 * ChattChiro - Chiropractors
 */

import java.net.URI;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

/**
 * CIST 2931 - Team 3
 */

/**
 * A data model representing the Admin data type.
 * @author Timothy
 */
public class Admin {
    private String adminId;
    private String password;
    private String firstName;
    private String lastName;
    private String email;
    private int officeNum;
    
    public Admin(){
        this("", "", "", "", "", 0);
    }
    
    /**
     * Creates a new admin object.
     * @param idIn A string representing the admin's ID.
     * @param pwdIn A string representing the admin's password.
     * @param nameIn A string representing the admin's name.
     * @param emailIn A string representing the admin's email address.
     * @param officeIn A string representing the admin's office number.
     */
    public Admin(String idIn, String pwdIn, String firstNameIn, String lastNameIn, String emailIn, int officeIn){
        adminId = idIn;
        password = pwdIn;
        firstName = firstNameIn;
        lastName = lastNameIn;
        email = emailIn;
        officeNum = officeIn;
    }
    
    /**
     * A method which displays all of the fields belonging to this object via {@code System.out.println}
     */
    public void display(){
        System.out.println("---admin Info---");
        System.out.println("AdminID    : " + adminId);
        System.out.println("Password  : " + password); 
        System.out.println("First Name: " + firstName);
        System.out.println("Last Name: " + firstName);
        System.out.println("Email     : " + email);
        System.out.println("Office Num: " + officeNum);
    }
    
    /**
     * Pulls data out of database and populates object with said data.
     * @param id String representing the admin's ID.
     * @throws Exception 
     */
    public boolean selectDB(String id) throws Exception{
        try {
            //this line must be added to work with glassfish
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
            String sql = "SELECT * FROM \"Admin\" where id = '" + id + "'";
            ResultSet rs = statement.executeQuery(sql);
            if(rs.next()){
                adminId = rs.getString(1);
                password = rs.getString(2);
                firstName = rs.getString(3);
                lastName = rs.getString(4);
                email = rs.getString(5);
                officeNum = rs.getInt(6);
                con.close();
                return true;
            } else {
                con.close();
                return false;
            }
            
        } catch (Exception e){
            if (e.toString().contains("ResultSet is empty")) {
                throw e;
            } else {
                System.out.println(e);
                return false;
            }
        }
    }
    
    /**
     * Creates a new row in the database table.
     * @param IDIn A string representing the admin's ID.
     * @param pwdIn A string representing the admin's password.
     * @param nameIn A string representing the admin's name.
     * @param emailIn A string representing the admin's email address.
     * @param officeNumIn A string representing the admin's office number.
     */
    public void insertDB(String IDIn, String pwdIn, String firstNameIn, String lastNameIn, String emailIn, int officeNumIn){
        try {
            Class.forName("net.ucanaccess.jdbc.UcanaccessDriver");
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
            String sql = String.format("INSERT INTO \"Admin\" VALUES ('%s', '%s', '%s', '%s', '%s', '%d');", IDIn, pwdIn, firstNameIn, lastNameIn, emailIn, officeNumIn);
            System.out.println("SQL String: " + sql);
            statement.execute(sql);  
            con.close();
        } catch (Exception e){
            System.out.println(e);
        }  
    }
    
    /**
     * Deletes the row which corresponds with this object from the database.
     */
    public void deleteDB(){
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
            String sql = String.format("DELETE FROM \"Admin\" WHERE id = '%s';", adminId);
            System.out.println("SQL String: " + sql);
            statement.execute(sql);  
            con.close();
            adminId = "";
            password = "";
            firstName = "";
            lastName = "";
            email = "";
            officeNum = 0;
        } catch (Exception e){
            System.out.println(e);
        } 
    }
    /**
     * Writes the data currently contained in the fields of the object to the database.
     */
        public void updateDB(){
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
            System.out.println("Connected to DB. Updating admin...");
            
            Statement statement = con.createStatement();
            String sql = String.format("UPDATE \"Admin\" SET password = '%s', firstName = '%s', lastName = '%s', email = '%s', office = '%d' WHERE id = '%s';", password, firstName, lastName, email, officeNum, adminId);
            System.out.println("SQL String: " + sql);
            statement.execute(sql);  
            con.close();
        } catch (Exception e){
            System.out.println(e);
        }  
    }
    
        
    /**
     * Gets admin's ID.
     * @return A string representing the admin's ID.
     */
    public String getID(){
        return adminId;
    }
    
    /**
     * Sets admin's ID.
     * @param input A string representing the admin's ID.
     */
    public void setID(String input){
        adminId = input;
    }
    
    /**
     * Gets admin's password.
     * @return A string representing the admin's password.
     */
    public String getPwd(){
        return password;
    }
    
    /**
     * Sets admin's password.
     * @param input A string representing the admin's password.
     */
    public void setPwd(String input){
        password = input;
    }
    
    /**
     * Gets admin's name
     * @return A string representing the admin's name.
     */
    public String getFirstName(){
        return firstName;
    }

    public String getLastName(){
        return lastName;
    }
    
    /**
     * Sets admin's name
     * @param input A string representing the admin's name.
     */
    public void setFirstName(String input){
        firstName = input;
    }

    public void setLastName(String input){
        lastName = input;
    }
    
    /**
     * Gets admin's email address.
     * @return A string representing the admin's email address.
     */
    public String getEmail(){
        return email;
    }
    
    /**
     * Sets admin's email address.
     * @param input A string representing the admin's email address.
     */
    public void setEmail(String input){
        email = input;
    }
    
    /**
     * Gets admin's office number.
     * @return A string representing the admin's office number.
     */
    public int getOfficeNum(){
        return officeNum;
    }
    
    /**
     * Sets admin's office number.
     * @param input A string representing the admin's office number.
     */
    public void setOfficeNum(int input){
        officeNum = input;
    }
    
    public static void main(String[] args) throws Exception{
        //Admin a1 = new Admin();
        //a1.selectDB("A201");
	    //d1.display();
    }
}
