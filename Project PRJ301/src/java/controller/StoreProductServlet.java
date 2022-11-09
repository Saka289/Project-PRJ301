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
import java.sql.Array;
import java.util.ArrayList;
import java.util.List;
import model.Brands;
import model.Category;
import model.Product;

/**
 *
 * @author Saka289
 */
@WebServlet(name = "StoreProductServlet", urlPatterns = {"/store1"})
public class StoreProductServlet extends HttpServlet {

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
            out.println("<title>Servlet StoreProductServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet StoreProductServlet at " + request.getContextPath() + "</h1>");
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
        String[] pp = {"Under $50", "$50 to 100$", "$100 to 200$", "$200 to 300$", "$300 & Above"};
        boolean[] pb = new boolean[pp.length + 1];
        CategoryDAO cd = new CategoryDAO();
        ProductDAO pd = new ProductDAO();
        BrandsDAO bd = new BrandsDAO();
        List<Category> listc = cd.getAll();
        List<Brands> listb = bd.getAllBrand();
        List<Product> getSale3 = pd.getTopSale3();
        List<Product> products = new ArrayList<>();
        boolean[] cate = new boolean[listc.size() + 1];
        boolean[] brands = new boolean[listb.size() + 1];
        brands[0] = true;
        String cid_raw = request.getParameter("cid");
        String key = request.getParameter("key");
        String[] cidd_raw = request.getParameterValues("cidd");
        String[] price = request.getParameterValues("price");
        String[] brand_raw = request.getParameterValues("brand");

        int[] cidd = {0};
        int[] brand = null;
        int cid = 0;
        double from = 0;
        double to = 0;
        if (cid_raw != null) {
            cid = Integer.parseInt(cid_raw);
            products = pd.getProductByCid(cid);
            if (cid == 0) {
                cate[0] = true;
            }
        }
        if (key != null) {
            products = pd.searchByKey(key);
        }

        if (cidd_raw != null && price == null) {
            cidd = new int[cidd_raw.length];
            for (int i = 0; i < cidd.length; i++) {
                cidd[i] = Integer.parseInt(cidd_raw[i]);
            }
            products = pd.searchProduct(cidd, from, to);
        }

        if (price != null) {
            cidd = new int[cidd_raw.length];
            for (int i = 0; i < cidd.length; i++) {
                cidd[i] = Integer.parseInt(cidd_raw[i]);
            }
            for (int i = 0; i < price.length; i++) {
                List<Product> temp = new ArrayList<>();
                if (price[i].equals("1")) {
                    from = 0;
                    to = 50;
                    temp = pd.searchProduct(cidd, from, to);
                    products.addAll(temp);
                    pb[1] = true;
                }
                if (price[i].equals("2")) {
                    from = 50;
                    to = 100;
                    temp = pd.searchProduct(cidd, from, to);
                    products.addAll(temp);
                    pb[2] = true;
                }
                if (price[i].equals("3")) {
                    from = 100;
                    to = 201;
                    temp = pd.searchProduct(cidd, from, to);
                    products.addAll(temp);
                    pb[3] = true;
                }
                if (price[i].equals("4")) {
                    from = 200;
                    to = 301;
                    temp = pd.searchProduct(cidd, from, to);
                    products.addAll(temp);
                    pb[4] = true;
                }
                if (price[i].equals("5")) {
                    from = 300;
                    to = 9999;
                    temp = pd.searchProduct(cidd, from, to);
                    products.addAll(temp);
                    pb[5] = true;
                }
            }
        }

        if (brand_raw != null) {
            brand = new int[brand_raw.length];
            for (int i = 0; i < brand.length; i++) {
                brand[i] = Integer.parseInt(brand_raw[i]);
            }
            products = pd.searchProductBybrandID(brand);
        }

        if ((brand_raw != null) && (brand[0] != 0)) {
            brands[0] = false;
            for (int i = 1; i < brands.length; i++) {
                if (ischeck(listc.get(i - 1).getId(), brand)) {
                    brands[i] = true;
                } else {
                    brands[i] = false;
                }
            }
        }

        if (cid_raw == null) {
            cate[0] = true;
        }

        if ((price != null) && (cidd[0] != 0)) {
            cate[0] = false;
            for (int i = 1; i < pb.length; i++) {
                if (ischeck1(String.valueOf(i), price)) {
                    pb[i] = true;
                } else {
                    pb[i] = false;
                }
            }
        }
        if ((cidd_raw != null) && (cidd[0] != 0)) {
            cate[0] = false;
            for (int i = 1; i < cate.length; i++) {
                if (ischeck(listc.get(i - 1).getId(), cidd)) {
                    cate[i] = true;
                } else {
                    cate[i] = false;
                }
            }
        }
        if (cidd_raw == null && cid_raw == null && brand_raw == null && price == null && key == null) {
            products = pd.getAllProduct();
        }
//        if(products == null) {
//            request.setAttribute("e", "No Product");
//        }
        request.setAttribute("category", listc);
        request.setAttribute("brand", listb);
        request.setAttribute("products", products);
        request.setAttribute("sale3", getSale3);
        request.setAttribute("pp", pp);
        request.setAttribute("pb", pb);
        request.setAttribute("cid", cid);
        request.setAttribute("cate", cate);
        request.setAttribute("brands", brands);
        request.getRequestDispatcher("store.jsp").forward(request, response);
    }

    private boolean ischeck(int d, int[] id) {
        if (id == null) {
            return false;
        } else {
            for (int i = 0; i < id.length; i++) {
                if (id[i] == d) {
                    return true;
                }
            }
            return false;
        }
    }

    private boolean ischeck1(String d, String[] id) {
        if (id == null) {
            return false;
        } else {
            for (int i = 0; i < id.length; i++) {
                if (id[i].equals(d)) {
                    return true;
                }
            }
            return false;
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
