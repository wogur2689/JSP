package univ;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class company {
	public Connection con = null;
	public PreparedStatement pstmt = null;
	public DataSource ds = null;
	
	public company() { 
		try { 
			InitialContext ctx = new InitialContext();
			ds = (DataSource) ctx.lookup("java:comp/env/jdbc/mysql");
		} catch (NamingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	void connect() {
		try {
			con = ds.getConnection();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	void disconnect() {
		if(pstmt != null) {
			try {
				pstmt.close();
			}
			catch (SQLException e) {
				e.printStackTrace();
			}
		}
		if(con != null) {
			try {
				con.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
	
	public ArrayList<CompanyEntity>getCompanyList() {
		connect();
		ArrayList<CompanyEntity> list = new ArrayList<CompanyEntity>();

		String SQL = "select * from company";
		
		try {
			pstmt = con.prepareStatement(SQL);
			ResultSet rs = pstmt.executeQuery();
			
			while (rs.next()) {
				CompanyEntity com = new CompanyEntity();
				com.setCname( rs.getString("cname"));
				com.setAddress( rs.getString("address"));
				com.setJuname( rs.getString("juname"));
				com.setJuje( rs.getString("juje"));
				com.setMoney( rs.getInt("money"));
				com.setCnt( rs.getInt("cnt"));
				com.setNewcnt( rs.getInt("newcnt"));
				list.add(com);
			}
			
			rs.close();
		} catch(SQLException e) {
			e.printStackTrace();
		}
		finally {
			disconnect();
		}
		return list;
	}
}
