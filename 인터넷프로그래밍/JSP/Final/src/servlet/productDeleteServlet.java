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

import product.ProductDAO;
import product.ProductDTO;

/**
 * Servlet implementation class productDeleteServlet
 */
@WebServlet("/productDelete")
public class productDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public productDeleteServlet() {
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
		
		int pid = -1;
		if(request.getParameter("pid") != null) {
			pid = Integer.parseInt(request.getParameter("pid"));
		}
		
		ProductDAO dao = new ProductDAO();
		ProductDTO dto = dao.SearchOne(pid);
		int pcode = dto.getPcode();
		int succ = dao.RemoveProduct(pid);

		
		if(succ > 0){
			out.println("<script>alert('상품을 삭제했습니다.')");
			out.println("location.href ='product.jsp?pcode="+pcode+"'");
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
		RequestDispatcher dispatcher = context.getRequestDispatcher("/productDetail.jsp");
		dispatcher.forward(request, response);
	}

}
