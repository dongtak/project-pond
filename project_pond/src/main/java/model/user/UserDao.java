package model.user;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import util.DBManager;

public class UserDao {
	// Database 연동을 위한 준비
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;

	private SimpleDateFormat sdf = new SimpleDateFormat("YYYYMMdd");

	// private ArrayList<User> list; ->
	// Database 연동하여 데이터 관리하기
	// Dao는 싱글톤으로 구현하기

	private UserDao() {
	}

	private static UserDao instance = new UserDao();

	public static UserDao getInstance() {
		return instance;
	}

	// CRUD
	// ㄴ Create
	// ㄴ Read
	// ㄴ Update (Update 테이블명 SET 컬럼명1=값1, 컬럼명2=값2 ... WHERE 기본키=값3 AND 비밀번호=값4)
	// ㄴ Delete (DELETE FROM 테이블명 WHERE 기본키=값1)

	public boolean createUser(UserRequestDto userDto) {
		User result = getUserById(userDto.getId());
		if (result != null)
			return false;

		String id = userDto.getId();
		String pwd = userDto.getPwd();
		String name = userDto.getName();
		String email = userDto.getEmail();
		int birth = userDto.getBirth();
		String phone = userDto.getPhone();

		boolean check = true;

		if (id != null && pwd != null && name != null && birth != 0 && phone != null) {
			this.conn = DBManager.getConnection();
			if (this.conn != null) {
				if (!email.equals("")) {
					String sql = "INSERT INTO user(id, pwd, name, email, birth, phone) VALUES(?, ?, ?, ?, DATE(?), ?)";

					try {
						this.pstmt = this.conn.prepareStatement(sql);
						this.pstmt.setString(1, id);
						this.pstmt.setString(2, pwd);
						this.pstmt.setString(3, name);
						this.pstmt.setString(4, email);
						this.pstmt.setInt(5, birth);
						this.pstmt.setString(6, phone);

						this.pstmt.execute();

					} catch (Exception e) {
						e.printStackTrace();
						check = false;
					} finally {
						DBManager.close(this.conn, this.pstmt);
					}
				} else {
					String sql = "INSERT INTO user(id, pwd, name, birth, phone) VALUES(?, ?, ?, DATE(?), ?)";

					try {
						this.pstmt = this.conn.prepareStatement(sql);
						this.pstmt.setString(1, id);
						this.pstmt.setString(2, pwd);
						this.pstmt.setString(3, name);
						this.pstmt.setInt(4, birth);
						this.pstmt.setString(5, phone);

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

	public ArrayList<User> getUserAll() {
		ArrayList<User> list = new ArrayList<User>();

		// 1. 데이터베이스에 연동 후,
		this.conn = DBManager.getConnection();

		if (this.conn != null) {
			// 2. 연동된 DB에 execute할 SQL 쿼리를 문자열로 작성
			String sql = "SELECT * FROM user";

			try {
				// 3. 쿼리를 객체에 담아 날릴 준비
				this.pstmt = this.conn.prepareStatement(sql);

				// 4. 쿼리 실행 execute -> 반환 받은 ResultSet 을 초기화
				this.rs = this.pstmt.executeQuery();

				// 5. ResultSet의 행 읽기
				while (this.rs.next()) {
					String id = this.rs.getString(1);
					String pwd = this.rs.getString(2);
					String email = this.rs.getString(3);
					String name = this.rs.getString(4);
					Date birth = this.rs.getDate(5);
					int birthNum = Integer.parseInt(sdf.format(birth));
					String phone = this.rs.getString(6);

					User user = new User(id, pwd, email, name, birthNum, phone);
					list.add(user);
				}

			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				DBManager.close(this.conn, this.pstmt, this.rs);
			}
		}

		return list;
	}

	public User getUserById(String id) {
		User user = null;

		this.conn = DBManager.getConnection();

		if (this.conn != null) {
			String sql = "SELECT * FROM `user` WHERE id=?";

			try {
				this.pstmt = this.conn.prepareStatement(sql);
				this.pstmt.setString(1, id);

				this.rs = this.pstmt.executeQuery();

				if (this.rs.next()) {
					String pwd = this.rs.getString(2);
					String name = this.rs.getString(3);
					String email = this.rs.getString(4);
					int birth = Integer.parseInt(this.sdf.format(this.rs.getInt(5)));
					String birthNum = this.rs.getString(5);
					String phone = this.rs.getString(6);
					String address = this.rs.getString(7);
					int rank = Integer.parseInt(this.sdf.format(this.rs.getInt(8)));
					String rankNum = this.rs.getString(8);
					user = new User(id, pwd, name, email, birth, phone, address, rank);
				}
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				DBManager.close(this.conn, this.pstmt, this.rs);
			}
		}

		return user;
	}

	public void updateUser(UserRequestDto userDto, String password) {
		this.conn = DBManager.getConnection();

		if (this.conn != null && userDto.getPwd() != null && userDto.getEmail() != null && userDto.getId() != null) {
			if (userDto.getPwd() != "") {
				String sql = "UPDATE user SET password=?, email=? WHERE id=? AND password=?";

				try {
					this.pstmt = this.conn.prepareStatement(sql);
					this.pstmt.setString(1, userDto.getPwd());
					this.pstmt.setString(2, userDto.getEmail());
					this.pstmt.setString(3, userDto.getId());
					this.pstmt.setString(4, password);

					this.pstmt.execute();

				} catch (Exception e) {
					e.printStackTrace();
				} finally {
					DBManager.close(this.conn, this.pstmt);
				}
			} else {
				String sql = "UPDATE user SET email=? WHERE id=? AND password=?";

				try {
					this.pstmt = this.conn.prepareStatement(sql);
					this.pstmt.setString(1, userDto.getEmail());
					this.pstmt.setString(2, userDto.getId());
					this.pstmt.setString(3, password);

					this.pstmt.execute();

				} catch (Exception e) {
					e.printStackTrace();
				} finally {
					DBManager.close(this.conn, this.pstmt);
				}
			}
		}
	}

	public boolean deleteUserById(String id, String password) {
		this.conn = DBManager.getConnection();

		boolean check = true;

		if (this.conn != null) {
			String sql = "DELETE FROM user WHERE id=? AND password=?";

			try {
				this.pstmt = this.conn.prepareStatement(sql);
				this.pstmt.setString(1, id);
				this.pstmt.setString(2, password);

				this.pstmt.execute();

			} catch (Exception e) {
				e.printStackTrace();
				check = false;
			} finally {
				DBManager.close(this.conn, this.pstmt);
			}
		} else {
			check = false;
		}

		return check;
	}

}
