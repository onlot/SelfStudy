package ch09;
import java.sql.*;
import javax.sql.*;
import javax.naming.*;
public class MemberDao { // DAO (Data Access Object) : DB와 연결하고 CRUD작업
	// 싱글톤(Singleton) : 디자인 패턴, 객체를 하나만 생성해서 공유
	// static 정적, 공유, 객체를 생성하지 않고 바로 사용가능, 클래스 변수
	// 클래스를 loading(사용)할 때 딱 1회만 실행
	private static MemberDao instance = new MemberDao();
	private MemberDao() { } // 생성자 기본형, 외부에서 객체 생성하는 것을 금지
	public static MemberDao getInstance() {
		return instance;
	}
	// DataBase Connection Pool
	private Connection getConnection() {
		Connection conn = null;
		try {
			Context ctx = new InitialContext();
			DataSource ds = (DataSource)ctx.lookup("java:comp/env/jdbc/OracleDB");
			conn = ds.getConnection();
		}catch (Exception e) {
			System.out.println("연결 에러 : "+e.getMessage());
		}
		return conn;
	}
	public int insert(Member member) { // 화면에서 입력한 id, password, name
		int result = 0;
		Connection conn = getConnection(); // DB연결
		PreparedStatement pstmt = null;
		String sql = "insert into member1 values(?,?,?,sysdate)";
		try { // 데이터 입력
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, member.getId());
			pstmt.setString(2, member.getPassword());
			pstmt.setString(3, member.getName());
			result = pstmt.executeUpdate(); // 성공한 갯수
		}catch (Exception e) {	System.out.println(e.getMessage());
		}finally {
			try {
				if (pstmt != null) pstmt.close();
				if (conn != null) conn.close();
			} catch (SQLException e) {	}
		}
		return result;		
	}
	public int loginChk(String id, String password) {  // password 입력된 패스워드
		int result = 0;
		Connection conn = getConnection(); // DB연결
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select password from member1 where id=?";
		try { 
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery(); // rs에는 password가 저장
			if (rs.next()) {
				String dbPass = rs.getString("password"); // table에 저장된 패스워드
				if (password.equals(dbPass)) result = 1; // 아이디와 패스워드가 일치
				else result = 0; // 아이디는 있지만 암호는 잘못된 암호야
			} else result = -1; // 없는 아이디
		}catch (Exception e) {	System.out.println(e.getMessage());
		}finally {
			try {
				if (rs != null) rs.close();
				if (pstmt != null) pstmt.close();
				if (conn != null) conn.close();
			} catch (SQLException e) {	}
		}
		return result;		
	}
}