
package com.tech.blog.dao;

import java.sql.*;
import com.tech.blog.entities.*;
import java.util.ArrayList;
import java.util.List;
import java.sql.ResultSet;

public class PostDao {

    Connection con;

    public PostDao(Connection con) {
        this.con = con;
    }

    public ArrayList<Category> getAllCategorys() {
        ArrayList<Category> list = new ArrayList<>();

        try {
//            System.out.println("In try");
            String q = "select * from categories";
            Statement st = this.con.createStatement();
            ResultSet rs = st.executeQuery(q);
            while (rs.next()) {
                int cid = rs.getInt("cid");
                String cname = rs.getString("cname");
                String cdiscrition = rs.getString("cdiscription");
                Category c = new Category(cid, cname, cdiscrition);
                list.add(c);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public boolean savePost(Posts p) {
        boolean flag = false;

        try {
            String q = "insert into posts(pTitle,pContent,pCode,pPic,catId,userId) values(?,?,?,?,?,?)";
            PreparedStatement pstmt = con.prepareStatement(q);
            pstmt.setString(1, p.getpTitle());
            pstmt.setString(2, p.getpContent());
            pstmt.setString(3, p.getpCode());
            pstmt.setString(4, p.getpPic());
            pstmt.setInt(5, p.getCatId());
            pstmt.setInt(6, p.getUserId());
            pstmt.executeLargeUpdate();
            flag = true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return flag;
    }

//    Get all post
    public List<Posts> getAllPost() {
        List<Posts> list = new ArrayList<>();
//        Fetch all posts
        try {
            PreparedStatement p = con.prepareStatement("Select * from posts order by pid desc");
            ResultSet set = p.executeQuery();

            while (set.next()) {
                int id = set.getInt("pid");
                String title = set.getString("pTitle");
                String content = set.getString("pContent");
                String code = set.getString("pCode");
                String pic = set.getString("pPic");
                Timestamp date = set.getTimestamp("pDate");
                int catid = set.getInt("catId");
                int userid = set.getInt("userId");
                Posts ps = new Posts(id, title, content, code, pic, date, catid, userid);

                list.add(ps);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public List<Posts> getPostByCatId(int catId) {
        List<Posts> list = new ArrayList<>();
//        Fetch all posts
        try {
            PreparedStatement p = con.prepareStatement("Select * from posts where catId=?");
            p.setInt(1, catId);
            ResultSet set = p.executeQuery();

            while (set.next()) {
                int id = set.getInt("pid");
                String title = set.getString("pTitle");
                String content = set.getString("pContent");
                String code = set.getString("pCode");
                String pic = set.getString("pPic");
                Timestamp date = set.getTimestamp("pDate");
                int catid = set.getInt("catId");
                int userid = set.getInt("userId");
                Posts ps = new Posts(id, title, content, code, pic, date, catid, userid);

                list.add(ps);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    public Posts getPostbyPostId(int postId) {
        Posts p_ = null;
        try {
            PreparedStatement p = con.prepareStatement("Select * from posts where pid=?");
            p.setInt(1, postId);
            ResultSet rs = p.executeQuery();           
            if(rs.next()){
                
                int id = rs.getInt("pid");
                String title = rs.getString("pTitle");
                String content = rs.getString("pContent");
                String code = rs.getString("pCode");
                String pic = rs.getString("pPic");
                Timestamp date = rs.getTimestamp("pDate");
                int catid = rs.getInt("catId");
                int userid = rs.getInt("userId");
                p_ = new Posts(id, title, content, code, pic, date, catid, userid);

            }
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        return p_;

    }
    
    public User getUserById(int uid){
        
        User user = null;
        try {
            PreparedStatement p = con.prepareStatement("Select * from user where id=?");
            p.setInt(1, uid);
            ResultSet rs = p.executeQuery();           
            if(rs.next()){
                
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
    
    public List<Posts> getPostbyUserId(int userId) {
        
        List<Posts> list = new ArrayList<>();
        try {
            PreparedStatement p = con.prepareStatement("Select * from posts where userId=?");
            p.setInt(1, userId);
            ResultSet set = p.executeQuery();           
            while (set.next()) {
                int id = set.getInt("pid");
                String title = set.getString("pTitle");
                String content = set.getString("pContent");
                String code = set.getString("pCode");
                String pic = set.getString("pPic");
                Timestamp date = set.getTimestamp("pDate");
                int catid = set.getInt("catId");
                int userid = set.getInt("userId");
                Posts ps = new Posts(id, title, content, code, pic, date, catid, userid);
                list.add(ps);
                System.out.println("sdfghjgfdghjgfdfghjkhgfdghj");
            }
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

}
