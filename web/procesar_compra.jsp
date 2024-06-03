<%@ page import="java.sql.*,java.io.*" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Procesando Compra</title>
        <!-- Incluir SweetAlert -->
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    </head>
    <body>

        <%
        // Recibir parámetros del formulario
            String nombre = request.getParameter("nombre");
            String apellido = request.getParameter("apellido");
            String email = request.getParameter("email");
            String telefono = request.getParameter("telefono");
            String direccion = request.getParameter("direccion");
            String ciudad = request.getParameter("ciudad");
            String estado = request.getParameter("estado");
            String pais = request.getParameter("pais");
            String producto = request.getParameter("producto");
            int cantidad = Integer.parseInt(request.getParameter("cantidad"));
            double precioTotal = Double.parseDouble(request.getParameter("precio_total"));
            String tarjeta = request.getParameter("tarjeta");
            String expiracion = request.getParameter("expiracion");
            String cvv = request.getParameter("cvv");

        // Query de inserción
            String query = "INSERT INTO historial_ventas (nombre, apellido, email, telefono, direccion, ciudad, estado, pais, producto, cantidad, precio_total, tarjeta, expiracion, cvv) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

            Connection conexion = null;
            PreparedStatement ps = null;
            try {
                // Establecer conexión con la base de datos
                Class.forName("com.mysql.jdbc.Driver");
                conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/capyy + "?useUnicode=true&characterEncoding=utf8_spanish_ci", "root", "";"
                //PROBAR SI REALMENTE REALIZA LA CONEXION CON EL UTF CORRECTO

                // Preparar el statement con el query de inserción
                ps = conexion.prepareStatement(query);
                ps.setString(1, nombre);
                ps.setString(2, apellido);
                ps.setString(3, email);
                ps.setString(4, telefono);
                ps.setString(5, direccion);
                ps.setString(6, ciudad);
                ps.setString(7, estado);
                ps.setString(8, pais);
                ps.setString(9, producto);
                ps.setInt(10, cantidad);
                ps.setDouble(11, precioTotal);
                ps.setString(12, tarjeta);
                ps.setString(13, expiracion);
                ps.setString(14, cvv);

                // Ejecutar la inserción
                int filasInsertadas = ps.executeUpdate();

                // Verificar si la inserción fue exitosa
                if (filasInsertadas > 0) {
                   // Mostrar un SweetAlert indicando que la compra fue exitosa
                       out.println("<script>");
                       out.println("Swal.fire({");
                       out.println("    title: 'Compra Exitosa',");
                       out.println("    text: '¡Gracias por tu compra!',");
                       out.println("    icon: 'success',");
                       out.println("}).then((result) => {");
                       out.println("    if (result.isConfirmed) {");
                       out.println("        window.location.href = 'principal.jsp'; // Reemplaza 'index.jsp' con la URL de tu página principal");
                       out.println("    }");
                       out.println("});");
                       out.println("</script>");

                    
                } else {
                     // Mostrar un SweetAlert indicando que hubo un error
                         out.println("<script>");
                         out.println("Swal.fire({");
                         out.println("    title: 'Error',");
                         out.println("    text: 'Hubo un problema al procesar la compra. Por favor, inténtalo de nuevo más tarde.',");
                         out.println("    icon: 'error'");
                         out.println("}).then(() => {");
                         out.println("    window.location.href = 'principal.jsp';");
                         out.println("});");
                         out.println("</script>");
                }
            } catch (Exception e) {
                e.printStackTrace();
                // Mostrar un SweetAlert indicando que hubo un error
                 out.println("<script>");
                     out.println("Swal.fire({");
                     out.println("    title: 'Error',");
                     out.println("    text: 'Hubo un problema al procesar la compra. Por favor, inténtalo de nuevo más tarde.',");
                     out.println("    icon: 'error'");
                     out.println("}).then(() => {");
                     out.println("    window.location.href = 'principal.jsp';");
                     out.println("});");
                     out.println("</script>");
            } finally {
                // Cerrar la conexión y el PreparedStatement
                if (ps != null) {
                    ps.close();
                }
                if (conexion != null) {
                    conexion.close();
                }
            }
        %>



    </body>
</html>
