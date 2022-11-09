/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.async;

import dal.ProductDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;
import model.Cart;
import model.Item;
import model.Product;

/**
 *
 * @author Saka289
 */
@WebServlet(name = "BuyAsyncServlet", urlPatterns = {"/buyasync"})
public class BuyAsyncServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet BuyAsyncServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet BuyAsyncServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
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
        HttpSession session = request.getSession();
        Cart cart = null;
        Object o = session.getAttribute("cart");
        //co roi 
        if (o != null) {
            cart = (Cart) o;
        } else {
            cart = new Cart();
        }
        String tid = request.getParameter("id");
//        String releatedcid = request.getParameter("releatedcid");
        String tnum = request.getParameter("num");
//        String url = request.getParameter("url");
        int num = 1, id;
        double price;
        try {
            id = Integer.parseInt(tid);
            if (tnum != null) {
                num = Integer.parseInt(tnum);
            }
            ProductDAO pd = new ProductDAO();
            Product p = pd.getDetailProduct(id);
            if (p.getDiscount() == 0) {
                price = p.getPrice();
            } else {
                price = p.getPrice() - (p.getPrice() * p.getDiscount() / 100);
            }
            Item t = new Item(p, num, price);
            cart.addItem(t);
        } catch (NumberFormatException e) {
            System.out.println(e);
        }
        List<Item> list = cart.getItems();
        session.setAttribute("cart", cart);
        session.setAttribute("size", list.size());
        session.setAttribute("total", cart.getTotalMoney());
        response.getWriter().println(list.size());
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
//        if (url.equals("1")) {
//            response.sendRedirect("home");
//        } else if (url.equals("2")) {
//            response.sendRedirect("store");
//        } else if (url.equals("3")) {
//            response.sendRedirect("detail?id=" + tid + "&releatedcid=" + releatedcid);
//        }
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
