package model.pay;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.Random;
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

	public boolean payment(PayRequestDto pay) {

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
					String sql = "INSERT INTO pay(pay_num,name, pay_money,message) VALUES(?,?, ?, ?)";

					System.out.println("dao" + name);
					try {
						this.pstmt = this.conn.prepareStatement(keyOff);
						this.pstmt.execute();

						this.pstmt = this.conn.prepareStatement(sql);
						this.pstmt.setString(1, payNum);
						this.pstmt.setString(2, "익명");
						this.pstmt.setString(3, money);
						this.pstmt.setString(4, message);

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
					String sql = "INSERT INTO pay(pay_num,name, pay_money,message) VALUES(?, ?, ?,?)";
					String moon = "SELECT moon_num FROM fullmoon WHERE moon_status = 1";
					
					System.out.println("dao2" + name);
					try {
						this.pstmt = this.conn.prepareStatement(moon);
	
						
						this.pstmt = this.conn.prepareStatement(keyOff);
						this.pstmt.execute();

						this.pstmt = this.conn.prepareStatement(sql);
						this.pstmt.setString(1, payNum);
						this.pstmt.setString(2, name);
						this.pstmt.setInt(3, Integer.parseInt(money));
						this.pstmt.setString(4, message);

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

}
