<%@ page import="java.sql.*" %>

<%
    if (session.getAttribute("login") != null) //check login session user not access or back to index.jsp page
    {
        response.sendRedirect("menu.jsp");
    }
%>

<%
    try {
        Class.forName("com.mysql.jdbc.Driver"); //load driver

        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/capyy", "root", ""); //create connection

        if (request.getParameter("btn_login") != null) //check login button click event not null
        {
            String dbemail, dbpassword;

            String email, password;

            email = request.getParameter("txt_email"); //txt_email
            password = request.getParameter("txt_password"); //txt_password

            PreparedStatement pstmt = null; //Creamos el statement

            pstmt = con.prepareStatement("select * from login where correo=? AND contraseña=?"); //sql select query
            pstmt.setString(1, email);
            pstmt.setString(2, password);

            ResultSet rs = pstmt.executeQuery(); //Ejecutamos el query y lo asignamos en resultset object rs.

            if (rs.next()) {
                dbemail = rs.getString("correo");
                dbpassword = rs.getString("contraseña");

                if (email.equals(dbemail) && password.equals(dbpassword)) {
                    session.setAttribute("registro", dbemail); //session name is login and store fetchable database email address
                    response.sendRedirect("principal.jsp"); //after login success redirect to welcome.jsp page
                }
            } else {
                // Mostrar SweetAlert de credenciales incorrectas
%>
                <script>
                    window.onload = function() {
                        Swal.fire({
                            icon: 'error',
                            title: 'Credenciales Incorrectas',
                            text: 'El correo electrónico o la contraseña proporcionados son incorrectos. Por favor, inténtelo de nuevo.',
                            showConfirmButton: true,
                            customClass: {
                                confirmButton: 'btn btn-primary',
                            }
                        });
                    };
                </script>
<%
            }

            con.close(); //close connection
        }

    } catch (Exception e) {
        out.println(e);
    }
%>
 
    

    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

</head>
<body>





    <style>
        html{
            
            background-color: black;
           

        }
       
        
        /* Estilo para el contenedor principal */
        .container {
           
            display: flex;
            justify-content: center;
            align-items: center;                     
            width: 100%;

           
         
            
        }

        /* Estilo para el formulario */
        .form-register form {
            width: 410px; /* Ancho del formulario */
   
        }

        /* Estilo para el formulario dentro del contenedor */
        .form-register .form-register-with-email {
            margin-top: 70px;
            background-color: white; /* Color de fondo del formulario */
            padding: 20px; /* Espacio alrededor del formulario */      
            width: 100%;
            height: 490px;
            

         
        }

        /* Estilo para el título del formulario */
        .form-title-row h1 {
            text-align: center; /* Centra el título horizontalmente */
        }

        /* Estilo para los mensajes de error */
        .form-white-background p {
            color: red;
            
        }

        /* Estilo para las etiquetas de los campos de entrada */
        .form-row label {
            display: block; /* Muestra las etiquetas en bloques para separarlas verticalmente */
            margin-bottom: 15px; /* Espacio inferior entre las etiquetas */
            margin-top: 15px;
        }



        /* Estilo para el botón de enviar */
        input[type="submit"] {
            
            color: white;
            background: black;
            font-size: 15px;
            font-weight: bold;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            width: 100%;
            
        }

        /* Estilo para el enlace de registro */
        .form-log-in-with-existing {
            display: block; /* Muestra el enlace en bloque para separarlo verticalmente */
            text-align: center; /* Centra el texto del enlace horizontalmente */
            margin-top: 15px; /* Espacio superior entre el enlace y el formulario */
            color: black;
        }
        
        #password{
            margin-top: 7px;
            border: 1px solid #ccc; /* Borde del campo de entrada */
            border-radius: 5px; /* Borde redondeado */
            opacity: 0.6;
            width: 100%;
            padding: 10px;
        }
        #email{
            
            border: 1px solid #ccc; /* Borde del campo de entrada */
            border-radius: 5px; /* Borde redondeado */
            margin-top: 7px;
            opacity: 0.6;
            width: 100%;
            padding: 10px;
            
        }
        
        .form-row span{
            margin-bottom: 5px;
        }
        
        .form-row{
            margin-top: -30px;
            
        }
        
        
        #contenido{
            width: 50%;
        }
        
        
        section{
            background-color: white;
            width: 100%;
            height: 850px;
         
        }
        
    </style>
    

        
        <section>
        
        <div class="col-md-6">
            
            <div class="container" style="margin-top: 20px; ">

                <form class="form-register" method="post" name="myform" onsubmit="return validate();">

                    <div class="form-register-with-email">

                        <div class="form-white-background">

                            <div class="form-title-row">
                                <h1>Inicio de sesión</h1>
                            </div><hr><br>

                            <p style="color:red">
                                <%
                                    if (request.getAttribute("errorMsg") != null) {
                                        out.println(request.getAttribute("errorMsg")); //error message for email or password
                                    }
                                %>
                            </p>

                            </br>

                            <div class="form-row">
                                <label>
                                    <span>Correo:* </span>
                                    <input type="text" name="txt_email" id="email" placeholder="Ingresa tu correo" required>
                                </label>
                            </div><br>

                            <div class="form-row">
                                <label>
                                    <span>Contraseña:*</span>
                                    <input type="password" name="txt_password" id="password" placeholder="Ingresa tu contraseña" required>
                                </label>
                            </div><br>

                            <input type="submit" name="btn_login"  value="Entrar">
                            


                            

                        </div><br><hr><br>

                        <a href="registro.jsp" class="form-log-in-with-existing">No tienes una cuenta? <b> Registrate aquí </b></a><br>
                        <a href="principal.jsp" style="text-decoration: none; color:black" class="form-log-in-with-existing">Entrar  como invitado</a>
                    </div>

                </form>
                           
            </div>
        
        </div> 
                            
       </section>   
                            
                            
            
     <!-- Incluir SweetAlert JS al final del body -->
         <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>

         <script>
             function validate() {
                 var email = document.myform.txt_email.value;
                

                 // Expresión regular para validar el formato del correo electrónico
                 var emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
             
                 if (!emailRegex.test(email)) { // Verifica si el correo electrónico tiene un formato válido
                     // Muestra una alerta SweetAlert
                     swal("Error", "Por favor, introduce una dirección de correo electrónico válida.", "error");
                     return false;
                 }
                
                 return true; // Devuelve true si ambos campos tienen valores
             }
         </script>
                                    
    </body>

</html>
