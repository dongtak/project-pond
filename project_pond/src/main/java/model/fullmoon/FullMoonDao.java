package model.fullmoon;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;

import model.pay.Pay;
import util.DBManager;

public class FullMoonDao {

	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;

	private FullMoonDao() {
	}

	private static FullMoonDao instance = new FullMoonDao();

	public static FullMoonDao getInstance() {
		return instance;
	}

	public ArrayList<FullMoonResponseDto> getMoonAllByKeyword(String keyword) {
		ArrayList<FullMoonResponseDto> list = new ArrayList<FullMoonResponseDto>();

		this.conn = DBManager.getConnection();

		if (this.conn != null) {
			String sql = "SELECT * FROM fullmoon ";

			if (keyword.equals("new"))
				sql += "ORDER BY moon_createAt DESC";
			else if (keyword.equals("done"))
				sql += "WHERE moon_goal<=moon_donate";
			else if (keyword.equals("peak"))
				sql += "ORDER BY moon_donate DESC LIMIT 8";
			else if (keyword.equals("topMsg"))
				sql += "ORDER BY message_cnt DESC LIMIT 8";

			try {
				this.pstmt = this.conn.prepareStatement(sql);
				this.rs = this.pstmt.executeQuery();

				while (this.rs.next()) {
					String moonNum = this.rs.getString(1);
					String adminId = this.rs.getString(2);
					String title = this.rs.getString(3);
					String content = this.rs.getString(4);
					Timestamp createdAt = this.rs.getTimestamp(5);
					int goal = this.rs.getInt(6);
					int donate = this.rs.getInt(7);
					int status = this.rs.getInt(8);
					int messageCnt = this.rs.getInt(9);
					FullMoonResponseDto moon = new FullMoonResponseDto(moonNum, adminId, title, content, createdAt,
							goal, donate, status, messageCnt);
					list.add(moon);
				}

			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				DBManager.close(this.conn, this.pstmt, this.rs);
			}

		}

		return list;
		
		
		
	}
	
	public FullMoonResponseDto fullmoonActivated () {
		FullMoonResponseDto moon = null;
		
		this.conn = DBManager.getConnection();

		if (this.conn != null) {
			String sql = "SELECT * FROM fullmoon WHERE moon_status=1";

			try {
				this.pstmt = this.conn.prepareStatement(sql);
				this.rs = this.pstmt.executeQuery();

				if(this.rs.next()) {
					String moonNum = this.rs.getString(1);
					String adminId = this.rs.getString(2);
					String title = this.rs.getString(3);
					String content = this.rs.getString(4);
					Timestamp createdAt = this.rs.getTimestamp(5);
					int goal = this.rs.getInt(6);
					int donate = this.rs.getInt(7);
					int status = this.rs.getInt(8);
					int messageCnt = this.rs.getInt(9);
					moon = new FullMoonResponseDto(moonNum, adminId, title, content, createdAt, goal, donate, status, messageCnt);
				}

			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				DBManager.close(this.conn, this.pstmt, this.rs);
			}
			
		}
		return moon;
	}
	
	
	
	
	
	
	
	
	
	
	public void donateAndMessage(Pay pay) {
		
		
	}
	
	

}
