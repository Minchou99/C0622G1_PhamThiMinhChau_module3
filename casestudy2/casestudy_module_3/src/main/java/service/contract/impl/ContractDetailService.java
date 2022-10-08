package service.contract.impl;

import model.contract.ContractDetail;
import service.contract.IContractDetailService;

import java.util.List;

public class ContractDetailService implements IContractDetailService {
    @Override
    public List<ContractDetail> showListContractDetail() {
        return null;
    }

    @Override
    public boolean create(ContractDetail contractDetail) {
        return false;
    }

    @Override
    public List<ContractDetail> showAttachFacility(int id) {
        return null;
    }
}
