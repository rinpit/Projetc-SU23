package Model;

public class TicketType {
    private String ticketTypeId;
    private String ticketType;
    private String ticketPrice;
    private String ticketSum;

    public TicketType() {
    }

    public TicketType(String ticketId, String ticketType, String ticketPrice) {
        this.ticketTypeId = ticketId;
        this.ticketType = ticketType;
        this.ticketPrice = ticketPrice;
    }

    public TicketType(String ticketType, String ticketPrice) {
        this.ticketType = ticketType;
        this.ticketPrice = ticketPrice;
    }


    public String getTicketTypeId() {
        return ticketTypeId;
    }

    public void setTicketTypeId(String ticketTypeId) {
        this.ticketTypeId = ticketTypeId;
    }


    public String getTicketType() {
        return ticketType;
    }

    public void setTicketType(String ticketType) {
        this.ticketType = ticketType;
    }

    public String getTicketPrice() {
        return ticketPrice;
    }

    public void setTicketPrice(String ticketPrice) {
        this.ticketPrice = ticketPrice;
    }

    public String getTicketSum() {
        return ticketSum;
    }

    public void setTicketSum(String ticketSum) {
        this.ticketSum = ticketSum;
    }

    @Override
    public String toString() {
        return "TicketType{" +
                "ticketTypeId='" + ticketTypeId + '\'' +
                ", ticketType='" + ticketType + '\'' +
                ", ticketPrice='" + ticketPrice + '\'' +
                '}';
    }
}