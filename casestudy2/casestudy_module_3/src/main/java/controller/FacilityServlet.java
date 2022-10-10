package controller;


import model.facility.Facility;
import model.facility.FacilityType;
import model.facility.RentType;
import service.facility.IFacilityService;
import service.facility.IFacilityTypeService;
import service.facility.IRentTypeService;
import service.facility.impl.FacilityService;
import service.facility.impl.FacilityTypeService;
import service.facility.impl.RentTypeService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "FacilityServlet", value = "/facilities")
public class FacilityServlet extends HttpServlet {
    private IFacilityService facilityService = new FacilityService();
    private IRentTypeService rentTypeService = new RentTypeService();
    private IFacilityTypeService facilityTypeService = new FacilityTypeService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "createVilla":
                showCreateVillaForm(request, response);
                break;
            case "createHouse":
                showCreateHouseForm(request, response);
                break;
            case "createRoom":
                showCreateRoomForm(request, response);
                break;
            case "update":
                showUpdateForm(request, response);
                break;
            case "delete":
                deleteFacility(request, response);
                break;
            case "search":
                searchFacility(request, response);
                break;
            default:
                showFacilityList(request, response);
        }
    }

    private void showCreateRoomForm(HttpServletRequest request, HttpServletResponse response) {

    }

    private void showCreateHouseForm(HttpServletRequest request, HttpServletResponse response) {

    }

    private void showCreateVillaForm(HttpServletRequest request, HttpServletResponse response) {

    }

    private void searchFacility(HttpServletRequest request, HttpServletResponse response) {
        String facilityName = request.getParameter("facilityName");
        String facilityTypeName = request.getParameter("facilityTypeName");
        List<Facility> facilityList = facilityService.search(facilityName, facilityTypeName);
        List<FacilityType> facilityTypeList = facilityTypeService.showListFacilityType();
        List<RentType> rentTypeList = rentTypeService.showListRentType();
        request.setAttribute("facilityList", facilityList);
        request.setAttribute("facilityTypeList", facilityTypeList);
        request.setAttribute("rentTypeList", rentTypeList);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("view/facility/list.jsp");
        try {
            requestDispatcher.forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }

    private void showUpdateForm(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        Facility facility = facilityService.findById(id);
        request.setAttribute("facility", facility);
        if (facility.getFacilityTypeId() == 1) {
            try {
                request.getRequestDispatcher("view/edit_villa.jsp").forward(request, response);
            } catch (ServletException e) {
                e.printStackTrace();
            } catch (IOException e) {
                e.printStackTrace();
            }
        } else if (facility.getFacilityTypeId() == 2) {
            try {
                request.getRequestDispatcher("view/edit_house.jsp").forward(request, response);
            } catch (ServletException e) {
                e.printStackTrace();
            } catch (IOException e) {
                e.printStackTrace();
            }
        } else if (facility.getFacilityTypeId() == 3) {
            try {
                request.getRequestDispatcher("view/edit_room.jsp").forward(request, response);
            } catch (ServletException e) {
                e.printStackTrace();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }

    private void showCreateForm(HttpServletRequest request, HttpServletResponse response) {
        List<FacilityType> facilityTypeList = facilityTypeService.showListFacilityType();
        List<RentType> rentTypeList = rentTypeService.showListRentType();
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("view/facility/create.jsp");
        request.setAttribute("facilityTypeList", facilityTypeList);
        request.setAttribute("rentTypeList", rentTypeList);
        try {
            requestDispatcher.forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }

    private void deleteFacility(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        facilityService.deleteFacility(id);
        try {
            response.sendRedirect("/facilities");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void showFacilityList(HttpServletRequest request, HttpServletResponse response) {
        String msg = request.getParameter("msg");
        List<Facility> facilityList = facilityService.showListFacility();
        List<FacilityType> facilityTypeList = facilityTypeService.showListFacilityType();
        List<RentType> rentTypeList = rentTypeService.showListRentType();
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("view/facility/list.jsp");
        request.setAttribute("facilityList", facilityList);
        request.setAttribute("facilityTypeList", facilityTypeList);
        request.setAttribute("rentTypeList", rentTypeList);
        request.setAttribute("msg", msg);
        try {
            requestDispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                createFacility(request, response);
                break;
            case "update":
                updateFacility(request, response);
                break;
            default:
        }
    }

    private void updateFacility(HttpServletRequest request, HttpServletResponse response) {
        int facilityId = Integer.parseInt(request.getParameter("id"));
        String facilityName = request.getParameter("name");
        int facilityArea = Integer.parseInt(request.getParameter("area"));
        double facilityCost = Double.parseDouble(request.getParameter("cost"));
        int maxPeople = Integer.parseInt(request.getParameter("max_people"));
        int rentTypeId = Integer.parseInt(request.getParameter("rent_type_id"));
        int facilityTypeId = Integer.parseInt(request.getParameter("facility_type_id"));
        String standardRoom = request.getParameter("standard_room");
        String descriptionOtherConvenience = request.getParameter("description_other_convenience");
        double poolArea = Double.parseDouble(request.getParameter("pool_area"));
        int numberOfFloor = Integer.parseInt(request.getParameter("number_of_floor"));
        String facilityFree = request.getParameter("facility_free");
              facilityService.updateFacility(new Facility(facilityId, facilityName, facilityArea, facilityCost, maxPeople, rentTypeId, facilityTypeId, standardRoom,
                descriptionOtherConvenience, poolArea, numberOfFloor, facilityFree));
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("view/facility/update.jsp");
        request.setAttribute("mess", "Update customer's information successfully!");
        try {
            requestDispatcher.forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }

    private void createFacility(HttpServletRequest request, HttpServletResponse response) {
        int facilityId = Integer.parseInt(request.getParameter("id"));
        String facilityName = request.getParameter("name");
        int facilityArea = Integer.parseInt(request.getParameter("area"));
        double facilityCost = Double.parseDouble(request.getParameter("cost"));
        int maxPeople = Integer.parseInt(request.getParameter("max_people"));
        int rentTypeId = Integer.parseInt(request.getParameter("rent_type_id"));
        int facilityTypeId = Integer.parseInt(request.getParameter("facility_type_id"));
        String standardRoom = request.getParameter("standard_room");
        String descriptionOtherConvenience = request.getParameter("description_other_convenience");
        double poolArea = Double.parseDouble(request.getParameter("pool_area"));
        int numberOfFloor = Integer.parseInt(request.getParameter("number_of_floor"));
        String facilityFree = request.getParameter("facility_free");
        facilityService.addNewFacility(new Facility(facilityId, facilityName, facilityArea, facilityCost, maxPeople, rentTypeId, facilityTypeId, standardRoom,
                descriptionOtherConvenience, poolArea, numberOfFloor, facilityFree));

        boolean check = facilityService.addNewFacility(new Facility(facilityId, facilityName, facilityArea, facilityCost, maxPeople, rentTypeId, facilityTypeId, standardRoom,
                descriptionOtherConvenience, poolArea, numberOfFloor, facilityFree));
        String mess = "Add new facility successfully!";
        if (check) {
            mess = "Can not add new facility!";
        }
        request.setAttribute("mess", mess);
        showCreateForm(request, response);
    }
}