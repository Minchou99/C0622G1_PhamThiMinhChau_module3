package repository.contract.impl;

import model.contract.AttachFacility;
import repository.BaseRepository;
import repository.contract.IAttachFacilityRepositoty;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class AttachFacilityRepositoty implements IAttachFacilityRepositoty {
    private static final String SELECT_ALL = "select * from attach_facility;";


    @Override
    public List<AttachFacility> showListAttachFacility() {
        List<AttachFacility> attachFacilityList = new ArrayList<>();
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                String name = resultSet.getString("name");
                double cost = resultSet.getDouble("cost");
                String unit = resultSet.getString("unit");
                String status = resultSet.getString("status");
                attachFacilityList.add(new AttachFacility(id, name, cost, unit, status));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return attachFacilityList;
    }
}
