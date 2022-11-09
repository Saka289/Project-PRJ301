/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.FeedbackDAO;
import dal.ProductDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.Enumeration;
import java.util.List;
import model.Feedback;
import model.Product;
import model.User;

/**
 *
 * @author Saka289
 */
@WebServlet(name = "DetailServlet", urlPatterns = {"/detail"})
public class DetailServlet extends HttpServlet {

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
            out.println("<title>Servlet DetailServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet DetailServlet at " + request.getContextPath() + "</h1>");
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
        String id_raw = request.getParameter("id");
        String cid_raw = request.getParameter("releatedcid");
        FeedbackDAO fd = new FeedbackDAO();
        ProductDAO pd = new ProductDAO();
        int id;
        int cid;
        try {
            id = Integer.parseInt(id_raw);
            cid = Integer.parseInt(cid_raw);
            Product p = pd.getDetailProduct(id);
            List<Product> listr = pd.getRelatedProduct(cid);
            List<Feedback> listf = fd.getFeedbackById(id);
            // phan trang
            int page, numperpage = 3;
            int sizeP = listf.size();
            int num = ((sizeP % 3 == 0) ? (sizeP / 3) : ((sizeP / 3) + 1));
            String xpage = request.getParameter("page");
            if (xpage == null) {
                page = 1;
            } else {
                page = Integer.parseInt(xpage);
            }
            int start, end;
            start = (page - 1) * numperpage;
            end = Math.min(page * numperpage, sizeP);
            List<Feedback> listF = fd.getListByPage(listf, start, end);
            int size = listf.size();
            request.setAttribute("listf", listF);
            request.setAttribute("related", listr);
            request.setAttribute("detail", p);
            request.setAttribute("page", page);
            request.setAttribute("num", num);
            session.setAttribute("reviewSize", size);
        } catch (Exception e) {
            System.out.println(e);
        }
        request.getRequestDispatcher("detail.jsp").forward(request, response);
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
        HttpSession session = request.getSession();
        String review = request.getParameter("review");
        String rating_raw = request.getParameter("rating");
        String id_raw = request.getParameter("id");
        String releatedcid = request.getParameter("releatedcid");
        User account = (User) session.getAttribute("account");
        FeedbackDAO fd = new FeedbackDAO();
        int rating, id;
        if (session.getAttribute("account") != null) {
            try {
                rating = Integer.parseInt(rating_raw);
                id = Integer.parseInt(id_raw);
                fd.insertFeedback(account, review, rating, id);
            } catch (Exception e) {
                System.out.println(e);
            }
            response.sendRedirect("detail?id=" + id_raw + "&releatedcid=" + releatedcid);
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
