package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
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
@WebServlet(name = "CartServlet", urlPatterns = {"/cart"})
public class CartServlet extends HttpServlet {
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
        Connection conn = null;
        int totalOneBeer = 0;
        int total = 0;
        ParseClass parse = new ParseClass();
        PrintWriter out = response.getWriter();
        RequestDispatcher rd = null;
        if(session.getAttribute("username") == null){
            response.sendRedirect("login.jsp");
        } else {
            Map<Integer,Integer> shoppingCart = (Map<Integer,Integer>)request.getSession().getAttribute("shoppingCart");
            PreparedStatement ps = null;
            if(request.getParameter("doBuy")!=null){
                String username = request.getSession().getAttribute("username").toString();
                String address = request.getParameter("address");
                String inputTel = request.getParameter("tel");
                shoppingCart = (Map<Integer,Integer>)request.getSession().getAttribute("shoppingCart");
                conn = model.DBConnection.getConnection();
                ps = conn.prepareStatement("insert into orders values (null,?,?,?,0)", Statement.RETURN_GENERATED_KEYS);
                ps.setString(1, username);
                ps.setString(2, address);
                long tel = 0;
                if(parse.tryParseLong(inputTel)){
                    tel = Long.parseLong(inputTel);
                    ps.setLong(3, tel);
                } else {
                    response.getWriter().println("<script src='https://code.jquery.com/jquery-1.9.1.min.js'></script>");
                    response.getWriter().println("<script src='https://unpkg.com/sweetalert/dist/sweetalert.min.js'></script>");
                    response.getWriter().println("<script>");
                    response.getWriter().println("$(document).ready(function(){");
                    response.getWriter().println("swal('SOMETHING WENT WRONG', 'NON NUMERIC CHARACTERS IN TELEPHONE FIELD', 'error', {button: false,});");
                    response.getWriter().println("});");
                    response.getWriter().println("</script>");
                    rd = request.getRequestDispatcher("cart.jsp");
                    rd.include(request, response);
                    response.setHeader("refresh", "3");
                }
                ps.execute();
                ResultSet generatedKey = ps.getGeneratedKeys();
                if(generatedKey.next()){
                    int primaryKey = generatedKey.getInt(1);
                    if(shoppingCart!=null){
                        for(Map.Entry<Integer,Integer> item : shoppingCart.entrySet()){
                            ps = conn.prepareStatement("insert into order_details values (?,?,?)");
                            ps.setInt(1, primaryKey);
                            ps.setInt(2, item.getKey());
                            ps.setInt(3, item.getValue());
                            ps.execute();
                            ps = conn.prepareStatement("update beers set quantity=quantity-? where id=?");
                            ps.setInt(1, item.getValue());
                            ps.setInt(2, item.getKey());
                            ps.execute();
                            int totalPrice = Integer.parseInt(request.getSession().getAttribute("total").toString());
                            ps = conn.prepareStatement("update orders set total_price=? where id=?");
                            ps.setInt(1, totalPrice);
                            ps.setInt(2, primaryKey);
                            ps.execute();
                        }
                    }
                }
                request.getSession().removeAttribute("shoppingCart");
            }
            if(request.getParameter("remove")!=null){
                shoppingCart = (Map<Integer,Integer>)request.getSession().getAttribute("shoppingCart");
                if(shoppingCart!=null){
                    int removeId = Integer.parseInt(request.getParameter("remove"));
                    shoppingCart.put(removeId, shoppingCart.get(removeId)-1);
                    if(shoppingCart.get(removeId)<1){
                        shoppingCart.remove(removeId);
                    }
                    if(shoppingCart.isEmpty()){
                        response.sendRedirect("beers");
                    }
                } 
            }
            if(request.getParameter("removeall")!=null){
                shoppingCart = (Map<Integer,Integer>)request.getSession().getAttribute("shoppingCart");
                if(shoppingCart!=null){
                    int removeId = Integer.parseInt(request.getParameter("removeall"));
                    shoppingCart.remove(removeId);
                    if(shoppingCart.isEmpty()){
                        response.sendRedirect("beers");
                    }
                } 
            }
            if(request.getParameter("add")!=null){
                conn = model.DBConnection.getConnection();
                shoppingCart = (Map<Integer,Integer>)request.getSession().getAttribute("shoppingCart");
                if(shoppingCart!=null){
                    int addId = Integer.parseInt(request.getParameter("add"));
                    ResultSet result = conn.createStatement().executeQuery("select * from beers where id="+addId+"");
                    result.next();
                    shoppingCart.put(addId, shoppingCart.get(addId)+1);
                    if(shoppingCart.get(addId).intValue()>result.getInt("quantity")){
                        shoppingCart.put(addId, result.getInt("quantity"));
                    }
                }
            }
            List<Map<String,String>> beers = new ArrayList<Map<String,String>>();
            List<String> beerIdForCart = new ArrayList<>();
            shoppingCart = (Map<Integer,Integer>)request.getSession().getAttribute("shoppingCart");
            if(shoppingCart==null){
                response.sendRedirect("beers");
                return; 
            }
            for(Integer beerId : shoppingCart.keySet()){
                beerIdForCart.add(String.valueOf(beerId));
            }
            String inString = String.join(",", beerIdForCart);
                conn = model.DBConnection.getConnection();
                ResultSet rs = conn.createStatement().executeQuery("select * from beers where id in ("+inString+")");
                while(rs.next()){
                    Map<String,String> beer = new HashMap<>();
                    beer.put("id", String.valueOf(rs.getInt("id")));
                    beer.put("name", rs.getString("name"));
                    beer.put("cartQuantiy", String.valueOf(shoppingCart.get(rs.getInt("id"))));
                    beer.put("price", String.valueOf(rs.getInt("price")));
                    beer.put("quantity", String.valueOf(rs.getInt("quantity")));
                    beer.put("image", rs.getString("image"));
                    totalOneBeer = Integer.parseInt(beer.get("cartQuantiy"))*Integer.parseInt(beer.get("price"));
                    beer.put("totalOneBeer", String.valueOf(totalOneBeer));
                    total+=Integer.parseInt(beer.get("totalOneBeer"));
                    beers.add(beer);
            }
            request.setAttribute("total", total);
            request.setAttribute("beers", beers);
            request.getSession().setAttribute("total", total);
            request.getRequestDispatcher("cart.jsp").forward(request, response);
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
            Logger.getLogger(CartServlet.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(CartServlet.class.getName()).log(Level.SEVERE, null, ex);
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
