<%-- 
    Document   : catalogos
    Created on : 25 may 2024, 17:14:48
    Author     : felip
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        
      
        <!-- Link para CDN BOOTSTRAP -->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
        
        <!-- Link para CDN FONT AWESOME ICONS -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            
        
    </head>
    
   <style>
   
   
   
  
   
   
   </style>
    
    
    
    <body>
        
            <%@ include file="sub_navbar.jsp" %>
        
        
   
            <h1 class="container" style="text-align: left; color:black; margin-top: 250px; font-weight: bold; font-size: 60px;">
                Categorias de productos
            </h1>
      
            
            

            <section style="background-image: url('img/bed4.jpg');  background-size: cover; background-position: center; height: 900px; position: relative; margin-top: 100px;   " >
                <div style="position: absolute;top: 50%; left: 50%; transform: translate(-50%, -50%); text-align: center; color: black;">
                    <h1 style="font-size: 100px;">Camas</h1>
                    <p style="font-size: 20px;">Increibles camas a tu disponibilidad</p>
                    <a href="camas.jsp" style="background-color: #2b2d2e; color: white; padding: 10px 30px; text-decoration: none; border-radius: 5px;">Ver mas</a>
                </div>
            </section>

            <section style="background-image: url('img/w3.jpg'); background-size: cover; background-position: center; height: 900px; position: relative; margin-top: 100px;  ">
                <div style="position: absolute; top: 50%; left: 50%; transform: translate(-50%, -50%); text-align: center; color: black">
                    <h1 style="font-size: 120px;">Sofas</h1>
                    <p style="font-size: 20px;">Magnificos sofas para tus diferentes gustos</p>
                    <a href="sofas.jsp" style="background-color: #2b2d2e; color: white; padding: 10px 30px; text-decoration: none; border-radius: 5px;">Ver mas</a>
                </div>
            </section>

            <section style="background-image: url('img/cleaning.jpg');margin-bottom: 50px;  background-size: cover; background-position: center; height: 900px; position: relative;  margin-top: 100px; ">
                <div style="position: absolute; top: 50%; left: 50%; transform: translate(-50%, -50%); text-align: center; color: black">
                    <h1 style="font-size: 100px;">Limpieza</h1>
                    <p style="font-size: 20px;">Mante limpios tus muebles con estos articulos</p>
                    <a href="limpieza.jsp" style="background-color: #2b2d2e; color: white; padding: 10px 30px; text-decoration: none; border-radius: 5px;">Ver mas</a>
                </div>
            </section>
            
            <section style="background-image: url('img/saba1.jpg');margin-bottom: 50px;  background-size: cover; background-position: center; height: 900px; position: relative;  margin-top: 100px; ">
                <div style="position: absolute; top: 50%; left: 50%; transform: translate(-50%, -50%); text-align: center; color: black">
                    <h1 style="font-size: 90px;">Artículos de domir</h1>
                    <p style="font-size: 20px;">Aligera tu sueño con el repertorio de artículos para mejorar tu sueño</p>
                    <a href="accesorios.jsp" style="background-color: #2b2d2e; color: white; padding: 10px 30px; text-decoration: none; border-radius: 5px;">Ver mas</a>
                </div>
            </section>
        
              <!-- Footer -->
         <%@ include file="footer.jsp" %>
    </body>

</html>
