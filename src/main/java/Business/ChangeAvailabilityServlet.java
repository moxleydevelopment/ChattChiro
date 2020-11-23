package Business;

/**
 * Nicholas Hall, Timothy Wolf, Donya Moxley, Jason Fleurival, Benjamin Ard
 * CIST2931
 * Team 3
 * ChattChiro - Chiropractors
 */

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(urlPatterns = { "/ChangeAvailabilityServlet" })
public class ChangeAvailabilityServlet extends HttpServlet {

    /**
     *
     */
    private static final long serialVersionUID = 1L;

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request  servlet request
     * @param response servlet response
     * @throws ServletException                 if a servlet-specific error occurs
     * @throws IOException                      if an I/O error occurs
     * @throws java.sql.SQLException
     * @throws java.lang.ClassNotFoundException
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException, ClassNotFoundException, Exception {
        response.setContentType("text/html;charset=UTF-8");

        String[] identArray;
        try {
            Connection con;
            Class.forName("org.postgresql.Driver");
            if ("/app".equals(System.getenv("HOME"))) {
                // System.getenv("JDBC_DATABASE_URL");
                con = DriverManager.getConnection("jdbc:postgresql://localhost/postgres", "postgres", "root");
            } else {
                con = DriverManager.getConnection("jdbc:postgresql://localhost/postgres", "postgres", "root");
            }
            for (String input : request.getParameterMap().keySet()) {
                for (String value : request.getParameterValues(input)) {
                    System.out.println(input + ": " + value);
                    identArray = input.split(",");
                    String doctID = identArray[0];
                    String date = identArray[1];
                    Statement statement = con.createStatement();
                    String sql = String.format(
                            "INSERT INTO \"Availability\" values('%s', '%s', '%s') ON CONFLICT ON CONSTRAINT dupes_pkey DO UPDATE SET available = EXCLUDED.available",
                            doctID, date, value, value, doctID, date);
                    System.out.println("SQL String: " + sql);
                    statement.execute(sql);
                }
            }
            con.close();
            RequestDispatcher rd = request.getRequestDispatcher("/admins/admin.jsp");
            rd.forward(request, response);
        } catch (Exception e) {
            System.out.println(e);
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the
    // + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request  servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException      if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(PatientLoginServletDB.class.getName()).log(Level.SEVERE, null, ex);
        } catch (Exception ex) {
            Logger.getLogger(PatientLoginServletDB.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request  servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException      if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (SQLException | ClassNotFoundException ex) {
            Logger.getLogger(PatientLoginServletDB.class.getName()).log(Level.SEVERE, null, ex);
        } catch (Exception ex) {
            Logger.getLogger(PatientLoginServletDB.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
