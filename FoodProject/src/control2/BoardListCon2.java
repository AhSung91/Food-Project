package control2;

import java.io.IOException;
import java.util.Vector;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model2.BoardDAO2;
import model2.BoardBean2;

@WebServlet("/BoardListCon2.do")
public class BoardListCon2 extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqProc(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqProc(request, response);
	}
	protected void reqProc(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		
		int pageSize = 10;
		
		String pageNum = request.getParameter("pageNum");
		
		 if(pageNum == null){
			pageNum = "1";
		}
		int count = 0;	
		int number = 0;	
		
		int currentPage = Integer.parseInt(pageNum);
		
		BoardDAO2 bdao = new BoardDAO2();

		int startRow = (currentPage-1)*pageSize+1;
		int endRow = currentPage * pageSize;
	
		Vector<BoardBean2> vec = new Vector<>();
		
		String reName = (String)session.getAttribute("recipe");	//레시피의 값을 저장
		
		if(reName.equals("레시피")){	//전체 레시피를 눌렀을 경우 모든 레시피 목록들을 불러온다
			count = bdao.getAllCount();
			vec = bdao.getAllBoard(startRow , endRow);
			
		}else{						//원하는 레시피의 카테고리를 눌렀을 경우 해당하는 레시피의 목록들을 불러온다
			vec = bdao.getRecipeBoard(startRow, endRow, reName);
			count = bdao.getRecipeCount(reName);
		}
		
		number = count -(currentPage -1) * pageSize;
		
		request.setAttribute("vec", vec);
		request.setAttribute("number", number);
		request.setAttribute("pageSize", pageSize);
		request.setAttribute("count", count);
		request.setAttribute("currentPage", currentPage);
		RequestDispatcher dis = request.getRequestDispatcher("Board2/BoardList2.jsp");
		dis.forward(request, response);
	}
}
