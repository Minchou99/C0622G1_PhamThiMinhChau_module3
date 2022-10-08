package repository.contract.impl;

import model.contract.Contract;
import repository.BaseRepository;
import repository.contract.IContractRepository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ContractRepository implements IContractRepository {
    private static final String SELECT_ALL =
            "select c.*, (f.cost+sum(ifnull(cd.quantity, 0) * ifnull(af.attach_facility_cost, 0))) as total_money \n" +
                    "from contract c left join facility f on c.facility_id = f.id \n" +
                    "left join contract_detail cd on cd.contract_id = c.id\n" +
                    "left join attach_facility af on af.id = cd.attach_facility_id\n" +
                    "group by c.contract_id;";
    private static final String CREATE_CONTRACT= "insert into contract(start_date, end_date, deposit, employee_id, customer_id, facility_id) values(?,?,?,?,?,?);";



    @Override
    public List<Contract> showListContract() {
        List<Contract> contractList = new ArrayList<>();
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                String startDate = resultSet.getString("start_date");
                String endDate = resultSet.getString("end_date");
                double deposit = resultSet.getDouble("deposit");
                int employeeId = resultSet.getInt("employee_id");
                int customerId = resultSet.getInt("customer_id");
                int facilityId = resultSet.getInt("facility_id");
                double totalMoney =resultSet.getDouble("total_money");
                contractList.add(new Contract( id, startDate,endDate,deposit,employeeId,customerId,facilityId,totalMoney));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return contractList;
    }

    @Override
    public void addNewContract(Contract contract) {
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(CREATE_CONTRACT);
            preparedStatement.setString(1, contract.getStartDate());
            preparedStatement.setString(2, contract.getEndDate());
            preparedStatement.setDouble(3, contract.getDeposit());
            preparedStatement.setInt(4, contract.getEmployeeId());
            preparedStatement.setInt(5, contract.getCustomerId());
            preparedStatement.setInt(6, contract.getFacilityId());
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
