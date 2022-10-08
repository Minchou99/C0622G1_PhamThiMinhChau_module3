package service.facility.impl;

import model.facility.Facility;
import repository.facility.IFacilityRepository;
import repository.facility.impl.FacilityRepository;
import service.facility.IFacilityService;

import java.util.List;

public class FacilityService implements IFacilityService {
    private IFacilityRepository facilityRepository = new FacilityRepository();

    @Override
    public List<Facility> showListFacility() {
        return facilityRepository.showListFacility();
    }

    @Override
    public boolean addNewFacility(Facility facility) {
        facilityRepository.addNewFacility(facility);
        return false;
    }

    @Override
    public void deleteFacility(int id) {
        facilityRepository.deleteFacility(id);
    }

    @Override
    public void updateFacility(Facility facility) {
        facilityRepository.updateFacility(facility);
    }

    @Override
    public Facility findById(int id) {
        return facilityRepository.findById(id);
    }

    @Override
    public List<Facility> search(String facilityName, String facilityTypeName) {
        return facilityRepository.search(facilityName, facilityTypeName);
    }
}
