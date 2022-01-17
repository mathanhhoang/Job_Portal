package com.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DB.DBConnect;
import com.dao.UserDAO;
import com.entity.User;


@WebServlet("/add_user")
public class RegisterServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		try {
			String name = req.getParameter("name");
			String qua = req.getParameter("qua");
			String email = req.getParameter("email");
			String ps = req.getParameter("ps");

			HttpSession session = req.getSession();
			
			UserDAO dao = new UserDAO(DBConnect.getConn());
			if(dao.getUserByEmail(email) != null){
				session.setAttribute("succMsg", "Email đã tồn tại!");
				resp.sendRedirect("signup.jsp");
			}
			else {
				User u = new User(name, email, ps, qua, "User");
				boolean f = dao.addUser(u);
				if(f) {
					session.setAttribute("succMsg", "Đăng kí thành công!");
					resp.sendRedirect("signup.jsp");
				} else {
					session.setAttribute("succMsg", "Đã xảy ra lỗi!");
					resp.sendRedirect("signup.jsp");
				}
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		
	}

}
