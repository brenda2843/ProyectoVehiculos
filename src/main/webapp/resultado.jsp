<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%
String nombre = request.getParameter("nombre");
String cedula = request.getParameter("cedula");
String placa = request.getParameter("placa");
String marca = request.getParameter("marca");
String modelo = request.getParameter("modelo");
if(nombre == null) nombre = "";
if(cedula == null) cedula = "";
if(placa == null) placa = "";
if(marca == null) marca = "";
if(modelo == null) modelo = "";
placa = placa.toUpperCase();

ArrayList<String> placasRegistradas = (ArrayList<String>) session.getAttribute("placas");
ArrayList<String> cedulasRegistradas = (ArrayList<String>) session.getAttribute("cedulas");
if(placasRegistradas == null) placasRegistradas = new ArrayList<String>();
if(cedulasRegistradas == null) cedulasRegistradas = new ArrayList<String>();

boolean placaDuplicada = placasRegistradas.contains(placa);
boolean cedulaDuplicada = cedulasRegistradas.contains(cedula);
String mensajeError = "";
if(placaDuplicada) mensajeError = "La placa " + placa + " ya fue registrada.";
else if(cedulaDuplicada) mensajeError = "La cedula " + cedula + " ya fue registrada.";
boolean hayError = placaDuplicada || cedulaDuplicada;

if(!hayError && !placa.isEmpty()) {
    placasRegistradas.add(placa);
    cedulasRegistradas.add(cedula);
    session.setAttribute("placas", placasRegistradas);
    session.setAttribute("cedulas", cedulasRegistradas);
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Resultado</title>
<style>
  body { font-family: Arial, sans-serif; background-color: #f0f4f8; display: flex; justify-content: center; align-items: center; min-height: 100vh; margin: 0; }
  .container { background-color: white; padding: 40px; border-radius: 10px; box-shadow: 0 4px 12px rgba(0,0,0,0.1); width: 400px; }
  h2 { text-align: center; margin-bottom: 25px; }
  .exito { background-color: #eafaf1; border: 1px solid #27ae60; border-radius: 6px; padding: 15px; margin-bottom: 20px; text-align: center; color: #27ae60; font-weight: bold; }
  .error-box { background-color: #fdecea; border: 1px solid #e74c3c; border-radius: 6px; padding: 15px; margin-bottom: 20px; text-align: center; color: #e74c3c; font-weight: bold; }
  .dato { display: flex; justify-content: space-between; padding: 10px 0; border-bottom: 1px solid #ecf0f1; font-size: 15px; }
  .dato span:first-child { font-weight: bold; color: #34495e; }
  .dato span:last-child { color: #2c3e50; }
  .botones { display: flex; gap: 10px; margin-top: 25px; }
  .btn { flex: 1; padding: 12px; border: none; border-radius: 6px; font-size: 14px; cursor: pointer; text-decoration: none; text-align: center; display: inline-block; }
  .btn-verde { background-color: #27ae60; color: white; }
  .btn-azul { background-color: #2980b9; color: white; }
  .btn-rojo { background-color: #e74c3c; color: white; }
  .btn-gris { background-color: #95a5a6; color: white; }
  .btn:hover { opacity: 0.9; }
</style>
</head>
<body>
<div class="container">
<% if(hayError) { %>
  <h2 style="color:#e74c3c;">Error de Registro</h2>
  <div class="error-box"><%=mensajeError%></div>
  <div class="botones">
    <a href="login.jsp" class="btn btn-rojo">Intentar de nuevo</a>
    <a href="limpiar.jsp" class="btn btn-gris">Limpiar registros</a>
  </div>
<% } else { %>
  <h2 style="color:#27ae60;">Vehiculo Registrado</h2>
  <div class="exito">Registro exitoso!</div>
  <div class="dato"><span>Nombre:</span><span><%=nombre%></span></div>
  <div class="dato"><span>Cedula:</span><span><%=cedula%></span></div>
  <div class="dato"><span>Placa:</span><span><%=placa%></span></div>
  <div class="dato"><span>Marca:</span><span><%=marca%></span></div>
  <div class="dato"><span>Modelo:</span><span><%=modelo%></span></div>
  <div class="botones">
    <a href="login.jsp" class="btn btn-verde">Registrar otro</a>
    <a href="index.jsp" class="btn btn-azul">Inicio</a>
  </div>
<% } %>
</div>
</body>
</html>