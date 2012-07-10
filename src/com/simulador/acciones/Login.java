package com.simulador.acciones;
import java.util.Map;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.simulador.modelos.Usuario;
import com.simulador.modelos.Persona;

@SuppressWarnings("serial")
public class Login extends ActionSupport implements ModelDriven<Usuario> {
    
	private Usuario usuario = new Usuario();
    private String acceso;
    
    public String execute(){
    	
    	Map<String, Object> session = ActionContext.getContext().getSession();
    	return ( session.get("tipoUsuario") != null ) ? SUCCESS : ERROR;
    
    }
    
   	public String verificarDatos(){
    	
    	Map<String, Object> session = ActionContext.getContext().getSession();
    	Persona p = usuario.verificar();
    	
    	if( usuario.isUsuarioValido() ){
        
    		/* Establecemos valores de sesi—n para el usuario actual */
    		session.put("tipoUsuario", usuario.getTipo() );
    		session.put("nombre_persona", p.getNombres() );
    		session.put("usuario_persona", usuario.getUsuario() );
    		session.put("idUsuario", p.getId_persona() );
    		
    	}else{
    		System.out.println("Usuario: [" + usuario.getUsuario() + "] y password: [" + usuario.getPassword() + "] no encontrados.");
    	}
    	
    	/* Regresamos objeto Usuario en formato JSON como respuesta a llamada AJAX*/
    	return SUCCESS;

    }
	
	public String mostrarForm(){
		Map<String, Object> session = ActionContext.getContext().getSession();
		return ( session.get("tipoUsuario") != null ) ? INPUT : SUCCESS;
	}
	
	public String salir(){
		
		Map<String,Object> session = ActionContext.getContext().getSession();
		session.remove("tipoUsuario" );
		session.remove("nombre_persona" );
		session.remove("usuario_persona" );
		session.remove("idUsuario" );
		
    	return SUCCESS;
	}
	
	public Usuario getModel(){
        return usuario;
    }
    
    public String getAcceso() {	
    	return acceso;	
    }
	public void setAcceso(String acceso) {	
		this.acceso = acceso;  
	}


    
}