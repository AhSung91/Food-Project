package control;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/random.do")
public class random extends HttpServlet {
   protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      reqProc(request, response);
   }

   protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      reqProc(request, response);
   }
   protected void reqProc(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      request.setCharacterEncoding("UTF-8");
      int random=(int)(Math.random()*5);	//�̹����� ���ڸ�ŭ ����
      String food="";		//�̹����� ������ ��ü
      String foodName="";	//�̹����� �̸��� ������ ��ü
      switch (random) {
      case 0: food="image/case0.jpg";
            foodName="�����";
         break;
      case 1: food="image/case1.jpg";
            foodName="�Ұ��";
         break;
      case 2: food="image/case2.jpg";
            foodName="�ø�";
         break;
      case 3: food="image/case3.jpg";
            foodName="���Ա�";
          break;
      default: food="image/default.jpg";
            foodName="��ġ�";
          break;
      }
      request.setAttribute("foodName", foodName);
      request.setAttribute("food", food);
      RequestDispatcher dis = request.getRequestDispatcher("foodForm.jsp");
      dis.forward(request, response);
   }
}