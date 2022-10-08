package model.contract;

public class ContractDetail {
    private int id;
    private int contractId;
    private int attachFacilityId;
    private int quantity;

    public ContractDetail() {
    }

    public ContractDetail(int id, int contractId, int attachFacilityId, int quantity) {
        this.id = id;
        this.contractId = contractId;
        this.attachFacilityId = attachFacilityId;
        this.quantity= quantity;
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

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }
}
