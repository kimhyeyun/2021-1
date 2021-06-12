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

import notice.Notice;
import notice.NoticeDAO;

/**
 * Servlet implementation class Not_updateServlet
 */
@WebServlet("/Not_update")
public class Not_updateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Not_updateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		ServletContext context = getServletContext();
        RequestDispatcher dispatcher = context.getRequestDispatcher("/Not_update.jsp"); //넘길 페이지 주소
        dispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		 
	    HttpSession session = request.getSession();
		String userID = null;
		if(session.getAttribute("userID") != null){
			userID = (String) session.getAttribute("userID");
		}
		if(userID == null){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('로그인을 하세요.')");
			script.println("location.href = 'login.jsp'");
			script.println("</script>");
		} 
		int ntID = 0;
		if(request.getParameter("ntID") != null) {
			ntID = Integer.parseInt(request.getParameter("ntID"));
		}
		if(ntID == 0) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('없는글입니다.')");
			script.println("location.href = 'Notice.jsp'");
			script.println("</script>");
		}
		Notice notice = new NoticeDAO().getNotice(ntID);
		if(!userID.equals(notice.getUserID())) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('권한이 없습니다.')");
			script.println("location.href = 'Notice.jsp'");
			script.println("</script>");
		} else {
			if(request.getParameter("ntTitle") == null || request.getParameter("ntContent") == null){
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("alert('모든 정보를 입력하세요')");
					script.println("history.back()");
					script.println("</script>");
				} else{
					NoticeDAO noticeDAO = new NoticeDAO();
					int result = noticeDAO.update(ntID, request.getParameter("ntTitle"),request.getParameter("ntContent"));
					if(result == -1){
						PrintWriter script = response.getWriter();
						script.println("<script>");
						script.println("alert('실패!')");
						script.println("history.back()");
						script.println("</script>");
					}
					else{
						PrintWriter script = response.getWriter();
						script.println("<script>");
						script.println("location.href = 'Notice.jsp'");
						script.println("</script>");
					}
					
				}
		}
	}

}
