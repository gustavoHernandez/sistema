<%@ taglib prefix="s" uri="/struts-tags"%>


<body>

<!-- 100% Box Grid Container: Start -->
	<div class="grid_24">

	<div id="mensaje">
		<div class="notice info">
			<p>Listado de grupos registrados en el sistema.</p>
		</div>
	</div>
	<!-- Box Header: Start -->
	<div class="box_top">
		
		<a name="news"></a>
		<h2 class="icon pages">Grupos registrados en el sistema.<span class="tip" title="Numero de Resultados" id="numRegistros"><s:property value="resultados" /></span></h2>
		
		<!-- Tab Select: Start -->
		<ul class="sorting">
			<li><a href="#listing" class="active lista"><span onclick="clearFormGrupo();">Listando</span></a></li>
			<li><a href="#registrarGrupoTab" class="formAltaGrupo"><span onclick="clearFormGrupo();">Agregar Nuevo</span></a></li>
		</ul>
		<!-- Tab Select: End -->
		
	</div>
	<!-- Box Header: End -->
	
	<!-- Box Content: Start -->
	<div class="box_content">
		
		<!-- News Table Tabs: Start -->
		<div class="tabs">
		
			<!-- Inicia primer Tab: Tabla de grupo registrados por el profesor-->
			<div id="listing">
				
				<table class="sorting" id="tablaGrupos">
					<thead>
						<tr>
							<th class="checkers"></th>
							<th class="align_left center">Nombre</th>
							<th class="align_left center tools">Acciones</th>
						</tr>
					</thead>
					
				<tbody>
				
					<s:iterator value="grupos" status="estatus">
				        
				        <tr class="<s:if test="estatus.odd == true ">odd</s:if><s:else>even</s:else> registro" id="GRUPO<s:property value="id_grupo" />" >
							<td class="checkers">
								<span class="icon cabin"></span>
							</td>
							<td class="center">
								<a><b><s:property value="nombre" /></b></a>
							</td>
							<td class="align_left tools center">
							
								<span class="view verAlumnosDelGrupo" title="Ver Alumnos" id="<s:property value="id_grupo" />"></span>
								<span class="edit editarGrupo" title="Editar" id="<s:property value="id_grupo" />"></span>
								<span class="delete eliminarGrupo" title="Eliminar" id="<s:property value="id_grupo" />"></span>
								
							</td>
						</tr>
				        
				        
				    </s:iterator>
				
				</tbody>
                        
               </table>
               
			</div>
			
			<div id="registrarGrupoTab">
			
				
				<form id="formRegistrarGrupo" action="registrarGrupo" method="post">
			
				<div class="padding">
			
					<p class="info small">Teclee un nombre para el nuevo grupo y de clic en 'Registrar'.</p>
	
					<!-- Inicio Formulario Datos Generales -->
					<div class="field">
					
						<div class="left">
					
							<label>Nombre del grupo: </label>
							<input type="text" class="big validate" title="" name="nombre" id="nombre">
							<input type="hidden" name="id_grupo" id="id_grupo" value="">
						</div>
						
						<div class="left" style="padding-left:100px;">
							<label>Password de Registro: </label>
							<input type="password" class="big validate" title="" name="password" id="password">
						</div>
					
												
						<div class="clear"></div>
						
						<div class="left">
							<label>Descripci&oacute;n: </label>
							<textarea rows="3" cols="103" name="descripcion" id="descripcion" class="validate"></textarea>
						</div>
					
												
						<div class="clear"></div>
						
					</div>
					
					<div class="center" style="margin-bottom:10px;" align="center" id="botones">
						<input type="button" onclick="altaGrupo();" value="Registrar" class="boton" />
					</div>
					<!-- Fin Formulario Datos Grupo -->
			
				</div>
				
				</form>
			
			</div>
			
			
			
			
		</div>
		<!-- News Table Tabs: End -->

	</div>
	<!-- Box Content: End -->
	
</div>
<!-- 100% Box Grid Container: End -->
	
