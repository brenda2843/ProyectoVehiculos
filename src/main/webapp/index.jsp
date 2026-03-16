<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%
// Limpiar sesion al volver al inicio
session.invalidate();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Sistema de Registro de Vehículos</title>
<style>
  body {
    font-family: Arial, sans-serif;
    background-color: #f0f4f8;
    display: flex;
    justify-content: center;
    align-items: center;
    height: 100vh;
    margin: 0;
  }
  .container {
    background-color: white;
    padding: 40px;
    border-radius: 10px;
    box-shadow: 0 4px 12px rgba(0,0,0,0.1);
    text-align: center;
    width: 350px;
  }
  h2 { color: #2c3e50; margin-bottom: 20px; }
  .btn {
    background-color: #2980b9;
    color: white;
    padding: 12px 25px;
    border: none;
    border-radius: 6px;
    font-size: 16px;
    cursor: pointer;
    text-decoration: none;
    display: inline-block;
    margin-top: 10px;
  }
  .btn:hover { background-color: #1a6fa3; }
</style>
</head>
<body>
<div class="container">
  <h2>Sistema de Registro de Vehiculos</h2>
  <p>Bienvenido al sistema de registro</p>
  <a href="login.jsp" class="btn">Registrar Vehiculo</a>
</div>
</body>
</html>