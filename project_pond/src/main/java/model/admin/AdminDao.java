package model.admin;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import util.DBManager;

public class AdminDao {
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	private AdminDao() {}
	private static AdminDao instance = new AdminDao();
	public static AdminDao getInstance() {
		return instance;
	}
	
	public void createAdmin() {
		this.conn = DBManager.getConnection();
		if(conn!=null) {
			String sql="INSERT INTO ";
			try {
				this.pstmt = this.conn.prepareStatement(sql);
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				DBManager.close(this.conn, this.pstmt);
			}
		}
	}
	
	public Admin getAdminById(String id) {
		Admin admin = null;
		this.conn = DBManager.getConnection();
	
		if(conn!=null) {
			String sql="SELECT * FROM admin WHERE admin_id=?";
			try {
				this.pstmt = this.conn.prepareStatement(sql);
				this.pstmt.setString(1, id);
				this.rs=this.pstmt.executeQuery();
				if(this.rs.next()) {
					admin = new Admin(this.rs.getString(1),this.rs.getString(2),this.rs.getString(3),this.rs.getString(4));
				}
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				DBManager.close(this.conn, this.pstmt, this.rs);
			}
		}
		
		return admin;
	}
	
}
