/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import model.Department;
import model.Employee;
import model.LeaveRequest;
import model.User;
import java.util.ArrayList;
import java.sql.*;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author sonnt-local
 */
public class LeaveRequestDBContext extends DBContext<LeaveRequest> {

    @Override
    public ArrayList<LeaveRequest> list() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public LeaveRequest get(int id) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void insert(LeaveRequest model) {
        try {
            String sql = "INSERT INTO LeaveRequest\n"
            + "           ([title]\n"
            + "           ,[reason]\n"
            + "           ,[from]\n"
            + "           ,[to]\n"
            + "           ,[createdby]\n"
            + "           ,[status]\n"
            + "           ,[createddate]\n"
            + "           )\n"
            + "     VALUES\n"
            + "           (?\n"
            + "           ,?\n"
            + "           ,?\n"
            + "           ,?\n"
            + "           ,?\n"
            + "           ,0,GETDATE())";

            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, model.getTitle());
            stm.setString(2, model.getReason());
            stm.setDate(3, model.getFrom());
            stm.setDate(4, model.getTo());
            stm.setString(5, model.getCreatedby().getUsername());
            stm.executeUpdate();//update insert delete
        } catch (SQLException ex) {
            Logger.getLogger(LeaveRequestDBContext.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            if (connection != null)
                try {
                connection.close();
            } catch (SQLException ex) {
                Logger.getLogger(LeaveRequestDBContext.class.getName()).log(Level.SEVERE, null, ex);
            }
        }

    }
    
public LeaveRequest getRequestById(int id) {
    LeaveRequest request = null;
    String sql = "SELECT * FROM LeaveRequest WHERE rid = ?";

    if (connection == null) {
        Logger.getLogger(LeaveRequestDBContext.class.getName()).log(Level.SEVERE, "Database connection is null.");
        return null;
    }

    try (PreparedStatement stm = connection.prepareStatement(sql)) {
        stm.setInt(1, id);

        try (ResultSet rs = stm.executeQuery()) {
            if (rs.next()) {
                request = new LeaveRequest();
                request.setId(rs.getInt("rid"));
                request.setTitle(rs.getString("title"));
                request.setReason(rs.getString("reason"));
                request.setFrom(rs.getDate("from"));
                request.setTo(rs.getDate("to"));
                request.setCreateddate(rs.getTimestamp("createddate"));
                request.setStatus(rs.getInt("status"));

                // Xử lý giá trị createdby nếu có
                int createdById = rs.getInt("createdby");
                if (!rs.wasNull()) {
                    User createdBy = new User();
                    Employee employee = new Employee(); // Giả định Employee có phương thức setId()
                    employee.setId(createdById);
                    createdBy.setE(employee);
                    request.setCreatedby(createdBy);
                }
            }
        }
    } catch (SQLException ex) {
        Logger.getLogger(LeaveRequestDBContext.class.getName()).log(Level.SEVERE, "Error retrieving leave request by ID", ex);
    }

    return request;
}



public ArrayList<LeaveRequest> getLrByName(String username) {
    ArrayList<LeaveRequest> requests = new ArrayList<>();
    String sql = "SELECT * FROM LeaveRequest WHERE createdby = ?";
    
    try (PreparedStatement stm = connection.prepareStatement(sql)) {
        stm.setString(1, username);
        try (ResultSet rs = stm.executeQuery()) {
            while (rs.next()) {
                LeaveRequest r = new LeaveRequest();
                r.setId(rs.getInt("rid"));
                r.setTitle(rs.getString("title"));
                r.setReason(rs.getString("reason"));
                r.setFrom(rs.getDate("from"));
                r.setTo(rs.getDate("to"));
                r.setCreateddate(rs.getTimestamp("createddate"));
                r.setStatus(rs.getInt("status"));
                
                // Tạo đối tượng User cho createdby (User có thể chỉ cần userName)
                User createdBy = new User();
                createdBy.setUsername(username); // Giả định User có phương thức setUserName()
                r.setCreatedby(createdBy);

                requests.add(r);
            }
        }
    } catch (SQLException ex) {
        Logger.getLogger(LeaveRequestDBContext.class.getName()).log(Level.SEVERE, null, ex);
    } finally {
        if (connection != null) {
            try {
                connection.close();
            } catch (SQLException ex) {
                Logger.getLogger(LeaveRequestDBContext.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }
    return requests;
}



 

    public ArrayList<LeaveRequest> getEmsRequest(int managerId) {
    ArrayList<LeaveRequest> requests = new ArrayList<>();
    String sql = "SELECT lr.* FROM LeaveRequest lr " +
                 "INNER JOIN Users u ON lr.createdby = u.username " +
                 "INNER JOIN Employees e ON u.eid = e.eid " +
                 "WHERE e.managerid = ?";
    
    try (PreparedStatement stm = connection.prepareStatement(sql)) {
        stm.setInt(1, managerId);
        try (ResultSet rs = stm.executeQuery()) {
            while (rs.next()) {
                LeaveRequest r = new LeaveRequest();
                r.setId(rs.getInt("rid"));
                r.setTitle(rs.getString("title"));
                r.setReason(rs.getString("reason"));
                r.setFrom(rs.getDate("from"));
                r.setTo(rs.getDate("to"));
                r.setCreateddate(rs.getTimestamp("createddate"));
                r.setStatus(rs.getInt("status"));
                
                // Gán thông tin người tạo yêu cầu
                User createdBy = new User();
                createdBy.setUsername(rs.getString("createdby"));
                r.setCreatedby(createdBy);
                
                requests.add(r);
            }
        }
    } catch (SQLException ex) {
        Logger.getLogger(EmployeeDBContext.class.getName()).log(Level.SEVERE, null, ex);
    } finally {
        if (connection != null) {
            try {
                connection.close();
            } catch (SQLException ex) {
                Logger.getLogger(EmployeeDBContext.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }
    return requests;
}
public void updateLeaveRequestStatus(int requestId, int status) {
    String sql = "UPDATE LeaveRequest SET status = ? WHERE rid = ?";
    
    try (PreparedStatement stm = connection.prepareStatement(sql)) {
        stm.setInt(1, status);
        stm.setInt(2, requestId);
        stm.executeUpdate();
    } catch (SQLException ex) {
        Logger.getLogger(LeaveRequestDBContext.class.getName()).log(Level.SEVERE, null, ex);
    }
}



    public ArrayList<LeaveRequest> getByDept(Integer did) {
        ArrayList<LeaveRequest> requests = new ArrayList<>();
        try {
            String sql = "SELECT \n"
                    + "	r.rid,r.title,r.reason,r.[from],r.[to],u.username,u.displayname,\n"
                    + "	r.createddate,r.status,\n"
                    + "	d.did,d.dname,\n"
                    + "	e.eid,e.ename\n"
                    + "FROM LeaveRequest r INNER JOIN Users u ON u.username = r.createdby\n"
                    + "			INNER JOIN Employees e ON e.eid = u.eid\n"
                    + "			INNER JOIN Departments d ON d.did = e.did";

            if (did != null) {
                sql += " WHERE d.did = ? ";
            }
            PreparedStatement stm = connection.prepareStatement(sql);
            if (did != null) {
                stm.setInt(1, did);
            }

            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                LeaveRequest r = new LeaveRequest();
                r.setId(rs.getInt("rid"));
                r.setTitle(rs.getString("title"));
                r.setReason(rs.getString("reason"));
                r.setFrom(rs.getDate("from"));
                r.setTo(rs.getDate("to"));
                r.setCreateddate(rs.getTimestamp("createddate"));
                r.setStatus(rs.getInt("status"));

                User u = new User();
                u.setUsername(rs.getString("username"));
                u.setDisplayname(rs.getString("displayname"));
                r.setCreatedby(u);

                Employee e = new Employee();
                u.setE(e);
                e.setId(rs.getInt("eid"));
                e.setName(rs.getString("ename"));

                Department d = new Department();
                e.setDept(d);
                d.setId(rs.getInt("did"));
                d.setName(rs.getString("dname"));

                requests.add(r);
            }

        } catch (SQLException ex) {
            Logger.getLogger(LeaveRequestDBContext.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            if (connection != null)
                try {
                connection.close();
            } catch (SQLException ex) {
                Logger.getLogger(LeaveRequestDBContext.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return requests;
    }
    
     
    @Override
    public void update(LeaveRequest model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void delete(LeaveRequest model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

}
