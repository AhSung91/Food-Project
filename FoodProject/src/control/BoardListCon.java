package control;

import java.io.IOException;
import java.util.Vector;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.BoardBean;
import model.BoardDAO;

@WebServlet("/BoardListCon.do")
public class BoardListCon extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqProc(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqProc(request, response);
	}
	protected void reqProc(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		int pageSize = 10;
		
		String pageNum = request.getParameter("pageNum");
		
		 if(pageNum == null){
			pageNum = "1";
		}
		int count = 0;	
		int number = 0;	
		
		int currentPage = Integer.parseInt(pageNum);
		
		BoardDAO dbao = new BoardDAO();

		count = dbao.getAllCount();
		
		int startRow = (currentPage-1)*pageSize+1;
		int endRow = currentPage * pageSize;
	
	
		Vector<BoardBean> vec = dbao.getAllBoard(startRow , endRow);
		
		number = count -(currentPage -1) * pageSize;
		
		request.setAttribute("vec", vec);
		request.setAttribute("number", number);
		request.setAttribute("pageSize", pageSize);
		request.setAttribute("count", count);
		request.setAttribute("currentPage", currentPage);
		
		RequestDispatcher dis = request.getRequestDispatcher("Board/BoardList.jsp");
		dis.forward(request, response);
	}
}
