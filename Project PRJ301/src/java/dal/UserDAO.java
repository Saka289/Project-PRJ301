/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.User;

/**
 *
 * @author Saka289
 */
public class UserDAO extends DBContext {

    public User checkUser(String username, String password) {
        String sql = "select * from [User]\n"
                + "where username = ? and password = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, username);
            st.setString(2, password);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                User u = new User(rs.getInt("id"), username, password,
                        rs.getString("nickname"), rs.getString("email"),
                        rs.getString("phone_number"), rs.getString("address"), rs.getInt("role_id"), rs.getString("image"));
                return u;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public boolean existedUser(String username) {
        String sql = "select * from [User]\n"
                + "where username = ? ";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, username);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return true;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return false;
    }

    public boolean existedEmailUser(String email) {
        String sql = "select * from [User]\n"
                + "where email = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, email);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return true;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return false;
    }

    public void registerUser(String username, String password, String nickname, String email, String phone_number, String address, int role_id, String image) {
        String sql = "insert into [User] values (?,?,?,?,?,?,?,?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, username);
            st.setString(2, password);
            st.setString(3, nickname);
            st.setString(4, email);
            st.setString(5, phone_number);
            st.setString(6, address);
            st.setInt(7, role_id);
            st.setString(8, image);
            st.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }
    }

    public void changeUser(String newpass, String email) {
        String sql = "update [User] set \n"
                + "password = ?\n"
                + "where email = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, newpass);
            st.setString(2, email);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public User getUserById(int id) {
        String sql = "select * from [User]\n"
                + "where id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                User u = new User();
                u.setId(rs.getInt("id"));
                u.setUsername(rs.getString("username"));
                u.setPassword(rs.getString("password"));
                u.setNickname(rs.getString("nickname"));
                u.setEmail(rs.getString("email"));
                u.setPhone_number(rs.getString("phone_number"));
                u.setAddress(rs.getString("address"));
                u.setRole_id(rs.getInt("role_id"));
                u.setImage(rs.getString("image"));
                return u;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public void updateUserImage(int id, String image) {
        String sql = "UPDATE [dbo].[User]\n"
                + "   SET [image] = ?\n"
                + " WHERE id = ? ";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, image);
            st.setInt(2, id);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public int numberOfAccount(int roleid) {
        String sql = "select count(u.id) as total from [User] u where u.role_id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, roleid);
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

    public void updateUser(int id, String nickname, String email, String phone, String address) {
        String sql = "UPDATE [dbo].[User]\n"
                + "   SET [nickname] = ?\n"
                + "      ,[email] = ?\n"
                + "      ,[phone_number] = ?\n"
                + "      ,[address] = ?\n"
                + " WHERE id = " + id;
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, nickname);
            st.setString(2, email);
            st.setString(3, phone);
            st.setString(4, address);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public List<User> top5User() {
        String sql = " select u.id,u.username,u.password,u.nickname,\n"
                + " u.email,u.phone_number,u.address,u.role_id,u.image,count(o.id) as[Total order] \n"
                + " from [User] u inner join Orders o on u.id = o.user_id\n"
                + " group by u.id,u.username,u.password,u.nickname,\n"
                + " u.email,u.phone_number,u.address,u.role_id,u.image\n"
                + " order by [Total order] desc";
        List<User> list = new ArrayList<>();
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                User u = new User();
                u.setId(rs.getInt("id"));
                u.setUsername(rs.getString("username"));
                u.setPassword(rs.getString("password"));
                u.setNickname(rs.getString("nickname"));
                u.setEmail(rs.getString("email"));
                u.setPhone_number(rs.getString("phone_number"));
                u.setAddress(rs.getString("address"));
                u.setRole_id(rs.getInt("role_id"));
                u.setImage(rs.getString("image"));
                list.add(u);

            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public static void main(String[] args) {

    }
}
