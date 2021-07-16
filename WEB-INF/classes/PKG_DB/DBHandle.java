package PKG_DB;

import java.sql.*;

import oracle.jdbc.OracleTypes;

public class DBHandle {
	
	private String[] dbInfos;
	private Connection con;
	
	public void setDBInfo(String[] dbInfos) {
		this.dbInfos = dbInfos;
	}//한꺼번에 처리하는 방법
	
	/*
	public void setUserID(String userID) {
		this.userID = userID;
	}

	public void setUserPass(String userPass) {
		this.userPass = userPass;
	}

	public void setUrl(String url) {
		this.url = url;
	}*/

	
	public void getConnenction() {
		//getConnenction 얘를 불러주면 아래가 실행이 된다
		this.con = null;
	
			try {
				Class.forName("oracle.jdbc.driver.OracleDriver");
				//con = DriverManager.getConnection(url, userID, userPass);
				this.con = DriverManager.getConnection(dbInfos[0],dbInfos[1],dbInfos[2]);
				
				}catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();//개발 끝나고 나면 e.printStackTrace()는 지워야할 사항
				}catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				}catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				}
			}
	
	//inline query select(resultSet 받아와야함), delete, update, insert
	
	public Statement getStatement() {
		getConnenction();
		Statement stmt = null;
		
		try {
			stmt = this.con.createStatement();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return stmt;
	}
	
	//insert, delete, update //inline쿼리를 사용할때 사용
	public void executeQuery(String strSql) {
		Statement stmt = getStatement();
	
		try {
			stmt.execute(strSql);
			
			this.con.close();
			this.con = null;
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	//select
	public ResultSet getResultSet(String strSql) {
		
		Statement stmt = getStatement();
		ResultSet rs = null;
		
		try {
			rs = stmt.executeQuery(strSql);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return rs;
	}
	
	//1.procedure활용해서 output parameter존재하지 않는 경우
	public void executeQuery(String strProcName, String [] strParams) {
		
		getConnenction();
		try {
			
			CallableStatement csmt = this.con.prepareCall(strProcName);
			
			for(int i=0; i<strParams.length; i++) {
				csmt.setString(i + 1, strParams[i]);
				//0부터 시작하는데 데이터베이스에서 1부터 시작하니까 +1해주기
			}
			
			csmt.execute();
			this.con.close();
			this.con = null;
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
	//2.output parameter이 존재하는 경우 - ResultSet => output Cursor 인 경우만
	public ResultSet getResultSet(String strProcName, String [] strParams) {
		
		getConnenction();
		ResultSet rs = null;
		
		try{
		CallableStatement csmt = this.con.prepareCall(strProcName);
				
				int paramsLength = strParams.length;
				// 몇개인지 먼저 받아 놓자
				for(int i=0; i<paramsLength; i++) {
					csmt.setString(i + 1, strParams[i]);
					//0부터 시작하는데 데이터베이스에서 1부터 시작하니까 +1해주기
				}
				
				csmt.registerOutParameter(paramsLength +1,OracleTypes.CURSOR);
				
				csmt.execute();
				rs = (ResultSet)csmt.getObject(paramsLength +1);
		}
		
		catch(SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return rs;
	}
	
	public void setClose() {
		if(this.con != null) {
			try {
				this.con.close();
				this.con = null;
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}
	}//return을 받아야하는 경우에는 close를 해줄 수 없으니까 아예 새로 기능을 구현해놓는다. 이렇게 만들어놓으면 위에 따로 close줬던 애들 다 지워도 무방함
	
}//end
