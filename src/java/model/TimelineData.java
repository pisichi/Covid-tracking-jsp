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
public class TimelineData {
    private  String UpdateDate;
    private List<DailyData> Daily = new ArrayList<>();

    public String getUpdateDate() {
        return UpdateDate;
    }

    public void setUpdateDate(String UpdateDate) {
        this.UpdateDate = UpdateDate;
    }

    public List<DailyData> getDaily() {
        return Daily;
    }

    public void setDaily(List<DailyData> Daily) {
        this.Daily = Daily;
    }
    
    
}
