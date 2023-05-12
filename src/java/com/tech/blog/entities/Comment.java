/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.tech.blog.entities;

import java.sql.Timestamp;
import oracle.sql.TIMESTAMP;

/**
 *
 * @author Priyank Patel
 */
public class Comment {
    
    int cmid;
    int pid;
    int uid;
    Timestamp tmsp;
    String cmt;

    public Comment(int pid, int uid, String cmt) {
        this.pid = pid;
        this.uid = uid;
        this.cmt = cmt;
    }

    public Comment() {
    }

    public int getCmid() {
        return cmid;
    }

    public void setCmid(int cmid) {
        this.cmid = cmid;
    }

    public int getPid() {
        return pid;
    }

    public Comment(int cmid, int pid, int uid, Timestamp tmsp, String cmt) {
        this.cmid = cmid;
        this.pid = pid;
        this.uid = uid;
        this.tmsp = tmsp;
        this.cmt = cmt;
    }

    public void setPid(int pid) {
        this.pid = pid;
    }

    public int getUid() {
        return uid;
    }

    public void setUid(int uid) {
        this.uid = uid;
    }

    public Timestamp getTmsp() {
        return tmsp;
    }

    public void setTmsp(Timestamp tmsp) {
        this.tmsp = tmsp;
    }

    public String getCmt() {
        return cmt;
    }

    public void setCmt(String cmt) {
        this.cmt = cmt;
    }
}
