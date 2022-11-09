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
import model.Brands;

/**
 *
 * @author Saka289
 */
public class BrandsDAO extends DBContext {

    public List<Brands> getAllBrand() {
        List<Brands> list = new ArrayList<>();
        String sql = "select * from Brands";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Brands b = new Brands();
                b.setId(rs.getInt("id"));
                b.setName(rs.getString("name"));
                list.add(b);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

}
