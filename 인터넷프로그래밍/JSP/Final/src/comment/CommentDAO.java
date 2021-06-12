package comment;

import java.io.InputStream;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class CommentDAO {
	
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
	
	//comment 저장
	public int commentInsert(CommentDTO dto) {
		SqlSession session = sqlMapper.openSession();
		int succ = -1;
		succ = session.insert("commentInsert", dto);
		session.commit();
		session.close();
		return succ;
	}
	
	//comment 삭제
	public int commentDelete(int cid) {
		SqlSession session = sqlMapper.openSession();
		int succ = -1;
		succ = session.delete("commentDelete",cid);
		session.commit();
		session.close();
		return succ;
	}
	
	//comment 갯수
	public int TotalCnt(int qid) {
		SqlSession session = sqlMapper.openSession();
		int cnt = 0;
		cnt = session.selectOne("commentTotalCnt", qid);
		session.close();
		return cnt;
	}
	
	//comment List
	public List<CommentDTO> SearchAll(int qid){
		SqlSession session = sqlMapper.openSession();
		List<CommentDTO> list = null;
		list = session.selectList("commentSelectAll", qid);
		session.close();
		return list;
	}
}
