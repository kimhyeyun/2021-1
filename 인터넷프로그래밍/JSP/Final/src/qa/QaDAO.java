package qa;

import java.io.InputStream;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class QaDAO {
	
	private static SqlSessionFactory sqlMapper;
	
	static {
		String resource = "mybatis/SqlMapConfig.xml";
		try {
			InputStream inputstream = Resources.getResourceAsStream(resource);
			sqlMapper = new SqlSessionFactoryBuilder().build(inputstream);
		}catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			System.out.println("SqlSessionFactory Exception!");
		}
	}
	
	//review 전체 갯수
	public int getTotalCnt() {
		SqlSession session = sqlMapper.openSession();
		int cnt = -1;
		cnt = session.selectOne("qagetTotalCnt");
		session.close();
		return cnt;
	}
	
	//review 전체 리스트
	public List<QaDTO> SearchAll(QaPage page){
		SqlSession session = sqlMapper.openSession();
		List<QaDTO> list = null;
		list = session.selectList("qaSearchAll", page);
		session.close();
		return list;
	}
	
	//하나 가져오기
	public QaDTO SearchOne(int qid) {
		SqlSession session = sqlMapper.openSession();
		QaDTO dto = null;
		dto = session.selectOne("qaSearchOne",qid);
		session.close();
		return dto;
	}
	
	//review 추가하기
	public int AddUserQa(QaDTO dto) {
		SqlSession session = sqlMapper.openSession();
		int succ = 0;
		succ = session.insert("qaInsertuser",dto);
		session.commit();
		session.close();
		return succ;
	}

	//공지 추가하기 
	public int AddAdminQa(QaDTO dto) {
		SqlSession session = sqlMapper.openSession();
		int succ = 0;
		succ = session.insert("qaInsertadmin",dto);
		session.commit();
		session.close();
		return succ;
	}
	
	//review 삭제하기
	public int RemoveQa(int qid) {
		SqlSession session = sqlMapper.openSession();
		int succ = 0;
		succ = session.delete("qaDelete",qid);
		session.commit();
		session.close();
		return succ;
	}
}
