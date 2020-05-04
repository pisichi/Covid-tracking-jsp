/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import static java.lang.Integer.parseInt;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.AllCasesData;
import model.ReportData;
import service.OpenCasesService;
import org.json.JSONArray;
import org.json.JSONObject;
import service.CaseSumService;

/**
 *
 * @author User
 */
public class ViewAllCaseController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        //JSONArray caseArr = new JSONArray();
        AllCasesData data = new AllCasesData();
        int ageMin = 0;
        int ageMax = 0;
        try {
            

            String gender = request.getParameter("gender");
            String nation = request.getParameter("nation");
            String province = request.getParameter("province");
            String min = request.getParameter("min");
            String max = request.getParameter("max");
            
            JSONObject country = CaseSumService.getNation();
            JSONObject provinces = CaseSumService.getProvince();
            
            if(gender == null && nation == null &&  min == null && max == null && province == null)
            data = OpenCasesService.getDatas();

            else
            data = OpenCasesService.getDataParams(nation,province, min, max, gender);
            
            
            ReportData report = OpenCasesService.makeReport(data);
            
            request.setAttribute("OpenCase", data);
            request.setAttribute("Country", country);
            request.setAttribute("Province", provinces);
            
            
            request.setAttribute("Report", report);
            
            
            request.setAttribute("province", province);
            request.setAttribute("gender", gender);
            request.setAttribute("nation", nation);
            request.setAttribute("min", min);
            request.setAttribute("max", max);
            request.getRequestDispatcher("viewallcase.jsp").forward(request, response);
        } catch (Exception ex) {
            Logger.getLogger(ViewAllCaseController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
