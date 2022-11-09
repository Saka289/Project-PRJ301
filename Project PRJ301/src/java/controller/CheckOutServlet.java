/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.OrdersDAO;
import dal.UserDAO;
import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;
import java.util.Properties;
import java.util.Random;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import model.Cart;
import model.Item;
import model.User;

/**
 *
 * @author Saka289
 */
@WebServlet(name = "ChekckOutServlet", urlPatterns = {"/checkout"})
public class CheckOutServlet extends HttpServlet {

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
            out.println("<title>Servlet ChekckOutServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ChekckOutServlet at " + request.getContextPath() + "</h1>");
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
        request.getRequestDispatcher("checkout.jsp").forward(request, response);
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
//        HttpSession session = request.getSession(true);
        HttpSession mySession = request.getSession(true);
        Object o = mySession.getAttribute("cart");
        Cart cart = null;
        if (o != null) {
            cart = (Cart) o;
        } else {
            cart = new Cart();
        }
        User account = (User) mySession.getAttribute("account");
        String name = request.getParameter("name");
        String email1 = request.getParameter("email");
        String address = request.getParameter("address");
        String country = request.getParameter("country");
        String phone = request.getParameter("phone");
        String note = request.getParameter("note");
        List<Item> list = cart.getItems();
        if (account != null) {
            if (mySession.getAttribute("size") != null && list.size() != 0) {
                UserDAO ud = new UserDAO();
                String to = email1;// change accordingly
                // Get the session object
                Properties props = new Properties();
                props.put("mail.smtp.host", "smtp.gmail.com");
                props.put("mail.smtp.socketFactory.port", "465");
                props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
                props.put("mail.smtp.auth", "true");
                props.put("mail.smtp.port", "465");
                Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
                    @Override
                    protected PasswordAuthentication getPasswordAuthentication() {
                        return new PasswordAuthentication("sakanatsuma289@gmail.com", "efujmbdegafyzoec");
                    }
                });
                try {
                    MimeMessage message = new MimeMessage(session);
                    message.setFrom(new InternetAddress(email1));// change accordingly
                    message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));
                    message.setSubject("Order Confirmation Email");
                    message.setText("Hello: " + name + "\n"
                            + "\n"
                            + "We’re happy to let you know that we’ve received your order.\n"
                            + "\n"
                            + "Once your package ships, we will send you an email with a tracking number and link so you can see the movement of your package.\n"
                            + "\n"
                            + "If you have any questions, contact us here or call us on 0961677176!\n"
                            + "\n"
                            + "We are here to help!\n"
                            + "\n"
                            + "Thank you for placing your order!");
                    Transport.send(message);
                } catch (MessagingException e) {
                    System.out.println(e);
                }
                OrdersDAO od = new OrdersDAO();
                od.addOrders(account, cart, note, email1, name, address, country, phone);
                mySession.removeAttribute("cart");
                mySession.setAttribute("size", 0);
                mySession.removeAttribute("total");
                request.setAttribute("check", "Order successfully check your mail !!!");
                request.getRequestDispatcher("checkout.jsp").forward(request, response);
            } else {
                request.setAttribute("check", "Your shopping cart is empty !!!");
                request.getRequestDispatcher("checkout.jsp").forward(request, response);
            }
        } else {
            response.sendRedirect("login");
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
