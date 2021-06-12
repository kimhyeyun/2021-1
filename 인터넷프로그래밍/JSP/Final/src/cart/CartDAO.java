package cart;

import java.io.InputStream;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class CartDAO {
	
	private static SqlSessionFactory sqlMapper;
	
	static {
		String resource = "mybatis/SqlMapConfig.xml";
		try {
			InputStream inputStream = Resources.getResourceAsStream(resource);
			sqlMapper = new SqlSessionFactoryBuilder().build(inputStream);
		}catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			System.out.println("SqlSessionFactory Exception!");
		}
	}
	
	//cart 담기
	public int AddCart(CartDTO dto) {
		SqlSession session = sqlMapper.openSession();
		int succ = 0;
		succ = session.insert("cartInsert", dto);
		session.commit();
		session.close();
		return succ;
	}
	
	//cart에서 삭제
	public int RemoveCart(UserProduct p) {
		SqlSession session = sqlMapper.openSession();
		int succ = 0;
		succ = session.delete("cartDelete",p);
		session.commit();
		session.close();
		return succ;
	}

	//cart list 가져오기
	public List<CartDTO> SearchAll(String userid){
		SqlSession session = sqlMapper.openSession();
		List<CartDTO> list = null;
		list = session.selectList("cartSearchAll",userid);
		session.close();
		return list;
	}

	//cart 내 제품 갯수
	public int totalCnt(String userid) {
		SqlSession session = sqlMapper.openSession();
		int cnt = -1;
		cnt = session.selectOne("carttotalCnt",userid);
		session.close();
		return cnt;
	}
	
	//cart에 존재>
	public int isProductinCart(UserProduct p) {
		SqlSession session = sqlMapper.openSession();
		int succ = 0;
		succ = session.selectOne("isProductinCart",p);
		session.close();
		return succ;
	}
}
