package model.cardInfo;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;


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
	
}
