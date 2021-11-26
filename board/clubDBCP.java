package univ;

import java.sql.*;
import java.util.*;
import javax.sql.*;
import javax.naming.*;

//DBCP�� �̿��� ���̺� board ó�� �����ͺ��̽� ���� �ڹٺ��� ���α׷�
public class clubDBCP {
	// �����ͺ��̽� ������� ���� ����
		private Connection con = null;
		private PreparedStatement pstmt = null;
		private DataSource ds = null;

		// JDBC ����̹� �ε� �޼ҵ�
		public clubDBCP() {
			try {
				InitialContext ctx = new InitialContext();
			    ds = (DataSource)ctx.lookup("java:comp/env/jdbc/mysql");
			} catch (NamingException e) {
				e.printStackTrace();
			}		
		}
		
		// �����ͺ��̽� ���� �޼ҵ�
		public void connect() {
			try {
			    con = ds.getConnection();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		// �����ͺ��̽� ���� ���� �޼ҵ�
		public void disconnect() {
			if(pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			} 
			if(con != null) {
				try {
					con.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}

		// �Խ����� ��� ���ڵ带 ��ȯ �޼ҵ�
		public ArrayList<clubEntity>getclubList() {	
			connect();
			ArrayList<clubEntity> list = new ArrayList<clubEntity>();
			String SQL = "select * from club";
			try {
				pstmt = con.prepareStatement(SQL);
				ResultSet rs = pstmt.executeQuery();
				
				while (rs.next()) {
					clubEntity club = new clubEntity();
					club.setId( rs.getInt("id") );
					club.setName( rs.getString("name") );
					club.setPassword( rs.getString("password") );
					club.setTitle( rs.getString("title") );
					club.setEmail( rs.getString("email") );
					club.setRegdate( rs.getTimestamp("regdate") );
					club.setContent( rs.getString("content") );
					//����Ʈ�� �߰�
					list.add(club);
				}
				rs.close();			
			} catch (SQLException e) {
				e.printStackTrace();
			} 
			finally {
				disconnect();
			}
			return list;
		}
		
		// �� Ű id�� ���ڵ带 ��ȯ�ϴ� �޼ҵ�
		public clubEntity getclub(int id) {	
			connect();
			String SQL = "select * from club where id = ?";
			clubEntity univ = new clubEntity();
			
			try {
				pstmt = con.prepareStatement(SQL);
				pstmt.setInt(1, id);
				ResultSet rs = pstmt.executeQuery();			
				rs.next();
				univ.setId(rs.getInt("id"));
				univ.setName(rs.getString("name"));
				univ.setPassword(rs.getString("password"));
				univ.setTitle(rs.getString("title"));
				univ.setEmail(rs.getString("email"));
				univ.setRegdate(rs.getTimestamp("regdate"));
				univ.setContent(rs.getString("content"));
				rs.close();			
			} catch (SQLException e) {
				e.printStackTrace();
			} 
			finally {
				disconnect();
			}
			return univ;
		}

		// �Խù� ��� �޼ҵ�
		public boolean insertDB(clubEntity club) {
			boolean success = false; 
			connect();
			String sql ="insert into club values(0, ?, ?, ?, ?, sysdate(), ?)";		
			try {
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, club.getName());
				pstmt.setString(2, club.getPassword());
				pstmt.setString(3, club.getTitle());
				pstmt.setString(4, club.getEmail());
				pstmt.setString(5, club.getContent());
				pstmt.executeUpdate();
				success = true; 
			} catch (SQLException e) {
				e.printStackTrace();
				return success;
			}
			finally {
				disconnect();
			}
			return success;
		}
		
		// ������ ������ ���� �޼ҵ�
		public boolean updateDB(clubEntity club) {
			boolean success = false; 
			connect();		
			String sql ="update club set name=?, title=?, email=?, content=? where id=?";	
			try {
				pstmt = con.prepareStatement(sql);
				// ���ڷ� ���� GuestBook ��ü�� �̿��� ����ڰ� ������ ���� ������ SQL�� �ϼ�
				pstmt.setString(1, club.getName());
				pstmt.setString(2, club.getTitle());
				pstmt.setString(3, club.getEmail());
				pstmt.setString(4, club.getContent());
				pstmt.setInt(5, club.getId());
				int rowUdt = pstmt.executeUpdate();
				//System.out.println(rowUdt);
				if (rowUdt == 1) success = true;
			} catch (SQLException e) {
				e.printStackTrace();
				return success;
			}
			finally {
				disconnect();
			}
			return success;
		}
		
		// �Խù� ������ ���� �޼ҵ�
		public boolean deleteDB(int id) {
			boolean success = false; 
			connect();		
			String sql ="delete from club where id=?";
			try {
				pstmt = con.prepareStatement(sql);
				// ���ڷ� ���� �� Ű�� id ���� �̿��� ����
				pstmt.setInt(1, id);
				pstmt.executeUpdate();
				success = true;
			} catch (SQLException e) {
				e.printStackTrace();
				return success;
			}
			finally {
				disconnect();
			}
			return success;
		}

		// �����ͺ��̽����� ������ id�� password�� ��ġ�ϴ��� �˻��ϴ� �޼ҵ�
		public boolean isPassword(int id, String password) {
			boolean success = false;
			connect();		
			String sql ="select password from club where id=?";
			try {
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, id);
				ResultSet rs = pstmt.executeQuery();
				rs.next();
				String orgPassword = rs.getString(1);
				if ( password.equals(orgPassword) ) success = true; 
				System.out.println(success);
				rs.close();			
			} catch (SQLException e) {
				e.printStackTrace();
				return success;
			}
			finally {
				disconnect();
			}
			return success;
		}
}
