/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package service;

import com.fasterxml.jackson.annotation.JsonAutoDetect;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.introspect.VisibilityChecker;
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL; 
import java.util.Iterator;
import model.DailyData;
import org.json.JSONObject;


public class DailyService {

	   
public static DailyData getData() throws Exception {
	String url = "https://covid19.th-stat.com/api/open/today";
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
        DailyData data = new DailyData();

        data.setConfirmed(myResponse.getInt("Confirmed"));
        data.setRecovered(myResponse.getInt("Recovered"));
        data.setDeath(myResponse.getInt("Deaths"));
        data.setHospitalized(myResponse.getInt("Hospitalized"));
        data.setNewConfirmed(myResponse.getInt("NewConfirmed"));
        data.setNewDeaths(myResponse.getInt("NewDeaths"));
        data.setNewRecovered(myResponse.getInt("NewRecovered"));
        data.setNewHospitalized(myResponse.getInt("NewHospitalized"));
        data.setUpdateDate(myResponse.getString("UpdateDate"));
        
        return data;

}
         
  
}