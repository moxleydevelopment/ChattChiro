package Business;

/**
 * Nicholas Hall, Timothy Wolf, Donya Moxley, Jason Fleurival, Benjamin Ard
 * CIST2931
 * Team 3
 * ChattChiro - Chiropractors
 */

 /**
     * Code Creates class Schedule.
     * @param date A string representing the date.
     * @param docId A string representing the doctor's ID.
     * @param DBPATH A string representing the database Path.
     * @param Schedule A place to put schedule inputs from database.
     * @param inputDate A string representing the date from the database.
     * @param inputDoct A string representing the Doctors ID from the database.
     */

public class Schedule {
    String date;
    String docId;
    
    static final String DBPATH = "C:\\Users\\Timothy\\Desktop\\Fall 2020\\Capstone Class\\NewProj\\Project\\src\\main\\resources\\ChiropractorOfficeDB.accdb";
    
    public Schedule(){
        this("", "");
    }
    
    public Schedule(String inputDate, String inputDoct) {
        date = inputDate;
        docId = inputDoct;
    }
}
