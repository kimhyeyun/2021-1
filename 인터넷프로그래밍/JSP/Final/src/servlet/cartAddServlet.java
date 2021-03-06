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
import product.ProductDTO;

/**
 * Servlet implementation class cartAddServlet
 */
@WebServlet("/cartAdd")
public class cartAddServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public cartAddServlet() {
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

		if (session.getAttribute("userid") == null) {
			out.println("<script>alert('로그인해주세요')");
			out.println("location.href = 'loginpage.jsp'");
			out.println("</script>");
		} else {
			userid = (String) session.getAttribute("userid");
			int pid = Integer.parseInt(request.getParameter("pid"));

			UserProduct p = new UserProduct();
			p.setPid(pid);
			p.setUserid(userid);

			CartDAO dao = new CartDAO();
			int succ = dao.isProductinCart(p);
			if(succ <= 0) {
				ProductDAO pdao = new ProductDAO();
				ProductDTO pdto = pdao.SearchOne(pid);
				CartDTO dto = new CartDTO();
				dto.setPid(pid);
				dto.setPimage(pdto.getPimage());
				dto.setPprice(pdto.getPprice());
				dto.setUserid(userid);
				dto.setPname(pdto.getPname());
				
				dao.AddCart(dto);
			}
			else {
				dao.updateProdCnt(p);
			}
			
			out.println("<script>('장바구니에 담았습니다.')");
			out.println("location.href = 'productDetail.jsp?pid="+pid+"'");
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
		RequestDispatcher dispatcher = context.getRequestDispatcher("/productDetail.jsp");
		dispatcher.forward(request, response);
	}

}
