<%-- 
    Document   : formulario.jsp
    Created on : 1 jun 2024, 10:27:25 p. m.
    Author     : locur
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    </head>
    <body>
       <script>
            
         function validarEmail(email) {
            // valida que se ingrese un correo valido
            var regex = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;
            return regex.test(email);
        }

        function validarFormulario() {
            var emailInput = document.getElementById('correo');
            var email = emailInput.value;

            if (!validarEmail(email)) {
                alert('Por favor, introduce un correo electrónico válido.');
                emailInput.focus();
                return false;
            }

            return true;
        }
            </script>
        <div class="container col-md-12">
            <!-- Tu estructura HTML aquí -->
         
            <form action="procesar_pago.jsp" method="post">
                
                <div class="row col-md-12">
                    
                    <div class="col-md-6">
                        <label for="nombre">Nombre:</label>
                        <input type="text" id="nombre" name="nombre" placeholder="Ingrese sus  nombres" required><br><br>
                    </div>
                    
                    <div class="col-md-6">    
                        <label for="apellido">Apellido:</label>
                        <input type="text" id="apellido" name="apellido" placeholder="Ingrese sus  apellidos" required><br><br>
                    </div>
                    
                    <div class="col-md-6">   
                        <label for="direccion">Dirección:</label>
                        <input type="text" id="direccion" name="direccion" placeholder="Ingrese dirección de ubicación" required><br><br>
                    </div>
                    
                    <div class="col-md-6">   
                        <label for="correo">Correo Electrónico:</label>
                        <input type="email" id="correo" name="correo" placeholder="Ingrese su correo electrónico" required><br><br>
                    </div>
                    
                    <div class="col-md-3">   
                        <label for="nombre_tarjeta">Nombre en la Tarjeta:</label>
                        <input type="text" id="nombre_tarjeta" name="nombre_tarjeta" placeholder="Nombre de Asociado" required><br><br>
                    </div>
                    
                    <div class="col-md-3">  
                        <label for="numero_tarjeta">Número de Tarjeta:</label>
                        <input type="text" id="numero_tarjeta" name="numero_tarjeta" placeholder="0000-0000-0000-0000" onkeypress="return justNumbers(event);" required><br><br>
                    </div>
                    
                    <div class="col-md-3">  
                        <label for="fecha_expiracion">Fecha de Expiración:</label>
                        <input type="text" id="fecha_expiracion" placeholder="00/00" name="fecha_expiracion" required><br><br>
                    </div>
                    
                    <div class="col-md-3">  
                        <label for="codigo_seguridad">Código de Seguridad (CVV):</label>
                        <input type="text" id="codigo_seguridad" name="codigo_seguridad" placeholder="*" required><br><br><br>
                    </div><br><hr>
                    
                    <button class="button bg-dark" style="margin-top: 20px; margin-left: 10px;" type="submit">Realizar Pago</button>
                    <button class="button bg-danger" onclick="window.location.href = 'principal.jsp'; " style="margin-top: 20px; margin-left: 10px;" type="submit">Cancelar Compra</button>
                
                </div>
                    
            </form>
        
        </div><br><br><br>
                                        
        <script>
        function validarInput1(e1) {
            var keynum = window.event ? window.event.keyCode : e1.which;

            // este es para que te deje borrar y retroceder
            if (keynum == 8 || keynum == 46) return true;

            //este valor obtiene el elemnto de entrada(en este caso es del input del numero de la tarjeta)
            var elemento = e1.target || e1.srcElement;

            // este solo verifica que hayan 16 caracteres
            if (elemento.value.length >= 16) {
                e1.preventDefault();
                Swal.fire({
                    icon: 'error',
                    title: 'Numero de tarjeta invalido',
                    text: 'El numero de tarjeta no puede tener más de 16 caracteres.',
                });
                return false;
            }

            // con esta permitis solo numeros
            if (!/\d/.test(String.fromCharCode(keynum))) {
                Swal.fire({
                    icon: 'error',
                    title: 'Entrada invalida',
                    text: 'Solo se permiten numeros ',
                });
                e1.preventDefault();

                return false;
            }

            return true;
        }
        //vaida que el formulario actual tenga los 16 caracteres creo 
        function validarFormulario1(elemento) {
            var numero = elemento.value;

            return numero.length === 16;
        }

        // esto asigna directamente el obkeypress al input. Solo cambia el nombre del input si que esta en comillas
        document.getElementById('numero_tarjeta').onkeypress = validarInput1;

        // este no me quedo muy claro para que sirve xd
        document.getElementById('numero_tarjeta').onblur = function() {
            validarFormulario1(this);
        };
        
        
        
        
        
        function validarInput2(e) {
            var keynum2 = window.event ? window.event.keyCode : e.which;

            if (keynum2 == 8 || keynum2 == 46) return true;

            var elemento2 = e.target || e.srcElement;

            // este solo verifica que hayan 3 caracteres
            if (elemento2.value.length >= 3) {
                e.preventDefault();
                Swal.fire({
                    icon: 'error',
                    title: 'Código de seguridad inválido',
                    text: 'El contenido no puede tener mas de 3 caracteres.',
                });
                return false;
            }

            // con esta permitis solo numeros
            if (!/\d/.test(String.fromCharCode(keynum2))) {
                
                e.preventDefault();
                Swal.fire({
                    icon: 'error',
                    title: 'Entrada inválida',
                    text: 'Solo se permiten numeros en este campo',
                });
                return false;
            }

            return true;
        }

        function validarFormulario2(elemento2) {
            var numero2 = elemento2.value;

            return numero2.length === 3;
        }

        document.getElementById('codigo_seguridad').onkeypress = validarInput2;

        document.getElementById('codigo_seguridad').onblur = function() {
            validarFormulario2(this);
        };


    </script>
    </body>
</html>
