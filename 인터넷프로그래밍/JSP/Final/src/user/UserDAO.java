package user;

import java.io.InputStream;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class UserDAO {

	private static SqlSessionFactory sqlMapper;

	static {
		String resource = "mybatis/SqlMapConfig.xml";
		try {
			InputStream inputStream = Resources.getResourceAsStream(resource);
			sqlMapper = new SqlSessionFactoryBuilder().build(inputStream);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			System.out.println("SqlSessionFactory Exception!");
		}
	}

	// ID 검색
	public UserDTO getById(String userid) {
		SqlSession session = sqlMapper.openSession();
		UserDTO dto = null;
		dto = session.selectOne("getById", userid);
		session.close();
		return dto;
	}

	// 회원가입
	public int UserInsert(UserDTO dto) {
		SqlSession session = sqlMapper.openSession();
		int succ = 0;
		UserDTO d = getById(dto.getUserid());
		if (d == null) {
			succ = session.insert("userInsert", dto);
			session.commit();
			session.close();
			return succ;
		} else {
			// 중복 아이디 있음
			return -1;
		}
	}

	// 회원탈퇴
	public int UserDelete(String userid) {
		SqlSession session = sqlMapper.openSession();
		int succ = 0;
		succ = session.delete("userDelete", userid);
		session.commit();
		session.close();

		return succ;
	}

	// 회원 수정
	public int UserUpdate(UserDTO dto) {
		SqlSession session = sqlMapper.openSession();
		int succ = 0;
		succ = session.update("userUpdate", dto);
		session.commit();
		session.close();

		return succ;
	}

	// login
	public int UserLogin(String userid, String userpw) {
		SqlSession session = sqlMapper.openSession();
		UserDTO u = getById(userid);
		if (u == null) {
			return -1;
			// 아이디 존재하지 않
		} else {
			if (u.getAdmin() == 1) {
				String pw = session.selectOne("login", userid);
				if (userpw.equals(pw)) {
					// 관리자 로그인 성공
					return 1;
				} else {
					// 관리자 로그인 실패
					return 0;
				}
			}
			else {
				String pw = session.selectOne("login", userid);
				if (userpw.equals(pw)) {
					// 일반 로그인 성공
					return 2;
				} else {
					// 일반 로그인 실패
					return 3;
				}
			}
		}
	}

}
