package com.tech.blog.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class LikeDao {

    private Connection con;

    public LikeDao(Connection con) {
        this.con = con;
    }

    public boolean insertLike(int pid, int uid) {

        boolean flag = false;
        if (!isLikedByUser(pid, uid)) {
            try {
                String q = "insert into likes(pid,uid) values(?,?) ";
                PreparedStatement p = this.con.prepareStatement(q);
                //  setting values..
                p.setInt(1, pid);
                p.setInt(2, uid);
                p.executeUpdate();
                flag = true;
            } catch (Exception e) {
                e.printStackTrace();
            }
            return flag;
        }
        return false;
    }

    public int countLikeOnPost(int pid) {
        int count = 0;

        try {
            String q = "select count(*) from likes where pid=?";
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

    public boolean isLikedByUser(int pid, int uid) {
        boolean f = false;

        try {
            PreparedStatement p = this.con.prepareStatement("select * from likes where pid=? and uid=?");
            p.setInt(1, pid);
            p.setInt(2, uid);
            ResultSet rs = p.executeQuery();
            if (rs.next()) {
                f = true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return f;
    }
}
