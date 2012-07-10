<%@ taglib prefix="s" uri="/struts-tags"%>

<body>

	<!-- 100% Box Grid Container: Start -->
	<div class="grid_24">
		
		<!-- Info Notice: Start -->
		
		<s:if test="acceso != 'denegado'">
			<div class="notice success">
				<p>Bienvenido <s:property value="#session.nombre_persona"></s:property>, este es el panel de control. Elije una acci&oacute;n a realizar.</p>
			</div>
		</s:if>
		<s:else>
			<div class="notice warning">
				<p>No tiene permiso para acceder al m&oacute;dulo especificado.</p>
			</div>
		</s:else>
		
		<!-- Info Notice: End -->
		
		<!-- Box Header: Start -->
		<div class="box_top">
			
			<h2 class="icon time">Links R&aacute;pidos.</h2>
			
		</div>
		<!-- Box Header: End -->
		
		<!-- Box Content: Start -->
		<div class="box_content">
			
			<p class="center">
				
				<s:if test="#session.tipoUsuario == 'ADMIN'">
				
					<a href="instructores" class="big_button add_user"><span>Instructores</span></a>
					<a href="cursos" class="big_button upload"><span>Cursos</span></a>
					<a href="asignarCurso" class="big_button support"><span>Asignar</span></a>
					
	            </s:if>
	            
	            <s:if test="#session.tipoUsuario == 'PROFESOR'">
				
					<a href="" class="big_button add_user"><span>Alumnos</span></a>
					<a href="" class="big_button add_news"><span>Examenes</span></a>
					<a href="grupos" class="big_button support"><span>Grupos</span></a>
					
	            </s:if>
	            
	            <s:if test="#session.tipoUsuario == 'ALUMNO'">
				
					<a href="inscripcionCursos" class="big_button support"><span>Cursos</span></a>
						
	            </s:if>
	            
	        </p>
			
		</div>
		<!-- Box Content: End -->
		
	</div>
	<!-- 100% Box Grid Container: End -->


</body>

