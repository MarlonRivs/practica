<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="javax.servlet.*" %>
<%@ page import="javax.servlet.http.*" %>
<%
    String id = request.getParameter("id");
    ArrayList<Map<String, Object>> carrito = (ArrayList<Map<String, Object>>) session.getAttribute("carrito");

    if (carrito != null && id != null) {
        Iterator<Map<String, Object>> iterator = carrito.iterator();
        while (iterator.hasNext()) {
            Map<String, Object> producto = iterator.next();
            String productoId = producto.containsKey("id_destacados") ? producto.get("id_destacados").toString()
                    : producto.containsKey("id_cama") ? producto.get("id_cama").toString()
                    : producto.containsKey("id_accesorios") ? producto.get("id_accesorios").toString()
                    : producto.containsKey("id_limpieza") ? producto.get("id_limpieza").toString()
                    : producto.containsKey("id_sofa") ? producto.get("id_sofa").toString() : "";

            if (productoId.equals(id)) {
                iterator.remove();
                break;
            }
        }
    }

    session.setAttribute("carrito", carrito);
%>
