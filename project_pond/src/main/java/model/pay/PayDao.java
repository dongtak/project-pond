package model.pay;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;

import model.user.User;
import model.user.UserDao;
import model.user.UserRequestDto;
import util.DBManager;

public class PayDao {

	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;

	private SimpleDateFormat sdf = new SimpleDateFormat("YYYYMMdd");

	
	private PayDao() {}

	
	private static PayDao instance = new PayDao();

	public static PayDao getInstance() {
		return instance;
	}
	
	
	public boolean payment(PayRequestDto pay) {

		String name = pay.getName();
		String money = pay.getPay_money();
		String message = pay.getMessage();
		
		System.out.println(name+money+message);
	
		boolean check = true;

		if (name != null && money != null && message != null) {
			this.conn = DBManager.getConnection();
			if (this.conn != null) {
				System.out.println("널 아닌디");
				if (name.equals("anonymous")) {
					String keyOff = "SET FOREIGN_KEY_CHECKS = 0 ";
					String keyOn = "SET FOREIGN_KEY_CHECKS = 1 ";
					String sql = "INSERT INTO pay(name, pay_money,message) VALUES(?, ?, ?)";

					System.out.println("dao"+name);
					try {
						this.pstmt = this.conn.prepareStatement(keyOff);
						this.pstmt.execute();

						this.pstmt = this.conn.prepareStatement(sql);
						this.pstmt.setString(1, "익명");
						this.pstmt.setString(2, money);
						this.pstmt.setString(3, message);

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
					String sql = "INSERT INTO pay(name, pay_money,message) VALUES(?, ?, ?)";

					System.out.println("dao2"+name);
					try {
						this.pstmt = this.conn.prepareStatement(keyOff);
						this.pstmt.execute();

						this.pstmt = this.conn.prepareStatement(sql);
						this.pstmt.setString(1, name);
						this.pstmt.setInt(2, Integer.parseInt(money));
						this.pstmt.setString(3, message);

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
	

	
	
}
