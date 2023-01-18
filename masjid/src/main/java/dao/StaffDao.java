package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javabean.Staff;
import javabean.Imam;

import static java.lang.System.out;

public class StaffDao {
	String dbURL = "jdbc:postgresql://ep-red-river-230703.ap-southeast-1.aws.neon.tech/neondb";
     String user = "xtahulasung";
     String pass = "Pczo6RY3EQJh";
    protected Connection getConnection() {
        Connection con = null;
        try {
            Class.forName("org.postgresql.Driver");
            con = DriverManager.getConnection(dbURL, user, pass);
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        return con;

    }
    public void addStaff (Staff stf) throws SQLException {

        // try-with-resource statement will auto close the connection.
        try (Connection con = getConnection();
             PreparedStatement ps = con.prepareStatement
            		 ("insert into staff(staffname,staffphoneno,staffrole,staffusername,staffpass,staffpicture,supervisorid) values(?,?,?,?,?,?,?)"))

        {
        	ps.setString(1,stf.getStaffName());
        	ps.setString(2,stf.getStaffPhone());
        	ps.setString(3,stf.getStaffRole());
        	ps.setString(4,stf.getStaffUsername());
        	ps.setString(5,stf.getStaffPassword());
            ps.setBinaryStream(6, stf.getStaffpicture());
        	ps.setInt(7, stf.getSvid());
        	


      
            out.println(ps);
            ps.executeUpdate();
        }
        catch (Exception e) {
            e.printStackTrace();
        }
    }
    public boolean deleteStaff(int id) throws SQLException {
        boolean rowDeleted;
        try (Connection connection = getConnection();
             PreparedStatement statement = connection.prepareStatement("delete from staff where staffid=?");) {
            statement.setInt(1, id);
            rowDeleted = statement.executeUpdate() > 0;
        }
        return rowDeleted;
    }
    public void addEdu (Imam i) throws SQLException {

        // try-with-resource statement will auto close the connection.
        try (Connection con = getConnection();
             PreparedStatement ps = con.prepareStatement
            		 ("insert into imam(staffid,education) values(?,?)"))

        {
        	ps.setInt(1, i.getId());
        	ps.setString(2, i.getEducation());
        	
      
            out.println(ps);
            ps.executeUpdate();
        }
        catch (Exception e) {
            e.printStackTrace();
        }
    }
    public void updateStaff (Staff stf) throws SQLException {

        // try-with-resource statement will auto close the connection.
        try (Connection con = getConnection();
             PreparedStatement ps = con.prepareStatement
            		 ("update staff set staffname=?,staffphoneno=?,staffusername=?,staffpass=?,staffpicture=? where staffid=?"))

        {
        	ps.setString(1,stf.getStaffName());
        	ps.setString(2,stf.getStaffPhone());
        	ps.setString(3,stf.getStaffUsername());
        	ps.setString(4,stf.getStaffPassword());
            ps.setBinaryStream(5, stf.getStaffpicture());
        	ps.setInt(6, stf.getId());
        	


      
            out.println(ps);
            ps.executeUpdate();
        }
        catch (Exception e) {
            e.printStackTrace();
        }
    }
    public void updateStaff2 (Staff stf) throws SQLException {

        // try-with-resource statement will auto close the connection.
        try (Connection con = getConnection();
             PreparedStatement ps = con.prepareStatement
            		 ("update staff set staffname=?,staffphoneno=?,staffusername=?,staffpass=? where staffid=?"))

        {
        	ps.setString(1,stf.getStaffName());
        	ps.setString(2,stf.getStaffPhone());
        	ps.setString(3,stf.getStaffUsername());
        	ps.setString(4,stf.getStaffPassword());
        	ps.setInt(5, stf.getId());
        	


      
            out.println(ps);
            ps.executeUpdate();
        }
        catch (Exception e) {
            e.printStackTrace();
        }
    }
}
