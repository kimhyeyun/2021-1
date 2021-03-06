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

/**
 * Servlet implementation class loginServlet
 */
@WebServlet("/login")
public class loginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public loginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		ServletContext context = getServletContext();
		RequestDispatcher dispatcher = context.getRequestDispatcher("/loginpage.jsp");
		dispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		HttpSession session = request.getSession();
		PrintWriter out = response.getWriter();
		
		String userid = (String)request.getParameter("userid");
		String userpw = (String)request.getParameter("userpw");
		
		UserDAO dao = new UserDAO();
		int succ = dao.UserLogin(userid, userpw);
		
		if(succ == -1){
			out.println("<script>alert('존재하지 않는 아이디입니다.')");
			out.println("history.back()");
			out.println("</script>");
		}
		else if(succ == 1){
			session.setAttribute("userid", userid);
			response.sendRedirect("main.jsp");
			out.println("<script>alert('관리자로 로그인 되었습니다.')");
			out.println("location.href='main.jsp'");
			out.println("</script>");
		}
		else if(succ == 0){
			out.println("<script>alert('관리자 비밀번호가 틀렸습니다.')");
			out.println("history.back()");
			out.println("</script>");
		}
		else if(succ == 2){
			session.setAttribute("userid", userid);
			response.sendRedirect("main.jsp");
			out.println("<script>alert('로그인 되었습니다.')");
			out.println("location.href='main.jsp'");
			out.println("</script>");
		}
		else{
			out.println("<script>alert('비밀번호가 틀렸습니다.')");
			out.println("history.back()");
			out.println("</script>");
		}
	}

}
