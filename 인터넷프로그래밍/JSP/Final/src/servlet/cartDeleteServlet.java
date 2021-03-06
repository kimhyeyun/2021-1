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

import cart.CartDAO;
import cart.CartDTO;
import cart.UserProduct;
import product.ProductDAO;

/**
 * Servlet implementation class cartDeleteServlet
 */
@WebServlet("/cartDelete")
public class cartDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public cartDeleteServlet() {
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
		
		int pid = Integer.parseInt(request.getParameter("pid"));
		
		UserProduct p = new UserProduct();
		p.setPid(pid);
		p.setUserid(userid);
		
		CartDAO dao = new CartDAO();
		int succ = dao.RemoveCart(p);
		
		if(succ > 0) {
			out.println("<script>alert('삭제했습니다.')");
			out.println("location.href='cart.jsp'");
			out.println("</script>");
		}
		else {
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
		RequestDispatcher dispatcher = context.getRequestDispatcher("/cart.jsp");
		dispatcher.forward(request, response);
	}

}
