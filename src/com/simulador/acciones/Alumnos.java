package com.simulador.acciones;

import java.util.Map;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.simulador.modelos.Alumno;

public class Alumnos extends ActionSupport implements ModelDriven<Alumno> {

	private static final long serialVersionUID = 1L;
	private Alumno alumno = new Alumno();
	
	@Override
	public Alumno getModel() {
		return alumno;
	}
	
	public String altaProfesor(){
		Map<String,Object> session = ActionContext.getContext().getSession();
		if ( session.get("tipoUsuario").equals("PROFESOR") ) { 
			boolean ingresado = alumno.alta();
			return ingresado? SUCCESS : ERROR;
		}
		return INPUT;
	}
	
	public String modificarProfesor(){
		
		Map<String,Object> session = ActionContext.getContext().getSession();
		if ( session.get("tipoUsuario").equals("PROFESOR") ) { 
			
			boolean isOk = alumno.modificar();
			return ( isOk )? SUCCESS : ERROR;
			
			
		}
		return INPUT;
	}

	public String obtenerDatos(){
		Map<String,Object> session = ActionContext.getContext().getSession();
		if ( session.get("tipoUsuario").equals("PROFESOR") ) { 
			
			boolean isOk = alumno.consultar();
			return ( isOk )? SUCCESS : ERROR;
			
			
		}
		return INPUT;
	}
	
	public String borrarAlumno(){
		Map<String,Object> session = ActionContext.getContext().getSession();
		if ( session.get("tipoUsuario").equals("PROFESOR") ) { 
			boolean ingresado = alumno.baja();
			return ingresado? SUCCESS : ERROR;
		}
		return INPUT;
	}
	
	public String execute(){ return ERROR; } /* No hay un flujo correcto que involucre esta funcion. Se regresa error en  todos los casos. */
	
}
