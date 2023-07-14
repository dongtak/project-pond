package model.fullmoon;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;

import model.pay.PayDao;

public class FullMoonDao {

	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;

	private SimpleDateFormat sdf = new SimpleDateFormat("YYYYMMdd");

	private FullMoonDao() {
	}

	private static FullMoonDao instance = new FullMoonDao();

	public static FullMoonDao getInstance() {
		return instance;
	}
	
	
	

}
