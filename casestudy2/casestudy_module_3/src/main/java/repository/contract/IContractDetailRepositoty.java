package repository.contract;

import model.contract.ContractDetail;

import java.util.List;

public interface IContractDetailRepositoty {
    List<ContractDetail> showListContractDetail();

    boolean create(ContractDetail contractDetail);

    List<ContractDetail> showAttachFacility(int id);
}
