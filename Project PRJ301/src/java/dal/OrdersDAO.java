/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import model.Cart;
import model.Category;
import model.Item;
import model.Orders;
import model.Product;
import model.User;

/**
 *
 * @author Saka289
 */
public class OrdersDAO extends DBContext {

    public void addOrders(User u, Cart cart, String note, String email, String name, String address, String country, String phone) {
        LocalDateTime curDate = java.time.LocalDateTime.now();
        String date = curDate.toString();
        try {
            String sql = "insert into Orders values (?,?,?,?,?,?,?,?,?)";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, u.getId());
            st.setString(2, date);
            st.setDouble(3, cart.getTotalMoney());
            st.setString(4, note);
            st.setString(5, email);
            st.setString(6, name);
            st.setString(7, address);
            st.setString(8, country);
            st.setString(9, phone);
            st.executeUpdate();
            String sql1 = "select top 1 id from Orders order by id desc";
            PreparedStatement st1 = connection.prepareStatement(sql1);
            ResultSet rs = st1.executeQuery();
            if (rs.next()) {
                int user_id = rs.getInt(1);
                for (Item i : cart.getItems()) {
                    String sql2 = "insert into Order_Details values (?,?,?,?)";
                    PreparedStatement st2 = connection.prepareStatement(sql2);
                    st2.setInt(1, user_id);
                    st2.setInt(2, i.getProduct().getId());
                    st2.setDouble(3, i.getPrice());
                    st2.setInt(4, i.getQuantity());
                    st2.executeUpdate();
                }
            }
            String sql3 = "update Product set quantity = quantity - ?\n"
                    + "where id = ?";
            PreparedStatement st3 = connection.prepareStatement(sql3);
            for (Item i : cart.getItems()) {
                st3.setInt(1, i.getQuantity());
                st3.setInt(2, i.getProduct().getId());
                st3.executeUpdate();
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public int numberOfOrder() {
        String sql = " select count(o.id) as total from Orders o";
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


//    public static void main(String[] args) {
//        OrdersDAO od = new OrdersDAO();
//        User u = new User(6, "nam", "nam2892002", "Lsdf", "sfdsdf", "23", "dsf", 2);
//        Category category = new Category(2, "sfd", "sfs");
//        Product product = new Product(2, category, "sdfs", 2, 3, 3, "sfds", 2, 3, "sdf");
////        Item items = new Item(product, 12, 23);
//        Cart cart = new Cart();
//        cart.getTotalMoney();
//        od.addOrders(u, cart, "sf", "sdfs", "sfds", "sfsf", "sfsfd", "sfsd");
//    }
}
