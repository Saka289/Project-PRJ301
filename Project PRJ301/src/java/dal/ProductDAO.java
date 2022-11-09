/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import com.sun.javafx.scene.control.skin.VirtualFlow;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Brands;
import model.Category;
import model.Product;

/**
 *
 * @author Saka289
 */
public class ProductDAO extends DBContext {

    public List<Product> getAllProduct() {
        List<Product> list = new ArrayList<>();
        String sql = "select * from Product";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product p = new Product();
                p.setId(rs.getInt("id"));
                CategoryDAO cd = new CategoryDAO();
                Category c = cd.getCategoryById(rs.getInt("category_id"));
                p.setCategory(c);
                p.setTitle(rs.getString("title"));
                p.setPrice(rs.getDouble("price"));
                p.setQuantity(rs.getInt("quantity"));
                p.setDiscount(rs.getInt("discount"));
                p.setDescription(rs.getString("description"));
                p.setStatus(rs.getInt("status"));
                p.setBrand_id(rs.getInt("brand_id"));
                p.setImage(rs.getString("image"));
                list.add(p);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }

        return list;
    }

    public List<Product> getNewProduct() {
        List<Product> list = new ArrayList<>();
        String sql = "select top 12 * from Product\n"
                + "order by id desc";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product p = new Product();
                p.setId(rs.getInt("id"));
                CategoryDAO cd = new CategoryDAO();
                Category c = cd.getCategoryById(rs.getInt("category_id"));
                p.setCategory(c);
                p.setTitle(rs.getString("title"));
                p.setPrice(rs.getDouble("price"));
                p.setQuantity(rs.getInt("quantity"));
                p.setDiscount(rs.getInt("discount"));
                p.setDescription(rs.getString("description"));
                p.setStatus(rs.getInt("status"));
                p.setBrand_id(rs.getInt("brand_id"));
                p.setImage(rs.getString("image"));
                list.add(p);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public List<Product> getProductByCid(int cid) {
        List<Product> list = new ArrayList<>();
        String sql = "select * from Product\n"
                + "where 1=1 ";
        if (cid != 0) {
            sql += " and category_id=" + cid;
        }
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product p = new Product();
                p.setId(rs.getInt("id"));
                CategoryDAO cd = new CategoryDAO();
                Category c = cd.getCategoryById(rs.getInt("category_id"));
                p.setCategory(c);
                p.setTitle(rs.getString("title"));
                p.setPrice(rs.getDouble("price"));
                p.setQuantity(rs.getInt("quantity"));
                p.setDiscount(rs.getInt("discount"));
                p.setDescription(rs.getString("description"));
                p.setStatus(rs.getInt("status"));
                p.setBrand_id(rs.getInt("brand_id"));
                p.setImage(rs.getString("image"));
                list.add(p);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

//    public List<Product> searchProduct(int[] cid) {
//        List<Product> list = new ArrayList<>();
//        String sql = "select *  from Product\n"
//                + "where 1=1 ";
//        if (cid != null && cid[0] != 0) {
//            sql += " and category_id in(";
//            for (int i = 0; i < cid.length; i++) {
//                sql += cid[i] + ",";
//            }
//            if (sql.endsWith(",")) {
//                sql = sql.substring(0, sql.length() - 1);
//            }
//            sql += ")";
//        }
//        try {
//            PreparedStatement st = connection.prepareStatement(sql);
//            ResultSet rs = st.executeQuery();
//            while (rs.next()) {
//                Product p = new Product();
//                p.setId(rs.getInt("id"));
//                CategoryDAO cd = new CategoryDAO();
//                Category c = cd.getCategoryById(rs.getInt("category_id"));
//                p.setCategory(c);
//                p.setTitle(rs.getString("title"));
//                p.setPrice(rs.getDouble("price"));
//                p.setQuantity(rs.getInt("quantity"));
//                p.setDiscount(rs.getInt("discount"));
//                p.setDescription(rs.getString("description"));
//                p.setStatus(rs.getInt("status"));
//                p.setBrand_id(rs.getInt("brand_id"));
//                p.setImage(rs.getString("image"));
//                list.add(p);
//            }
//        } catch (SQLException e) {
//            System.out.println(e);
//        }
//        return list;
//    }
//
//    public List<Product> searchProductByPrice(double from, double to) {
//        List<Product> list = new ArrayList<>();
//        String sql = "select * from Product\n"
//                + "where price between " + from + " and " + to;
//        try {
//            PreparedStatement st = connection.prepareStatement(sql);
//            ResultSet rs = st.executeQuery();
//            while (rs.next()) {
//                Product p = new Product();
//                p.setId(rs.getInt("id"));
//                CategoryDAO cd = new CategoryDAO();
//                Category c = cd.getCategoryById(rs.getInt("category_id"));
//                p.setCategory(c);
//                p.setTitle(rs.getString("title"));
//                p.setPrice(rs.getDouble("price"));
//                p.setQuantity(rs.getInt("quantity"));
//                p.setDiscount(rs.getInt("discount"));
//                p.setDescription(rs.getString("description"));
//                p.setStatus(rs.getInt("status"));
//                p.setBrand_id(rs.getInt("brand_id"));
//                p.setImage(rs.getString("image"));
//                list.add(p);
//            }
//        } catch (SQLException e) {
//            System.out.println(e);
//        }
//        return list;
//    }
    public List<Product> searchProduct(int[] cid, double from, double to) {
        List<Product> list = new ArrayList<>();
        if (from == 0 && to == 0) {
            from = 0;
            to = 99999;
        }
        String sql = "select * from Product\n"
                + "where 1=1\n"
                + "and price between " + from + " and " + to;
        if (cid != null && cid[0] != 0) {
            sql += " and category_id in(";
            for (int i = 0; i < cid.length; i++) {
                sql += cid[i] + ",";
            }
            if (sql.endsWith(",")) {
                sql = sql.substring(0, sql.length() - 1);
            }
            sql += ")";
        }
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product p = new Product();
                p.setId(rs.getInt("id"));
                CategoryDAO cd = new CategoryDAO();
                Category c = cd.getCategoryById(rs.getInt("category_id"));
                p.setCategory(c);
                p.setTitle(rs.getString("title"));
                p.setPrice(rs.getDouble("price"));
                p.setQuantity(rs.getInt("quantity"));
                p.setDiscount(rs.getInt("discount"));
                p.setDescription(rs.getString("description"));
                p.setStatus(rs.getInt("status"));
                p.setBrand_id(rs.getInt("brand_id"));
                p.setImage(rs.getString("image"));
                list.add(p);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public List<Product> searchProductBybrandID(int[] brand_id) {
        List<Product> list = new ArrayList<>();
        String sql = "select *  from Product\n"
                + "where 1=1 ";
        if (brand_id != null && brand_id[0] != 0) {
            sql += " and brand_id in(";
            for (int i = 0; i < brand_id.length; i++) {
                sql += brand_id[i] + ",";
            }
            if (sql.endsWith(",")) {
                sql = sql.substring(0, sql.length() - 1);
            }
            sql += ")";
        }
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product p = new Product();
                p.setId(rs.getInt("id"));
                CategoryDAO cd = new CategoryDAO();
                Category c = cd.getCategoryById(rs.getInt("category_id"));
                p.setCategory(c);
                p.setTitle(rs.getString("title"));
                p.setPrice(rs.getDouble("price"));
                p.setQuantity(rs.getInt("quantity"));
                p.setDiscount(rs.getInt("discount"));
                p.setDescription(rs.getString("description"));
                p.setStatus(rs.getInt("status"));
                p.setBrand_id(rs.getInt("brand_id"));
                p.setImage(rs.getString("image"));
                list.add(p);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public Product getDetailProduct(int id) {
        String sql = "select * from Product\n"
                + "where id  = " + id;
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Product p = new Product();
                p.setId(rs.getInt("id"));
                CategoryDAO cd = new CategoryDAO();
                Category c = cd.getCategoryById(rs.getInt("category_id"));
                p.setCategory(c);
                p.setTitle(rs.getString("title"));
                p.setPrice(rs.getDouble("price"));
                p.setQuantity(rs.getInt("quantity"));
                p.setDiscount(rs.getInt("discount"));
                p.setDescription(rs.getString("description"));
                p.setStatus(rs.getInt("status"));
                p.setBrand_id(rs.getInt("brand_id"));
                p.setImage(rs.getString("image"));
                return p;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public List<Product> getRelatedProduct(int cid) {
        List<Product> list = new ArrayList<>();
        String sql = "select top 4 * from Product\n"
                + "where category_id = \n" + cid
                + " order by newid()";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product p = new Product();
                p.setId(rs.getInt("id"));
                CategoryDAO cd = new CategoryDAO();
                Category c = cd.getCategoryById(rs.getInt("category_id"));
                p.setCategory(c);
                p.setTitle(rs.getString("title"));
                p.setPrice(rs.getDouble("price"));
                p.setQuantity(rs.getInt("quantity"));
                p.setDiscount(rs.getInt("discount"));
                p.setDescription(rs.getString("description"));
                p.setStatus(rs.getInt("status"));
                p.setBrand_id(rs.getInt("brand_id"));
                p.setImage(rs.getString("image"));
                list.add(p);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public void insertProduct(int cid, String title, double price, int quantity, int discount, String description, int status, int brand_id, String image) {
        String sql = "insert into Product values (?,?,?,?,?,?,?,?,?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, cid);
            st.setString(2, title);
            st.setDouble(3, price);
            st.setInt(4, quantity);
            st.setInt(5, discount);
            st.setString(6, description);
            st.setInt(7, status);
            st.setInt(8, brand_id);
            st.setString(9, image);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void deleteProduct(int id) {
        String sql = "delete from Product\n"
                + "where id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void updateProduct(int id, int cid, String title, double price, int quantity, int discount, String description, int status, int brand_id, String image) {
        String sql = "UPDATE [dbo].[Product]\n"
                + "   SET [category_id] = ?\n"
                + "      ,[title] = ?\n"
                + "      ,[price] = ?\n"
                + "      ,[quantity] = ?\n"
                + "      ,[discount] = ?\n"
                + "      ,[description] = ?\n"
                + "      ,[status] = ?\n"
                + "      ,[brand_id] = ?\n"
                + "      ,[image] = ?\n"
                + " WHERE id = " + id;
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, cid);
            st.setString(2, title);
            st.setDouble(3, price);
            st.setInt(4, quantity);
            st.setInt(5, discount);
            st.setString(6, description);
            st.setInt(7, status);
            st.setInt(8, brand_id);
            st.setString(9, image);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }

    }

    public List<Product> getTopSale12() {
        List<Product> list = new ArrayList<>();
        String sql = "select top 12 * from Product \n"
                + "where discount >= 20\n"
                + "order by newid()";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product p = new Product();
                p.setId(rs.getInt("id"));
                CategoryDAO cd = new CategoryDAO();
                Category c = cd.getCategoryById(rs.getInt("category_id"));
                p.setCategory(c);
                p.setTitle(rs.getString("title"));
                p.setPrice(rs.getDouble("price"));
                p.setQuantity(rs.getInt("quantity"));
                p.setDiscount(rs.getInt("discount"));
                p.setDescription(rs.getString("description"));
                p.setStatus(rs.getInt("status"));
                p.setBrand_id(rs.getInt("brand_id"));
                p.setImage(rs.getString("image"));
                list.add(p);
            }
        } catch (SQLException e) {
            System.out.println("e");
        }
        return list;
    }

    public List<Product> getTopSale3() {
        List<Product> list = new ArrayList<>();
        String sql = "select top 3 p.id,p.category_id,p.title,p.price,p.quantity as num,p.discount,p.description,p.status,p.brand_id,p.image,sum(od.quantity) as quantity\n"
                + "FROM [Order_Details] od join Product p \n"
                + "on p.id = od.product_id \n"
                + "group by p.id,p.category_id,p.title,p.price,p.quantity,p.discount,p.description,p.status,p.brand_id,p.image\n"
                + "order by quantity desc";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product p = new Product();
                p.setId(rs.getInt("id"));
                CategoryDAO cd = new CategoryDAO();
                Category c = cd.getCategoryById(rs.getInt("category_id"));
                p.setCategory(c);
                p.setTitle(rs.getString("title"));
                p.setPrice(rs.getDouble("price"));
                p.setQuantity(rs.getInt("quantity"));
                p.setDiscount(rs.getInt("discount"));
                p.setDescription(rs.getString("description"));
                p.setStatus(rs.getInt("status"));
                p.setBrand_id(rs.getInt("brand_id"));
                p.setImage(rs.getString("image"));
                list.add(p);
            }
        } catch (SQLException e) {
            System.out.println("e");
        }
        return list;
    }

    public List<Product> getTopSale5() {
        List<Product> list = new ArrayList<>();
        String sql = "select top 5 p.id,p.category_id,p.title,p.price,p.quantity as num,p.discount,p.description,p.status,p.brand_id,p.image,sum(od.quantity) as quantity\n"
                + "FROM [Order_Details] od join Product p \n"
                + "on p.id = od.product_id \n"
                + "group by p.id,p.category_id,p.title,p.price,p.quantity,p.discount,p.description,p.status,p.brand_id,p.image\n"
                + "order by quantity desc";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product p = new Product();
                p.setId(rs.getInt("id"));
                CategoryDAO cd = new CategoryDAO();
                Category c = cd.getCategoryById(rs.getInt("category_id"));
                p.setCategory(c);
                p.setTitle(rs.getString("title"));
                p.setPrice(rs.getDouble("price"));
                p.setQuantity(rs.getInt("quantity"));
                p.setDiscount(rs.getInt("discount"));
                p.setDescription(rs.getString("description"));
                p.setStatus(rs.getInt("status"));
                p.setBrand_id(rs.getInt("brand_id"));
                p.setImage(rs.getString("image"));
                list.add(p);
            }
        } catch (SQLException e) {
            System.out.println("e");
        }
        return list;
    }

    public List<Product> searchByKey(String key) {
        List<Product> list = new ArrayList<>();
        String sql = "select * from Product\n"
                + " where title like '%" + key + "%' or description like '%" + key + "%'";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product p = new Product();
                p.setId(rs.getInt("id"));
                CategoryDAO cd = new CategoryDAO();
                Category c = cd.getCategoryById(rs.getInt("category_id"));
                p.setCategory(c);
                p.setTitle(rs.getString("title"));
                p.setPrice(rs.getDouble("price"));
                p.setQuantity(rs.getInt("quantity"));
                p.setDiscount(rs.getInt("discount"));
                p.setDescription(rs.getString("description"));
                p.setStatus(rs.getInt("status"));
                p.setBrand_id(rs.getInt("brand_id"));
                p.setImage(rs.getString("image"));
                list.add(p);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public double sumOfIncome() {
        String sql = "select sum((p.price-(p.price*p.discount)/100)*od.quantity) as total from Product p , \n"
                + "Order_Details od where p.id =od.product_id ";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                int sum = rs.getInt("total");
                return sum;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return -1;
    }

    public int numberOfProduct() {
        String sql = " select count(p.id) as total from Product p";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                int sum = rs.getInt("total");
                return sum;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return 0;
    }

    public List<Product> getListByPage(List<Product> list, int start, int end) {
        List<Product> arr = new ArrayList<>();
        for (int i = start; i < end; i++) {
            arr.add(list.get(i));
        }
        return arr;
    }

    public static void main(String[] args) {
        ProductDAO productDAO = new ProductDAO();
        List<Product> list = productDAO.getTopSale3();
        for (Product i : list) {
            System.out.println(i);
        }
    }
}
