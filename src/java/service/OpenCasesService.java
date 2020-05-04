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
import model.AllCasesData;
import model.CasesData;

import model.ReportData;
import org.json.JSONArray;
import org.json.JSONObject;

/**
 *
 * @author User
 */
public class OpenCasesService {

    public static AllCasesData getDatas() throws Exception {
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

        AllCasesData data = new AllCasesData();
        JSONObject myResponse = new JSONObject(response.toString());
        JSONArray jArr = (JSONArray) myResponse.get("Data");
        List<CasesData> cases = new ArrayList<>();

        for (int i = 0; i < jArr.length(); i++) {
            JSONObject innerObj = (JSONObject) jArr.get(i);
            CasesData subdata = new CasesData();
            subdata.setConfirmDate(innerObj.getString("ConfirmDate"));
            subdata.setGender(innerObj.getString("Gender"));
            subdata.setGenderEn(innerObj.getString("GenderEn"));
            subdata.setNation(innerObj.getString("Nation"));
            if (!innerObj.isNull("NationEn")) {
                subdata.setNationEn((String) innerObj.get("NationEn"));
            }
            subdata.setProvince(innerObj.getString("Province"));
            subdata.setDistrict(innerObj.getString("District"));
            subdata.setProvinceEn(innerObj.getString("ProvinceEn"));
            //subdata.setNo(innerObj.getInt("No"));
            subdata.setAge(innerObj.getInt("Age"));
            subdata.setProvinceId(innerObj.getInt("ProvinceId"));
            cases.add(i, subdata);
        }
        data.setCases(cases);

        return data;
    }

    public static AllCasesData getDataParams(String nation, String province, String ageMin, String ageMax, String gender) throws Exception {
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

        AllCasesData data = new AllCasesData();
        JSONObject myResponse = new JSONObject(response.toString());
        JSONArray caseArr = (JSONArray) myResponse.get("Data");
        List<CasesData> cases = new ArrayList<>();
        int min = 0;
        int max = 999;

        if (!ageMin.equals("")) {
            min = Integer.parseInt(ageMin);
        }
        if (!ageMax.equals("")) {
            max = Integer.parseInt(ageMax);
        }

        if (min > max) {
            int temp = max;
            max = min;
            min = temp;
        }

        for (int i = 0; i < caseArr.length(); i++) {
            JSONObject innerObj = (JSONObject) caseArr.get(i);
            CasesData subdata = new CasesData();
            if (nation == null || innerObj.get("NationEn").equals(nation)) {
                //output.put(innerObj);
                if (province == null || innerObj.get("ProvinceEn").equals(province)) {
                    if (gender == null || innerObj.getString("GenderEn").equals(gender)) {

                        if (min < innerObj.getInt("Age") && innerObj.getInt("Age") < max) {

                            subdata.setConfirmDate(innerObj.getString("ConfirmDate"));
                            subdata.setGender(innerObj.getString("Gender"));
                            subdata.setGenderEn(innerObj.getString("GenderEn"));
                            subdata.setNation(innerObj.getString("Nation"));
                            if (!innerObj.isNull("NationEn")) {
                                subdata.setNationEn((String) innerObj.get("NationEn"));
                            }
                            subdata.setProvince(innerObj.getString("Province"));
                            subdata.setDistrict(innerObj.getString("District"));
                            subdata.setProvinceEn(innerObj.getString("ProvinceEn"));
                            //subdata.setNo(innerObj.getInt("No"));
                            subdata.setAge(innerObj.getInt("Age"));
                            subdata.setProvinceId(innerObj.getInt("ProvinceId"));
                            cases.add(subdata);
                        }
                    }
                }
            }
        }
        data.setCases(cases);

        return data;
    }

      public static ReportData makeReport(AllCasesData data) throws Exception {
          int count = 0;
          int male = 0;
          int female = 0;
          int age = 0;
          int thai = 0;
          int foreigner = 0;
          
           List<CasesData>caseArr = data.getCases();
           for (int i = 0 ; i < caseArr.size(); i++)
           {
               if(caseArr.get(i).getNation().equals("ไทย"))
               {
                   thai += 1;
               }
               else
               {
                   foreigner+=1;
               }
               
               if(caseArr.get(i).getGender().equals("ชาย")){
                   male +=1;
               }
               if(caseArr.get(i).getGender().equals("หญิง")){
                   female += 1;
               }
               age += caseArr.get(i).getAge();
               count += 1;
           }
          
           ReportData report = new ReportData();
           report.setAge(age);
           report.setCount(count);
           report.setMale(male);
           report.setFemale(female);
           report.setThai(thai);
           report.setForeigner(foreigner);
          
          return report;
      }
    
}
