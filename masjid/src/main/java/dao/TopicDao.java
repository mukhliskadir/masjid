package dao;

import java.sql.Connection;
import javabean.Topic;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;



import static java.lang.System.out;

public class TopicDao {
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
    public void addTopic (Topic tpc) throws SQLException {

        // try-with-resource statement will auto close the connection.
        try (Connection con = getConnection();
             PreparedStatement ps = con.prepareStatement
                     ("insert into topic(topicname,topictheme) values(?,?)"))
        {

            ps.setString(1, tpc.getTopicName());
            ps.setString(2, tpc.getTopicTheme());
            out.println(ps);
            ps.executeUpdate();
        }
        catch (Exception e) {
            e.printStackTrace();
        }
    }
    public boolean deleteTopic(int id) throws SQLException {
        boolean rowDeleted;
        try (Connection connection = getConnection();
             PreparedStatement statement = connection.prepareStatement("delete from topic where topicid=?");) {
            statement.setInt(1, id);
            rowDeleted = statement.executeUpdate() > 0;
        }
        return rowDeleted;
    }
    public boolean updateTopic(Topic tpc) throws SQLException {
        boolean rowUpdated;
        try (Connection connection = getConnection();
             PreparedStatement ps = connection.prepareStatement("update topic set topicname=?,topictheme=? where topicid=?");) {

            ps.setString(1, tpc.getTopicName());
            ps.setString(2, tpc.getTopicTheme());
            ps.setInt(3, tpc.getId());
            rowUpdated = ps.executeUpdate() > 0;
        }
        return rowUpdated;
    }
}