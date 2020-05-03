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
import java.util.Iterator;
import model.DailyData;
import org.json.JSONArray;
import org.json.JSONObject;

/**
 *
 * @author User
 */
public class OpenCasesService {
    
       public static JSONArray getData() throws Exception {
	String url = "https://covid19.th-stat.com/api/open/cases";
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
        
        ArrayList<DailyData> myObjects = new ArrayList<>();
        
        JSONObject myResponse = new JSONObject(response.toString());
        JSONArray jArr = (JSONArray) myResponse.get("Data");
        
        return jArr;
    }
       
       public static JSONArray getDataParam(String nation,String ageMin,String ageMax,String gender) throws Exception {
	String url = "https://covid19.th-stat.com/api/open/cases";
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
        
        ArrayList<DailyData> myObjects = new ArrayList<>();
        
        JSONObject myResponse = new JSONObject(response.toString());
        JSONArray caseArr = (JSONArray) myResponse.get("Data");
        JSONArray output = new JSONArray();
        int min = 0;
        int max = 999;
        
        if(!ageMin.equals(""))
          min =  Integer.parseInt(ageMin);
        if(!ageMax.equals(""))
          max =  Integer.parseInt(ageMax);
        
        if(min > max)
        {
            int temp = max;
            max = min;
            min = temp;
        }

         for (int i = caseArr.length()-1; i > 0 ; i--) {
                        JSONObject innerObj = (JSONObject)caseArr.get(i);
                        
                        
                        if(nation==null || innerObj.get("NationEn").equals(nation))
                        {
                              //output.put(innerObj);
                           if(gender==null || innerObj.getString("GenderEn").equals(gender))
                            {
                                if(min < innerObj.getInt("Age") && innerObj.getInt("Age") < max)
                                {
                                output.put(innerObj);
                                }
                            }
                        }

                        
                        
         }
                            
        
        

        
        return output;
    }
    
}
