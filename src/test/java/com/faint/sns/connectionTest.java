package com.faint.sns;

import static org.junit.Assert.*;

import java.sql.DriverManager;
import java.sql.Connection;
import org.junit.Test;


public class connectionTest {

	private static final String DRIVER = "com.mysql.jdbc.Driver";
	
	private static final String URL ="jdbc:mysql://127.0.0.1:3306/faint?useSSL=false";
	
	private static final String USER = "faint";
	private static final String PW = "faint";
	
	@Test
	public void test() throws Exception{
		Class.forName(DRIVER);
		
		try(Connection con = DriverManager.getConnection(URL, USER, PW)) {
			System.out.println(con);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
