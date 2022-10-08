package service.contract.impl;

import model.contract.Contract;
import service.contract.IContractService;

import java.util.List;

public class ContractService implements IContractService{
    @Override
    public List<Contract> showListContract() {
        return null;
    }

    @Override
    public boolean addNewContract(Contract contract) {
        return false;
    }
}
