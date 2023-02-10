/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.sql.Date;

/**
 *
 * @author xuank
 */
public class Order {
    private int order_id;
    private int status;
    private int customer_id;
    private Date date;
    private String note;
    private float total_price;
    

    public Order() {
    }

    public Order(int status, int customer_id, Date date, String note, float total_price) {
        this.status = status;
        this.customer_id = customer_id;
        this.date = date;
        this.note = note;
        this.total_price = total_price;
    }

    public Order(int order_id, int status, int customer_id, Date date, float total_price) {
        this.order_id = order_id;
        this.status = status;
        this.customer_id = customer_id;
        this.date = date;
        this.total_price = total_price;
    }
    

    public Order(int status, int customer_id, Date date, float total_price) {
        this.status = status;
        this.customer_id = customer_id;
        this.date = date;
        this.total_price = total_price;
    }

    public int getOrder_id() {
        return order_id;
    }

    public void setOrder_id(int order_id) {
        this.order_id = order_id;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public int getCustomer_id() {
        return customer_id;
    }

    public void setCustomer_id(int customer_id) {
        this.customer_id = customer_id;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }

    public float getTotal_price() {
        return total_price;
    }

    public void setTotal_price(float total_price) {
        this.total_price = total_price;
    }
    
    
}
