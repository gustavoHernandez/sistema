<%@ taglib prefix="s" uri="/struts-tags"%>


<body>


	
<!-- 100% Box Grid Container: Start -->
	<div class="grid_24">

	<div id="mensaje">
		<div class="notice info">
			<p>Listado de instructores registrados en el sistema.</p>
		</div>
	</div>
	<!-- Box Header: Start -->
	<div class="box_top">
		
		<a name="news"></a>
		<h2 class="icon pages">Instructores registrados en el sistema.<span class="tip" title="Numero de Resultados" id="numRegistros"><s:property value="resultados" /></span></h2>
		
		<!-- Tab Select: Start -->
		<ul class="sorting">
			<li><a href="#listing" class="active lista"><span onclick="clearForm();">Listando</span></a></li>
			<li><a href="#registrarProfesorTab" class="formAlta"><span onclick="resetForm();">Agregar Nuevo</span></a></li>
		</ul>
		<!-- Tab Select: End -->
		
	</div>
	<!-- Box Header: End -->
	
	<!-- Box Content: Start -->
	<div class="box_content">
		
		<!-- News Table Tabs: Start -->
		<div class="tabs">
		
			<!-- Inicia primer Tab: Tabla de instructores registrados -->
			<div id="listing">
				
				<table class="sorting" id="tablaProfesores">
					<thead>
						<tr>
							<th class="checkers"></th>
							<th class="align_left">Nombre</th>
							<th class="align_left center">Apellido Paterno</th>
							<th class="align_left center">Apellido Materno</th>
							<th class="align_left center">e-mail</th>
							<th class="align_left center tools">Acciones</th>
						</tr>
					</thead>
					
				<tbody>
				
					<s:iterator value="instructores" status="estatus">
				        
				        <tr class="<s:if test="estatus.odd == true ">odd</s:if><s:else>even</s:else> registro" id="PROFESOR<s:property value="id_persona" />" >
							<td class="checkers">
								<span class="icon user"></span>
							</td>
							<td class="align_left">
								<a><b><s:property value="nombres" /></b></a>
							</td>
							<td class="align_left">
								<a><b><s:property value="apellidop" /></b></a>
							</td>
							<td class="align_left">
								<a><b><s:property value="apellidom" /></b></a>
							</td>
							<td class="align_left">
								<a><b><s:property value="email" /></b></a>
							</td>
							<td class="align_left tools center">
							
								<span class="edit editarProfesor" title="Editar" id="<s:property value="id_persona" />"></span>
								<span class="delete eliminarProfesor" title="Eliminar" id="<s:property value="id_persona" />"></span>
								
							</td>
						</tr>
				        
				        
				    </s:iterator>
				
				</tbody>
                        
               </table>
               
			</div>
			
			<div id="registrarProfesorTab">
			
				
				<form id="formRegistrarProfesor" action="registrarProfesor" method="post">
			
				<div class="padding">
			
					<p class="info small">Datos Generales.</p>
	
					<!-- Inicio Formulario Datos Generales -->
					<div class="field">
					
						<div class="left">
					
							<label>Nombres:</label>
							<input type="text" class="big validate" title="" name="nombres" id="nombres">
					
						</div>
					
						<div class="left" style="padding-left:150px;">
					
							<label>Apellido Paterno:</label>
							<input type="text" class="big validate" name="apellidop" id="apellidop">
					
						</div>
						
						<div class="clear"></div>
						
						<div class="left">
					
							<label>Apellido Materno:</label>
							<input type="text" class="big validate" name="apellidom" id="apellidom">
					
						</div>
						
						<div class="left" style="padding-left:150px;">
						
							<label>e-mail:</label>
							<input type="text" class="big validate" name="email" id="email">
						
						</div>
						
						<div class="clear"></div>
						
						<div class="left">
					
							<label>Sexo:</label>
							<select name="sexo" id="sexo">
								<option value="FEMENINO">FEMENINO</option>
								<option value="MASCULINO">MASCULINO</option>
							</select>
					
						</div>
						
						<div class="left" style="padding-left:250px;">
						
							<label>Fecha de Nacimiento:</label>
							<input type="text" class="big date validate" readonly="readonly" name="fechaNac" id="fechaNac">
						
						</div>
						
						<div class="clear"></div>
						
					</div>
					<!-- Fin Formulario Datos Generales -->
			
					<p class="info small">Datos de Usuario</p>
					
					<!-- Inicio Formulario Datos Usuario -->
					<div class="field">
					
						<div class="left">
					
							<label>Usuario:</label>
							<input type="text" class="big validate" title="" name="usuario" id="usuario">
					
						</div>
					
						<div class="left" style="padding-left:150px;">
					
							<label>Password:</label>
							<input type="password" class="big validate" name="password" id="password">
							<input type="hidden" name="id_persona" id="id_persona" />
							
						</div>
						
						<div class="clear"></div>
						
					</div>
					
					<div class="center" style="margin-bottom:10px;" align="center" id="botones">
						
						<input type="button" onclick="altaProfesor();" value="Registrar" class="boton" />
						
					</div>
					
					<!-- Fin Formulario Datos Usuario -->
			
				</div>
				
				</form>
			
			</div>
			
			
			
			
		</div>
		<!-- News Table Tabs: End -->

	</div>
	<!-- Box Content: End -->
	
</div>
<!-- 100% Box Grid Container: End -->
	
