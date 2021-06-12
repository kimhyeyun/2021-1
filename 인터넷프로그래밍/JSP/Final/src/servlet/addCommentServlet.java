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

import comment.CommentDAO;
import comment.CommentDTO;

/**
 * Servlet implementation class addCommentServlet
 */
@WebServlet("/addComment")
public class addCommentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public addCommentServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		ServletContext context = getServletContext();
		RequestDispatcher dispatcher = context.getRequestDispatcher("/qaDetail.jsp");
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
		if (session.getAttribute("userid") == null) {
			out.println("<script>alert('로그인해주세요')");
			out.println("location.href = 'loginpage.jsp'");
			out.println("</script>");
		} else {
			userid = (String) session.getAttribute("userid");
			int qid = Integer.parseInt(request.getParameter("qid"));
			
			CommentDAO dao = new CommentDAO();
			CommentDTO dto = new CommentDTO();
			dto.setCcontent((String)request.getParameter("ccontent"));
			dto.setQid(qid);
			dto.setUserid(userid);
			
			int succ = dao.commentInsert(dto);
			
			if(succ > 0) {
				out.println("<script>alert('댓글을 작성했습니다.')");
				out.println("location.href='qaDetail.jsp?qid="+qid+ "'");
				out.println("</script>");
			}
			else {
				out.println("<script>alert('error!')");
				out.println("history.back()");
				out.println("</script>");
			}
		}
	}

}
