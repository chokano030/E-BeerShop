package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "AdminServlet", urlPatterns = {"/admin"})
public class AdminServlet extends HttpServlet {
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
        PrintWriter out = response.getWriter();
        Connection conn = model.DBConnection.getConnection();
        PreparedStatement ps = null;
        ResultSet rs = null;
        RequestDispatcher rd = null;
        ParseClass parse = new ParseClass();
        if(session.getAttribute("username") == null || session.getAttribute("status").equals("0")){
             response.sendRedirect("login.jsp");
        } else {
            if(request.getParameter("beername")!=null && request.getParameter("beerprice")!=null && request.getParameter("beerbrewery")!=null && request.getParameter("beercountry")!=null && request.getParameter("beerstyle")!=null && request.getParameter("beeralcohol")!=null && request.getParameter("beerpacking")!=null && request.getParameter("beerdescription")!=null && request.getParameter("beerimage")!=null){
                String beerName = request.getParameter("beername");
                String inputBeerPrice = request.getParameter("beerPrice");
                String beerBrewery = request.getParameter("beerbrewery");
                String beerCountry = request.getParameter("beercountry");
                String beerStyle = request.getParameter("beerstyle");
                String inputBeerAlcohol = request.getParameter("beeralcohol");
                String beerPacking = request.getParameter("beerpacking");
                String beerDescription = request.getParameter("beerdescription");
                String beerImage = request.getParameter("beerimage");
                ps = conn.prepareStatement("select * from beers where name=?");
                ps.setString(1, beerName);
                rs = ps.executeQuery();
                if(!rs.next()){
                    ps = conn.prepareStatement("insert into beers values (null,?,?,?,?,?,?,?,?,?,0)");
                    ps.setString(1, beerName);
                    int beerPrice = 0;
                    if(parse.tryParseInt(inputBeerPrice)){
                        beerPrice = Integer.parseInt(inputBeerPrice);
                        ps.setInt(2, beerPrice);
                    } else {
                        out.println("<script src='https://code.jquery.com/jquery-1.9.1.min.js'></script>");
                        out.println("<script src='https://unpkg.com/sweetalert/dist/sweetalert.min.js'></script>");
                        out.println("<script>");
                        out.println("$(document).ready(function(){");
                        out.println("swal('SOMETHING WENT WRONG', 'NON NUMERIC CHARACTERS IN BEER PRICE', 'error');");
                        out.println("});");
                        out.println("</script>");
                        rd = request.getRequestDispatcher("admin.jsp");
                        rd.include(request, response);
                    }
                    ps.setString(3, beerBrewery);
                    ps.setString(4, beerCountry);
                    ps.setString(5, beerStyle);
                    float beerAlcohol = 0;
                    if(parse.tryParseFloat(inputBeerAlcohol)){
                        beerAlcohol = Float.parseFloat(inputBeerAlcohol);
                        ps.setFloat(6, beerAlcohol);
                    } else {
                        out.println("<script src='https://code.jquery.com/jquery-1.9.1.min.js'></script>");
                        out.println("<script src='https://unpkg.com/sweetalert/dist/sweetalert.min.js'></script>");
                        out.println("<script>");
                        out.println("$(document).ready(function(){");
                        out.println("swal('SOMETHING WENT WRONG', 'NON NUMERIC CHARACTERS IN ALCOHOL PERCENT', 'error');");
                        out.println("});");
                        out.println("</script>");
                        rd = request.getRequestDispatcher("admin.jsp");
                        rd.include(request, response);
                    }
                    ps.setString(7, beerPacking);
                    ps.setString(8, beerDescription);
                    ps.setString(9, beerImage);
                    ps.executeUpdate();
                    request.setAttribute("beerName", beerName);
                    out.println("<script src='https://code.jquery.com/jquery-1.9.1.min.js'></script>");
                    out.println("<script src='https://unpkg.com/sweetalert/dist/sweetalert.min.js'></script>");
                    out.println("<script>");
                    out.println("$(document).ready(function(){");
                    out.println("swal('"+beerName+"', 'SUCCESSFULLY ADDED', 'success');");
                    out.println("});");
                    out.println("</script>");
                    rd = request.getRequestDispatcher("admin.jsp");
                    rd.include(request, response);                    
                } else {
                    out.println("<script src='https://code.jquery.com/jquery-1.9.1.min.js'></script>");
                    out.println("<script src='https://unpkg.com/sweetalert/dist/sweetalert.min.js'></script>");
                    out.println("<script>");
                    out.println("$(document).ready(function(){");
                    out.println("swal('SOMETHING WENT WRONG', 'BEER IS ALREADY IN DATABASE', 'error');");
                    out.println("});");
                    out.println("</script>");
                    rd = request.getRequestDispatcher("admin.jsp");
                    rd.include(request, response);
                }
            }
            if(request.getParameter("beernamequantity")!=null && request.getParameter("beerquantity")!=null){
                String beerNameQuantity = request.getParameter("beernamequantity");
                String inputBeerQuantity = request.getParameter("beerquantity");
                int beerQuantity = 0;
                if(parse.tryParseInt(inputBeerQuantity)){
                    beerQuantity = Integer.parseInt(inputBeerQuantity);
                    ps = conn.prepareStatement("select * from beers where name=?");
                    ps.setString(1, beerNameQuantity);
                    rs = ps.executeQuery();
                    if(rs.next()){
                        ps = conn.prepareStatement("update beers set quantity=quantity+? where name=?");
                        ps.setInt(1, beerQuantity);
                        ps.setString(2, beerNameQuantity);
                        ps.executeUpdate();
                        request.setAttribute("beerQuantity", beerQuantity);
                        request.setAttribute("beerNameQuantity", beerNameQuantity);
                        out.println("<script src='https://code.jquery.com/jquery-1.9.1.min.js'></script>");
                        out.println("<script src='https://unpkg.com/sweetalert/dist/sweetalert.min.js'></script>");
                        out.println("<script>");
                        out.println("$(document).ready(function(){");
                        out.println("swal('"+beerNameQuantity+"', 'YOU ADDED "+beerQuantity+" ITEMS', 'success');");
                        out.println("});");
                        out.println("</script>");
                        rd = request.getRequestDispatcher("admin.jsp");
                        rd.include(request, response);
                    } else {
                        out.println("<script src='https://code.jquery.com/jquery-1.9.1.min.js'></script>");
                        out.println("<script src='https://unpkg.com/sweetalert/dist/sweetalert.min.js'></script>");
                        out.println("<script>");
                        out.println("$(document).ready(function(){");
                        out.println("swal('SOMETHING WENT WRONG', 'NO SUCH BEER IN DATABASE', 'error');");
                        out.println("});");
                        out.println("</script>");
                        rd = request.getRequestDispatcher("admin.jsp");
                        rd.include(request, response);
                    }
                } else {
                    out.println("<script src='https://code.jquery.com/jquery-1.9.1.min.js'></script>");
                    out.println("<script src='https://unpkg.com/sweetalert/dist/sweetalert.min.js'></script>");
                    out.println("<script>");
                    out.println("$(document).ready(function(){");
                    out.println("swal('SOMETHING WENT WRONG', 'NON NUMERIC CHARACTERS ARE NOT ALLOWED', 'error');");
                    out.println("});");
                    out.println("</script>");
                    rd = request.getRequestDispatcher("admin.jsp");
                    rd.include(request, response);
                }
            }
            if(request.getParameter("beernameprice")!=null && request.getParameter("newbeerprice")!=null){
                String beerNamePrice = request.getParameter("beernameprice");
                String inputNewBeerPrice = request.getParameter("newbeerprice");
                int newBeerPrice = 0;
                if(parse.tryParseInt(inputNewBeerPrice)){
                    newBeerPrice = Integer.parseInt(inputNewBeerPrice);
                    ps = conn.prepareStatement("select * from beers where name=?");
                    ps.setString(1, beerNamePrice);
                    rs = ps.executeQuery();
                    if(rs.next()){
                        ps = conn.prepareStatement("update beers set price=? where name=?");
                        ps.setInt(1, newBeerPrice);
                        ps.setString(2, beerNamePrice);
                        ps.executeUpdate();
                        request.setAttribute("newBeerPrice", newBeerPrice);
                        request.setAttribute("beerNamePrice", beerNamePrice);
                        out.println("<script src='https://code.jquery.com/jquery-1.9.1.min.js'></script>");
                        out.println("<script src='https://unpkg.com/sweetalert/dist/sweetalert.min.js'></script>");
                        out.println("<script>");
                        out.println("$(document).ready(function(){");
                        out.println("swal('"+beerNamePrice+"', 'NEW PRICE IS "+newBeerPrice+" €', 'success');");
                        out.println("});");
                        out.println("</script>");
                        rd = request.getRequestDispatcher("admin.jsp");
                        rd.include(request, response);
                    } else {
                        out.println("<script src='https://code.jquery.com/jquery-1.9.1.min.js'></script>");
                        out.println("<script src='https://unpkg.com/sweetalert/dist/sweetalert.min.js'></script>");
                        out.println("<script>");
                        out.println("$(document).ready(function(){");
                        out.println("swal('SOMETHING WENT WRONG', 'NO SUCH BEER IN DATABASE', 'error');");
                        out.println("});");
                        out.println("</script>");
                        rd = request.getRequestDispatcher("admin.jsp");
                        rd.include(request, response);
                    }
                } else {
                    out.println("<script src='https://code.jquery.com/jquery-1.9.1.min.js'></script>");
                    out.println("<script src='https://unpkg.com/sweetalert/dist/sweetalert.min.js'></script>");
                    out.println("<script>");
                    out.println("$(document).ready(function(){");
                    out.println("swal('SOMETHING WENT WRONG', 'NON NUMERIC CHARACTERS ARE NOT ALLOWED', 'error');");
                    out.println("});");
                    out.println("</script>");
                    rd = request.getRequestDispatcher("admin.jsp");
                    rd.include(request, response);
                }
            }
            if(request.getParameter("deletebeer")!=null){
                String deleteBeer = request.getParameter("deletebeer");
                ps = conn.prepareStatement("select * from beers where name=?");
                ps.setString(1, deleteBeer);
                rs = ps.executeQuery();
                if(rs.next()){
                    ps = conn.prepareStatement("delete from beers where name=?");
                    ps.setString(1, deleteBeer);
                    ps.executeUpdate();
                    request.setAttribute("deliteBeer", deleteBeer);
                    out.println("<script src='https://code.jquery.com/jquery-1.9.1.min.js'></script>");
                    out.println("<script src='https://unpkg.com/sweetalert/dist/sweetalert.min.js'></script>");
                    out.println("<script>");
                    out.println("$(document).ready(function(){");
                    out.println("swal('"+deleteBeer+" IS DELETED FROM DATABASE', '', 'success');");
                    out.println("});");
                    out.println("</script>");
                    rd = request.getRequestDispatcher("admin.jsp");
                    rd.include(request, response);
                } else {
                    out.println("<script src='https://code.jquery.com/jquery-1.9.1.min.js'></script>");
                    out.println("<script src='https://unpkg.com/sweetalert/dist/sweetalert.min.js'></script>");
                    out.println("<script>");
                    out.println("$(document).ready(function(){");
                    out.println("swal('SOMETHING WENT WRONG', 'NO SUCH BEER IN DATABASE', 'error');");
                    out.println("});");
                    out.println("</script>");
                    rd = request.getRequestDispatcher("admin.jsp");
                    rd.include(request, response);
                }
            }
        }
        request.getRequestDispatcher("admin.jsp").forward(request, response);
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
            Logger.getLogger(LoginServlet.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(AdminServlet.class.getName()).log(Level.SEVERE, null, ex);
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
