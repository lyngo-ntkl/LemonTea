/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.beverage;

/**
 *
 * @author Dell
 */
public class BeverageImage {
    private String imageID;
    private String productID;
    private byte[] image;

    public byte[] getImage() {
        return image;
    }

    public void setImage(byte[] image) {
        this.image = image;
    }

    public BeverageImage() {
    }

    public BeverageImage(String imageID, String productID, byte[] image) {
        this.imageID = imageID;
        this.productID = productID;
        this.image = image;
    }

    public String getImageID() {
        return imageID;
    }

    public void setImageID(String imageID) {
        this.imageID = imageID;
    }

    public String getProductID() {
        return productID;
    }

    public void setProductID(String productID) {
        this.productID = productID;
    }
}
