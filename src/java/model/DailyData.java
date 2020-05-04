/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;


/**
 *
 * @author component
 */
public class DailyData {

    private int Confirmed;
    private int NewConfirmed;
    private int Recovered;
    private int NewRecovered;
    private int Hospitalized;
    private int NewHospitalized;
    private int Deaths;
    private int NewDeaths;
    private String UpdateDate;

    
    
    public int getConfirmed() {
        return Confirmed;
    }

    public void setConfirmed(int Confirmed) {
        this.Confirmed = Confirmed;
    }

    public int getNewConfirmed() {
        return NewConfirmed;
    }

    public void setNewConfirmed(int NewConfirmed) {
        this.NewConfirmed = NewConfirmed;
    }

    public int getDeaths() {
        return Deaths;
    }

    public void setDeaths(int Deaths) {
        this.Deaths = Deaths;
    }

    public int getRecovered() {
        return Recovered;
    }

    public void setRecovered(int Recovered) {
        this.Recovered = Recovered;
    }

    public int getHospitalized() {
        return Hospitalized;
    }

    public void setHospitalized(int Hospitalized) {
        this.Hospitalized = Hospitalized;
    }

    public int getDeath() {
        return Deaths;
    }

    public void setDeath(int Death) {
        this.Deaths = Death;
    }

    public int getNewRecovered() {
        return NewRecovered;
    }

    public void setNewRecovered(int NewRecovered) {
        this.NewRecovered = NewRecovered;
    }

    public int getNewHospitalized() {
        return NewHospitalized;
    }

    public void setNewHospitalized(int NewHospitalized) {
        this.NewHospitalized = NewHospitalized;
    }

    public int getNewDeaths() {
        return NewDeaths;
    }

    public void setNewDeaths(int NewDeaths) {
        this.NewDeaths = NewDeaths;
    }

    public String getUpdateDate() {
        return UpdateDate;
    }

    public void setUpdateDate(String UpdateDate) {
        this.UpdateDate = UpdateDate;
    }

}
