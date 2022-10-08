package service.contract.impl;

import model.contract.AttachFacility;
import repository.contract.IAttachFacilityRepositoty;
import repository.contract.impl.AttachFacilityRepositoty;
import service.contract.IAttachFacilityService;

import java.util.List;

public class AttachFacilityService implements IAttachFacilityService {
private IAttachFacilityRepositoty attachFacilityRepositoty = new AttachFacilityRepositoty();

    @Override
    public List<AttachFacility> showListAttachFacility() {
        return attachFacilityRepositoty.showListAttachFacility();
    }
}
