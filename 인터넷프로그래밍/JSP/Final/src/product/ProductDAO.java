package product;

import java.io.InputStream;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class ProductDAO {

	private static SqlSessionFactory sqlMapper;
	
	static {
		String resource = "mybatis/SqlMapConfig.xml";
		try {
			InputStream inputstream  = Resources.getResourceAsStream(resource);
			sqlMapper = new SqlSessionFactoryBuilder().build(inputstream);
		}catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			System.out.println("SqlSessionFactory Exception!");
		}
	}
	
	//product 전체 갯수
	public int getTotalCnt(int pcode) {
		SqlSession session = sqlMapper.openSession();
		int cnt = -1;
		cnt = session.selectOne("productgetTotalCnt", pcode);
		session.close();
		return cnt;
	}
	
	//product 전체 리스트
	public List<ProductDTO> SearchAll(ProductPage pp){
		SqlSession session = sqlMapper.openSession();
		List<ProductDTO> list = null;
		list = session.selectList("productSearchAll",pp);
		session.close();
		return list;
	}
	
	//한 제품 가져오기
	public ProductDTO SearchOne(int pid) {
		SqlSession session = sqlMapper.openSession();
		ProductDTO dto = null;
		dto = session.selectOne("productSearchOne",pid);
		session.close();
		return dto;
		
	}
	
	//제품 추가하기
	public int AddProduct(ProductDTO dto) {
		SqlSession session = sqlMapper.openSession();
		int succ = 0;
		succ = session.insert("productInsert", dto);
		session.commit();
		session.close();
		return succ;
	}
	
	//제품 삭제하기
	public int RemoveProduct(int pid) {
		SqlSession session = sqlMapper.openSession();
		int succ = 0;
		succ = session.delete("productDelete", pid);
		session.commit();
		session.close();
		return succ;
	}
}
