package Model;

public class Flight {

    String flightId;
    String startDate;
    String endDate;
    String startTime;
    String endTime;
    String departure;
    String destination;
    int seatB;
    int seatC;

    public Flight() {
    }

    public Flight(String flightId, String startDate, String endDate, String startTime, String endTime, String departure, String destination, int seatB, int seatC) {
        this.flightId = flightId;
        this.startDate = startDate;
        this.endDate = endDate;
        this.startTime = startTime;
        this.endTime = endTime;
        this.departure = departure;
        this.destination = destination;
        this.seatB = seatB;
        this.seatC = seatC;
    }

    public Flight(String flightId, String startDate, String startTime, String endTime, String departure, String destination) {
        this.flightId = flightId;
        this.startDate = startDate;
        this.startTime = startTime;
        this.endTime = endTime;
        this.departure = departure;
        this.destination = destination;
    }

    public String getFlightId() {
        return flightId;
    }

    public void setFlightId(String flightId) {
        this.flightId = flightId;
    }

    public String getStartDate() {
        return startDate;
    }

    public void setStartDate(String startDate) {
        this.startDate = startDate;
    }

    public String getEndDate() {
        return endDate;
    }

    public void setEndDate(String endDate) {
        this.endDate = endDate;
    }

    public String getStartTime() {
        return startTime;
    }

    public void setStartTime(String startTime) {
        this.startTime = startTime;
    }

    public String getEndTime() {
        return endTime;
    }

    public void setEndTime(String endTime) {
        this.endTime = endTime;
    }

    public String getDeparture() {
        return departure;
    }

    public void setDeparture(String departure) {
        this.departure = departure;
    }

    public String getDestination() {
        return destination;
    }

    public void setDestination(String destination) {
        this.destination = destination;
    }

    public int getSeatB() {
        return seatB;
    }

    public void setSeatB(int seatB) {
        this.seatB = seatB;
    }

    public int getSeatC() {
        return seatC;
    }

    public void setSeatC(int seatC) {
        this.seatC = seatC;
    }

    @Override
    public String toString() {
        return "Flight{" + "flightId=" + flightId + ", startDate=" + startDate + ", endDate=" + endDate + ", startTime=" + startTime + ", endTime=" + endTime + ", departure=" + departure + ", destination=" + destination + ", seatB=" + seatB + ", seatC=" + seatC + '}';
    }

}
