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

import qa.QaDAO;
import qa.QaDTO;

/**
 * Servlet implementation class qaDeleteServlet
 */
@WebServlet("/qaDelete")
public class qaDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public qaDeleteServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");

		HttpSession session = request.getSession();
		PrintWriter out = response.getWriter();

		String userid = null;
		if (session.getAttribute("userid") != null) {
			userid = (String) session.getAttribute("userid");
		}

		String quser = null;
		quser = (String) request.getParameter("quserid");

		if (userid != null && (userid.equals("admin") || userid.equals(quser))) {
			int qid = -1;
			if (request.getParameter("qid") != null) {
				qid = Integer.parseInt(request.getParameter("qid"));
			}

			QaDAO dao = new QaDAO();
			int succ = dao.RemoveQa(qid);

			if (succ > 0) {
				out.println("<script>alert('질문을 삭제했습니다.')");
				out.println("location.href ='qa.jsp'");
				out.println("</script>");
			} else {
				out.println("<script>alert('error!')");
				out.println("history.back()");
				out.println("</script>");
			}
		} else {
			out.println("<script>alert('권한이 없습니다.')");
			out.println("history.back()");
			out.println("</script>");
		}

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		ServletContext context = getServletContext();
		RequestDispatcher dispatcher = context.getRequestDispatcher("/qaDetail.jsp");
		dispatcher.forward(request, response);
	}

}
