/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.beverage;

import java.util.HashMap;
import java.util.Map;

/**
 *
 * @author Dell
 */
public class Cart {

    private Map<String, Beverage> cart;

    public Cart() {
    }

    public Cart(Map<String, Beverage> cart) {
        this.cart = cart;
    }

    public Map<String, Beverage> getCart() {
        return cart;
    }

    public void setCart(Map<String, Beverage> cart) {
        this.cart = cart;
    }

    public boolean add(Beverage beverage) {
        boolean check = false;
        if (beverage.getQuantity() > 0) {
            String productID = beverage.getProductID();
            if (this.cart == null) {
                this.cart = new HashMap<>();
            }
            if (this.cart.containsKey(productID)) {
                int currentQuantity = this.cart.get(productID).getQuantity();
                beverage.setQuantity(currentQuantity + beverage.getQuantity());
            }
            this.cart.put(productID, beverage);
        }
        check = true;
        return check;
    }

    public boolean remove(String id) {
        boolean check = false;
        if (this.cart != null) {
            if (this.cart.containsKey(id)) {
                this.cart.remove(id);
                check = true;
            }
        }
        return check;
    }

    public boolean update(String id, Beverage drink) {
        boolean check = false;
        if( this.cart!=null){
            if(this.cart.containsKey(id)){
                this.cart.replace(id, drink);
            }
        }
        return check;
    }
}
