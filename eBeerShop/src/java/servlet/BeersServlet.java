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
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "Beers", urlPatterns = {"/beers"})
public class BeersServlet extends HttpServlet {
    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        HttpSession session = request.getSession(false);
        if(session.getAttribute("username") == null){
            response.sendRedirect("login.jsp");
        } else {
            Connection conn = null;
            int totalBeersCount = 0;
            String username = request.getSession().getAttribute("username").toString();
            List<Map<String,String>> beers = new ArrayList<Map<String,String>>();
            try {
                conn = model.DBConnection.getConnection();
                ResultSet rs = conn.createStatement().executeQuery("select * from beers");
                while(rs.next()){
                    Map<String,String> beer = new HashMap<>();
                    beer.put("id", String.valueOf(rs.getInt("id")));
                    beer.put("name", rs.getString("name"));
                    beer.put("price", String.valueOf(rs.getInt("price")));
                    beer.put("brewery", rs.getString("brewery"));
                    beer.put("country", rs.getString("country"));
                    beer.put("style", rs.getString("style"));
                    beer.put("alcohol", String.valueOf(rs.getFloat("alcohol")));
                    beer.put("packing", rs.getString("packing"));
                    beer.put("description", rs.getString("description"));
                    beer.put("quantity", String.valueOf(rs.getInt("quantity")));
                    beer.put("image", rs.getString("image"));
                    beers.add(beer);
                }
            } catch(SQLException ex){
                ex.printStackTrace();
            }
            Map<Integer,Integer> shoppingCart = (Map<Integer,Integer>)request.getSession().getAttribute("shoppingCart");
            if(request.getParameter("add")!=null){
                if(shoppingCart != null){
                    int beerId = Integer.parseInt(request.getParameter("add"));
                    if(shoppingCart.containsKey(beerId)){
                        shoppingCart.put(beerId, shoppingCart.get(beerId)+1);
                    } else {
                        shoppingCart.put(beerId, 1);
                    }
                } else {
                    Map<Integer,Integer> newShoppingCart = new HashMap<>();
                    int beerId = Integer.parseInt(request.getParameter("add"));
                    newShoppingCart.put(beerId, 1);
                    request.getSession().setAttribute("shoppingCart", newShoppingCart);
                    totalBeersCount = 1;
                }
            }
            if(shoppingCart != null){
                for(Map.Entry<Integer,Integer> keyValueParts : shoppingCart.entrySet()){
                    totalBeersCount+=keyValueParts.getValue();
                }
            }
            request.setAttribute("beers", beers);
            request.setAttribute("username", username);
            request.setAttribute("totalBeersCount", totalBeersCount);
            request.getSession().setAttribute("totalBeersCount", totalBeersCount);
            request.getRequestDispatcher("beers.jsp").forward(request, response);
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
        processRequest(request, response);
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
        processRequest(request, response);
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
