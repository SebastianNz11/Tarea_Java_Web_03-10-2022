<%-- 
    Document   : index
    Created on : 28/09/2022, 16:04:55
    Author     : sebas
--%>
<%@page import="modelo.Sangre" %>
<%@page import="modelo.Estudiante" %>
<%@page import="java.util.HashMap" %>
<%@page import="javax.swing.table.DefaultTableModel" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title> ESTUDIANTES </title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet">
    </head>
    <body>


        <nav class="navbar navbar-expand-lg navbar-light bg-primary  ">
            <div class="collapse navbar-collapse justify-content-center" id="navbarNav">

                <ul class="navbar-nav">
                    <li class="nav-item ">
                        <a class="nav-link active text-light" aria-current="page" href="#">INICIO</a>
                    </li>
                    <li class="nav-item ">
                        <a class="nav-link active text-light" aria-current="page" href="#">FORMULARIO</a>
                    </li>
                    <li class="nav-item ">
                        <a class="nav-link active text-light" aria-current="page" href="#">SERVICIOS</a>
                    </li>
                    <li class="nav-item ">
                        <a class="nav-link active text-light" aria-current="page" href="#">CONOCENOS</a>
                    </li>
                    <li class="nav-item ">
                        <a class="nav-link active text-light" aria-current="page" href="#">CONTACTO</a>
                    </li>
                </ul>
            </div>
        </nav>
        <br>
        <br>

        <!-- Button to Open the Modal -->


        <!-- The Modal -->
        <div class="modal" id="myModal">
            <div class="modal-dialog">
                <div class="modal-content">

                    <!-- Modal Header -->
                    <div class="modal-header">
                        <h4 class="modal-title"></h4>
                        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                    </div>

                    <!-- Modal body -->
                    <div class="modal-body">
                        <h1 class="text-center">FORMULARIO ESTUDIANTES</h1>
                        <br>
                        <form action="sr_estudiantes" method="post" class="form-group was-validated">
                            <fieldset class="container p-3 my-3 border">

                                <label for="lbl_id" class=" col-form-label-lg"><b>ID:</b></label>
                                <input type="text" name="txt_id" id="txt_id" class="form-control"  value="0" readonly >
                                <label for="lbl_carne" class=" col-form-label-lg"><b>Carne: (E00)</b></label>
                                <input type="text" name="txt_carne" id="txt_carne" class="form-control" placeholder="Ejemplo: E000"  pattern="[E][0-9]{3}" required>
                                <label for="lbl_nombres" class=" col-form-label-lg"><b>Nombres:</b></label>
                                <input type="text" name="txt_nombres" id="txt_nombres" class="form-control" placeholder="Ejemplo: Nombre 1 y Nombre 2" required>
                                <label for="lbl_apellidos" class=" col-form-label-lg"><b>Apellidos:</b></label>
                                <input type="text" name="txt_apellidos" id="txt_apellidos" class="form-control" placeholder="Ejemplo: Apellido 1 y Apellido 2" required>
                                <label for="lbl_direccion" class=" col-form-label-lg"><b>Direccion:</b></label>
                                <input type="text" name="txt_direccion" id="txt_direccion" class="form-control" placeholder="Ejemplo: No. Casa, Calle, Zona, Ciudad" required>
                                <label for="lbl_telefono" class=" col-form-label-lg"><b>Telefono:</b></label>
                                <input type="tel" name="txt_telefono" id="txt_telefono" class="form-control" placeholder="Ejemplo: 0000-0000" required>
                                <label for="lbl_correo" class=" col-form-label-lg"><b>Correo Electronico:</b></label>
                                <input type="email" name="txt_correo" id="txt_correo" class="form-control" placeholder="Ejemplo: correo@correo.com" required>
                                <label for="lbl_fn" class=" col-form-label-lg"><b>Fecha de Nacimiento:</b></label>
                                <input type="date" name="txt_fn" id="txt_fn" class="form-control"  required>
                                <label for="lbl_sangre" class=" col-form-label-lg"><b>Tipo de sangre:</b></label>
                                <select id="drop_sangre" class="form-control" name="drop_sangre">
                                    <%
                                        Sangre puesto = new Sangre();
                                        HashMap<String, String> drop = puesto.drop_sangre();
                                        for (String i : drop.keySet()) {
                                            out.println("<option value=" + i + ">" + drop.get(i) + "</option>");
                                        }
                                    %>

                                </select>

                            </fieldset>
                            <br>
                            <div class="row justify-content-around " >
                                <div class="col-3">
                                    <button name="btn_agregar" id="btn_agregar"  class="btn btn-success btn-lg" value="agregar"><b>Agregar</b></button>
                                </div>
                                <div class="col-3">
                                    <button name="btn_modificar" id="btn_modificar"  class="btn btn-warning btn-lg" value="modificar"><b>Modificar</b></button>
                                </div>
                                <div class="col-3">
                                    <button name="btn_eliminar" id="btn_eliminar"  class="btn btn-danger btn-lg" value="eliminar" onclick="javascript:if (!confirm('¿Desea Eliminar?'))
                                                return false"><b>Eliminar</b></button>
                                </div>
                            </div>
                        </form>

                    </div>

                    <!-- Modal footer -->
                    <div class="modal-footer">
                        <button type="button" class="btn btn-outline-danger" data-bs-dismiss="modal">CERRAR</button>
                    </div>

                </div>
            </div>
        </div>



        <h2 class="text-center"> TABLA DE DATOS </h2>
        <br>
        <fieldset class="container p-3 my-3 border text-center">
            <table class="table table-hover text-center" >

                <thead>
                    <tr>
                        <th>CARNE</th>
                        <th>NOMBRES</th>
                        <th>APELLIDOS</th>
                        <th>DIRECCION</th>
                        <th>TELEFONO</th>
                        <th>CORREO ELECTRONICO</th>

                        <th>FECHA DE NACIMIENTO</th>
                        <th>SANGRE</th>
                    </tr>
                </thead>
                <tbody id="tbl_estudiante">

                    <%
                        Estudiante estudiante = new Estudiante();
                        DefaultTableModel tabla = new DefaultTableModel();
                        tabla = estudiante.leer();
                        for (int t = 0; t < tabla.getRowCount(); t++) {
                            out.println("<tr data-id=" + tabla.getValueAt(t, 0) + " data-id_s=" + tabla.getValueAt(t, 9) + ">");
                            out.println("<td>" + tabla.getValueAt(t, 1) + "</td>");
                            out.println("<td>" + tabla.getValueAt(t, 2) + "</td>");
                            out.println("<td>" + tabla.getValueAt(t, 3) + "</td>");
                            out.println("<td>" + tabla.getValueAt(t, 4) + "</td>");
                            out.println("<td>" + tabla.getValueAt(t, 5) + "</td>");
                            out.println("<td>" + tabla.getValueAt(t, 6) + "</td>");
                            out.println("<td>" + tabla.getValueAt(t, 7) + "</td>");
                            out.println("<td>" + tabla.getValueAt(t, 8) + "</td>");
                            out.println("</tr>");

                        }

                    %>

                </tbody>
            </table>
            <br>
            <div>
                <button type="button" class="btn btn-primary btn-lg" data-bs-toggle="modal" data-bs-target="#myModal" onclick="limpiar()">NUEVO</button>
            </div>
        </fieldset>






        <br>
        <br>
        <br>
        <br>
        <br>
        <br>
        <br>
        <br>
        <footer class="  text-white bg-primary navbar navbar-expand-lg navbar-light bg-primary  justify-content-center">
            <div>
                <h4 class="text-center"> PROGRAMACION II</h4>
            </div>
        </footer>

        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
        <script type="text/javascript">
                    function limpiar() {
                        $("#txt_id").val(0);
                        $("#txt_carne").val('');
                        $("#txt_nombres").val('');
                        $("#txt_apellidos").val('');
                        $("#txt_direccion").val('');
                        $("#txt_telefono").val('');
                        $("#txt_correo").val('');
                        $("#txt_fn").val('');
                        $("#drop_sangre").val(1);
                    }
                    $('#tbl_estudiante').on('click', 'tr td', function (evt) {
                        var target, id, id_s, carne, nombres, apellidos, direccion, telefono, correo, nacimiento;
                        target = $(event.target);
                        id = target.parent().data('id');
                        id_s = target.parent().data('id_s');
                        carne = target.parent("tr").find("td").eq(0).html();
                        nombres = target.parent("tr").find("td").eq(1).html();
                        apellidos = target.parent("tr").find("td").eq(2).html();
                        direccion = target.parent("tr").find("td").eq(3).html();
                        telefono = target.parent("tr").find("td").eq(4).html();
                        correo = target.parent("tr").find("td").eq(5).html();
                        nacimiento = target.parent("tr").find("td").eq(6).html();
                        $("#txt_id").val(id);
                        $("#txt_carne").val(carne);
                        $("#txt_nombres").val(nombres);
                        $("#txt_apellidos").val(apellidos);
                        $("#txt_direccion").val(direccion);
                        $("#txt_telefono").val(telefono);
                        $("#txt_correo").val(correo);
                        $("#txt_fn").val(nacimiento);
                        $("#drop_sangre").val(id_s);
                        $("#myModal").modal('show');

                    });
        </script>
    </body>
</html>
