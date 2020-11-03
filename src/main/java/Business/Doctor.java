package Business;

/**
 * Nicholas Hall, Timothy Eolf, Donya Moxley, Jason Fleurival, Benjamin Ard
 * CIST2931
 * Team 3
 * ChattChiro - Chiropractors
 */

import java.net.URI;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

/*
 * CIST 2931 - Team 3
 */

/**
 * A data model representing the Doctor data type.
 * @author Timothy
 */
public class Doctor {
    private String doctId;
    private String password;
    private String firstName;
    private String lastName;
    private String email;
    private String officeNum;
    
    public Doctor(){
        this("", "", "", "", "", "");
    }
    
    /**
     * Creates a new doctor object.
     * @param idIn A string representing the doctor's ID.
     * @param pwdIn A string representing the doctor's password.
     * @param nameIn A string representing the doctor's name.
     * @param emailIn A string representing the doctor's email address.
     * @param officeIn A string representing the doctor's office number.
     */
    public Doctor(String idIn, String pwdIn, String firstNameIn, String lastNameIn, String emailIn, String officeIn){
        doctId = idIn;
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
        System.out.println("---doctor Info---");
        System.out.println("DoctID    : " + doctId);
        System.out.println("Password  : " + password); 
        System.out.println("First Name: " + firstName);
        System.out.println("Last Name: " + firstName);
        System.out.println("Email     : " + email);
        System.out.println("Office Num: " + officeNum);
    }
    
    /**
     * Pulls data out of database and populates object with said data.
     * @param id String representing the doctor's ID.
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
            String sql = "SELECT * FROM \"Chiropractor\" where id = '" + id + "'";
            ResultSet rs = statement.executeQuery(sql);
            if(rs.next()){
                doctId = rs.getString(1);
                password = rs.getString(2);
                firstName = rs.getString(3);
                lastName = rs.getString(4);
                email = rs.getString(5);
                officeNum = rs.getString(6);
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
     * @param IDIn A string representing the doctor's ID.
     * @param pwdIn A string representing the doctor's password.
     * @param nameIn A string representing the doctor's name.
     * @param emailIn A string representing the doctor's email address.
     * @param officeNumIn A string representing the doctor's office number.
     */
    public void insertDB(String IDIn, String pwdIn, String firstNameIn, String lastNameIn, String emailIn, String officeNumIn){
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
            String sql = String.format("INSERT INTO \"Chiropractor\" VALUES ('%s', '%s', '%s', '%s', '%s', '%s');", IDIn, pwdIn, firstNameIn, lastNameIn, emailIn, officeNumIn);
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
            String sql = String.format("DELETE FROM \"Chiropractor\" WHERE id = '%s';", doctId);
            System.out.println("SQL String: " + sql);
            statement.execute(sql);  
            con.close();
            doctId = "";
            password = "";
            firstName = "";
            lastName = "";
            email = "";
            officeNum = "";
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
            System.out.println("Connected to DB. Updating doctor...");
            
            Statement statement = con.createStatement();
            String sql = String.format("UPDATE \"Chiropractor\" SET password = '%s', firstName = '%s', lastName = '%s', email = '%s', office = '%d' WHERE id = '%s';", password, firstName, lastName, email, officeNum, doctId);
            System.out.println("SQL String: " + sql);
            statement.execute(sql);  
            con.close();
        } catch (Exception e){
            System.out.println(e);
        }  
    }
    
        
    /**
     * Gets doctor's ID.
     * @return A string representing the doctor's ID.
     */
    public String getID(){
        return doctId;
    }
    
    /**
     * Sets doctor's ID.
     * @param input A string representing the doctor's ID.
     */
    public void setID(String input){
        doctId = input;
    }
    
    /**
     * Gets doctor's password.
     * @return A string representing the doctor's password.
     */
    public String getPwd(){
        return password;
    }
    
    /**
     * Sets doctor's password.
     * @param input A string representing the doctor's password.
     */
    public void setPwd(String input){
        password = input;
    }
    
    /**
     * Gets doctor's name
     * @return A string representing the doctor's name.
     */
    public String getFirstName(){
        return firstName;
    }

    public String getLastName(){
        return lastName;
    }
    
    /**
     * Sets doctor's name
     * @param input A string representing the doctor's name.
     */
    public void setFirstName(String input){
        firstName = input;
    }

    public void setLastName(String input){
        lastName = input;
    }
    
    /**
     * Gets doctor's email address.
     * @return A string representing the doctor's email address.
     */
    public String getEmail(){
        return email;
    }
    
    /**
     * Sets doctor's email address.
     * @param input A string representing the doctor's email address.
     */
    public void setEmail(String input){
        email = input;
    }
    
    /**
     * Gets doctor's office number.
     * @return A string representing the doctor's office number.
     */
    public String getOfficeNum(){
        return officeNum;
    }
    
    /**
     * Sets doctor's office number.
     * @param input A string representing the doctor's office number.
     */
    public void setOfficeNum(String input){
        officeNum = input;
    }
    
    public static void main(String[] args) throws Exception{
        Doctor d1 = new Doctor();
        d1.selectDB("D201");
	d1.display();
    }
}
