package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Vector;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;


//데이터 베이스에 연결하고 select, insert, update, delete 작업을 실행해주는 클래스이다.
public class MemberDAO {
	Connection con;
	PreparedStatement pstmt;
	ResultSet rs;

	public void getCon() {

		try {
			Context initctx = new InitialContext();
			Context envctx = (Context) initctx.lookup("java:comp/env");
			DataSource ds = (DataSource) envctx.lookup("jdbc/testdb");
			con = ds.getConnection();
		}catch(Exception e) {
			e.printStackTrace();
		}	
	}

	//회원가입을 하는 메소드
	public void insertMember(MemberBean mbean) {

		try{
			getCon();
			String sql = "INSERT INTO member values(?, ?, ?, ?, ?)";
			PreparedStatement pstmt = con.prepareStatement(sql);
			pstmt.setString(1, mbean.getId());
			pstmt.setString(2, mbean.getPassword1());
			pstmt.setString(3, mbean.getName());
			pstmt.setString(4, mbean.getEmail());
			pstmt.setString(5, mbean.getPhone());
			pstmt.executeUpdate();	
			//insert, update, delete시 사용하는 메소드

			//자원반납
			con.close();

		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
	//로그인을 하는 메소드
	public int getMember(String id, String password1) {
		int result = 0;
		getCon();
		
		try {
			String sql = "select count(*) from member where id=? and password1=?";
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, id);
			pstmt.setString(2, password1);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				result = rs.getInt(1);
				//1= 로그인 성공
			}
			con.close();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	//모든 회원의 정보를 리턴해주는 메소드 호출
	public Vector<MemberBean> allSelectMember(){
		//가변길이로 데이터를 저장
		Vector<MemberBean> v = new Vector<>();
		
		//무조건 데이터 베이스는 예외 처리를 해야한다.
		try {
			//커넥션 연결
			getCon();
			String sql = "select * from member";
			pstmt = con.prepareStatement(sql);
			//쿼리를 실행 시킨 결과를 리턴해서 받아줌(테이블의 검색된 결과를 자바객체에 저장)
			rs = pstmt.executeQuery();
			//반복문을 사용해서 rs에 저장된 데이터를 추출해야된다.
			while(rs.next()) {	//저장된 데이터 만큼까지 반복문을 돌리겠다라는 뜻
				MemberBean bean = new MemberBean();	//칼럼으로 나뉘어진 데이터를 빈클래스에 저장
				bean.setId(rs.getString(1));
				bean.setPassword1(rs.getString(2));
				bean.setName(rs.getString(3));
				bean.setEmail(rs.getString(4));
				bean.setPhone(rs.getString(5));
				//패키징된 memberban클래스를 벡터에 저장
				v.add(bean);	//0번부터 순서대로 데이터가 저장된다.
			}
			con.close();
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return v;
	}
		
	//한사람의 대한 정보를 리턴하는 메소드 작성
	public MemberBean oneSelectMember(String id) {
		//한사람에 대한 정보만 리턴하기에 빈클래스 객체 생성
		MemberBean bean = new MemberBean();
		
		try {
			getCon();
			String sql ="select * from member where id=?";
			pstmt = con.prepareStatement(sql);
			//?의 값을 맵핑
			pstmt.setString(1, id);
			//쿼리 실행
			rs = pstmt.executeQuery();
			if(rs.next()) {	//레코드가 있다면
				bean.setId(rs.getString(1));
				bean.setPassword1(rs.getString(2));
				bean.setName(rs.getString(3));
				bean.setEmail(rs.getString(4));
				bean.setPhone(rs.getString(5));
			}
			con.close();
		}catch(Exception e) {
			e.printStackTrace();
		}
		//리턴
		return bean;
	}
	
	//한 회원의 패스워드값을 리턴하는 메소드
	public String getPassword(String id) {
		//스트링으로 리턴을 해야하기에 스트링변수 선언
		String password="";
		try {
			getCon();
			//쿼리준비
			String sql = "selcet password1 from member where id=?";
			pstmt = con.prepareStatement(sql);
			//?에 값을 맵핑
			pstmt.setString(1, id);
			//쿼리 실행
			rs = pstmt.executeQuery();
			if(rs.next()) {
				password = rs.getString(1);//패스워드값이 저장된 칼럼인덱스
			}
			con.close();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return password;
	}
	
	//회원 정보를 수정하는 메소드
	public void updateMember(MemberBean bean) {
		getCon();
		try {
			//쿼리준비
			String sql = "update member set email=?, phone=? where id=?";
			//쿼리 실행
			pstmt = con.prepareStatement(sql);
			//?에 값을 맵핑
			pstmt.setString(1, bean.getEmail());
			pstmt.setString(2, bean.getPhone());
			pstmt.setString(3, bean.getId());
			//쿼리 실행
			pstmt.executeUpdate();
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void deleteMember(String id) {
		getCon();
		try {
			String sql = "delete from member where id=?";
			pstmt = con.prepareStatement(sql);
			//?에 값을 맵핑
			pstmt.setString(1, id);
			//쿼리 실행
			pstmt.executeUpdate();
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
