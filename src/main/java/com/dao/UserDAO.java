package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;


import com.entity.User;


public class UserDAO {
	private Connection conn;
	
	public UserDAO(Connection conn) {
		super();
		this.conn = conn;
	}
	
	public boolean addUser(User u) {
		boolean f = false;
		try {
			String sql = "insert into user(name,qualification,email,password,role) values (?,?,?,?,?)";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, u.getName());
			ps.setString(2, u.getQualification());
			ps.setString(3, u.getEmail());
			ps.setString(4, u.getPassword());
			ps.setString(5, "user");
			
			int i = ps.executeUpdate();
			if (i == 1) {
				f = true;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}
	
	public User login(String em, String psw) {
		User u = null;
		try {
			String sql = "select * from user where email=? and password=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, em);
			ps.setString(2, psw);
			
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				u = new User();
				u.setId(rs.getInt(1));
				u.setName(rs.getString(2));
				u.setEmail(rs.getString(3));
				u.setPassword(rs.getString(4));
				u.setQualification(rs.getString(5));
				u.setRole(rs.getString(6));
			}
		
		} catch (Exception e) {
			e.printStackTrace();
		}
		return u;
	}
	public User getUserById(int id) {
		User j = null;

		try {
			String sql = "select * from user where id=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, id);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				j = new User();
				j.setId(rs.getInt(1));
				j.setName(rs.getString(2));
				j.setEmail(rs.getString(3));
				j.setPassword(rs.getString(4));
				j.setQualification(rs.getString(5));
				j.setRole(rs.getString(6));

			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return j;

	}
	public List<User> getAllUserForName(String name) {
		List<User> list = new ArrayList<User>();
		User j = null;

		try {
			String sql = "select * from user where name like '%"+name+"%'";
			PreparedStatement ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				j = new User();
				j.setId(rs.getInt(1));
				j.setName(rs.getString(2));
				j.setEmail(rs.getString(3));
				j.setPassword(rs.getString(4));
				j.setQualification(rs.getString(5));
				j.setRole(rs.getString(6));
				list.add(j);

			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;

	}
	public List<User> getAllUser() {
		List<User> list = new ArrayList<User>();
		User j = null;

		try {
			String sql = "select * from user order by id desc";
			PreparedStatement ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				j = new User();
				j.setId(rs.getInt(1));
				j.setName(rs.getString(2));
				j.setEmail(rs.getString(3));
				j.setPassword(rs.getString(4));
				j.setQualification(rs.getString(5));
				j.setRole(rs.getString(6));
				list.add(j);

			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;

	}
	public boolean updateUser(User u) {
		boolean f = false;
		try {
			String sql = "update user set name=?, qualification=?, email=?, password=? where id=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, u.getName());
			ps.setString(2, u.getQualification());
			ps.setString(3, u.getEmail());
			ps.setString(4, u.getPassword());
			ps.setInt(5, u.getId());
			
			int i = ps.executeUpdate();
			if (i == 1) {
				f = true;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}
	public boolean deleteUser(int id) {
		boolean f = false;

		try {

			String sql = "delete from user where id=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, id);

			int i = ps.executeUpdate();
			if (i == 1) {
				f = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return f;
	}
	
	public User getUserByEmail(String email) {
		User j = null;

		try {
			String sql = "select * from user where email=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, email);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				j = new User();
				j.setId(rs.getInt(1));
				j.setName(rs.getString(2));
				j.setEmail(rs.getString(3));
				j.setPassword(rs.getString(4));
				j.setQualification(rs.getString(5));
				j.setRole(rs.getString(6));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return j;
	}

}
