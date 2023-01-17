package dao;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javabean.Announcement;

public class AnnouncementDao {
	String dbURL = "jdbc:postgresql://ep-red-river-230703.ap-southeast-1.aws.neon.tech/neondb";
    String user = "xtahulasung";
    String pass = "Pczo6RY3EQJh";

    
    protected Connection getConnection() {
        Connection con = null;
        try {
            Class.forName("org.postgresql.Driver");
            con = DriverManager.getConnection(dbURL, user, pass);
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return con;

    }
    public void addAnnouncement (Announcement anc) throws SQLException {

        // try-with-resource statement will auto close the connection.
        try (Connection con = getConnection();
             PreparedStatement ps = con.prepareStatement
                     ("insert into announcement(announcementpicture,announcementtitle,announcementdesc,announcementdate,announcementtime,staffid) values(?,?,?,?,?,?)"))
        {

            ps.setBinaryStream(1, anc.getPicture());
            ps.setString(2, anc.getTitle());
            ps.setString(3, anc.getDescr());
            ps.setDate(4, anc.getDate());
            ps.setString(5, anc.getTime());
            ps.setInt(6, anc.getStaffid());
            ps.executeUpdate();
        }
        catch (Exception e) {
            e.printStackTrace();
        }
    }
    public boolean deleteAnnouncement(int id) throws SQLException {
        boolean rowDeleted;
        try (Connection connection = getConnection();
             PreparedStatement statement = connection.prepareStatement("delete from announcement where announcementid=?");) {
            statement.setInt(1, id);
            rowDeleted = statement.executeUpdate() > 0;
        }
        return rowDeleted;
        
    }
    public boolean updateAnnouncement(Announcement anc) throws SQLException, IOException {
        boolean rowUpdated = false;
        
      
        	try (Connection connection = getConnection();
                    PreparedStatement ps = connection.prepareStatement("update announcement set announcementpicture=?,announcementtitle=?,announcementdesc=?,announcementdate=?,announcementtime=?,staffid=?where announcementid=?");) {
               	
         
                   ps.setBinaryStream(1, anc.getPicture());
                   ps.setString(2, anc.getTitle());
                   ps.setString(3, anc.getDescr());
                   ps.setDate(4, anc.getDate());
                   ps.setString(5, anc.getTime());
                   ps.setInt(6, anc.getStaffid());
               	ps.setInt(7, anc.getId());
               	
                   rowUpdated = ps.executeUpdate() > 0;
                }
        	 catch (Exception e) {
                 e.printStackTrace();
             }

        
		return rowUpdated;

    }
    public boolean updateAnnouncement2(Announcement anc) throws SQLException, IOException {
        boolean rowUpdated = false;
        
      
        	try (Connection connection = getConnection();
                    PreparedStatement ps = connection.prepareStatement("update announcement set announcementtitle=?,announcementdesc=?,announcementdate=?,announcementtime=?,staffid=?where announcementid=?");) {
               	
         
                   ps.setString(1, anc.getTitle());
                   ps.setString(2, anc.getDescr());
                   ps.setDate(3, anc.getDate());
                   ps.setString(4, anc.getTime());
                   ps.setInt(5, anc.getStaffid());
               	ps.setInt(6, anc.getId());
               	
                   rowUpdated = ps.executeUpdate() > 0;
                }
        	 catch (Exception e) {
                 e.printStackTrace();
             }

        
		return rowUpdated;

    }
}
	
