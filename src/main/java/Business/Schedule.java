package Business;

/**
 * Nicholas Hall, Timothy Eolf, Donya Moxley, Jason Fleurival, Benjamin Ard
 * CIST2931
 * Team 3
 * ChattChiro - Chiropractors
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
