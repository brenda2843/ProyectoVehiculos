<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Registro Vehículo</title>
<style>
  body {
    font-family: Arial, sans-serif;
    background-color: #f0f4f8;
    display: flex;
    justify-content: center;
    align-items: center;
    min-height: 100vh;
    margin: 0;
  }
  .container {
    background-color: white;
    padding: 40px;
    border-radius: 10px;
    box-shadow: 0 4px 12px rgba(0,0,0,0.1);
    width: 400px;
  }
  h2 {
    color: #2c3e50;
    text-align: center;
    margin-bottom: 25px;
  }
  .form-group {
    margin-bottom: 15px;
  }
  label {
    display: block;
    font-weight: bold;
    color: #34495e;
    margin-bottom: 5px;
  }
  input[type="text"] {
    width: 100%;
    padding: 10px;
    border: 1px solid #ccc;
    border-radius: 6px;
    font-size: 14px;
    box-sizing: border-box;
  }
  input[type="text"]:focus {
    border-color: #2980b9;
    outline: none;
  }
  .error {
    color: red;
    font-size: 12px;
    display: none;
    margin-top: 4px;
  }
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
  .btn:hover {
    background-color: #1a6fa3;
  }
  .link {
    display: block;
    text-align: center;
    margin-top: 15px;
    color: #2980b9;
    text-decoration: none;
  }
  .link:hover {
    text-decoration: underline;
  }
</style>
</head>
<body>
<div class="container">
  <h2>Formulario de Registro</h2>
 <form id="formRegistro" action="resultado.jsp" method="post" onsubmit="return validarFormulario()">

    <div class="form-group">
      <label>Nombre del cliente:</label>
      <input type="text" id="nombre" name="nombre" placeholder="Ej: Juan Perez">
      <span class="error" id="errorNombre">El nombre es obligatorio.</span>
    </div>

    <div class="form-group">
      <label>Cedula:</label>
      <input type="text" id="cedula" name="cedula" placeholder="Ej: 1234567890">
      <span class="error" id="errorCedula">La cedula debe contener solo numeros.</span>
    </div>

    <div class="form-group">
      <label>Placa:</label>
      <input type="text" id="placa" name="placa" placeholder="Ej: ABC123 o ABC12F">
      <span class="error" id="errorPlaca">Formato invalido. Use ABC123 o ABC12F.</span>
    </div>

    <div class="form-group">
      <label>Marca:</label>
      <input type="text" id="marca" name="marca" placeholder="Ej: Toyota">
      <span class="error" id="errorMarca">La marca es obligatoria.</span>
    </div>

    <div class="form-group">
      <label>Modelo (año):</label>
      <input type="text" id="modelo" name="modelo" placeholder="Ej: 2021">
      <span class="error" id="errorModelo">El modelo es obligatorio.</span>
    </div>

    <input type="submit" class="btn" value="Registrar Vehiculo">
  </form>
  <a href="index.jsp" class="link">Volver al inicio</a>
</div>

<script>
function validarFormulario() {
  let valido = true;

  document.querySelectorAll('.error').forEach(e => e.style.display = 'none');

  let nombre = document.getElementById('nombre').value.trim();
  if (nombre === '') {
    document.getElementById('errorNombre').style.display = 'block';
    valido = false;
  }

  let cedula = document.getElementById('cedula').value.trim();
  if (!/^\d+$/.test(cedula)) {
    document.getElementById('errorCedula').style.display = 'block';
    valido = false;
  }

  let placa = document.getElementById('placa').value.trim().toUpperCase();
  if (!/^[A-Z]{3}\d{3}$/.test(placa) && !/^[A-Z]{3}\d{2}[A-Z]$/.test(placa)) {
    document.getElementById('errorPlaca').style.display = 'block';
    valido = false;
  }

  let marca = document.getElementById('marca').value.trim();
  if (marca === '') {
    document.getElementById('errorMarca').style.display = 'block';
    valido = false;
  }

  let modelo = document.getElementById('modelo').value.trim();
  if (modelo === '') {
    document.getElementById('errorModelo').style.display = 'block';
    valido = false;
  }

  return valido;
}
</script>
</body>
</html>
```
