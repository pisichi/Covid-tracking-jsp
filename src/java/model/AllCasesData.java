/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author User
 */
public class AllCasesData {
    private String LastData;
    private String UpdateDate;
    private List<CasesData> Cases = new ArrayList<>();

    public String getLastData() {
        return LastData;
    }

    public void setLastData(String LastData) {
        this.LastData = LastData;
    }

    public String getUpdateDate() {
        return UpdateDate;
    }

    public void setUpdateDate(String UpdateDate) {
        this.UpdateDate = UpdateDate;
    }

    public List<CasesData> getCases() {
        return Cases;
    }

    public void setCases(List<CasesData> Cases) {
        this.Cases = Cases;
    }
    
    

}
