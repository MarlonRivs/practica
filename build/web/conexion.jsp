<%-- 
    Document   : conexion
    Created on : 3 may 2024, 10:40:26 a. m.
    Author     : willj
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*"%>
<%
 Connection conexion = null;
 PreparedStatement st = null;
 ResultSet rs = null;
//Leemos el driver MySQL
 Class.forName("com.mysql.jdbc.Driver");
//Obtenemos la conexion con la base de datos
 DriverManager.getConnection("jdbc:mysql://localhost:3306/capyy + "?useUnicode=true&characterEncoding=utf8_spanish_ci", "root", "";"
 //PROBAR SI REALMENTE REALIZA LA CONEXION CON EL UTF CORRECTO
%>
