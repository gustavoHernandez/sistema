<%@ taglib uri="/struts-tags" prefix="s" %>

<!DOCTYPE html>
<html>

	<head>
	
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	
		<title>Login | Simulador</title>
		
		<!-- Imports General CSS and jQuery CSS -->
		<link href="public/css/screen.css" rel="stylesheet" media="screen" type="text/css">
		
		<!-- CSS for Fluid and Fixed Widths - Double to prevent flickering on change -->
		<link href="public/css/fixed.css" rel="stylesheet" media="screen" type="text/css">
		<link href="public/css/fixed.css" rel="stylesheet" media="screen" type="text/css" class="width">
		
		<!-- IE Stylesheet ie7 - Added in 1.2 -->
		<!--[if lt IE 8]> <html lang="en" class="ie7"> <![endif]-->
		
		<!-- IE Stylesheet ie8 - Added in 1.1 -->
		<!--[if IE 8 ]> <html lang="en" class="ie8"> <![endif]-->
		
		<!-- CSS for Theme Styles - Double to prevent flickering on change -->
		<link href="public/css/blue.css" rel="stylesheet" media="screen" type="text/css">
		<link href="public/css/blue.css" rel="stylesheet" media="screen" type="text/css" class="theme">
		
		<!-- IE Canvas Fix for Visualize Charts - Added in 1.1 -->
		<!--[if IE]><script type="text/javascript" src="js/excanvas.js"></script><![endif]-->
		
		
		<!-- jQuery thats loaded before document ready to prevent flickering - Rest are found at the bottom -->
		<script type="text/javascript" src="public/js/jquery-1.4.1.min.js"></script>
	
	</head>

<body>

	
<!-- Start: Page Wrap -->
<div id="wrap" class="container_24">

	<!-- Header Grid Container: Start -->
	<div class="login">
		
	<!-- Info Notice: Start -->
	
	<div id="usuarioNoValidoMensaje">
	
		<s:if test="acceso == null">
		
			<div class="notice info">
				<p>Ingrese su <b>usuario</b> y <b>contrase&ntilde;a</b> para accesar al sistema.</p>
			</div>
	
		</s:if>
		<s:else>
			
			<div class="notice error">
				<p>Ingrese sus datos de usuario. Haga click en reestablecer contrase&ntilde;a si los olvid&oacute;.</p>
			</div>
		
		</s:else>
	
	</div>
	
	<!-- Info Notice: End -->
	
		<!-- Header: Start -->
		<div id="header">
				
			<!-- Logo: Start -->
			<a href="" id="logo">Simplpan - Admin Panel</a>
			<!-- Logo: End -->
			
			
			<!-- Login: Start -->
			<form id="login" name="login" method="post" action="Dashboard" onsubmit="javascript:verificarDatos();return false;">
				
				<!-- Username Input: Start -->
				<label for="usuario" class="label_username">Usuario</label>
				<input type="text" name="usuario" value="" id="usuario" class="password tip-stay validate" title="Ingrese su ID de Usuario.">
				<!-- Username Input: End -->
				
				<!-- Password Input: Start -->
				<label for="password" class="label_password">Password</label>
				<input type="password" name="password" value="" id="password" class="password tip-stay validate" title="Ingrese su password.">
				
				<!-- Password Input: End -->
				
				<!-- Login Button: Start -->
				<input type="submit" value="login" class="tip" title="Login" />
				<!-- Login Button: End -->
				
			</form>
			
			<!-- Login: End -->
			
		</div>
		<!-- Header: End -->
		
		<!-- Breadcrumb Bar: Start -->
		<div id="breadcrumb">
			
			<!-- Breadcrumb: Start -->
			<ul class="left">
				<li class="icon key showFormRecuperar"><a href="#">Contrase&ntilde;a Olvidada</a></li>
			</ul>
			<!-- Breadcrumb: End -->
			
			<!-- Breadcrumb Icon Links: Start -->
			<ul class="right">
				<li class="registrarse"><a href="#" class="icon edit tip" title="Registrarse">Registrarse</a></li>
			</ul>
			<!-- Breadcrumb Icon Links: End -->
			
		</div>
		<!-- Breadcrumb Bar: End -->
		
	</div>
	<!-- Header Grid Container: End -->
	
	
	
	<!-- Incia formulario de recuperacion de contraseña -->
	<div class="login" id="recover" style="display:none;">

		<!-- Box Header: Start -->
		<div class="box_top">
			
			<a name="news"></a>
			<h2 class="icon pages">Recuperaci&oacute;n de Contrase&ntilde;a.</h2>
			
		</div>
		<!-- Box Header: End -->
		
		<!-- Box Content: Start -->
		<div class="box_content padding">
			
			<form id="formRecuperarPassword" action="recuperarPassword" method="post">
			
				<p class="info small">
					<span class="icon info"></span>
					Teclee su e-mail para enviarle su contrase&ntilde;a.
				</p>
	
				<!-- Inicio Formulario Datos Generales -->
				<div class="field">
					<div align="center">
						<label style="display:inline;">email:</label> <input type="text" class="big validate" title="" name="email" id="email">
					</div>
					<div class="clear"></div>
				</div>
					
				<div class="center" style="margin-bottom:10px;" align="center" id="botones">
					<input type="button" value="Enviar" class="boton recuperarPassword" />
				</div>
				<!-- Fin Formulario Recuperar Contraseña -->
			
			</form>
			
		</div>
		
	</div>
	<!-- Termina formulario de recuperación de contraseña -->
	
	<!-- Inicia formulario de Registro -->
	<div class="login" id="registrarse" style="display:none;">

		<!-- Box Header: Start -->
		<div class="box_top">
			
			<a name="news"></a>
			<h2 class="icon pages">Registrarse a un curso.</h2>
			
		</div>
		<!-- Box Header: End -->
		
		<!-- Box Content: Start -->
		<div class="box_content padding">
			
			<form id="formRecuperarPassword" action="recuperarPassword" method="post">
			
				<!-- Inicio Formulario Datos Generales -->
				<p class="info small">
					<span class="icon info"></span>
					Datos generales.
				</p>
				<div class="field">
				
					<div class="left">
				
						<label>Nombres:</label>
						<input type="text" class="validate" title="" name="nombres" id="nombres">
				
					</div>
				
					<div class="left" style="padding-left:150px;">
				
						<label>Apellido Paterno:</label>
						<input type="text" class="validate" name="apellidop" id="apellidop">
				
					</div>
					
					<div class="clear"></div>
					
					<div class="left">
				
						<label>Apellido Materno:</label>
						<input type="text" class="validate" name="apellidom" id="apellidom">
				
					</div>
					
					<div class="left" style="padding-left:150px;">
					
						<label>e-mail:</label>
						<input type="text" class="validate" name="email" id="email">
					
					</div>
					
					<div class="clear"></div>
					
					<div class="left">
				
						<label>Sexo:</label>
						<select name="sexo" id="sexo">
							<option value="FEMENINO">FEMENINO</option>
							<option value="MASCULINO">MASCULINO</option>
						</select>
				
					</div>
					
					<div class="left" style="padding-left:150px;">
					
						<label>Fecha de Nacimiento:</label>
						<input type="text" class="date validate" readonly="readonly" name="fechaNac" id="fechaNac">
					
					</div>
					
					<div class="clear"></div>
					
				</div>
				<!-- Fin Formulario Datos Generales -->
				
				<!-- Inicio Formulario Datos de Curso -->
				<p class="info small">
					<span class="icon info"></span>
					Datos de Curso
				</p>
				<div class="field">
				
					<div class="left">
				
						<label>Curso:</label>
						<input type="text" class="validate" title="" name="grupo" id="grupo">
				
					</div>
				
					<div class="left" style="padding-left:150px;">
				
						<label>Password del curso:</label>
						<input type="password" class="validate" name="password" id="password">
					
					</div>
					
					<div class="clear"></div>
					
				</div>
		
				<!-- Inicio Formulario Datos Usuario -->
				<p class="info small">
					<span class="icon info"></span>
					Datos de Usuario
				</p>
				<div class="field">
				
					<div class="left">
				
						<label>Usuario:</label>
						<input type="text" class="validate" title="" name="usuario" id="usuario">
				
					</div>
				
					<div class="left" style="padding-left:150px;">
				
						<label>Password:</label>
						<input type="password" class="validate" name="password" id="password">
						<input type="hidden" name="id_persona" id="id_persona" />
						
					</div>
					
					<div class="clear"></div>
					
				</div>
				
				<div class="center" style="margin-bottom:10px;" align="center" id="botones">
						
					<input type="button" value="Registrarse" class="boton recuperarPassword" />
						
				</div>
					
				<!-- Fin Formulario Recuperar Contraseña -->
			
			</form>
			
		</div>
		
	</div>	
	<!-- Termina formulario de registro -->
	
	
	
	
</div>
<!-- End: Page Wrap -->

	<!-- Librerías de JQuery -->
	<script type="text/javascript" src="public/js/jquery-ui-1.8.13.custom.min.js"></script>
	<script type="text/javascript" src="public/js/jquery.poshytip.min.js"></script>
	<script type="text/javascript" src="public/js/jquery.dataTables.min.js"></script>
	<script type="text/javascript" src="public/js/jquery.facebox.js"></script>
	<script type="text/javascript" src="public/js/jquery.uniform.min.js"></script>
	
	<!-- Personalizacion -->
	<script type="text/javascript" src="public/js/custom.js"></script>
	<script type="text/javascript" src="public/js/login.js"></script>


</body>
</html>