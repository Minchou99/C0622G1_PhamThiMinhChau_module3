package repository.facility;

import model.facility.Facility;

import java.util.List;

public interface IFacilityRepository {
    List<Facility> showListFacility();

    void addNewFacility(Facility facility);

    void deleteFacility(int id);

    void updateFacility(Facility facility);

    Facility findById(int id);

    List<Facility> search(String facilityName, String facilityTypeName);
}
