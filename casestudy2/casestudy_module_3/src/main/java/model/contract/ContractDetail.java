package model.contract;

public class ContractDetail {
    private int id;
    private int contractId;
    private int attachFacilityId;

    public ContractDetail() {
    }

    public ContractDetail(int id, int contractId, int attachFacilityId) {
        this.id = id;
        this.contractId = contractId;
        this.attachFacilityId = attachFacilityId;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getContractId() {
        return contractId;
    }

    public void setContractId(int contractId) {
        this.contractId = contractId;
    }

    public int getAttachFacilityId() {
        return attachFacilityId;
    }

    public void setAttachFacilityId(int attachFacilityId) {
        this.attachFacilityId = attachFacilityId;
    }
}
