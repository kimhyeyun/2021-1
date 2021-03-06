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
 * Servlet implementation class productAddServlet
 */
@WebServlet("/productAdd")
public class productAddServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public productAddServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		ServletContext context = getServletContext();
		RequestDispatcher dispatcher = context.getRequestDispatcher("/addProduct.jsp");
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
		 
		ProductDTO dto = new ProductDTO();
		
		dto.setPname((String)request.getParameter("pname"));
		dto.setPcontent((String)request.getParameter("pcontent"));
		dto.setPimage((String)request.getParameter("pimage"));
		
		String pprice = (String) request.getParameter("pprice");
		String pcode = (String)request.getParameter("pcode");
		
		dto.setPprice(Integer.parseInt(pprice));
		dto.setPcode(Integer.parseInt(pcode));
		
		ProductDAO dao = new ProductDAO();
		int succ = dao.AddProduct(dto);
		if(succ > 0){
			out.println("<script>alert('?????? ????????? ?????????????????????.')");
			out.println("location.href = 'product.jsp?pcode="+dto.getPcode()+"'");
			out.println("</script>");
		}
		else{
			out.println("<script>alert('????????????!')");
			out.println("history.back()");
			out.println("</script>");
		}

	}

}
