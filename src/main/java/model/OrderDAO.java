package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Vector;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class OrderDAO {
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
	
	//하나의 새로운 게시글이 넘어와서 저장되는 메소드
		public void insertOrder(OrderBean bean) {
			getCon();
			//빈 클래스에 넘어오지 않았던 데이터들을 초기화
			//int ref=0;	//글 그룹을 의미 = 쿼리를 실행시켜서 가장큰 ref값을 가져온후 +1을 더해주면 된다.
			//int re_step=1;	//새글이기에 = 부모글이기에
			//int re_level=1;
				
			try {
				//가장 큰 num값을 읽어오는 쿼리 준비
				String numsql = "select max(num) from order_";
				//쿼리실행 객체
				pstmt = con.prepareStatement(numsql);
				//쿼리 실행후 결과를 리턴
				rs = pstmt.executeQuery();
				if(rs.next()) {	
					//결과값이 있다면
					//ref = rs.getInt(1)+1;	//최대값에 +1을 더해서 글 그룹을 설정해준다.
				}
				//실제로 게시글 전체값을 테이블에 저장한다
				String sql = "insert into order_ (ordernum, brand, option_, size, pieces, doller, engname, url, tracking) values (?, ?, ?, ?, ?, ?, ?, ?, ?)";
				pstmt = con.prepareStatement(sql);
				//?에 값을 맵핑
				pstmt.setString(1, bean.getOrdernum());
				pstmt.setString(2, bean.getBrand());
				pstmt.setString(3, bean.getOption_());
				pstmt.setString(4, bean.getSize());
				pstmt.setString(5, bean.getPieces());
				pstmt.setString(6, bean.getDoller());
				pstmt.setString(7, bean.getEngname());
				pstmt.setString(8, bean.getUrl());
				pstmt.setString(9, bean.getTracking());
				//쿼리를 실행
				pstmt.executeUpdate();
				con.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		//모든 게시글을 리턴해주는 메소드 작성
		public Vector<OrderBean> getAllOrder(){
			Vector<OrderBean> v = new Vector<>();
			getCon();
			
			try {
				//쿼리 준비
				String sql = "select * from order_ order by num desc";
				pstmt = con.prepareStatement(sql);
				rs = pstmt.executeQuery();
				while(rs.next()) {
					OrderBean bean = new OrderBean();
					bean.setNum(rs.getInt(1));
					bean.setOrdernum(rs.getString(2));
					bean.setBrand(rs.getString(3));
					bean.setOption_(rs.getString(4));
					bean.setSize(rs.getString(5));				
					bean.setPieces(rs.getString(6));
					bean.setDoller(rs.getString(7));
					bean.setEngname(rs.getString(8));
					bean.setUrl(rs.getString(9));
					bean.setTracking(rs.getString(10));
					v.add(bean);
				}
				con.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
			return v;
		}
		
		//하나의 게시글을 리턴하는 메소드
		public OrderBean getOneOrder(int num) {
			
			//리턴타입 선언
			OrderBean bean = new OrderBean();
			getCon();
			
			try {
				//조회수 증가쿼리
				String sql = "select * from order_  where num=?";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, num);
				//쿼리 실행후 결과를 리턴
				rs = pstmt.executeQuery();
				if(rs.next()) {
					bean.setNum(rs.getInt(1));
					bean.setOrdernum(rs.getString(2));
					bean.setBrand(rs.getString(3));
					bean.setOption_(rs.getString(4));
					bean.setSize(rs.getString(5));				
					bean.setPieces(rs.getString(6));
					bean.setDoller(rs.getString(7));
					bean.setEngname(rs.getString(8));
					bean.setUrl(rs.getString(9));
					bean.setTracking(rs.getString(10));
				}
				con.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
			return bean;
		}
		
		//orderupdate용 하나의 게시글을 리턴
		public OrderBean getOneUpdateOrder(int num) {
			
			OrderBean bean = new OrderBean();
			getCon();
			
			try {
				//조회수 증가쿼리
				String sql = "select * from order_ where num=?";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, num);
				//쿼리 실행후 결과를 리턴
				rs = pstmt.executeQuery();
				if(rs.next()) {
					bean.setNum(rs.getInt(1));
					bean.setOrdernum(rs.getString(2));
					bean.setBrand(rs.getString(3));
					bean.setOption_(rs.getString(4));
					bean.setSize(rs.getString(5));				
					bean.setPieces(rs.getString(6));
					bean.setDoller(rs.getString(7));
					bean.setEngname(rs.getString(8));
					bean.setUrl(rs.getString(9));
					bean.setTracking(rs.getString(10));
				}
				con.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
			return bean;
		}
		
		//update와 delete시 필요한 패스워드값을 리턴해주는 메소드
		public String getOrdernum(int num) {
			//리턴할 변수 객체 선언
			String ordernum= "";
			getCon();
			
			try {
				//쿼리 준비
				String sql = "select ordernum from board where num=?";
				//쿼리 실행할 객체 선언
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, num);
				rs = pstmt.executeQuery();
				//주문번호 값을 저장
				if(rs.next()) {
					ordernum = rs.getString(1);
				}
				//자원반납
				con.close();
			}catch(Exception e) {
				e.printStackTrace();
			}
			return ordernum;
		}
		
		//하나의 게시글을 수정하는 메소드
		public void updateOrder(OrderBean bean) {
			getCon();
			
			try {
				//쿼리 준비
				String sql = "update order_ set ordernum=?, brand=?, option_=?, pieces=?, doller=?, engname=?, url=?, tracking=? where num=?";
				pstmt = con.prepareStatement(sql);

				//?값을 대입
				pstmt.setString(1, bean.getOrdernum());
				pstmt.setString(2, bean.getBrand());
				pstmt.setString(3, bean.getOption_());
				pstmt.setString(4, bean.getPieces());
				pstmt.setString(5, bean.getDoller());
				pstmt.setString(6, bean.getEngname());
				pstmt.setString(7, bean.getUrl());
				pstmt.setString(8, bean.getTracking());
				pstmt.setInt(9, bean.getNum());
				
				pstmt.executeUpdate();
				
				con.close();
				
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
		
	//회원정보가 있는지를 비교
	public int getMember(String id, String pass) {
		int result = 0;
		getCon();
		
		try {
			String sql = "select count(*) from member where id=? and password1=?";
			pstmt=con.prepareStatement(sql);
			
			pstmt.setString(1, id);
			pstmt.setString(2, pass);
			
			//결과 리턴
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				result = rs.getInt(1);
				//0또는 1이 저장된다.
			}
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	//하나의 게시글을 삭제하는 메소드
		public void deleteorder(int num) {
			getCon();
			
			try {
				//쿼리 준비
				String sql = "delete from order_ where num=?";
				pstmt = con.prepareStatement(sql);
				//?
				pstmt.setInt(1, num);
				//쿼리 실행
				pstmt.executeUpdate();
				//자원반납
				con.close();
				
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
}
