/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;


/**
 *
 * @author admin
 */
public class Promotion {
    private String promotion_id, description  ,StartDate, EndDate, price;

    private String id;
    private String description;
    private Date startDate;
    private Date endDate;
    private float amount;

    public Promotion() {
    }

    public Promotion(String id, String description, Date startDate, Date endDate, float amount) {
        this.id = id;
        this.description = description;
        this.StartDate = StartDate;
        this.EndDate = EndDate;
        this.price = price;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getStartDate() {
        return StartDate;
    }

    public void setStartDate(String StartDate) {
        this.StartDate = StartDate;
    }

    public String getEndDate() {
        return EndDate;
    }

    public void setEndDate(String EndDate) {
        this.EndDate = EndDate;
    }

    public String getPrice() {
        return price;
    }

    public void setPrice(String price) {
        this.price = price;
    }

}
