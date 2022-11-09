/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Saka289
 */
public class Cart {

    private List<Item> items;

    public Cart() {
        items = new ArrayList<>();
    }

    public Cart(List<Item> items) {
        this.items = items;
    }

    public List<Item> getItems() {
        return items;
    }

    public void setItems(List<Item> items) {
        this.items = items;
    }

    private Item getItemById(int id) {
        for (Item i : items) {
            if (i.getProduct().getId() == id) {
                return i;
            }
        }
        return null;
    }

    //tra ve so luong khi biet id
    public int getQuantityById(int id) {
        return getItemById(id).getQuantity();
    }

    //them 1 san pham vao gio hang
    public void addItem(Item t) {
        //co trong gio roi 
        if (getItemById(t.getProduct().getId()) != null) {
            //lay tu gio hang ra
            Item i = getItemById(t.getProduct().getId());
            i.setQuantity(i.getQuantity() + t.getQuantity());
        } else {
            //chua co thi add vao gio
            items.add(t);
        }
    }

    public void removeItem(int id) {
        if (getItemById(id) != null) {
            items.remove(getItemById(id));
        }
    }

    public double getTotalMoney() {
        double t = 0;
        for (Item i : items) {
            t += i.getQuantity() * i.getPrice();
        }
        return t;
    }
}
