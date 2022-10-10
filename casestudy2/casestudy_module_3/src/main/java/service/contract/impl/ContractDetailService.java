package service.contract.impl;

import model.contract.ContractDetail;
import repository.contract.IContractDetailRepository;
import repository.contract.impl.ContractDetailRepository;
import service.contract.IContractDetailService;

import java.util.List;

public class ContractDetailService implements IContractDetailService {
    private IContractDetailRepository contractDetailRepository = new ContractDetailRepository();

    @Override
    public List<ContractDetail> showListContractDetail() {
        return contractDetailRepository.showListContractDetail();
    }

    @Override
    public boolean create(ContractDetail contractDetail) {
        return contractDetailRepository.create(contractDetail);
    }

    @Override
    public List<ContractDetail> showAttachFacility(int id) {
        return contractDetailRepository.showAttachFacility(id);
    }
}
