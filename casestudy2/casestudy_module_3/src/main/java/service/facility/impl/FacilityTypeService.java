package service.facility.impl;

import model.facility.FacilityType;
import repository.facility.IFacilityTypeRepository;
import repository.facility.impl.FacilityTypeRepository;
import service.facility.IFacilityTypeService;

import java.util.List;

public class FacilityTypeService implements IFacilityTypeService {
    private IFacilityTypeRepository facilityTypeRepository = new FacilityTypeRepository();
    @Override
    public List<FacilityType> showListFacilityType() {
        return facilityTypeRepository.showListFacilityType();
    }
}
