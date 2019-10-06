package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
/**
 *
 * @author Marko
 */
@WebServlet(name = "PreviousOrdersServlet", urlPatterns = {"/previousorders"})
public class PreviousOrdersServlet extends HttpServlet {
    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        HttpSession session = request.getSession(false);
        List<Map<String,String>> previousOrders = new ArrayList<Map<String,String>>();
        Connection conn = null;
        if (session.getAttribute("username") == null) {
            response.sendRedirect("login.jsp");
        } else {
           String username = request.getSession().getAttribute("username").toString();
           conn = model.DBConnection.getConnection();
           ResultSet rs = conn.createStatement().executeQuery("select * from orders_view where username='"+username+"'");
           while(rs.next()){
               Map<String,String> onePreviousOrders = new HashMap<>();
               onePreviousOrders.put("id", String.valueOf(rs.getInt("orders_view.order_id")));
               onePreviousOrders.put("address", rs.getString("orders_view.address"));
               onePreviousOrders.put("tel", String.valueOf(rs.getLong("orders_view.tel")));
               onePreviousOrders.put("beersName", rs.getString("orders_view.group_concat(beers.name)"));
               onePreviousOrders.put("quantity", rs.getString("orders_view.group_concat(order_details.quantity)"));
               onePreviousOrders.put("totalPrice", String.valueOf(rs.getInt("orders_view.total_price")));
               previousOrders.add(onePreviousOrders);
           }
           request.setAttribute("previousOrders", previousOrders);
           request.getRequestDispatcher("previousorders.jsp").forward(request, response);
        } 
    }
    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(PreviousOrdersServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(PreviousOrdersServlet.class.getName()).log(Level.SEVERE, null, ex);
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
