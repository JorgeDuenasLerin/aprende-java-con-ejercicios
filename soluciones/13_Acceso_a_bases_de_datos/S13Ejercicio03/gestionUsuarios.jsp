<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <!-- Materialize -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.6/css/materialize.min.css">
    <link href="http://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <title>Gestión de usuarios</title>
  </head>
  
  <body>
    <%
      Class.forName("com.mysql.jdbc.Driver");
      Connection conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/seguridad3","root", "root");
      Statement s = conexion.createStatement();

      request.setCharacterEncoding("UTF-8");

      ResultSet listado = s.executeQuery ("SELECT * FROM acceso");
    %>
    
    <div class="container">
      <div class="row"></div>
      <div class="row">
        <div class="col s1">&nbsp;</div>
        <div class="col s10">
          <div class="card">
            <h5 class="center">Gestión de usuarios</h5>
            <table class="bordered striped centered responsive-table">
              <thead><th>Usuario</th><th>Contraseña</th><th>Permisos</th></thead>
              <%
                while (listado.next()) {
                  out.println("<tr><td>");
                  out.println(listado.getString("usuario") + "</td>");
                  out.println("<td>" + listado.getString("clave"));
                  %>
                  </td>
                  <td>
                    <form method="post" action="editaPermisos.jsp">
                      <input type="hidden" name="usuario" value="<%=listado.getString("usuario") %>">
                      <button class="btn waves-effect waves-light center blue" type="submit" name="editar">
                        Editar
                      </button>
                    </form>
                  </td></tr>
                  <%
                }
              %>

              <form method="post" action="altaUsuario.jsp">
                <tr>
                  <td>
                    <div class="input-field">
                      <input type="text" name="usuario" id="usuario" required>
                      <label for="usuario">Usuario</label>
                    </div>
                  </td>
                  <td>
                    <div class="input-field">
                      <input type="password" name="clave" id="clave" required>
                      <label for="clave">Contraseña</label>
                    </div>
                  </td>
                  <td>
                    <button class="btn waves-effect waves-light center" type="submit" name="aceptar">
                      Añadir usuario
                      <i class="material-icons">check_circle</i>
                    </button>
                  </td>
                </tr>
              </form>
            </table>  
          </div>
        </div>
      </div>
    </div>
              
    <%
      conexion.close();
    %>
    <script type="text/javascript" src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
    <!-- Materialize -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.6/js/materialize.min.js"></script>
    </body>
</html>
