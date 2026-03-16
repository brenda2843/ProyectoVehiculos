<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Inicio de Sesion</title>
<style>
  /* Estilos generales del cuerpo */
  body {
    font-family: Arial, sans-serif;
    background-color: #f0f4f8;
    display: flex;
    justify-content: center;
    align-items: center;
    height: 100vh;
    margin: 0;
  }
  /* Contenedor principal */
  .container {
    background-color: white;
    padding: 40px;
    border-radius: 10px;
    box-shadow: 0 4px 12px rgba(0,0,0,0.1);
    width: 350px;
    text-align: center;
  }
  h2 { color: #2c3e50; margin-bottom: 25px; }
  /* Grupos de formulario */
  .form-group { margin-bottom: 15px; text-align: left; }
  label { display: block; font-weight: bold; color: #34495e; margin-bottom: 5px; }
  input[type="text"], input[type="password"] {
    width: 100%;
    padding: 10px;
    border: 1px solid #ccc;
    border-radius: 6px;
    font-size: 14px;
    box-sizing: border-box;
  }
  input[type="text"]:focus, input[type="password"]:focus {
    border-color: #2980b9;
    outline: none;
  }
  /* Mensaje de error */
  .error-box {
    background-color: #fdecea;
    border: 1px solid #e74c3c;
    border-radius: 6px;
    padding: 10px;
    margin-bottom: 15px;
    color: #e74c3c;
    font-weight: bold;
    font-size: 14px;
  }
  /* Boton principal */
  .btn {
    background-color: #2980b9;
    color: white;
    padding: 12px;
    border: none;
    border-radius: 6px;
    font-size: 16px;
    cursor: pointer;
    width: 100%;
    margin-top: 10px;
  }
  .btn:hover { background-color: #1a6fa3; }
  .link { display: block; margin-top: 15px; color: #2980b9; text-decoration: none; }
  .link:hover { text-decoration: underline; }
</style>
</head>
<body>
<div class="container">
  <h2>Iniciar Sesion</h2>

  <%
  // Mostrar mensaje de error si existe
  String error = (String) request.getAttribute("error");
  if(error != null) {
  %>
    <div class="error-box"><%=error%></div>
  <% } %>

  <!-- Formulario de autenticacion -->
  <form action="AuthServlet" method="post">
    <div class="form-group">
      <label>Usuario:</label>
      <input type="text" name="usuario" placeholder="Ingrese su usuario">
    </div>
    <div class="form-group">
      <label>Contrasena:</label>
      <input type="password" name="contrasena" placeholder="Ingrese su contrasena">
    </div>
    <input type="submit" class="btn" value="Ingresar">
  </form>
  <a href="index.jsp" class="link">Volver al inicio</a>
</div>
</body>
</html>