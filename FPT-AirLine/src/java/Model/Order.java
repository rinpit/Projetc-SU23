package Model;


public class Order {
    private String orderID;
    private String date;
    private String promotionID;
    private float tax;
    private float totalAmount;

    public Order() {
    }

    public Order(String orderID, String date, String promotionID, float tax, float totalAmount) {
        this.orderID = orderID;
        this.date = date;
        this.promotionID = promotionID;
        this.tax = tax;
        this.totalAmount = totalAmount;
    }

    public Order(String orderID, String date, float tax, float totalAmount) {
        this.orderID = orderID;
        this.date = date;
        this.tax = tax;
        this.totalAmount = totalAmount;
    }

    public String getOrderID() {
        return orderID;
    }

    public void setOrderID(String orderID) {
        this.orderID = orderID;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public String getPromotionID() {
        return promotionID;
    }

    public void setPromotionID(String promotionID) {
        this.promotionID = promotionID;
    }

    public float getTax() {
        return tax;
    }

    public void setTax(float tax) {
        this.tax = tax;
    }

    public float getTotalAmount() {
        return totalAmount;
    }

    public void setTotalAmount(float totalAmount) {
        this.totalAmount = totalAmount;
    }

    @Override
    public String toString() {
        return "Order{" + "orderID=" + orderID + ", date=" + date + ", promotionID=" + promotionID + ", tax=" + tax + ", totalAmount=" + totalAmount + '}';
    }
}