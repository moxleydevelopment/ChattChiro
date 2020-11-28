package Business;

/**
 * Nicholas Hall, Timothy Wolf, Donya Moxley, Jason Fleurival, Benjamin Ard
 * CIST2931
 * Team 3
 * ChattChiro - Chiropractors
 */

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;

    /**
     * The {@code Appointment} class is a data model for appointments. 
     * 
     * The class {@code Appointment} includes methods for setting/getting the various fields, updating database entries, and adding new {@code Appointment} objects to the database.
     */
public class Appointment {
    
    /**
     * Stores the appointment date/time.
     */
    String apptDate;
    /**
     * Stores the patient ID.
     */
    String patId;
    /**
     * Stores the doctor ID.
     */
    String doctId;
    /**
     * Stores the procedure.
     */
    String timeSlot;
    String procedure;

    public Appointment(){
        this("", "", "", "", "");
    }
    
    /**
     * Creates an appointment with the given information.
     * @param inputApptDateTime The date and time of the appointment.
     * @param inputPatId The ID of the patient.
     * @param inputDoctId The ID of the doctor.
     * @param inputTimeSlot The code of the procedure being performed.
     */
    public Appointment(String inputApptDateTime, String inputPatId, String inputDoctId, String inputTimeSlot, String inputProcedure) {
        apptDate = inputApptDateTime;
        patId = inputPatId;
        doctId = inputDoctId;
        timeSlot = inputTimeSlot;
        procedure = inputProcedure;
    }

	/**
     * Gets timeslot.
     * @return An integer representing the timeslot.
     */
    public String getTimeSlot(){
        return timeSlot;
    }

    public String getProcedure(){
        return procedure;
    }
    
    /**
     * Sets the patient ID.
     * @param inputId The patient ID.
     */
    public void setId(String inputId){
        patId = inputId;
    }
    
    /**
     * Gets the patient ID.
     * @return A string representing the patient ID.
     */
    public String getPatId(){
        return patId;
    }

    public String getFormattedTimeslot(){
        LocalTime apptStartTime = LocalTime.parse("07:00");
        LocalTime apptEndTime;
        int loopCount = Integer.parseInt(timeSlot) - 1;
        for (int i = 0; i < loopCount; i++){
            apptStartTime = apptStartTime.plusMinutes(30);
        }
        apptEndTime = apptStartTime.plusMinutes(30);
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("h:mm a");
        String apptTimeString = apptStartTime.format(formatter) + "-" + apptEndTime.format(formatter);
        return apptTimeString;
    }
    
    /**
     * Sets the timeslot.
     * @param inputTimeSlot An integer representing the timeslot.
     */
    public void setTimeSlot(String inputTimeSlot){
        timeSlot = inputTimeSlot;
    }
    
    /**
     * Gets the appointment date.
     * @return A string representing the appointment date.
     */
    public String getDate(){
        return apptDate;
    }
    
    /**
     * Sets the date of the appointment.
     * @param inputDate A string representing the appointment date.
     */
    public void setDate(String inputDate){
        apptDate = inputDate;
    }
    
    /**
     * Gets the doctor ID.
     * @return A string representing the doctor ID.
     */
    public String getDoctor(){
        return doctId;
    }
    
    /**
     * Sets the doctor ID.
     * @param inputDoctor A string representing the Doctor ID.
     */
    public void setDoctor(String inputDoctor){
        doctId = inputDoctor;
    }
    
    /**
     * Writes the data currently contained in the fields of the object to the database.
     */
    public void updateDB(){
        try {
            Connection con;
            Class.forName("org.postgresql.Driver");
            if( "/app".equals(System.getenv("HOME"))){
                    //System.getenv("JDBC_DATABASE_URL");
                    con = DriverManager.getConnection("jdbc:postgresql://localhost/postgres", "postgres", "root");
                }else{
                    con = DriverManager.getConnection("jdbc:postgresql://localhost/postgres", "postgres", "root");
                }
            Statement statement = con.createStatement();
            String sql = String.format("UPDATE Appointments SET apptDate = '%s', doctId = '%s', timeslot = '%d' WHERE patId = '%s';", apptDate, doctId, timeSlot, patId);
            System.out.println("SQL String: " + sql);
            statement.execute(sql);  
            con.close();
        } catch (Exception e){
            System.out.println(e);
        }  
    }
    
    /**
     * Creates a new row in the database table.
     * @param inputApptDate A string representing the appointment date.
     * @param inputPatId A string representing the patient ID.
     * @param inputDoctId A string representing the doctor ID.
     * @param inputProcCode An integer representing the timeslot.
     */
    public void insertDB(String inputApptDate, String inputPatId, String inputDoctId, int inputTimeSlot){
        try {
            Connection con;
            Class.forName("org.postgresql.Driver");
            if( "/app".equals(System.getenv("HOME"))){
                    //System.getenv("JDBC_DATABASE_URL");
                    con = DriverManager.getConnection("jdbc:postgresql://localhost/postgres", "postgres", "root");
                }else{
                    con = DriverManager.getConnection("jdbc:postgresql://localhost/postgres", "postgres", "root");
                }
            Statement statement = con.createStatement();
            String sql = String.format("INSERT INTO \"Appointments\" VALUES ('%s', '%s', '%s', '%s');",inputDoctId , inputPatId, inputApptDate, inputTimeSlot);
            System.out.println("SQL String: " + sql);
            statement.execute(sql);  
            con.close();
        } catch (Exception e){
            System.out.println(e);
        }  
    }

}
