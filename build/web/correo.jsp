<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <title>Contacto</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.1.3/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
        <style>
            body {
                background-image: url("img/nv6.jpg");
                background-size: cover;
                background-repeat: no-repeat;
                background-attachment: fixed;
            }

            #comentarios {
                
                border-radius: 8px;
                padding: 20px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.6);
                max-width: 500px;
                width: 100%;
                margin-bottom: 100px;
                margin-top: 30px;
                background-color: whitesmoke;
        
              
            }

            .form-title-row h3 {
                text-align: center;
                color: #333;
            }

            .form-row {
                margin-bottom: 15px;
            }

            .form-row label {
                display: block;
                margin-bottom: 25px;
                color: #333;
            
            }

            .form-row input[type="email"],
            .form-row textarea {
                width: 100%;
                padding: 10px;
                border: 1px solid #ccc;
                border-radius: 5px;
                box-sizing: border-box;
                margin-top: 20px;
                background-color: transparent;
                
            }

            .form-row input[type="submit"] {
                width: 100%;
                padding: 10px;
                border: none;
                border-radius: 5px;
                background-color: #000;
                color: #fff;
                font-size: 16px;
                cursor: pointer;

            }
            
            .form-row span{margin-bottom: 20px;}

            .form-row input[type="submit"]:hover {
                background-color: #333;
            }

            .form-log-in-with-existing {
                display: block;
                text-align: center;
                margin-top: 20px;
                color: #000;
                text-decoration: none;
            }

            .form-log-in-with-existing:hover {
                text-decoration: underline;
            }

            .social-icons {
                display: flex;
                justify-content: center;
                align-items: center;
                margin-top: 20px;
            }

            .social-icons a {
                margin: 0 10px;
                color: black;
                font-size: 40px;
                text-decoration: none;
            }

            .social-icons a:hover {
                color: black;
            }
        </style>
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    </head>
    <body>
        
        <!-- INCLUCION DE MENU NAVBAR -->
        <%@ include file="sub_navbar.jsp" %>
        
        <h1 class="container" style='font-size:70px; font-weight: bold; margin-top: 160px;'>Comentarios</h1><br><br><br>
        
        <section>
            <div class="container" id='comentarios'>
                <form id="comentarios-form" class="form-register" action="https://formspree.io/f/mpzvgzga" method="POST">
                    <div class="form-register-with-email">
                        <div class="form-title-row">
                            <h3>¡Envíanos tus comentarios!</h3>
                        </div>
                        <hr><br>
                        <div class="form-row">
                            <label>
                                <span>Correo:</span>
                                <input type="email" name="email" id="email" placeholder="Ingresa tu correo" required>
                            </label>
                        </div>
                        <div class="form-row">
                            <label>
                                <span>Comentario:</span>
                                <textarea name="comentario" id="comentario" placeholder="Ingresa tu comentario" required></textarea>
                            </label>
                        </div>
                        <input type="hidden" name="_subject" value="Nuevo comentario recibido">
                        <input type="hidden" name="_next" value="http://localhost:8080/Capri/principal.jsp/enviado2.jsp">
                        <div class="form-row">
                            <input type="submit" value="Enviar">
                        </div>
                    </div>
                </form>
                <div class="social-icons">
                    <a href="https://www.facebook.com" target="_blank"><i class="fab fa-facebook"></i></a>
                    <a href="https://www.whatsapp.com" target="_blank"><i class="fab fa-whatsapp"></i></a>
                    <a href="https://www.instagram.com" target="_blank"><i class="fab fa-instagram"></i></a>
                </div>
            </div>
        </section>

        <!-- codigo para redireccionar a otra pagina -->
        <script>
            document.getElementById('comentarios-form').addEventListener('submit', function(event) {
                event.preventDefault();  // Evita el envío estándar del formulario
                const form = event.target;
                const formData = new FormData(form);

                fetch(form.action, {
                    method: form.method,
                    body: formData,
                    headers: {
                        'Accept': 'application/json'
                    }
                }).then(response => {
                    if (response.ok) {
                        window.location.href = form._next.value;  // Redirige a la página JSP
                    } else {
                        alert("Hubo un problema al enviar el formulario. Inténtalo de nuevo.");
                    }
                }).catch(error => {
                    console.error("Error:", error);
                    alert("Hubo un problema al enviar el formulario. Inténtalo de nuevo.");
                });
            });
            </script>

        <%
            if (request.getMethod().equals("POST")) {
                String correo = request.getParameter("email");
                String comentario = request.getParameter("comentario");

                if (correo != null && !correo.isEmpty() && comentario != null && !comentario.isEmpty()) {
                    try {
                        Class.forName("com.mysql.jdbc.Driver"); // Reemplaza "nombre_de_tu_driver" por el nombre de tu driver JDBC
                        Connection conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/capyy", "root", ""); // Reemplaza los placeholders por tu URL, usuario y contraseña de la base de datos
                        PreparedStatement st = conexion.prepareStatement("INSERT INTO comentarios (correo, comentario) VALUES (?, ?)");
                        st.setString(1, correo);
                        st.setString(2, comentario);
                        st.executeUpdate();
                        st.close();
                        conexion.close();
                        response.sendRedirect("enviado2.jsp");
                    } catch (Exception e) {
                        e.printStackTrace(); // Manejar o registrar el error apropiadamente
                        out.println("<p>Error al procesar el comentario.</p>");
                    }
                } else {
                    out.println("<p>Por favor, completa todos los campos.</p>");
                }
            }
        %>
        
        
        <div class="section">
            
            <h1 class="container" style='font-size:70px; font-weight: bold; '>Ubicación</h1><br><br><br><br>
            
            <iframe 
                src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3875.491667101975!2d-89.21822468511084!3d13.699558890384295!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x8f6330529381d47f%3A0x4b0bda3ab3343d12!2sPQ2H%2BXXP%2C%2057%20Avenida%20Norte%2C%20San%20Salvador%201101%2C%20El%20Salvador!5e0!3m2!1sen!2sus!4v1622544413494!5m2!1sen!2sus" 
                width="100%" 
                height="500" 
                style="border:0;" 
                allowfullscreen="" 
                loading="lazy">
            </iframe>
        </div>


        <script>
            function validate() {
                var email = document.getElementById("email").value;
                var emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;

                if (!emailRegex.test(email)) {
                    Swal.fire("Error", "Por favor, introduce una dirección de correo electrónico válida.", "error");
                    return false;
                }
                return true;
            }
        </script>

        <!-- Footer -->
        <%@ include file="footer.jsp" %>
    </body>
</html>
