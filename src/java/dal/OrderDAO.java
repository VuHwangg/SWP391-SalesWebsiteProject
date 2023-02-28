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
import model.Order_Details;
import model.Product;

/**
 *
 * @author xuank
 */
public class OrderDAO extends DBContext {

    public boolean addOrder(int status, int cusId, String date, String note, float totalPrice) {
        boolean check = false;
        try {
            String sql = "Insert into [Order] "
                    + "(status,customer_id,date,note,total_price) values (?,?,?,?,?)";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, status);
            ps.setInt(2, cusId);
            ps.setString(3, date);
            ps.setString(4, note);
            ps.setFloat(5, totalPrice);

            check = ps.executeUpdate() > 0;

        } catch (Exception e) {
        }
        return check;
    }

    public boolean addOrder_Detail(int order_id, int product_id, int num, float price) {
        boolean check = false;
        try {
            String sql = "Insert into Order_Details "
                    + "(order_id,product_id,num,price) values (?,?,?,?)";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, order_id);
            ps.setInt(2, product_id);
            ps.setInt(3, num);
            ps.setFloat(4, price);

            check = ps.executeUpdate() > 0;

        } catch (Exception e) {
        }
        return check;
    }

    public int getLastOrderId() {
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            String sql = "SELECT TOP 1 order_id FROM [Order] ORDER BY order_id DESC;";
            stm = connection.prepareStatement(sql);
            rs = stm.executeQuery();
            if (rs.next()) {
                return rs.getInt("order_id");
            }

        } catch (Exception ex) {
            return 1;
        }
        return 1;
    }

    public ArrayList<Order> getOrder(int Custid) {
        ArrayList<Order> arr = new ArrayList<>();
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            String sql = "Select * from [Order] where customer_id = ? ";
            stm = connection.prepareStatement(sql);
            stm.setInt(1, Custid);

            rs = stm.executeQuery();
            while (rs.next()) {
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

    public ArrayList<Order_Details> getOrder_Details(int order_id) {
        ArrayList<Order_Details> arr = new ArrayList<>();
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            String sql = "Select * from Order_Details where order_id =?";
            stm = connection.prepareStatement(sql);
            stm.setInt(1, order_id);

            rs = stm.executeQuery();
            while (rs.next()) {

                int product_id = rs.getInt("product_id");
                int num = rs.getInt("num");
                float price = rs.getFloat("price");

                arr.add(new Order_Details(order_id, product_id, num, price));
            }

        } catch (Exception ex) {

        }
        return arr;
    }

    public Product getProduct(int product_id) {
        Product pro = new Product();
        PreparedStatement stm = null;
        ResultSet rs = null;

        try {

            String sql = "Select [name],color from Product where product_id = ?";
            stm = connection.prepareStatement(sql);
            stm.setInt(1, product_id);

            rs = stm.executeQuery();
            if (rs.next()) {

                String name = rs.getString("name");
                String color = rs.getString("color");
                pro = new Product(product_id, name, color);
            }

        } catch (Exception ex) {

        }
        return pro;
    }

    public Order getOrder1(int order_id) {
        Order arr = new Order();
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            String sql = "Select * from [Order] where order_id = ? ";
            stm = connection.prepareStatement(sql);
            stm.setInt(1, order_id);

            rs = stm.executeQuery();
            if (rs.next()) {

                int status = rs.getInt("status");
                int customer_id = rs.getInt("customer_id");
                Date date = rs.getDate("date");
                String note = rs.getString("note");
                float total_price = rs.getFloat("total_price");
                arr = new Order(order_id, status, customer_id, date, total_price);
            }

        } catch (Exception ex) {

        }
        return arr;
    }

    public Order getOrder2(int order_id, int customer_id) {
        Order arr = new Order();
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            String sql = "Select * from [Order] where order_id = ? and customer_id = ?  ";
            stm = connection.prepareStatement(sql);
            stm.setInt(1, order_id);
            stm.setInt(2, customer_id);
            rs = stm.executeQuery();
            if (rs.next()) {

                int status = rs.getInt("status");

                Date date = rs.getDate("date");
                String note = rs.getString("note");
                float total_price = rs.getFloat("total_price");
                arr = new Order(order_id, status, customer_id, date, total_price);
            }

        } catch (Exception ex) {

        }
        return arr;
    }

    public boolean updateStatusOrder(int order_id) {
        boolean check = false;
        try {
            String sql = "Update  [Order] set [status] = 4 where order_id = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, order_id);

            check = ps.executeUpdate() > 0;

        } catch (Exception e) {
        }
        return check;
    }

    public boolean checkExist(int cust_id) {
        boolean check = false;
        Product pro = new Product();
        PreparedStatement stm = null;
        ResultSet rs = null;
        int[] arr = null;
        int a = 0;
        try {

            String sql = "select cart_id from Cart where customer_id = ?";
            stm = connection.prepareStatement(sql);
            stm.setInt(1, cust_id);

            rs = stm.executeQuery();
            if (rs.next()) {

                arr[a] = rs.getInt("cart_id");
                a++;
            }
            if (a != 0) {
                check = true;
            }

        } catch (Exception ex) {

        }
        return check;
    }

    public boolean deleteCart(int cart_id) {
        boolean check = false;
        try {
            String sql = "delete from Cart where cart_id =?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, cart_id);

            int rowsAffected = ps.executeUpdate();
            if(rowsAffected > 0) check = true;

        } catch (Exception e) {
        }
        return check;

    }

//    public static void main(String[] args) {
//         ArrayList<Order_Details> arr = new ArrayList<>();
//         arr = new OrderDAO().GetOrder_Details(7);
//         if (arr.size()==0) System.out.println("1");
//    }
}
