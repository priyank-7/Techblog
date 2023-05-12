/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.tech.blog.entities;

public class Category {
    
    private int cid;
    private String cName;
    private String Discription;

    public Category(int cid, String cName, String Discription) {
        this.cid = cid;
        this.cName = cName;
        this.Discription = Discription;
    }

    public Category() {
    }

    public Category(String cName, String Discription) {
        this.cName = cName;
        this.Discription = Discription;
    }

    public int getCid() {
        return cid;
    }

    public void setCid(int cid) {
        this.cid = cid;
    }

    public String getcName() {
        return cName;
    }

    public void setcName(String cName) {
        this.cName = cName;
    }

    public String getDiscription() {
        return Discription;
    }

    public void setDiscription(String Discription) {
        this.Discription = Discription;
    }
    
    
}
