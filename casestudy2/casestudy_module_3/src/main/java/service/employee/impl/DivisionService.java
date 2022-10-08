package service.employee.impl;

import model.employee.Division;
import repository.employee.IDivisionRepository;
import repository.employee.impl.DivisionRepository;
import service.employee.IDivisionService;

import java.util.List;

public class DivisionService implements IDivisionService {
    private IDivisionRepository divisionRepository = new DivisionRepository();
    @Override
    public List<Division> showListDivision() {
        return divisionRepository.showListDivision();
    }
}
