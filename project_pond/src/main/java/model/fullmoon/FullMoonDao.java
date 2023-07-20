package model.fullmoon;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import util.DBManager;

public class FullMoonDao {

	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

	private FullMoonDao() {
	}

	private static FullMoonDao instance = new FullMoonDao();

	public static FullMoonDao getInstance() {
		return instance;
	}

	
	
	public ArrayList<FullMoonResponseDto> getMoonAllByKeyword(String keyword,int startRow, int pageSize) {
		ArrayList<FullMoonResponseDto> list = new ArrayList<FullMoonResponseDto>();

		this.conn = DBManager.getConnection();

		if (this.conn != null) {
			String sql = "SELECT * FROM fullmoon ";

			if (keyword.equals("new"))
				sql += "ORDER BY CAST(SUBSTRING(moon_num, 3) AS UNSIGNED) DESC LIMIT ?, ?";
			else if (keyword.equals("done"))
				sql += "WHERE moon_goal<=moon_donate ORDER BY CAST(SUBSTRING(moon_num, 3) AS UNSIGNED) DESC LIMIT ?, ?";
			else if (keyword.equals("peak"))
				sql += "ORDER BY moon_donate DESC LIMIT 8";
			else if (keyword.equals("topMsg"))
				sql += "ORDER BY message_cnt DESC LIMIT 8";

			try {
				this.pstmt = this.conn.prepareStatement(sql);
				if(keyword.equals("new") || keyword.equals("done")) {
					this.pstmt.setInt(1, startRow-1); // 시작행-1
					this.pstmt.setInt(2, pageSize); // 페이지 크기
				}
				this.rs = this.pstmt.executeQuery();

				while (this.rs.next()) {
					String moonNum = this.rs.getString(1);
					String adminId = this.rs.getString(2);
					String title = this.rs.getString(3);
					Timestamp createdAt = this.rs.getTimestamp(4);
					String finishAt = sdf.format(this.rs.getDate(5));
					int goal = this.rs.getInt(6);
					int donate = this.rs.getInt(7);
					int status = this.rs.getInt(8);
					int messageCnt = this.rs.getInt(9);

					FullMoonResponseDto moon = new FullMoonResponseDto(moonNum, adminId, title, createdAt,finishAt, goal, donate, status, messageCnt);

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
					Timestamp createdAt = this.rs.getTimestamp(4);
					String finishAt = sdf.format(this.rs.getDate(5));
					int goal = this.rs.getInt(6);
					int donate = this.rs.getInt(7);
					int status = this.rs.getInt(8);
					int messageCnt = this.rs.getInt(9);
					moon = new FullMoonResponseDto(moonNum, adminId, title, createdAt,finishAt, goal, donate, status, messageCnt);
				}

			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				DBManager.close(this.conn, this.pstmt, this.rs);
			}
			
		}
		return moon;
	}

	
	// 수정필요
	public FullMoonRequestDto getFullMoonByMoonNum(String moonNum) {
		FullMoonRequestDto fullmoon = null;
		
		this.conn = DBManager.getConnection();
		if(conn!=null) {
			String sql = "SELECT * FROM fullmoon WHERE moon_num=?";
			try {
				this.pstmt=this.conn.prepareStatement(sql);
				this.pstmt.setString(1, moonNum);
				this.rs = this.pstmt.executeQuery();
				if(rs.next()) {
					int moonGoal = this.rs.getInt(6);
					int moonDonate = this.rs.getInt(7);
					int messageCnt = this.rs.getInt(9);
					
					fullmoon = new FullMoonRequestDto(moonGoal,moonDonate,messageCnt);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		return fullmoon;
	}
	
		//금액 추가 만들기 
	
	public boolean donateMoney(int money) {
	    System.out.println("금액접속" + money);
	    this.conn = DBManager.getConnection();
	    if (conn != null) {
	        String moonDonateQuery = "SELECT moon_donate FROM fullmoon WHERE moon_status=1";
	        String updateQuery = "UPDATE fullmoon SET moon_donate = ? WHERE moon_status = 1";
	        
	        try {
	            this.pstmt = this.conn.prepareStatement(moonDonateQuery);
	            this.rs = this.pstmt.executeQuery();
	            
	            if (rs.next()) {
	                int moneyBefore = rs.getInt("moon_donate");
	                System.out.println("이전 기부금: " + moneyBefore);
	                
	                int newDonation = moneyBefore + money; // 새로운 기부금 계산
	                
	                // UPDATE 문 실행
	                this.pstmt = this.conn.prepareStatement(updateQuery);
	                this.pstmt.setInt(1, newDonation);
	                int rowsAffected = this.pstmt.executeUpdate();
	                
	                if (rowsAffected > 0) {
	                    System.out.println("기부가 성공적으로 업데이트되었습니다.");
	                    return true;
	                } else {
	                    System.out.println("기부 업데이트 실패");
	                }
	            } else {
	                System.out.println("해당하는 레코드가 없습니다.");
	            }
	            
	        } catch (SQLException e) {
	            e.printStackTrace();
	        } finally {
	        	DBManager.close(this.conn, this.pstmt, this.rs);
	        }
	    }
	    
	    return false;
	}

	
	// 전체 fullmoon 개수 리턴 함수
	public int getCount() {
		int count=0;
		
		this.conn = DBManager.getConnection();
		if(this.conn!=null) {
			String sql = "SELECT COUNT(*) FROM fullmoon";
			try {
				this.pstmt = this.conn.prepareStatement(sql);
				this.rs = this.pstmt.executeQuery();
				if(this.rs.next()) {
					count=this.rs.getInt(1);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				DBManager.close(this.conn, this.pstmt, this.rs);
			}
		}
		
		return count;
	}


}
