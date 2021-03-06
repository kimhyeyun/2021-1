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
 * Servlet implementation class userInfoDelete
 */
@WebServlet("/userInfoDelete")
public class userInfoDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public userInfoDeleteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		HttpSession session = request.getSession();
		PrintWriter out = response.getWriter();
		
		String userid = null;
		
		if(session.getAttribute("userid") != null) {
			userid = (String)session.getAttribute("userid");
		}
		
		UserDAO dao = new UserDAO();
		
		int succ = dao.UserDelete(userid);
		
		if(succ > 0){
			session.setAttribute("userid", null);
			out.println("<script>alert('탈퇴가 완료되었습니다.')");
			out.println("location.href ='main.jsp'");
			out.println("</script>");
		}
		else{
			out.println("<script>alert('error!')");
			out.println("history.back()");
			out.println("</script>");
		}
	

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		ServletContext context = getServletContext();
		RequestDispatcher dispatcher = context.getRequestDispatcher("/mypage.jsp");
		dispatcher.forward(request, response);
	}

}
