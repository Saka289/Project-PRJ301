/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author Saka289
 */
public class Orders {

    private int id;
    private int user_id;
    private String order_date;
    private double total_money;
    private String note;
    private String email;
    private String fullname;
    private String address;
    private String country;
    private String phone;

    public Orders() {
    }

    public Orders(int id, int user_id, String order_date, double total_money, String note, String email, String fullname, String address, String country, String phone) {
        this.id = id;
        this.user_id = user_id;
        this.order_date = order_date;
        this.total_money = total_money;
        this.note = note;
        this.email = email;
        this.fullname = fullname;
        this.address = address;
        this.country = country;
        this.phone = phone;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getUser_id() {
        return user_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    public String getOrder_date() {
        return order_date;
    }

    public void setOrder_date(String order_date) {
        this.order_date = order_date;
    }

    public double getTotal_money() {
        return total_money;
    }

    public void setTotal_money(double total_money) {
        this.total_money = total_money;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getFullname() {
        return fullname;
    }

    public void setFullname(String fullname) {
        this.fullname = fullname;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getCountry() {
        return country;
    }

    public void setCountry(String country) {
        this.country = country;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    @Override
    public String toString() {
        return "Orders{" + "id=" + id + ", user_id=" + user_id + ", order_date=" + order_date + ", total_money=" + total_money + ", note=" + note + ", email=" + email + ", fullname=" + fullname + ", address=" + address + ", country=" + country + ", phone=" + phone + '}';
    }
    
}
