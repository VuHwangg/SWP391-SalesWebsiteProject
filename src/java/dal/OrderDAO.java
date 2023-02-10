/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import com.mysql.cj.Messages;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import model.Account;
import model.Order;

/**
 *
 * @author xuank
 */
public class OrderDAO extends DBContext {

    public ArrayList<Order> GetOrder(int Custid) {
        ArrayList<Order> arr = new ArrayList<>();
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            String sql = "Select * from [Order] where customer_id = ? ";
            stm = connection.prepareStatement(sql);
            stm.setInt(1, Custid);

            rs = stm.executeQuery();
            if (rs.next()) {
                int order_id = rs.getInt("order_id");
                int status = rs.getInt("status");
                int customer_id = rs.getInt("customer_id");
                Date date = rs.getDate("date");
                String note = rs.getString("note");
                float total_price = rs.getFloat("total_price");
                arr.add(new Order(order_id, status, customer_id, date, total_price));
            }

        } catch (Exception ex) {

        }
        return arr;
    }

}
