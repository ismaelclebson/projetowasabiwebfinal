package com.wasabi.controller;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

@WebServlet(name = "RegistroServlet", value = "/RegistroServlet")
public class RegistroServlet extends HttpServlet {
    static AcessoBD bd;
    @Override
    public void init() throws ServletException {
        super.init();
        bd = new AcessoBD();
        try {
            bd.conectar();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String nome = request.getParameter("nome");
        String email = request.getParameter("email");
        String cpf = request.getParameter("cpf");
        String telefone = request.getParameter("telefone");
        String senha = request.getParameter("senha");
        try {
            Connection conn = bd.getConnection();
            PreparedStatement ps = conn.prepareStatement("INSERT INTO cliente (nome, email, cpf, telefone," +
                    "senha) VALUES (?, ?, ?, ?, ?)");
            ps.setString(1, nome);
            ps.setString(2, email);
            ps.setString(3, cpf);
            ps.setString(4, telefone);
            ps.setString(5, senha);
            ps.executeUpdate();
            conn.commit();
            response.sendRedirect("login.jsp");
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            response.sendRedirect("registro.jsp?msg=invalid");
        }
    }

    @Override
    public void destroy() {
        super.destroy();
        try {
            bd.desconectar();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
