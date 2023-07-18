package model.pay;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import java.sql.Timestamp;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;


import model.article.ArticleRequestDto;

import model.article.Article;

import model.user.User;
import model.user.UserDao;
import model.user.UserRequestDto;
import util.DBManager;

public class PayDao {

	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;

	private SimpleDateFormat sdf = new SimpleDateFormat("YYYYMMdd");

	private PayDao() {
	}

	private static PayDao instance = new PayDao();

	public static PayDao getInstance() {
		return instance;
	}

	public boolean donatePayment(PayRequestDto pay) {

		String moonNum = pay.getMoon_num();
		String payNum = PayDao.generateRandomCode();
		String name = pay.getName();
		String money = pay.getPay_money();
		String message = pay.getMessage();

		System.out.println(name + money + message);

		boolean check = true;

		if (name != null && money != null && message != null) {
			this.conn = DBManager.getConnection();
			if (this.conn != null) {
				System.out.println("널 아닌디");
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
						this.pstmt.setInt(4, Integer.parseInt(money));
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
					
					System.out.println("dao2" + name);
					try {
						this.pstmt = this.conn.prepareStatement(moon);
	
						
						this.pstmt = this.conn.prepareStatement(keyOff);
						this.pstmt.execute();

						this.pstmt = this.conn.prepareStatement(sql);
						this.pstmt.setString(1, moonNum);
						this.pstmt.setString(2, payNum);
						this.pstmt.setString(3, name);
						this.pstmt.setInt(4, Integer.parseInt(money));
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
				System.out.println("널~");
				check = false;
			}
		} else {
			check = false;
		}
		return check;
	}

	private static final String ALPHABET = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ";
	private static Random random;

	static {
		random = new Random();
	}

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

	public List<PayRequestDto> getMoonMessage() {
		List<PayRequestDto> list = new ArrayList<PayRequestDto>();
		
		this.conn = DBManager.getConnection();
		if(conn!=null) {
			/*
			 select * from article where moon_num in (
			 select moon_num from fullmoon where moon_status=0
			 ) order by article_createAt desc;
			*/
			String sql="SELECT * FROM pay WHERE moon_num IN ( SELECT moon_num FROM fullmoon WHERE moon_status=1 )";
			try {
				this.pstmt = this.conn.prepareStatement(sql);
				this.rs = this.pstmt.executeQuery();
				while(this.rs.next()) {
					PayRequestDto payDto = new PayRequestDto();
					payDto.setCard_num(this.rs.getString(2));
					payDto.setUser_id(this.rs.getString(3));
					payDto.setMoon_num(this.rs.getString(4));
					payDto.setName(this.rs.getString(5));
					payDto.setMessage(this.rs.getString(6));
					payDto.setPay_day(this.rs.getTimestamp(8));
					list.add(payDto);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				DBManager.close(this.conn, this.pstmt, this.rs);
			}
			
		}
		
		return list;
	}

	public List<PayRequestDto> getPayByNum(String num){
		List<PayRequestDto> payList = new ArrayList<PayRequestDto>();
		
		this.conn = DBManager.getConnection();
		if(conn!=null) {
			String sql = "SELECT * FROM pay WHERE moon_num=?";
			try {
				this.pstmt = this.conn.prepareStatement(sql);
				this.pstmt.setString(1, num);
				this.rs = this.pstmt.executeQuery();
				UserDao userDao = UserDao.getInstance();
				while(this.rs.next()) {
					String moonNum = this.rs.getString(4);
					String name = this.rs.getString(5);
					String message = this.rs.getString(6);
					
					PayRequestDto pay = new PayRequestDto(moonNum,name,message);
					
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
