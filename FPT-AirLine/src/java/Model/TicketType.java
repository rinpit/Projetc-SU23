package Model;

public class TicketType {
    private String ticketId;
    private String ticketType;
    private float ticketPrice;

    public TicketType() {
    }

    public TicketType(String ticketId, String ticketType, float ticketPrice) {
        this.ticketId = ticketId;
        this.ticketType = ticketType;
        this.ticketPrice = ticketPrice;
    }

    public TicketType(String ticketType, float ticketPrice) {
        this.ticketType = ticketType;
        this.ticketPrice = ticketPrice;
    }

    public String getTicketId() {
        return ticketId;
    }

    public void setTicketId(String ticketId) {
        this.ticketId = ticketId;
    }

    public String getTicketType() {
        return ticketType;
    }

    public void setTicketType(String ticketType) {
        this.ticketType = ticketType;
    }

    public float getTicketPrice() {
        return ticketPrice;
    }

    public void setTicketPrice(float ticketPrice) {
        this.ticketPrice = ticketPrice;
    }

    @Override
    public String toString() {
        return "Ticket{" +
                "ticketId='" + ticketId + '\'' +
                ", ticketType='" + ticketType + '\'' +
                ", ticketPrice='" + ticketPrice + '\'' +
                '}';
    }
}
