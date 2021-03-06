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
import java.util.ArrayList;
import java.util.List;

/*
 * CIST 2931 - Team 3
 */

/**
     * The {@code Patient} class is a data model for patients. 
     * 
     * The class {@code Patient} includes methods for setting/getting the various fields, updating database entries, and adding new {@code Patient} objects to the database.
     */
public class Patient {
    private String patId;
    private String password;
    private String firstName;
    private String lastName;
    private String address;
    private String email;
    private String insCo;
    public List<Appointment> appointmentList;
    
    public Patient(){
        this("", "", "", "", "");
    }
    /**
     * Creates a new patient object.
     * @param idIn A string representing the patient's ID.
     * @param pwdIn A string representing the patient's password.
     * @param firstName
     * @param lastName
     * @param addressIn A string representing the patient's address.
     * @param emailIn A string representing the patient's email address.
     * @param insCoIn A string representing the patient's insurance company. 
     */
    public Patient(String idIn, String pwdIn, String firstNameIn, String lastNameIn, String emailIn){
        patId = idIn;
        password = pwdIn;
        firstName = firstNameIn;
        lastName = lastNameIn;
        email = emailIn;
       
    }
    
    /**
     * Displays the data from the object using {@code System.out.println}
     */
    public void display(){
        System.out.println("---Patient Info---");
        System.out.println("PatID    : " + patId);
        System.out.println("Password  : " + password); 
        System.out.println("Name: " + firstName);
        System.out.println("Email     : " + email);
    }
    
    /**
     * Populates the object with data from the database.
     * @param id A string representing the patient's ID.
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
            
            
           
            
            Statement statement = con.createStatement();
            String sql = "SELECT * FROM \"Patients\" where id = '" + id + "'";
            ResultSet rs = statement.executeQuery(sql);
            if (rs.next()){
                patId = rs.getString(2);
                password = rs.getString(1);
                firstName = rs.getString(3);
                lastName = rs.getString(4);
                //address = rs.getString(1);
                email = rs.getString(5);
                //insCo = rs.getString(7);
                rs = null;
                con.close();
                getAppointments();
                return true;
            } else {
                con.close();
                return false;
            }
           
            
            
        } catch (Exception e){
            if (e.toString().contains("ResultSet is empty")) {
                throw e;
            } else {
                System.out.println("Resultset error: " + e);
                return false;
            }
        }
         
    }
    
    /**
     * Inserts a row into the database with the provided information.
     * @param IDIn A string representing the patient's ID.
     * @param pwdIn A string representing the patient's password.
     * @param firstName
     * @param lastName
     * @param emailIn  A string representing the patient's email address.
     * 
     */
    public void insertDB(String IDIn, String pwdIn, String firstName, String lastName, String emailIn){
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
            String sql = String.format("INSERT INTO \"Patients\" (password, id, \"firstName\", \"lastName\", email) VALUES ('%s', '%s', '%s', '%s', '%s');", pwdIn, IDIn, firstName, lastName, emailIn);
            System.out.println("SQL String: " + sql);
            statement.execute(sql);  
            con.close();
        } catch (Exception e){
            System.out.println(e);
        }  
    }
    
    /**
     * Deletes the row associated with the current object from the database.
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
            
        
            
            Statement statement = con.createStatement();
            String sql = String.format("DELETE FROM \"Patients\" WHERE id = '%s';", patId);
            System.out.println("SQL String: " + sql);
            statement.execute(sql);  
            con.close();
            patId = "";
            password = "";
            firstName = "";
            address = "";
            email = "";
            insCo = "";
        } catch (Exception e){
            System.out.println(e);
        } 
    }
    
    /**
     * Updates the database row associated with the current object.
     */
    public void updateDB(String IDIn, String pwdIn, String firstName, String lastName, String emailIn){
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
            
            System.out.println("Attempting to update patient record in database.");
            
            Statement statement = con.createStatement();
            String sql = String.format("UPDATE \"Patients\" SET \"password\" = '%s', \"firstName\" = '%s', \"lastName\" = '%s', \"email\" = '%s' WHERE \"id\" = '%s';", pwdIn, firstName, lastName, emailIn, IDIn);
            System.out.println("SQL String: " + sql);
            statement.execute(sql);  
            con.close();
        } catch (Exception e){
            System.out.println(e);
        }  
    }

    public List<Appointment> getAppointments() throws Exception {
        appointmentList = new ArrayList<Appointment>();
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
            String sql = "SELECT * FROM \"Appointments\" WHERE \"patientID\" = '" + patId + "' ORDER BY date ASC, timeslot ASC";
            
            ResultSet rs = statement.executeQuery(sql);
            while (rs.next()){
                String doctID = rs.getString(1);
                String patientID = rs.getString(2);
                String date = rs.getString(3);
                String timeslot = rs.getString(4);
                String procedure = rs.getString(5);
                Appointment newAppointmnt = new Appointment(date, patientID, doctID, timeslot, procedure);
                //System.out.println("adding to apptlist + " + date + " " + doctID + " " + patientID);
                appointmentList.add(newAppointmnt);
            }
            con.close();
            return appointmentList;
        } catch (Exception e){
                throw e;
        }
    }
    
    /**
     * Gets the ID of the current patient.
     * @return  A string representing the patient's ID.
     */
    public String getID(){
        return patId;
    }
    
    /**
     * Sets the ID of the current patient.
     * @param input  A string representing the patient's ID.
     */
    public void setID(String input){
        patId = input;
    }
    
    /**
     * Gets the password of the current patient.
     * @return  A string representing the patient's password.
     */
    public String getPwd(){
        return password;
    }
    
    /**
     * Sets the password of the current patient.
     * @param input  A string representing the patient's password.
     */
    public void setPwd(String input){
        password = input;
    }
    
    /**
     * Gets the first name of the current patient.
     * @return  A string representing the patient's first name.
     */
    public String getLastName(){
        return lastName;
    }
    
    /**
     * Sets the first name of the current patient.
     * @param input A string representing the patient's first name. 
     */
    public void setLastName(String input){
        lastName = input;
    }
    
    public String getFirstName(){
        return firstName;
    }
    
    /**
     * Sets the first name of the current patient.
     * @param input A string representing the patient's first name. 
     */
    public void setFirstName(String input){
        firstName = input;
    }

    public String getFullName(){
        return firstName + " " + lastName;
    }
    
    /**
     * Gets the email address of the current patient.
     * @return  A string representing the patient's email address.
     */
    public String getEmail(){
        return email;
    }
    
    /**
     * Sets the email address of the current patient.
     * @param input  A string representing the patient's email address.
     */
    public void setEmail(String input){
        email = input;
    }
    
    /**
     * Gets the address of the current patient.
     * @return  A string representing the patient's address.
     */
    public String getAddress(){
        return address;
    }
    
    /**
     * Sets the address of the current patient.
     * @param input  A string representing the patient's address.
     */
    public void setAddress(String input){
        address = input;
    }
    
    /**
     * Gets the insurance provider of the current patient.
     * @return  A string representing the patient's insurance provider.
     */
    public String getInsCo(){
        return insCo;
    }
    
    /**
     * Sets the insurance provider of the current patient.
     * @param input  A string representing the patient's insurance provider.
     */
    public void setInsCo(String input){
        insCo = input;
    }
    
    /**
     * Gets the address of the current patient.
     * @return  A string representing the patient's initials.
     */
    public String getInitials(){
        String intials; 
        intials = firstName.charAt(0) + " ";
        intials = intials + lastName.charAt(0);
        String url = "https://avatars.dicebear.com/api/initials/:"+intials+".svg?options[height]=100";

        return url;
    }
    public static void main(String[] args) throws Exception{
        Patient c1 = new Patient();
        c1.selectDB("P101");
        //c1.insertDB("P101", "password", "firstName", "lastName", "addressIn", "emailIn", "insCoIn");
	c1.display();
    }
}
