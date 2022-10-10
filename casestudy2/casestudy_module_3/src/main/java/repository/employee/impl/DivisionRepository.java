package repository.employee.impl;

import model.employee.Division;
import repository.BaseRepository;
import repository.employee.IDivisionRepository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class DivisionRepository implements IDivisionRepository {
    private static final String FIND_ALL = "select * from division;";
    @Override
    public List<Division> showListDivision() {
        List<Division> divisionList = new ArrayList<>();
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(FIND_ALL);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()){
                int divisionId = resultSet.getInt("id");
                String divisionName = resultSet.getString("name");
                divisionList.add(new Division(divisionId,divisionName));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return divisionList;
    }
}
