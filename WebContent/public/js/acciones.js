function clearForm(){	
		
	limpiarFormulario( "formRegistrarProfesor" );
	
	$("#usuario").removeAttr( "disabled" );
	$("#password").removeAttr( "disabled" );
	
	$("#botones").html('<input type="button" onclick="altaProfesor();" value="Registrar" id="boton" />');
	$("input:button").uniform();

}

function resetForm(){
	clearForm();
}

function clearFormGrupo(){	
	
	limpiarFormulario( "formRegistrarGrupo" );
	$("#botones").html('<input type="button" onclick="altaGrupo();" value="Registrar" id="boton" />');
	$("input:button").uniform();

}

function editarProfesor(){
	
	if( formValido( 'formRegistrarProfesor' ) ){
		
		if( $("#email").esCorreo() ){
		
			var datos = $("#formRegistrarProfesor").serialize();
			$.getJSON('modificarInstructor', datos, function(data) {
				
				var oTable = $('#tablaProfesores').dataTable(); // Obtenemos referencia de la tabla.
				var nNodes = oTable.fnGetNodes( ); // Obtenemos todos los nodos de la tabla.
				
				for( var i = 0; i < nNodes.length; i++ ){
					if( $(nNodes[ i ]).attr("id") == "PROFESOR" + data.model.id_persona ){
						oTable.fnUpdate( "<a><b>" + data.model.nombres + "</b></a>", nNodes[ i ], 1, false ); // Actualizar Nombres
						oTable.fnUpdate( "<a><b>" + data.model.apellidop  + "</b></a>", nNodes[ i ], 2, false ); // Actualizar Apellido P
						oTable.fnUpdate( "<a><b>" + data.model.apellidom + "</b></a>", nNodes[ i ], 3, false ); // Actualizar Apellido M
						oTable.fnUpdate( "<a><b>" + data.model.email + "</b></a>", nNodes[ i ], 4, false ); // Actualizar Email
					}
				}
				
				limpiarFormulario( 'formRegistrarProfesor' );
				$(".lista").click();
				$("#mensaje").html('<div class="notice success"><p><b>Datos de profesor modificados correctamente.</b></p></div>');
			
			});
		
		}else{
			alert( "Teclee un e-mail valido!" );
		}
	}else{
		alert("Todos los campos son obligatorios.");
	}
}

/****************************** Agrega un nuevo Grupo ***********************************************/
function altaGrupo(){
	
	if( formValido( 'formRegistrarGrupo' ) ){
		
		var datos = $("#formRegistrarGrupo").serialize();
		$.getJSON('registrarGrupo', datos, function(data) {
			
			var datos = new Array();
			datos.push( data.model.id_grupo );
			datos.push( "<a><b>" + data.model.nombre + "</b></a>" );
			datos.push( true );	// Agregar Acciones ?
			
			// Agregamos la fila de la nueva persona a la tabla. 
			agregarFilaGrupo( datos );
			limpiarFormulario( 'formRegistrarGrupo' );
		
			$(".lista").click();
			$("#numRegistros").html( parseInt( $("#numRegistros").html() ) + 1 );
			$("#mensaje").html('<div class="notice success"><p><b>Grupo registrado correctamente en el sistema.</b></p></div>');
		
		});
	
	}else{
		
		alert("Todos los campos son obligatorios.");
		
	}
}

/*********************** Modifica los datos del grupo en la vista ********************************************/
function editarGrupo(){
	
	if( formValido( 'formRegistrarGrupo' ) ){
		
		var datos = $("#formRegistrarGrupo").serialize();
		$.getJSON('modificarGrupo', datos, function(data) {
			
			var oTable = $('#tablaGrupos').dataTable(); // Obtenemos referencia de la tabla.
			var nNodes = oTable.fnGetNodes( ); // Obtenemos todos los nodos de la tabla.
			
			for( var i = 0; i < nNodes.length; i++ ){
				if( $(nNodes[ i ]).attr("id") == "GRUPO" + data.model.id_grupo ){
					oTable.fnUpdate( "<a><b>" + data.model.nombre + "</b></a>", nNodes[ i ], 1, false ); // Actualizar Nombres
				}
			}
			
			limpiarFormulario( 'formRegistrarGrupo' );
			$(".lista").click();
			$("#mensaje").html('<div class="notice success"><p><b>Datos del Grupo modificados correctamente.</b></p></div>');
		
		});
		
	}else{
		alert("Todos los campos son obligatorios.");
	}
}


/*********************** Agrega una fila a una tabla con los datos especificados *****************************/
function agregarFilaGrupo( datos ){
	
	var id = datos[ 0 ]; // Obtenemos Id del nuevo registro con el que identificaremos la nueva fila.
	
	var editar = 	'<span class="edit editar" title="Editar" id="' + id + '"></span>';
	var eliminar = 	'<span class="delete eliminar" title="Eliminar" id="' + id + '"></span>';
	var acciones = editar + eliminar;
	
	datos[ 0 ] = '<span class="icon cabin"></span>' ;
	
	datos[ datos.length - 1 ] =  ( datos[ datos.length - 1 ] == true ) ? acciones : ""; // Asignamos acciones a la fila nueva.
	
	var oTable = $('#tablaGrupos').dataTable(); // Obtenemos referencia de la tabla.
	oTable.fnAddData( datos, true ); // Agregamos la fila con los datos nuevos.
	
	var nNodes = oTable.fnGetNodes( ); // Obtenemos todos los nodos de la tabla.
	
	for( var i = 0; i < nNodes.length; i++ ){
		if( $(nNodes[ i ]).attr("id") == "" ){
			$(nNodes[ i ]).attr("id", "GRUPO" + id); // Le asignamos un id a la nueva fila. 
		}
	}

}

$(document).ready(function(){
	
	$(".eliminarProfesor").live("click", function(){	
		if( confirm("Esta seguro de eliminar este registro?") ){
			
			var idPersona = $(this).attr("id");
			var fuente = $(this);
			
			$.getJSON('borrarInstructor', { id_persona:idPersona }, function(data) {
				
				var oTable = $('#tablaProfesores').dataTable();
				var nNodes = oTable.fnGetNodes( );
				var row = null;
				
				for( var i = 0; i < nNodes.length; i++ ){
					if( $(nNodes[ i ]).attr("id") == "PROFESOR" + idPersona ){
						row = nNodes[ i ];
					}
				}
				
				oTable.fnDeleteRow( row );
				$("#numRegistros").html( parseInt( $("#numRegistros").html() - 1 ) );
				
				
				clearForm();
				
				// Si la eliminacion se hizo desde el formulario de modificacion, se hace click en el listado. 
				if( fuente[0].tagName == "INPUT"  ) $(".lista").click(); 
			
			});
			
		}
		
	});
	
	$(".editarProfesor").live("click", function(){	
			
			var idPersona = $(this).attr("id");
			
			$.getJSON('obtenerDatosInstructor', { usuario:idPersona }, function(data) {
				
				/* Utilizamos el mismo formulario que da de alta al profesor */
				$(".formAlta").click();
				
				/* Cambiamos los botones por los de modificación y eliminación */
				$("#botones").html('<input type="button" onclick="editarProfesor();" value="Modificar"  />');
				$("#botones").append('<input type="button" value="Eliminar" class="eliminarProfesor" id="' + idPersona + '" />');
				
				/* Rellenamos los campos a partir del JSON */
				$("#nombres").val( data.model.nombres );
				$("#apellidop").val( data.model.apellidop );
				$("#apellidom").val( data.model.apellidom );
				$("#email").val( data.model.email );
				$("#sexo").val( data.model.sexo );
				$("#fechaNac").val( data.model.fechaNac );
				$("#usuario").val( data.model.usuario );
				$("#password").val( "password" );
				$("#id_persona").val( idPersona ); // Id de la persona que se va a modificar.
				
				/* El administrador no puede modificar los datos de usuario del profesor */
				$("#usuario").attr( "disabled", "disabled" );
				$("#password").attr( "disabled", "disabled" );
				
				/* Estilo de los elementos del form */
				$.uniform.update("#sexo");
				$("input:button").uniform();
				
			});
			
	});
	
	$(".editarGrupo").live("click", function(){	
		
		var idGrupo = $(this).attr("id");
		
		$.getJSON('obtenerDatosGrupo', { id_grupo:idGrupo }, function(data) {
			
			/* Utilizamos el mismo formulario que da de alta al profesor */
			$(".formAltaGrupo").click();
			
			/* Cambiamos los botones por los de modificación y eliminación */
			$("#botones").html('<input type="button" onclick="editarGrupo();" value="Modificar"  />');
			$("#botones").append('<input type="button" value="Eliminar" class="eliminarGrupo" id="' + idGrupo + '" />');
			
			/* Rellenamos los campos a partir del JSON */
			$("#nombre").val( data.model.nombre );
			$("#password").val( data.model.password );
			$("#descripcion").val( data.model.descripcion );
			$("#id_grupo").val( idGrupo ); // Id del grupo que se va a modificar.
			
			$("input:button").uniform();
			
		});
		
	});
	
	$(".eliminarGrupo").live("click", function(){	
		if( confirm("Esta seguro de eliminar este registro?") ){
			
			var idGrupo = $(this).attr("id");
			var fuente = $(this);
			
			$.getJSON('borrarGrupo', { id_grupo:idGrupo }, function(data) {
				
				var oTable = $('#tablaGrupos').dataTable();
				var nNodes = oTable.fnGetNodes( );
				var row = null;
				
				for( var i = 0; i < nNodes.length; i++ ){
					if( $(nNodes[ i ]).attr("id") == "GRUPO" + idGrupo ){
						row = nNodes[ i ];
					}
				}
				
				oTable.fnDeleteRow( row );
				$("#numRegistros").html( parseInt( $("#numRegistros").html() - 1 ) );
				
				
				clearForm();
				
				// Si la eliminacion se hizo desde el formulario de modificacion, se hace click en el listado. 
				if( fuente[0].tagName == "INPUT"  ) $(".lista").click(); 
			
			});
			
		}
		
	});
	
});