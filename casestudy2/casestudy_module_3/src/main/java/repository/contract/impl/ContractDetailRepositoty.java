package repository.contract.impl;

import model.contract.ContractDetail;
import repository.BaseRepository;
import repository.contract.IContractDetailRepositoty;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ContractDetailRepositoty implements IContractDetailRepositoty {
    private static final String SELECT_ALL = "select * from contract_detail;";
    private static final String INSERT = "insert into contract_detail(contract_id, attach_facility_id,quantity) values(?,?,?);";
    private static final String SELECT_BY_ID = "select * from contract_detail where id = ?;";


    @Override
    public List<ContractDetail> showListContractDetail() {
        List<ContractDetail> contractDetailList = new ArrayList<>();
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                int contractId = resultSet.getInt("contract_id");
                int attachFacilityId = resultSet.getInt("attach_facility_id");
                int quantity = resultSet.getInt("quantity");
                contractDetailList.add(new ContractDetail(id, contractId, attachFacilityId,quantity));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return contractDetailList;
    }

    @Override
    public boolean create(ContractDetail contractDetail) {
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(INSERT);
            preparedStatement.setInt(1, contractDetail.getContractId());
            preparedStatement.setInt(2, contractDetail.getAttachFacilityId());
            preparedStatement.setInt(3, contractDetail.getQuantity());
            int num = preparedStatement.executeUpdate();
            return (num == 1);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public List<ContractDetail> showAttachFacility(int id) {
        List<ContractDetail> contractDetailList = new ArrayList<>();
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_BY_ID);
            preparedStatement.setInt(1, id);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                int contractId = resultSet.getInt("contract_id");
                int attachFacilityId = resultSet.getInt("attach_facility_id");
                int quantity = resultSet.getInt("quantity");
                ContractDetail contractDetail = new ContractDetail(id, quantity, contractId, attachFacilityId);
                contractDetailList.add(contractDetail);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return contractDetailList;
    }
}
