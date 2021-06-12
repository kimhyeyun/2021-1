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

import board.Board;
import board.BoardDAO;
/**
 * Servlet implementation class com_WriteServlet
 */
@WebServlet("/com_write")
public class com_WriteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public com_WriteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		ServletContext context = getServletContext();
        RequestDispatcher dispatcher = context.getRequestDispatcher("/com_write.jsp"); //넘길 페이지 주소
        dispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method String userID = null;
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
		} else {
			Board board = new Board();
		    board.setBdTitle(request.getParameter("bdTitle"));
		    board.setBdContent(request.getParameter("bdContent"));
			if(board.getBdTitle() == null || board.getBdContent() == null){
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("alert('모든 정보를 입력하세요')");
					script.println("history.back()");
					script.println("</script>");
				} else{
					BoardDAO boardDAO = new BoardDAO();
					int result = boardDAO.write(board.getBdTitle(), userID, board.getBdContent());
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
						script.println("location.href = 'community.jsp'");
						script.println("</script>");
					}
				}
		}
	}

}
