package model.cardInfo;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import model.pay.PayRequestDto;
import model.user.User;
import model.user.UserDao;
import model.user.UserRequestDto;
import util.DBManager;


public class CardInfoDao {
	// cardExpire String형이라 DATE 변환 필요
	SimpleDateFormat sdf;
	
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;

	private CardInfoDao() {
	}
	private static CardInfoDao instance = new CardInfoDao();
	public static CardInfoDao getInstance() {
		return instance;
	}
	
	public boolean createCardInfo(UserRequestDto userDto) {
		UserDao userDao = UserDao.getInstance();
		User result = userDao.getUserById(userDto.getId());//아이디 중복체크 user 모든 정보를 채워서 온다
		if (result != null)
			return false;

		String id = userDto.getId();
		String pwd = userDto.getPwd();
		String name = userDto.getName();
		String email = userDto.getEmail();
		int birth = userDto.getBirth();
		String phone = userDto.getPhone();
		String address = userDto.getAddress();

		boolean check = true;

		if (id != null && pwd != null && name != null && birth != 0 && phone != null) {
			this.conn = DBManager.getConnection();
			if (this.conn != null) {
				if (!email.equals("")) {
					String sql = "INSERT INTO user(user_id, user_pwd, user_name, user_email, user_birth, user_phone,user_addr) VALUES(?, ?, ?, ?, DATE(?), ?,?)";

					try {
						this.pstmt = this.conn.prepareStatement(sql);
						this.pstmt.setString(1, id);
						this.pstmt.setString(2, pwd);
						this.pstmt.setString(3, name);
						this.pstmt.setString(4, email);
						this.pstmt.setInt(5, birth);
						this.pstmt.setString(6, phone);
						this.pstmt.setString(7, address);

						this.pstmt.execute();

					} catch (Exception e) {
						e.printStackTrace();
						check = false;
					} finally {
						DBManager.close(this.conn, this.pstmt);
					}
				} else {
					String sql = "INSERT INTO user(user_id, user_pwd, user_name, user_birth, user_phone,user_addr) VALUES(?, ?, ?, DATE(?), ?,?)";

					try {
						this.pstmt = this.conn.prepareStatement(sql);
						this.pstmt.setString(1, id);
						this.pstmt.setString(2, pwd);
						this.pstmt.setString(3, name);
						this.pstmt.setInt(4, birth);
						this.pstmt.setString(5, phone);
						this.pstmt.setString(6, address);
						this.pstmt.execute();

					} catch (Exception e) {
						e.printStackTrace();
						check = false;
					} finally {
						DBManager.close(this.conn, this.pstmt);
					}
				}
			} else {
				check = false;
			}
		} else {
			check = false;
		}
		return check;
	}
	
	public List<CardInfoResponseDto> getUserCardListById(String id){
		List<CardInfoResponseDto> list = new ArrayList<CardInfoResponseDto>();

		this.conn = DBManager.getConnection();
		if (conn != null) {
			String sql = "SELECT * FROM cardInfo WHERE user_id=?";
			try {
				this.pstmt = this.conn.prepareStatement(sql);
				this.pstmt.setString(1, id);
				this.rs = this.pstmt.executeQuery();
				while (this.rs.next()) {
					String cardNum = this.rs.getString(1);
					String userId = this.rs.getString(2);
					String cardName = this.rs.getString(3);
					String cardPwd = this.rs.getString(4);
					String cardExpire = this.rs.getString(5);
					
					CardInfoResponseDto card = new CardInfoResponseDto(cardNum, userId, cardName, cardPwd, cardExpire);
					list.add(card);

				}
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				DBManager.close(this.conn, this.pstmt, this.rs);
			}
		}

		return list;
	}
}
