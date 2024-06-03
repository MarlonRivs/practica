<%-- 
    Document   : productoVista
    Created on : 31 may 2024, 14:24:37
    Author     : felip
--%>


<!DOCTYPE html>
<html>
    <head>

        <meta charset="UTF-8">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Principal</title>

        <!-- Link de fontawesome CDN iconos -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA==" crossorigin="anonymous" referrerpolicy="no-referrer" />

        <!-- Link para CDN BOOTSTRAP -->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">

        <!-- Link para CDN FONT AWESOME ICONS -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>

        <!-- Carga la biblioteca ScrollReveal -->
        <script src="https://unpkg.com/scrollreveal"></script>

        <!-- Carga la biblioteca Intersection Observer -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/intersection-observer/2.0.0/intersection-observer.min.js"></script>




        <style>
            .product-card {
                .product-img {
                    width: 100%;
                    height: auto;
                    border-radius: 5px;
                    padding: 60px;
                    transition: transform 0.5s ease; /* La transición se realizará en 0.5 segundos con una función de aceleración */
                }

                .product-img:hover {
                    transform: scale(1.1); /* Al hacer hover, la imagen se ampliará un 10% */
                }
            </style>

        </head>



        <%@page contentType="text/html" pageEncoding="UTF-8"%>
        <%@ page import="java.util.*" %>
        <%@ page import="java.text.DecimalFormat" %>
        <%@ page import="java.text.NumberFormat" %>
        <%
            // Obtener los parámetros enviados desde el formulario del producto
            String idDestacados = request.getParameter("id_cama");
            String nombre = request.getParameter("nombre");
            double precio = Double.parseDouble(request.getParameter("precio"));
            String descripcion = request.getParameter("descripcion");
            String foto = request.getParameter("foto");

            // Crear un objeto Map para almacenar los detalles del producto
            Map<String, Object> producto = new HashMap<>();
            producto.put("id_cama", idDestacados);
            producto.put("nombre", nombre);
            producto.put("precio", precio);
            producto.put("descripcion", descripcion);
            producto.put("foto", foto);

            // Obtener el carrito de la sesión o crear uno nuevo si no existe
            List<Map<String, Object>> carrito = (List<Map<String, Object>>) session.getAttribute("carrito");
            if (carrito == null) {
                carrito = new ArrayList<>();
            }

            // Agregar el producto al carrito
            carrito.add(producto);

            // Actualizar el carrito en la sesión
            session.setAttribute("carrito", carrito);
        %>



        <body>

            <!-- INCLUCION DE MENU NAVBAR -->
            <%@ include file="sub_navbar.jsp" %>

            <div class="card container" style="margin-bottom:200px;
                padding: 10px; margin-top: 150px;">
                <div class="row mt-4">
                    <div class="col-md-12" style="padding:20px;" id="producto_<%= request.getParameter("id_cama")%>">
                        <div class="product-card">
                            <div class="row">
                                <!-- Contenido del producto a la izquierda -->
                                <div class="col-md-6" style="padding:80px;">
                                    <h3 class=""><%= request.getParameter("nombre")%></h3><hr>
                                    <p class=""><%= request.getParameter("descripcion")%></p>
                                    <p id="precio_<%= request.getParameter("id_cama")%>">Precio: $<span class="precio-unitario"><%= request.getParameter("precio")%></span></p>
                                    <div class="mb-3">
                                        <label for="cantidad_<%= request.getParameter("id_cama")%>" class="form-label">Cantidad:</label>
                                        <input type="number" class="form-control cantidad" id="cantidad_<%= request.getParameter("id_destacados")%>"
                                               name="cantidad" value="1" min="1" data-id="<%= request.getParameter("id_cama")%>">
                                    </div>
                                    <div class="mb-3">
                                        <label for="precioTotal_<%= request.getParameter("id_cama")%>" class="form-label">Precio Total:</label>
                                        <input type="text" class="form-control precio-total" id="precioTotal_<%= request.getParameter("id_cama")%>"
                                               name="precioTotal" value="<%= request.getParameter("precio")%>" readonly>
                                    </div>
                                    <!-- Botón para reenviar el card a otro JSP -->
                                    <form action="almacen.jsp" method="post">
                                        <input type="hidden" name="id_cama" value="<%= request.getParameter("id_cama")%>">
                                        <input type="hidden" name="nombre" value="<%= request.getParameter("nombre")%>">
                                        <input type="hidden" name="precio" value="<%= request.getParameter("precio")%>">
                                        <input type="hidden" name="descripcion" value="<%= request.getParameter("descripcion")%>">
                                        <input type="hidden" name="foto" value="<%= request.getParameter("foto")%>">
                                        <button type="submit" class="btn btn-dark">Agregar al carrito</button>


                                    </form>
                                </div>
                                <!-- Imagen del producto a la derecha -->
                                <div class="col-md-6" style="padding:30px;">
                                    <img class="product-img" src="<%= request.getParameter("foto")%>" alt="Product Image">
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Script de JavaScript para manejar la lógica del precio total -->
            <script>
                document.addEventListener("DOMContentLoaded", function () {
                    // Asignar evento de cambio a todos los inputs de cantidad
                    var cantidadInputs = document.getElementsByClassName("cantidad");
                    for (var i = 0; i < cantidadInputs.length; i++) {
                        cantidadInputs[i].addEventListener("change", function () {
                            var id = this.getAttribute("data-id");
                            var cantidad = parseInt(this.value);
                            var precioUnitario = parseFloat(document.getElementById("precio_" + id).innerText.split("$")[1]);
                            var precioTotal = cantidad * precioUnitario;
                            document.getElementById("precioTotal_" + id).value = precioTotal.toFixed(2);
                            document.getElementById("precioTotal2" + id).value = precioTotal.toFixed(2);
                        });
                    }
                });

            </script>      

            <!-- INCLUCION DE footer -->
            <%@ include file="footer.jsp" %>
        </body>
    </html>
