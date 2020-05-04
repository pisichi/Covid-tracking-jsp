/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package service;


import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;
import java.util.List;
import model.DailyData;
import model.TimelineData;
import org.json.JSONArray;
import org.json.JSONObject;

/**
 *
 * @author User
 */
public class TimelineService {

  

    public static TimelineData getDatas() throws Exception {
        String url = "https://covid19.th-stat.com/api/open/timeline";
        URL obj = new URL(url);
        HttpURLConnection con = (HttpURLConnection) obj.openConnection();

        con.setRequestMethod("GET");

        con.setRequestProperty("User-Agent", "Mozilla/5.0");

        BufferedReader in = new BufferedReader(
                new InputStreamReader(con.getInputStream()));
        String inputLine;
        StringBuffer response = new StringBuffer();
        while ((inputLine = in.readLine()) != null) {
            response.append(inputLine);
        }
        in.close();

        JSONObject myResponse = new JSONObject(response.toString());

        TimelineData data = new TimelineData();
        data.setUpdateDate(myResponse.getString("UpdateDate"));
        JSONArray jArr = (JSONArray) myResponse.get("Data");
        List<DailyData> daily = new ArrayList<>();
       

        for (int i = 0; i < jArr.length(); i++) {
            JSONObject innerObj = (JSONObject) jArr.get(i);
            DailyData subdata = new DailyData();
            subdata.setConfirmed(innerObj.getInt("Confirmed"));
            subdata.setNewConfirmed(innerObj.getInt("NewConfirmed"));
            subdata.setRecovered(innerObj.getInt("Recovered"));
            subdata.setNewRecovered(innerObj.getInt("NewRecovered"));
            subdata.setDeath(innerObj.getInt("Deaths"));
            subdata.setNewDeaths(innerObj.getInt("NewDeaths"));
            subdata.setHospitalized(innerObj.getInt("Hospitalized"));
            subdata.setNewHospitalized(innerObj.getInt("NewHospitalized"));
            subdata.setUpdateDate(innerObj.getString("Date"));
            daily.add(i,subdata);
        }
        data.setDaily(daily);
        return data;
    }

}
