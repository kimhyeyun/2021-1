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
 * Servlet implementation class userInfoUpdateServlet
 */
@WebServlet("/userInfoUpdate")
public class userInfoUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public userInfoUpdateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		ServletContext context = getServletContext();
		RequestDispatcher dispatcher = context.getRequestDispatcher("/mypage.jsp");
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
		int succ = dao.UserUpdate(dto);
		
		if(succ > 0) {
			session.setAttribute("userid", dto.getUserid());
			out.println("<script>alert('???????????? ????????? ?????????????????????.')");
			out.println("location.href = 'mypage.jsp'");
			out.println("</script>");
		}
		else {
			out.println("<script>alert('????????????!.')");
			out.println("history.back()");
			out.println("</script>");
			
		}
	}

}
