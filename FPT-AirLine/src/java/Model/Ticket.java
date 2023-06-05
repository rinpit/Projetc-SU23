package Model;

public class Ticket {
    private String ticketId;
    private String ticketType;
    private String ticketPrice;

    public Ticket(String ticketType, String ticketPrice) {
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

    public String getTicketPrice() {
        return ticketPrice;
    }

    public void setTicketPrice(String ticketPrice) {
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
