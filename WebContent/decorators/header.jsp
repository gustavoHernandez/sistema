<%@ taglib prefix="s" uri="/struts-tags"%>

<html>
	
	<head>

		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<title>Simulador de aplicaciones.</title>
		
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
		<link href="public/css/theme/blue.css" rel="stylesheet" media="screen" type="text/css">
		<link href="public/css/theme/blue.css" rel="stylesheet" media="screen" type="text/css" class="theme">
		
		<!-- IE Canvas Fix for Visualize Charts - Added in 1.1 -->
		<!--[if IE]><script type="text/javascript" src="js/excanvas.js"></script><![endif]-->
		
		<!-- jQuery thats loaded before document ready to prevent flickering - Rest are found at the bottom -->
		<script type="text/javascript" src="public/js/jquery-1.4.1.min.js"></script>
		<script type="text/javascript" src="public/js/jquery.visualize.js"></script>
	
	</head>
	
	<!-- Comienza: Contenedor Principal ( Termina en footer.jsp[31] ) -->
	<div id="wrap" class="container_24">
	
	
		<!-- Contenedor de encabezado: Comienza -->
		<div class="grid_24">
			
			<!-- User Panel: Start -->
			<div id="userpanel">
				
				<!-- User: Start -->
				<ul id="user" class="dropdown">
					<li class="topnav">
						<!-- User Name -->
						<a href="#" class="top icon user"> <s:property value="#session.nombre_persona" /> </a>
						
						<!-- User Dropdown Content: Start -->
						<ul class="subnav">  
				            <li><a href="#" class="icon users">Perfil</a></li> 
				            <li><a href="#" class="icon lock salir">Salir</a></li>  
				        </ul>  
				        <!-- User Dropdown Content: End -->
					</li>
				</ul>
				<!-- User: End -->
				
			</div>
			<!-- User Panel: End -->
			
			<!-- Header: Start -->
			<div id="header">
					
				<!-- Navigation: Start -->
				<ul id="navigation" class="dropdown">
					
					
					<li><a class="dashboard active" href="Dashboard">Panel de control</a></li>
				    
				</ul>
				<!-- Navigation: End -->
				
			</div>
			<!-- Header: End -->
			
			<!-- Breadcrumb Bar: Start -->
			<div id="breadcrumb">
				
				<!-- Breadcrumb: Start -->
				<ul class="left">
					<li class="icon dashboard"> <s:property value="#session.tipoUsuario"></s:property> </li>
				</ul>
				<!-- Breadcrumb: End -->
				
				<!-- Breadcrumb Icon Links: Start -->
				<ul class="right">
					<li><a href="#" class="icon lock tip salir" title="Salir">Salir</a></li>
				</ul>
				<!-- Breadcrumb Icon Links: End -->
				
			</div>
			<!-- Breadcrumb Bar: End -->
			
		</div>
		<!-- Contenedor de encabezado: Termina -->
