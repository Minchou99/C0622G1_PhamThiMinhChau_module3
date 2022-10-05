package model.facility;

public class Room extends Facility {
    private String facilityFree;

    public Room() {
    }

    public Room(String facilityId, String facilityName, double area, double cost, int maxPeople, String rentType, String facilityFree) {
        super(facilityId, facilityName, area, cost, maxPeople, rentType);
        this.facilityFree = facilityFree;
    }

    public String getFacilityFree() {
        return facilityFree;
    }

    public void setFacilityFree(String facilityFree) {
        this.facilityFree = facilityFree;
    }
}
