package com.simulador.modelos;

import java.sql.SQLException;
import com.simulador.conexion.Conexion;

public class Usuario{
	
	private String usuario;
	private String password;
	private String tipo;
	private boolean usuarioValido;
	
	public Usuario(){ super(); }
	
	public String getUsuario() {
        return usuario;
    }
    
	public void setUsuario(String usuario) {
        this.usuario = usuario;
    }
	
	public String getPassword(){
    	return password;
    }
    
    public void setPassword( String password ){
    	this.password = password;
    }

	public String getTipo() {
		return tipo;
	}

	public void setTipo(String tipo) {
		this.tipo = tipo;
	}
	
	public boolean isUsuarioValido() {
		return usuarioValido;
	}

	public void setUsuarioValido(boolean usuarioValido) {
		this.usuarioValido = usuarioValido;
	}
	
	public Persona verificar(){
		
		Conexion c = new Conexion();
    	Persona p = new Persona();
    	try {
            
    		if ( c.conn != null) {
            	
    			String pass = "", descypher_pass = "", user = "";
    			
            	c.preparedStatement = c.conn.prepareStatement("SELECT * FROM Persona WHERE usuario = ?");
            	c.preparedStatement.setString( 1, getUsuario() );
    			c.result = c.preparedStatement.executeQuery();
            	
            	while (c.result.next()) {
            	
            		p.setNombres( c.result.getString("nombres") + " " + c.result.getString("apellidop") );
    				setTipo( c.result.getString("tipo") );
    				p.setId_persona( c.result.getString("id_persona") ); 
    				
    				pass = c.result.getString("password");
    				user = c.result.getString("usuario");
    				
    			}
            	
            	c.preparedStatement = c.conn.prepareStatement("SELECT AES_DECRYPT( ?, '$eCr3T0' ) AS pass");
            	c.preparedStatement.setString( 1, pass );
            	c.result = c.preparedStatement.executeQuery();
            	
            	while (c.result.next()) {
            		descypher_pass = c.result.getString("pass");
    			}
            	
            	System.out.println("Descrifrada: " + descypher_pass + "\tTecleada: " + getPassword() );
            	
            	if( user.equalsIgnoreCase( getUsuario() ) && getPassword().equalsIgnoreCase( descypher_pass ) ){
            		setUsuarioValido(true);
				}else{
					setUsuarioValido(false);
				}
    			
    		}
    		
        }
        catch(SQLException ex) {
            System.out.println("[ERROR] Usuario.verificar(): "+ ex.getMessage() );
        }
    	
    	return p;
    	
    }

}
