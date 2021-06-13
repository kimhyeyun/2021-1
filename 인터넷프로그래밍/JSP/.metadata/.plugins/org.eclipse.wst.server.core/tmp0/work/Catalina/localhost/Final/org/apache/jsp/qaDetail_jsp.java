/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/8.5.64
 * Generated at: 2021-06-12 14:10:58 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import comment.CommentDTO;
import comment.CommentDAO;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.sql.Date;
import qa.QaDTO;
import java.util.List;
import qa.QaPage;
import user.UserDTO;
import qa.QaDAO;
import user.UserDAO;
import page.Page;
import java.util.ArrayList;

public final class qaDetail_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent,
                 org.apache.jasper.runtime.JspSourceImports {

  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  private static final java.util.Set<java.lang.String> _jspx_imports_packages;

  private static final java.util.Set<java.lang.String> _jspx_imports_classes;

  static {
    _jspx_imports_packages = new java.util.HashSet<>();
    _jspx_imports_packages.add("javax.servlet");
    _jspx_imports_packages.add("javax.servlet.http");
    _jspx_imports_packages.add("javax.servlet.jsp");
    _jspx_imports_classes = new java.util.HashSet<>();
    _jspx_imports_classes.add("comment.CommentDAO");
    _jspx_imports_classes.add("page.Page");
    _jspx_imports_classes.add("qa.QaDAO");
    _jspx_imports_classes.add("java.sql.Timestamp");
    _jspx_imports_classes.add("qa.QaPage");
    _jspx_imports_classes.add("comment.CommentDTO");
    _jspx_imports_classes.add("java.text.SimpleDateFormat");
    _jspx_imports_classes.add("user.UserDAO");
    _jspx_imports_classes.add("java.sql.Date");
    _jspx_imports_classes.add("java.util.ArrayList");
    _jspx_imports_classes.add("java.util.List");
    _jspx_imports_classes.add("qa.QaDTO");
    _jspx_imports_classes.add("user.UserDTO");
  }

  private volatile javax.el.ExpressionFactory _el_expressionfactory;
  private volatile org.apache.tomcat.InstanceManager _jsp_instancemanager;

  public java.util.Map<java.lang.String,java.lang.Long> getDependants() {
    return _jspx_dependants;
  }

  public java.util.Set<java.lang.String> getPackageImports() {
    return _jspx_imports_packages;
  }

  public java.util.Set<java.lang.String> getClassImports() {
    return _jspx_imports_classes;
  }

  public javax.el.ExpressionFactory _jsp_getExpressionFactory() {
    if (_el_expressionfactory == null) {
      synchronized (this) {
        if (_el_expressionfactory == null) {
          _el_expressionfactory = _jspxFactory.getJspApplicationContext(getServletConfig().getServletContext()).getExpressionFactory();
        }
      }
    }
    return _el_expressionfactory;
  }

  public org.apache.tomcat.InstanceManager _jsp_getInstanceManager() {
    if (_jsp_instancemanager == null) {
      synchronized (this) {
        if (_jsp_instancemanager == null) {
          _jsp_instancemanager = org.apache.jasper.runtime.InstanceManagerFactory.getInstanceManager(getServletConfig());
        }
      }
    }
    return _jsp_instancemanager;
  }

  public void _jspInit() {
  }

  public void _jspDestroy() {
  }

  public void _jspService(final javax.servlet.http.HttpServletRequest request, final javax.servlet.http.HttpServletResponse response)
      throws java.io.IOException, javax.servlet.ServletException {

    final java.lang.String _jspx_method = request.getMethod();
    if (!"GET".equals(_jspx_method) && !"POST".equals(_jspx_method) && !"HEAD".equals(_jspx_method) && !javax.servlet.DispatcherType.ERROR.equals(request.getDispatcherType())) {
      response.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED, "JSP들은 오직 GET, POST 또는 HEAD 메소드만을 허용합니다. Jasper는 OPTIONS 메소드 또한 허용합니다.");
      return;
    }

    final javax.servlet.jsp.PageContext pageContext;
    javax.servlet.http.HttpSession session = null;
    final javax.servlet.ServletContext application;
    final javax.servlet.ServletConfig config;
    javax.servlet.jsp.JspWriter out = null;
    final java.lang.Object page = this;
    javax.servlet.jsp.JspWriter _jspx_out = null;
    javax.servlet.jsp.PageContext _jspx_page_context = null;


    try {
      response.setContentType("text/html; charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("<head>\n");
      out.write("<meta charset=\"UTF-8\">\n");
      out.write("<meta name=\"viewport\" content=\"width=device-width\">\n");
      out.write("\n");
      out.write("<title>REVIEW</title>\n");
      out.write("<link rel=\"stylesheet\" href=\"css/menu.css\">\n");
      out.write("<link rel=\"stylesheet\" href=\"css/qadetail.css\">\n");
      out.write("\n");
      out.write("<script type=\"text/javascript\">\n");
      out.write("\tfunction qaDelete(qid,quserid){\n");
      out.write("\t\tif(confirm(\"정말 삭제하시겠습니까?\")){\n");
      out.write("\t\t\tlocation.href = \"qaDelete?qid=\"+qid+\"&quserid=\"+quserid;\n");
      out.write("\t\t}\n");
      out.write("\t}\n");
      out.write("</script>\n");
      out.write("\n");
      out.write("</head>\n");
      out.write("<body>\n");
      out.write("\t");

	request.setCharacterEncoding("utf-8");
	QaDAO dao = new QaDAO();
	Page p = new Page();

	int totalcnt = dao.getTotalCnt();

	String userid = null;
	boolean admin = false;
	
	if(session.getAttribute("userid") != null){
		userid = (String)session.getAttribute("userid");
		UserDAO udao = new UserDAO();
		UserDTO dto = udao.getById(userid);
		if(dto.getAdmin() == 1)
			admin = true;
	}
	
	int qid = -1;
	qid = Integer.parseInt(request.getParameter("qid"));
	
	QaDTO q = dao.SearchOne(qid);
	
	pageContext.setAttribute("q", q);
	
	CommentDAO cdao = new CommentDAO();
	int cnt = cdao.TotalCnt(qid);
	
	
      out.write("\n");
      out.write("\t<div class=\"wrap\">\n");
      out.write("\t\t<aside class=\"left\">\n");
      out.write("\t\t\t<h1 id=\"home\">\n");
      out.write("\t\t\t\t<a href=\"main.jsp\"><img src=\"static/home.png\"></a>\n");
      out.write("\t\t\t</h1>\n");
      out.write("\t\t\t<!-- 카테고리 -->\n");
      out.write("\t\t\t<section id=\"category\">\n");
      out.write("\t\t\t\t<ul>\n");
      out.write("\t\t\t\t\t<li style=\"margin-bottom: 10px;\"><a href=\"main.jsp\">HOME</a></li>\n");
      out.write("\t\t\t\t\t<li style=\"margin-bottom: 10px;\"><a href=\"product.jsp?pcode=1\">IPHONE</a></li>\n");
      out.write("\t\t\t\t\t<li style=\"margin-bottom: 10px;\"><a href=\"product.jsp?pcode=2\">AIRPODS</a></li>\n");
      out.write("\t\t\t\t\t<li style=\"margin-bottom: 10px;\"><a href=\"product.jsp?pcode=3\">SMART\n");
      out.write("\t\t\t\t\t\t\tTOK</a></li>\n");
      out.write("\t\t\t\t\t<li style=\"margin-bottom: 10px;\"><a href=\"product.jsp?pcode=4\">KEYRING</a></li>\n");
      out.write("\t\t\t\t\t<li style=\"margin-bottom: 10px;\"><a href=\"qa.jsp\">Q&A</a></li>\n");
      out.write("\t\t\t\t</ul>\n");
      out.write("\t\t\t</section>\n");
      out.write("\t\t</aside>\n");
      out.write("\t\t<aside id=\"right\"></aside>\n");
      out.write("\n");
      out.write("\t\t<div class=\"container\">\n");
      out.write("\t\t\t<header>\n");
      out.write("\t\t\t\t<div id=\"user\">\n");
      out.write("\t\t\t\t\t<ul>\n");
      out.write("\t\t\t\t\t\t");

						if (userid == null) {
						
      out.write("\n");
      out.write("\t\t\t\t\t\t<li><a href=\"loginpage.jsp\">로그인</a></li>\n");
      out.write("\t\t\t\t\t\t<li><a href=\"joinform.jsp\">회원가입</a></li>\n");
      out.write("\t\t\t\t\t\t");

						} else {
						
      out.write("\n");
      out.write("\t\t\t\t\t\t<li><a href=\"logout.jsp\">로그아웃</a></li>\n");
      out.write("\t\t\t\t\t\t<li><a href=\"mypage.jsp\">마이페이지</a></li>\n");
      out.write("\t\t\t\t\t\t");

						}
						
      out.write("\n");
      out.write("\t\t\t\t\t\t<li><a href=\"cart.jsp\">장바구니</a></li>\n");
      out.write("\t\t\t\t\t</ul>\n");
      out.write("\t\t\t\t</div>\n");
      out.write("\t\t\t</header>\n");
      out.write("\n");
      out.write("\t\t\t<div class=\"contents\">\n");
      out.write("\t\t\t\t<div class=\"titleArea\">\n");
      out.write("\t\t\t\t\t<h2>Q&A</h2>\n");
      out.write("\t\t\t\t</div>\n");
      out.write("\n");
      out.write("\t\t\t\t<div id=\"qabox\">\n");
      out.write("\t\t\t\t\t<table>\n");
      out.write("\t\t\t\t\t\t<tbody>\n");
      out.write("\t\t\t\t\t\t\t<tr>\n");
      out.write("\t\t\t\t\t\t\t\t<th scope=\"row\">제목</th>\n");
      out.write("\t\t\t\t\t\t\t\t<td>");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${q.qtitle }", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null));
      out.write("</td>\n");
      out.write("\t\t\t\t\t\t\t</tr>\n");
      out.write("\t\t\t\t\t\t\t<tr>\n");
      out.write("\t\t\t\t\t\t\t\t<th scope=\"row\">작성자</th>\n");
      out.write("\t\t\t\t\t\t\t\t<td>");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${q.userid }", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null));
      out.write("</td>\n");
      out.write("\t\t\t\t\t\t\t</tr>\n");
      out.write("\t\t\t\t\t\t\t<tr>\n");
      out.write("\t\t\t\t\t\t\t\t<td colspan=\"2\">\n");
      out.write("\t\t\t\t\t\t\t\t\t<ul class=\"etcArea\">\n");
      out.write("\t\t\t\t\t\t\t\t\t\t<li>\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t<strong>작성일</strong>\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t<span class=\"txtNum\">\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t");

												Timestamp timestamp = q.getQdate();
												SimpleDateFormat ConTimeFormat = new SimpleDateFormat("yyyy-MM-dd");
											
      out.write("\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t");
      out.print(ConTimeFormat.format(timestamp) );
      out.write("\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t</span>\n");
      out.write("\t\t\t\t\t\t\t\t\t\t</li>\n");
      out.write("\t\t\t\t\t\t\t\t\t</ul>\n");
      out.write("\t\t\t\t\t\t\t\t\t<div class=\"detail\">\n");
      out.write("\t\t\t\t\t\t\t\t\t\t");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${q.qcontent }", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null));
      out.write("\n");
      out.write("\t\t\t\t\t\t\t\t\t</div>\n");
      out.write("\t\t\t\t\t\t</tbody>\n");
      out.write("\t\t\t\t\t</table>\n");
      out.write("\t\t\t\t</div>\n");
      out.write("\n");
      out.write("\t\t\t\t<a onclick=\"qaDelete('");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${q.qid}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null));
      out.write('\'');
      out.write(',');
      out.write('\'');
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${q.userid }", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null));
      out.write("')\" id=\"removebtn\" >DELETE</a>\n");
      out.write("\t\n");
      out.write("\t\t\t\t\n");
      out.write("\t\t\t\t<div id=\"cdiv\" style=\"margin-top: 100px;\">\n");
      out.write("\t\t\t\t");
if(cnt > 0){ 
					List<CommentDTO> list = cdao.SearchAll(qid);
				
      out.write("\n");
      out.write("\t\t\t\t<div id=\"clist\">\n");
      out.write("\t\t\t\t\t");
for(int i=0;i<list.size();i++){ 
      out.write("\n");
      out.write("\t\t\t\t\t<ul id=\"cul\" style=\"-webkit-padding-start:0px;\">\n");
      out.write("\t\t\t\t\t\t<li>\n");
      out.write("\t\t\t\t\t\t\t<div class=\"commentTop\">\n");
      out.write("\t\t\t\t\t\t\t\t<strong class=\"name\">");
      out.print(list.get(i).getUserid() );
      out.write("</strong>\n");
      out.write("\t\t\t\t\t\t\t\t<span class=\"date\">\n");
      out.write("\t\t\t\t\t\t\t\t\t");

										timestamp = list.get(i).getCdate();
									
      out.write("\n");
      out.write("\t\t\t\t\t\t\t\t\t");
      out.print(ConTimeFormat.format(timestamp) );
      out.write("\n");
      out.write("\t\t\t\t\t\t\t\t</span>\n");
      out.write("\t\t\t\t\t\t\t</div>\n");
      out.write("\t\t\t\t\t\t\t<span class=\"btn\">\n");
      out.write("\t\t\t\t\t\t\t\t<a href=\"deleteComment?cid=");
      out.print(list.get(i).getCid());
      out.write("&qid=");
      out.print(qid);
      out.write("&userid=");
      out.print(list.get(i).getUserid());
      out.write("\">삭제</a>\n");
      out.write("\t\t\t\t\t\t\t</span>\n");
      out.write("\t\t\t\t\t\t\t<div class=\"comment_div\">\n");
      out.write("\t\t\t\t\t\t\t\t<span id=\"comment_content\">");
      out.print(list.get(i).getCcontent() );
      out.write("</span>\n");
      out.write("\t\t\t\t\t\t\t</div>\n");
      out.write("\t\t\t\t\t\t</li>\n");
      out.write("\t\t\t\t\t</ul>\n");
      out.write("\t\t\t\t\t");
} 
      out.write("\n");
      out.write("\t\t\t\t</div>\n");
      out.write("\t\t\t\t");
} 
      out.write("\n");
      out.write("\t\t\t\t<div style=\"background: #f9f9f9;padding: 10px;\">\n");
      out.write("\t\t\t\t\t<form action=\"addComment?qid=");
      out.print(qid );
      out.write("\" method=\"post\">\n");
      out.write("\t\t\t\t\t\t<p id=\"fp\"><span>이름 :</span><input id=\"comment_name\" value=");
      out.print(userid );
      out.write(" name=\"userid\" readonly=\"readonly\"></p>\n");
      out.write("\t\t\t\t\t\t<div class=\"comment_view\">\n");
      out.write("\t\t\t\t\t\t\t<textarea id=\"comment\" name=\"ccontent\" ></textarea>\n");
      out.write("\t\t\t\t\t\t\t<input type=\"submit\" id=\"csub\" value=\"확인\">\n");
      out.write("\t\t\t\t\t\t</div>\n");
      out.write("\t\t\t\t\t</form>\n");
      out.write("\t\t\t\t</div>\n");
      out.write("\t\t\t\t</div>\n");
      out.write("\t\t\t</div>\n");
      out.write("\n");
      out.write("\t\t\t<footer>\n");
      out.write("\t\t\t\t<div id=\"insta\">\n");
      out.write("\t\t\t\t\t<div class=\"titleArea\">\n");
      out.write("\t\t\t\t\t\t<h2>INSTAGRAM</h2>\n");
      out.write("\t\t\t\t\t\t<p onclick=\"window.open('http://www.instagram.com/potato_yunn')\">@potato_yun</p>\n");
      out.write("\t\t\t\t\t</div>\n");
      out.write("\t\t\t\t</div>\n");
      out.write("\t\t\t\t<div id=\"f_menu\">\n");
      out.write("\t\t\t\t\t<span>ABOUT&nbsp;&nbsp;</span> <span>GUIDE&nbsp;&nbsp;</span> <span>AGREEMENT&nbsp;&nbsp;</span>\n");
      out.write("\t\t\t\t\t<span>PRIVACY</span>\n");
      out.write("\t\t\t\t</div>\n");
      out.write("\t\t\t</footer>\n");
      out.write("\t\t</div>\n");
      out.write("\t</div>\n");
      out.write("</body>\n");
      out.write("</html>");
    } catch (java.lang.Throwable t) {
      if (!(t instanceof javax.servlet.jsp.SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          try {
            if (response.isCommitted()) {
              out.flush();
            } else {
              out.clearBuffer();
            }
          } catch (java.io.IOException e) {}
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
