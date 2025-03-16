/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import model.Employee;
import model.Feature;
import model.Role;
import model.User;
import java.util.ArrayList;
import java.sql.*;
import java.util.Random;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.GoogleAccount;

/**
 *
 * @author sonnt-local
 */
public class UserDBContext extends DBContext{

   public User get(String username, String password) {
    try {
        String sql = "SELECT u.username, u.displayname, u.email, \n" +
                     "       r.rid, r.rname, \n" +
                     "       f.fid, f.url, \n" +
                     "       e.eid, e.ename \n" +
                     "FROM Users u \n" +
                     "INNER JOIN Employees e ON e.eid = u.eid \n" +
                     "LEFT JOIN User_Role ur ON u.username = ur.username \n" +
                     "LEFT JOIN Roles r ON ur.rid = r.rid \n" +
                     "LEFT JOIN Role_Feature rf ON rf.rid = r.rid \n" +
                     "LEFT JOIN Features f ON f.fid = rf.fid \n" +
                     "WHERE u.username = ? AND u.password = ?";

        PreparedStatement stm = connection.prepareStatement(sql);
        stm.setString(1, username);
        stm.setString(2, password);
        ResultSet rs = stm.executeQuery();
        User user = null;
        Role current_role = new Role();
        current_role.setId(-1);

        while (rs.next()) {
            if (user == null) {
                user = new User();
                user.setUsername(username);
                user.setDisplayname(rs.getString("displayname"));
                user.setEmail(rs.getString("email"));  // Lấy giá trị email

                Employee e = new Employee();
                e.setId(rs.getInt("eid"));
                e.setName(rs.getString("ename"));
                user.setE(e);
            }

            int rid = rs.getInt("rid");
            if (rid != 0 && rid != current_role.getId()) {
                current_role = new Role();
                current_role.setId(rid);
                current_role.setName(rs.getString("rname"));
                user.getRoles().add(current_role);
                current_role.getUsers().add(user);
            }

            int fid = rs.getInt("fid");
            if (fid != 0) {
                Feature f = new Feature();
                f.setId(rs.getInt("fid"));
                f.setUrl(rs.getString("url"));
                current_role.getFeatures().add(f);
                f.getRoles().add(current_role);
            }
        }
        return user;
    } catch (SQLException ex) {
        Logger.getLogger(UserDBContext.class.getName()).log(Level.SEVERE, null, ex);
    } finally {
        if (connection != null) {
            try {
                connection.close();
            } catch (SQLException ex) {
                Logger.getLogger(UserDBContext.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }
    return null;
}
     public User getUserByEmail(String email) {
        try {
            String sql = "SELECT * FROM Users WHERE email = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, email);
            ResultSet rs = stm.executeQuery();

            if (rs.next()) {
                User user = new User();
                user.setUsername(rs.getString("username"));
                user.setEmail(rs.getString("email"));
                user.setDisplayname(rs.getString("displayname"));
                return user;
            }
        } catch (SQLException ex) {
            Logger.getLogger(UserDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
public User getUserRoleByEmail(String email) {
    try {
        String sql = "SELECT u.username, u.displayname, u.email, " +
                     "       r.rid, r.rname, " +
                     "       f.fid, f.url " +
                     "FROM Users u " +
                     "LEFT JOIN User_Role ur ON u.username = ur.username " +
                     "LEFT JOIN Roles r ON ur.rid = r.rid " +
                     "LEFT JOIN Role_Feature rf ON rf.rid = r.rid " +
                     "LEFT JOIN Features f ON f.fid = rf.fid " +
                     "WHERE u.email = ?";

        PreparedStatement stm = connection.prepareStatement(sql);
        stm.setString(1, email);
        ResultSet rs = stm.executeQuery();

        User user = null;
        Role current_role = new Role();
        current_role.setId(-1); 

        while (rs.next()) {
            if (user == null) {
                user = new User();
                user.setUsername(rs.getString("username"));
                user.setDisplayname(rs.getString("displayname"));
                user.setEmail(rs.getString("email"));
            }

            int rid = rs.getInt("rid");
            if (rid != 0 && rid != current_role.getId()) {
                current_role = new Role();
                current_role.setId(rid);
                current_role.setName(rs.getString("rname"));
                user.getRoles().add(current_role);
                current_role.getUsers().add(user);
            }

            int fid = rs.getInt("fid");
            if (fid != 0) {
                Feature f = new Feature();
                f.setId(rs.getInt("fid"));
                f.setUrl(rs.getString("url"));
                current_role.getFeatures().add(f);
                f.getRoles().add(current_role);
            }
        }
        return user;
    } catch (SQLException ex) {
        Logger.getLogger(UserDBContext.class.getName()).log(Level.SEVERE, null, ex);
    } finally {
        if (connection != null) {
            try {
                connection.close();
            } catch (SQLException ex) {
                Logger.getLogger(UserDBContext.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }
    return null;
}
     public User getByEmail(String email) {
    User user = null;
    try {
        String sql = "SELECT * FROM Users WHERE email = ?";
        PreparedStatement stm = connection.prepareStatement(sql);
        stm.setString(1, email);
        ResultSet rs = stm.executeQuery();
        if (rs.next()) {
            user = new User();
            user.setUsername(rs.getString("username"));
            user.setEmail(rs.getString("email"));
            user.setDisplayname(rs.getString("displayname"));
        }
    } catch (SQLException ex) {
        ex.printStackTrace();
    }
    return user;
}

    // Tạo user mới
    public void insertUser(User user) {
    if (getByEmail(user.getEmail()) != null) {
        System.out.println("User already exists: " + user.getEmail());
        return; 
    }

    try {
        String sql = "INSERT INTO Users (username, email, displayname, password) VALUES (?, ?, ?, ?)";
        PreparedStatement stm = connection.prepareStatement(sql);
        stm.setString(1, user.getUsername());
        stm.setString(2, user.getEmail());
        stm.setString(3, user.getDisplayname());
        stm.setString(4, user.getPassword());  // Không cần mật khẩu cho Google Login
        stm.executeUpdate();
        System.out.println("User inserted: " + user.getEmail());
    } catch (SQLException ex) {
        Logger.getLogger(UserDBContext.class.getName()).log(Level.SEVERE, null, ex);
    }
}


 
   public String generateRandomPassword() {
        int length = 10;
        String chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
        StringBuilder password = new StringBuilder();
        Random random = new Random();
        for (int i = 0; i < length; i++) {
            password.append(chars.charAt(random.nextInt(chars.length())));
        }
        return password.toString();
    }
   
    

     public void insertUserRole(String username, int rid) {
    String sql = "INSERT INTO User_Role (username, rid) VALUES (?, ?)";
    try {
        PreparedStatement stm = connection.prepareStatement(sql);
        stm.setString(1, username);
        stm.setInt(2, rid);
        stm.executeUpdate();
    } catch (SQLException ex) {
        Logger.getLogger(UserDBContext.class.getName()).log(Level.SEVERE, null, ex);
    }
}
   
    
    @Override
    public ArrayList<User> list() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public User get(int id) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void insert(Object model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void update(Object model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void delete(Object model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    
}

