package service.contract.impl;

import model.contract.AttachFacility;
import repository.contract.IAttachFacilityRepository;
import repository.contract.impl.AttachFacilityRepository;
import service.contract.IAttachFacilityService;

import java.util.List;

public class AttachFacilityService implements IAttachFacilityService {
private IAttachFacilityRepository attachFacilityRepositoty = new AttachFacilityRepository();

    @Override
    public List<AttachFacility> showListAttachFacility() {
        return attachFacilityRepositoty.showListAttachFacility();
    }
}
