/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.tech.blog.dao;

import com.tech.blog.entities.Comment;
import com.tech.blog.entities.User;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;

/**
 *
 * @author Priyank Patel
 */
public class CommentDao {

    private Connection con;

    public CommentDao(Connection con) {
        this.con = con;
    }

    public boolean inserComment(int pid, int uid, String comment) {
        boolean flag = false;

        try {
            String q = "insert into comments(pid,uid,cmt) values(?,?,?)";
            PreparedStatement p = con.prepareStatement(q);
            p.setInt(1, pid);
            p.setInt(2, uid);
            p.setString(3, comment);
            p.executeLargeUpdate();
            flag = true;

        } catch (Exception e) {
            e.printStackTrace();
        }
        return flag;
    }

    public ArrayList<Comment> getAllComment(int pid) {

        ResultSet rs = null;
        ArrayList<Comment> cml = new ArrayList<>();

        try {
            String q = "select * from comments where pid=? order by tmsp desc;";
            PreparedStatement p = con.prepareStatement(q);
            p.setInt(1, pid);
            rs = p.executeQuery();
            while (rs.next()) {
                Comment c = new Comment(rs.getInt("cmid"), rs.getInt("pid"), rs.getInt("uid"), rs.getTimestamp("tmsp"), rs.getString("cmt"));
                cml.add(c);
            }
            return cml;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return cml;
    }

    public User getUserById(int uid) {

        User user = null;
        try {
            PreparedStatement p = con.prepareStatement("Select * from user where id=?");
            p.setInt(1, uid);
            ResultSet rs = p.executeQuery();
            if (rs.next()) {

                int id = rs.getInt("id");
                String name = rs.getString("name");
                String email = rs.getString("email");
                String password = rs.getString("password");
                String gender = rs.getString("gender");
                Timestamp rd = rs.getTimestamp("rdate");
                String about = rs.getString("about");
                String pic = rs.getString("profile");
                user = new User(id, name, email, password, gender, about, rd);

            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return user;
    }
    
    public int countCommentOnPost(int pid) {
        int count = 0;

        try {
            String q = "select count(*) from comments where pid=?";
            PreparedStatement p = this.con.prepareStatement(q);
            p.setInt(1, pid);
            ResultSet rs = p.executeQuery();
            if (rs.next()) {
                count = rs.getInt(1);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return count;
    }
}
