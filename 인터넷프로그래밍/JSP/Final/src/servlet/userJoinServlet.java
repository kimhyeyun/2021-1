package servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import user.UserDAO;
import user.UserDTO;

/**
 * Servlet implementation class userJoinServlet
 */
@WebServlet(name = "userjoin", urlPatterns = { "/userjoin" })
public class userJoinServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public userJoinServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		ServletContext context = getServletContext();
		RequestDispatcher dispatcher = context.getRequestDispatcher("/joinform.jsp");
		dispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		request.setCharacterEncoding("utf-8");
		
		HttpSession session = request.getSession();
		PrintWriter out = response.getWriter();
		
		UserDTO dto = new UserDTO();
		
		dto.setUserid((String)request.getParameter("userid"));
		dto.setUserpw((String)request.getParameter("userpw"));
		dto.setUsername((String)request.getParameter("username"));
		dto.setUserphone((String)request.getParameter("userphone"));
		
		UserDAO dao = new UserDAO();
		int succ = dao.UserInsert(dto);
		
		if(succ == -1){
			out.println("<script>alert('중복된 아이디가 존재합니다.')");
			out.println("history.back()");
			out.println("</script>");
		}
		else if(succ > 0 ){
			out.println("<script>alert('회원가입이 완료되었습니다.')");
			out.println("location.href = 'main.jsp'");
			out.println("</script>");
		}
		else{
			out.println("<script>alert('에러발생!.')");
			out.println("history.back()");
			out.println("</script>");
		}
		
	}

}
