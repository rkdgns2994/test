package kr.or.agilin.ibatis.factory;

import java.nio.charset.Charset;

import com.ibatis.sqlmap.client.SqlMapClient;

public class SqlMapClientFactory {
	private static SqlMapClient client;
	
	static{
		Charset charSet = Charset.forName("UTF-8");
	}
	

}
