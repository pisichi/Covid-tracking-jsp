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
import org.json.JSONArray;
import org.json.JSONObject;

/**
 *
 * @author User
 */
public class CaseSumService {
    
        public static JSONObject getProvince() throws Exception {
	String url = "https://covid19.th-stat.com/api/open/cases/sum";
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
        JSONObject Province = (JSONObject) myResponse.get("Province");
        return Province;
    }
        
        
        
        public static JSONObject getNation() throws Exception {
	String url = "https://covid19.th-stat.com/api/open/cases/sum";
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
        JSONObject Nation = (JSONObject) myResponse.get("Nation");
        return Nation;
    }
        
        
        
        public static JSONObject getGender() throws Exception {
	String url = "https://covid19.th-stat.com/api/open/cases/sum";
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
        JSONObject Gender = (JSONObject) myResponse.get("Gender");
        return Gender;
    }
    
}
