/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author Saka289
 */
public class Product {
    private int id;
    private Category category;
    private String title;
    private double price;
    private int quantity;
    private int discount;
    private String description;
    private int status;
    private int brand_id;
    private String image;

    public Product() {
    }

    public Product(int id, Category category, String title, double price, int quantity, int discount, String description, int status, int brand_id, String image) {
        this.id = id;
        this.category = category;
        this.title = title;
        this.price = price;
        this.quantity = quantity;
        this.discount = discount;
        this.description = description;
        this.status = status;
        this.brand_id = brand_id;
        this.image = image;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Category getCategory() {
        return category;
    }

    public void setCategory(Category category) {
        this.category = category;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public int getDiscount() {
        return discount;
    }

    public void setDiscount(int discount) {
        this.discount = discount;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public int getBrand_id() {
        return brand_id;
    }

    public void setBrand_id(int brand_id) {
        this.brand_id = brand_id;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    @Override
    public String toString() {
        return "Product{" + "id=" + id + ", category=" + category + ", title=" + title + ", price=" + price + ", quantity=" + quantity + ", discount=" + discount + ", description=" + description + ", status=" + status + ", brand_id=" + brand_id + ", image=" + image + '}';
    }
    
    
}
