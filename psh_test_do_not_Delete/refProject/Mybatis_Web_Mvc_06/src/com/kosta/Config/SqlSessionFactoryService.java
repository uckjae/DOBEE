package com.kosta.Config;

import java.io.Reader;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class SqlSessionFactoryService {
	//private static SqlSession session;
		private static SqlSessionFactory sqlsessionfactory;
		
		static{
			String resource = "SqlMapConfig.xml";
			try{
				Reader reader = Resources.getResourceAsReader(resource);
				sqlsessionfactory = new SqlSessionFactoryBuilder().build(reader);
			 	//session = Factory.openSession();
			}catch(Exception e){
				
			}
		}
		public static SqlSessionFactory getSqlSession(){
			return sqlsessionfactory;
		}
		
}
