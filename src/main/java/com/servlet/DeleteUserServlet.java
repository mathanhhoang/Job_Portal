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

@WebServlet("/deleteuser")
public class DeleteUserServlet extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			
			int id = Integer.parseInt(req.getParameter("id"));
			
			UserDAO dao = new UserDAO(DBConnect.getConn());
			boolean f = dao.deleteUser(id);
			
			
			HttpSession session = req.getSession();

			if (f) {
				
				session.setAttribute("succMsg", "Xóa thành công!");
				
				resp.sendRedirect("view_user.jsp");

			} else {

				session.setAttribute("succMsg", "Thất bại!");
				resp.sendRedirect("view_user.jsp");

			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
