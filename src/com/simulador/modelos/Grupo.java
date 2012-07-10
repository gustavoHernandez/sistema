package com.simulador.modelos;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.opensymphony.xwork2.ActionContext;
import com.simulador.conexion.Conexion;

public class Grupo {
	
	private String id_grupo;
	private String id_propietario;
	private String nombre;
	private String password;
	private String descripcion;
	
	public String getId_grupo() {
		return id_grupo;
	}
	public void setId_grupo(String id_grupo) {
		this.id_grupo = id_grupo;
	}
	public String getId_propietario() {
		return id_propietario;
	}
	public void setId_propietario(String id_propietario) {
		this.id_propietario = id_propietario;
	}
	public String getNombre() {
		return nombre;
	}
	public void setNombre(String nombre) {
		this.nombre = nombre;
	}
	
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getDescripcion() {
		return descripcion;
	}
	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}
	public Grupo(){}
	
	public Grupo(String id_grupo, String id_propietario, String nombre, String password, String descripcion ) {
		super();
		this.id_grupo = id_grupo;
		this.id_propietario = id_propietario;
		this.nombre = nombre;
		this.password = password;
		this.descripcion = descripcion;
	}
	
	public List<Grupo> obtener(){
		
		List<Grupo> grupos = new ArrayList<Grupo>();
		Conexion c = new Conexion();
		
		Map<String,Object> session = ActionContext.getContext().getSession();
		String id_profesor = session.get("idUsuario").toString(); 
		
		
		try {
            
    		if ( c.conn != null) {
            	
            	c.preparedStatement = c.conn.prepareStatement("SELECT * FROM Grupo WHERE id_propietario = ?");
            	c.preparedStatement.setString( 1, id_profesor );
    			c.result = c.preparedStatement.executeQuery();
            	
            	while ( c.result.next() ) {
            		grupos.add( new Grupo( c.result.getString("id_grupo"), c.result.getString("id_propietario"), c.result.getString("nombre"), c.result.getString("password"), c.result.getString("descripcion") ) );
            	}
            	
            	
    		}
    		
        }
        catch(SQLException ex) {
            System.out.println("[ERROR] com.simulador.modelos.Grupo.obtener(): "+ ex.getMessage() );
        }
		
		return grupos;
		
	}
	
	public boolean alta(){
		Conexion c = new Conexion();
		
		Map<String,Object> session = ActionContext.getContext().getSession();
		String id_profesor = session.get("idUsuario").toString(); 
		
		try {
            
    		if ( c.conn != null) {
    			
    			setId_grupo( "GRU" + System.currentTimeMillis() );
    			
    			c.preparedStatement = c.conn.prepareStatement("INSERT INTO Grupo VALUES( ?, ?, ?, ?, ? )");
            	c.preparedStatement.setString( 1, getId_grupo() );
            	c.preparedStatement.setString( 2, id_profesor );
            	c.preparedStatement.setString( 3, getNombre() );
            	c.preparedStatement.setString( 4, getPassword() );
            	c.preparedStatement.setString( 5, getDescripcion() );
            	c.preparedStatement.executeUpdate();
            	
            }
    		
        }
        catch(Exception ex) {
        	System.out.println("[ERROR] com.simulador.modelos.Grupo.alta(): "+ ex.getMessage() );
            return false;
        }
		
		
		return true;
		
	}
	
	public boolean consultar(){
		Conexion c = new Conexion();
		
		if( getId_grupo() == null ) return false;
		
		try {
            
    		if ( c.conn != null) {
    			
    			c.preparedStatement = c.conn.prepareStatement("SELECT * FROM Grupo WHERE id_grupo = ?");
            	c.preparedStatement.setString( 1, getId_grupo() );
            	c.result = c.preparedStatement.executeQuery();
            	
            	while( c.result.next() ){
            		this.setId_grupo(c.result.getString("id_grupo") );
            		this.setNombre( c.result.getString("nombre"));
            		this.setPassword( c.result.getString("password"));
            		this.setDescripcion( c.result.getString("descripcion"));
            	}
            	
            }
    		
        }
        catch(SQLException ex) {
        	System.out.println("[ERROR] com.simulador.modelos.consultar(): "+ ex.getMessage() );
            return false;
        }
		
		return true;
		
	}
	
	public boolean modificar(){
		Conexion c = new Conexion();
		
		try {
            
    		if ( c.conn != null) {
    			
    			System.out.println( getId_grupo() );
    			
    			c.preparedStatement = c.conn.prepareStatement("UPDATE Grupo SET nombre = ?, password = ?, descripcion = ? WHERE id_grupo = ?");
            	c.preparedStatement.setString( 1, getNombre() );
            	c.preparedStatement.setString( 2, getPassword() );
            	c.preparedStatement.setString( 3, getDescripcion() );
    			c.preparedStatement.setString( 4, getId_grupo() );
    			c.preparedStatement.executeUpdate();
            	
            }
    		
        }
        catch(Exception ex) {
        	System.out.println("[ERROR] com.simulador.modelos.Grupo.modificar(): "+ ex );
            return false;
        }
		
		
		return true;
		
	}
	
	public boolean baja(){
		Conexion c = new Conexion();
		
		if( getId_grupo() == null ) return false;
		
		try {
            
    		if ( c.conn != null) {
    			
    			c.preparedStatement = c.conn.prepareStatement("DELETE FROM Grupo WHERE id_grupo = ?");
            	c.preparedStatement.setString( 1, getId_grupo() );
            	c.preparedStatement.executeUpdate();
            	
            }
    		
        }
        catch(SQLException ex) {
        	System.out.println("[ERROR] com.simulador.modelos.Grupo.baja(): "+ ex.getMessage() );
            return false;
        }
		
		return true;
	}
    
}
