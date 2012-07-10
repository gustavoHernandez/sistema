package com.simulador.acciones;

import java.util.List;
import java.util.Map;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.simulador.modelos.Instructor;

public class Instructores extends ActionSupport implements ModelDriven<Instructor> {

	private static final long serialVersionUID = 1L;
	private Instructor instructor = new Instructor();
	private List<Instructor> instructores;
	private int resultados;
	
	public Instructor getModel() {
		return instructor;
	}
	
	public String obtenerDatos(){
		if ( esAdmin() ) { 
			return ( instructor.consultar() )? SUCCESS : ERROR;
		}
		return INPUT;
	}
	
	public String obtenerTodos(){
		if ( esAdmin() ) { 
			instructores = instructor.obtenerInstructores();
			setResultados( instructores.size() );
			return SUCCESS;
		}else{
			return ERROR;
		}
	}
	
	public String altaInstructor(){
		if ( esAdmin() ) { 
			return ( instructor.alta() )? SUCCESS : ERROR;
		}
		return INPUT;
	}
	
	public String modificarInstructor(){
		if ( esAdmin() ) { 
			return ( instructor.modificar() )? SUCCESS : ERROR;
		}
		return INPUT;
	}
	
	public String borrarInstructor(){
		if ( esAdmin() ) { 
			return instructor.baja() ? SUCCESS : ERROR;
		}
		return INPUT;
	}

	public int getResultados() {
		return resultados;
	}

	public void setResultados(int resultados) {
		this.resultados = resultados;
	}

	public List<Instructor> getInstructores() {
		return instructores;
	}

	public void setInstructores(List<Instructor> instructores) {
		this.instructores = instructores;
	}
	
	public boolean esAdmin(){
		Map<String,Object> session = ActionContext.getContext().getSession();
		return ( session.get("tipoUsuario") != null && session.get("tipoUsuario").equals("ADMIN") ) ? true : false; 
	}

}
