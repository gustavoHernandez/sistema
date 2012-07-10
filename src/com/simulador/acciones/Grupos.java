package com.simulador.acciones;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.simulador.modelos.Grupo;

public class Grupos extends ActionSupport implements ModelDriven<Grupo>{

	private static final long serialVersionUID = 1L;
	
	private Grupo grupo = new Grupo();
	private int resultados;
	private List<Grupo> grupos = new ArrayList<Grupo>();
	
	public String mostrarGrupos(){
		Map<String,Object> session = ActionContext.getContext().getSession();
		if ( session.get("tipoUsuario") != null && session.get("tipoUsuario").equals("PROFESOR") ) { 
			
			grupos = grupo.obtener();
			setResultados( grupos.size() );
			
			return SUCCESS;
			
		}else{
			
			return ERROR;
			
		}
	}
	
	public String altaGrupo(){
		Map<String,Object> session = ActionContext.getContext().getSession();
		if ( session.get("tipoUsuario").equals("PROFESOR") ) { 
			boolean ingresado = grupo.alta();
			return ingresado? SUCCESS : ERROR;
		}
		return INPUT;
	}
	
	public String obtenerDatosGrupo(){
		Map<String,Object> session = ActionContext.getContext().getSession();
		if ( session.get("tipoUsuario").equals("PROFESOR") ) { 
			
			boolean isOk = grupo.consultar();
			return ( isOk )? SUCCESS : ERROR;
			
			
		}
		return INPUT;
	}
	
	public String modificarGrupo(){
		
		Map<String,Object> session = ActionContext.getContext().getSession();
		if ( session.get("tipoUsuario").equals("PROFESOR") ) { 
			
			boolean isOk = grupo.modificar();
			return ( isOk )? SUCCESS : ERROR;
			
			
		}
		return INPUT;
	}
	
	public String borrarGrupo(){
		Map<String,Object> session = ActionContext.getContext().getSession();
		if ( session.get("tipoUsuario").equals("PROFESOR") ) { 
			boolean ingresado = grupo.baja();
			return ingresado? SUCCESS : ERROR;
		}
		return INPUT;
	}

	
	/* ModelDriven */
	public Grupo getModel() {
		return grupo;
	}

	public int getResultados() {
		return resultados;
	}

	public void setResultados(int resultados) {
		this.resultados = resultados;
	}

	public List<Grupo> getGrupos() {
		return grupos;
	}

	public void setGrupos(List<Grupo> grupos) {
		this.grupos = grupos;
	}

}
