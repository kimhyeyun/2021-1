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
 * Servlet implementation class qaAddServlet
 */
@WebServlet("/qaAdd")
public class qaAddServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public qaAddServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		ServletContext context = getServletContext();
		RequestDispatcher dispatcher = context.getRequestDispatcher("/addQa.jsp");
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
		
		String userid = null;
		
		if(session.getAttribute("userid") != null) {
			userid = (String)session.getAttribute("userid");
		}
		
		QaDAO dao = new QaDAO();
		QaDTO dto = new QaDTO();
		
		dto.setQtitle((String)request.getParameter("qtitle"));
		dto.setQcontent((String)request.getParameter("qcontent"));
		dto.setUserid(userid);
		
		int succ = -1;
		
		if(userid.equals("admin")) {
			succ = dao.AddAdminQa(dto);
		}
		else {
			succ = dao.AddUserQa(dto);
		}
		
		if(succ > 0) {
			out.println("<script>alert('????????? ??????????????????.')");
			out.println("location.href='qa.jsp'");
			out.println("</script>");
		}
		else {
			out.println("<script>alert('error!')");
			out.println("history.back()");
			out.println("</script>");
		}
	}

}
