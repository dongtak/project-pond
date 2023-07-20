package model.pay;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import java.sql.Timestamp;

import java.util.ArrayList;
import java.util.List;
import java.util.Random;

import util.DBManager;

public class PayDao {

	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;

	private PayDao() {
	}
	private static PayDao instance = new PayDao();

	public static PayDao getInstance() {
		return instance;
	}

	
	// 비회원 후원
	public boolean donatePayment(PayRequestDto pay) {

		String payNum = PayDao.generateRandomCode();
		String moonNum = pay.getMoonNum();
		String name = pay.getName();
		int money = pay.getPayMoney();
		String message = pay.getMessage();

		
		boolean check = true;

		if (name != null && money !=0 && message != null) {
			this.conn = DBManager.getConnection();
			if (this.conn != null) {
				if (name.equals("anonymous")) {
					String keyOff = "SET FOREIGN_KEY_CHECKS = 0 ";
					String keyOn = "SET FOREIGN_KEY_CHECKS = 1 ";
					String sql = "INSERT INTO pay(moon_num,pay_num,name, pay_money,message) VALUES(?,?, ?, ?,?)";

					System.out.println("dao" + name);

					try {
						this.pstmt = this.conn.prepareStatement(keyOff);
						this.pstmt.execute();

						this.pstmt = this.conn.prepareStatement(sql);
						this.pstmt.setString(1, moonNum);
						this.pstmt.setString(2, payNum);
						this.pstmt.setString(3, "익명");
						this.pstmt.setInt(4,money);
						this.pstmt.setString(5, message);

						this.pstmt.execute();

						this.pstmt = this.conn.prepareStatement(keyOn);
						this.pstmt.execute();

					} catch (Exception e) {
						e.printStackTrace();
						check = false;
					} finally {
						DBManager.close(this.conn, this.pstmt);
					}
				} else {
					String keyOff = "SET FOREIGN_KEY_CHECKS = 0 ";
					String keyOn = "SET FOREIGN_KEY_CHECKS = 1 ";
					String sql = "INSERT INTO pay(moon_num,pay_num,name, pay_money,message) VALUES(?, ?, ?,?,?)";
					String moon = "SELECT moon_num FROM fullmoon WHERE moon_status = 1";
					
					try {
						this.pstmt = this.conn.prepareStatement(moon);
	
						
						this.pstmt = this.conn.prepareStatement(keyOff);
						this.pstmt.execute();

						this.pstmt = this.conn.prepareStatement(sql);
						this.pstmt.setString(1, moonNum);
						this.pstmt.setString(2, payNum);
						this.pstmt.setString(3, name);
						this.pstmt.setInt(4, money);
						this.pstmt.setString(5, message);


						this.pstmt.execute();

						this.pstmt = this.conn.prepareStatement(keyOn);
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

	
	// 랜덤 코드 생성
	private static final String ALPHABET = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ";
	private static Random random = new Random();

	public static String generateRandomCode() {
		StringBuilder code = new StringBuilder();

		for (int i = 0; i < 10; i++) {
			if (i % 2 == 0) {
				code.append(generateRandomNumber());
			} else {
				code.append(generateRandomAlphabet());
			}
		}

		return code.toString();
	}

	private static int generateRandomNumber() {
		return random.nextInt(10);
	}

	private static char generateRandomAlphabet() {
		int index = random.nextInt(ALPHABET.length());
		return ALPHABET.charAt(index);
	}

	

	// moonNum의 pay리스트 받아오기
	public List<PayRequestDto> getPayByNum(String num){
		List<PayRequestDto> payList = new ArrayList<PayRequestDto>();
		
		this.conn = DBManager.getConnection();
		if(conn!=null) {
			String sql = "SELECT * FROM pay WHERE moon_num=?";
			try {
				this.pstmt = this.conn.prepareStatement(sql);
				this.pstmt.setString(1, num);
				this.rs = this.pstmt.executeQuery();
				while(this.rs.next()) {
					String payNum = this.rs.getString(1);
					String cardNum = this.rs.getString(2);
					String userId = this.rs.getString(3);
					String moonNum = this.rs.getString(4);
					String name = this.rs.getString(5);
					String message = this.rs.getString(6);
					int payMoney = this.rs.getInt(7);
					Timestamp payDay = this.rs.getTimestamp(8);
					
					PayRequestDto pay = new PayRequestDto(payNum, cardNum, userId, moonNum, name, message, payMoney, payDay);
					
					payList.add(pay);
					
				}
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				DBManager.close(this.conn, this.pstmt, this.rs);
			}
		}
		
		return payList;
	}

	// 유저의 id로 pay list 받아오기
	public List<PayResponseDto> getUserPayListById(String id){
		List<PayResponseDto> payList = new ArrayList<PayResponseDto>();
		
		this.conn = DBManager.getConnection();
		if(conn!=null) {
			String sql = "SELECT * FROM pay WHERE user_id=?";
			try {
				this.pstmt = this.conn.prepareStatement(sql);
				this.pstmt.setString(1, id);
				this.rs = this.pstmt.executeQuery();
				while(this.rs.next()) {
					String payNum = this.rs.getString(1);
					String cardNum = this.rs.getString(2);
					String userId = this.rs.getString(3);
					String moonNum = this.rs.getString(4);
					String name = this.rs.getString(5);
					String message = this.rs.getString(6);
					int payMoney = this.rs.getInt(7);
					Timestamp payDay = this.rs.getTimestamp(8);
					
					PayResponseDto pay = new PayResponseDto(payNum, cardNum, userId, moonNum, name, message, payMoney, payDay);
					payList.add(pay);
				}
				
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				DBManager.close(this.conn, this.pstmt, this.rs);
			}
		}
		
		
		return payList;
	}
	
	

}
