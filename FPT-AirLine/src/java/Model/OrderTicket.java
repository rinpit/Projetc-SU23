package Model;

import java.util.Date;

public class OrderTicket {

    private String orderID, departure, startTime, destination, endTime;
    private Date startDate, endDate;
    private float totalAmount;
    public OrderTicket() {
    }

    public OrderTicket(String orderID, float totalAmount, String departure, Date startDate, String startTime, String destination, Date endDate, String endTime) {
        this.orderID = orderID;
        this.departure = departure;
        this.startTime = startTime;
        this.destination = destination;
        this.endTime = endTime;
        this.startDate = startDate;
        this.endDate = endDate;
        this.totalAmount = totalAmount;
    }

    public String getOrderID() {
        return orderID;
    }

    public String getDeparture() {
        return departure;
    }

    public String getStartTime() {
        return startTime;
    }

    public String getDestination() {
        return destination;
    }

    public String getEndTime() {
        return endTime;
    }

    public Date getStartDate() {
        return startDate;
    }

    public Date getEndDate() {
        return endDate;
    }

    public float getTotalAmount() {
        return totalAmount;
    }

    public void setOrderID(String billID) {
        this.orderID = billID;
    }

    public void setDeparture(String departure) {
        this.departure = departure;
    }

    public void setStartTime(String startTime) {
        this.startTime = startTime;
    }

    public void setDestination(String destination) {
        this.destination = destination;
    }

    public void setEndTime(String endTime) {
        this.endTime = endTime;
    }

    public void setStartDate(Date startDate) {
        this.startDate = startDate;
    }

    public void setEndDate(Date endDate) {
        this.endDate = endDate;
    }

    public void setTotalAmount(float totalAmount) {
        this.totalAmount = totalAmount;
    }

}
