/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author Saka289
 */
public class Feedback {

    private int id;
    private String note;
    private String date;
    private int rating;
    private User user;
    private int product_id;

    public Feedback() {
    }

    public Feedback(int id, String note, String date, int rating, User user, int product_id) {
        this.id = id;
        this.note = note;
        this.date = date;
        this.rating = rating;
        this.user = user;
        this.product_id = product_id;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public int getRating() {
        return rating;
    }

    public void setRating(int rating) {
        this.rating = rating;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public int getProduct_id() {
        return product_id;
    }

    public void setProduct_id(int product_id) {
        this.product_id = product_id;
    }

    @Override
    public String toString() {
        return "Feedback{" + "id=" + id + ", note=" + note + ", date=" + date + ", rating=" + rating + ", user=" + user + ", product_id=" + product_id + '}';
    }

}
