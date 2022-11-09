/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.BrandsDAO;
import dal.CategoryDAO;
import dal.ProductDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import model.Brands;
import model.Category;
import model.Feedback;
import model.Product;

/**
 *
 * @author Saka289
 */
@WebServlet(name = "StoreServlet", urlPatterns = {"/store"})
public class StoreServlet extends HttpServlet {

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
            out.println("<title>Servlet StoreServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet StoreServlet at " + request.getContextPath() + "</h1>");
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
        CategoryDAO cd = new CategoryDAO();
        ProductDAO pd = new ProductDAO();
        BrandsDAO bd = new BrandsDAO();
        List<Brands> listb = bd.getAllBrand();
        List<Category> listc = cd.getAll();
        List<Product> listp = pd.getAllProduct();
        List<Product> getSale3 = pd.getTopSale3();
        String[] pp = {"Under $50", "$50 to 100$", "$100 to 200$", "$200 to 300$", "$300 & Above"};
        boolean[] pb = new boolean[pp.length + 1];
        pb[0] = true;
        boolean[] cate = new boolean[listc.size() + 1];
        cate[0] = true;
        boolean[] brands = new boolean[listb.size() + 1];
        brands[0] = true;
        // phan trang
        int page, numperpage = 9;
        int sizeP = listp.size();
        int num = ((sizeP % 9 == 0) ? (sizeP / 9) : ((sizeP / 9) + 1));
        String xpage = request.getParameter("page");
        if (xpage == null) {
            page = 1;
        } else {
            page = Integer.parseInt(xpage);
        }
        int start, end;
        start = (page - 1) * numperpage;
        end = Math.min(page * numperpage, sizeP);
        List<Product> ListP = pd.getListByPage(listp, start, end);
        request.setAttribute("page", page);
        request.setAttribute("num", num);
        request.setAttribute("brand", listb);
        request.setAttribute("category", listc);
        request.setAttribute("products", ListP);
        request.setAttribute("sale3", getSale3);
        request.setAttribute("pp", pp);
        request.setAttribute("pb", pb);
        request.setAttribute("cid", 0);
        request.setAttribute("cate", cate);
        request.setAttribute("brands", brands);
        request.getRequestDispatcher("store.jsp").forward(request, response);
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
