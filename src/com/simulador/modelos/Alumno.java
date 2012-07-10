package com.simulador.modelos;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.simulador.conexion.Conexion;

public class Alumno extends Persona {

	private static final long serialVersionUID = 1L;
	public Alumno(){}
	
	public Alumno(String id, String nombres, String apellidop, String apellidom, String mail, String sexo, String fechaNac ) {
		super( id, nombres, apellidop, apellidom, mail, sexo, fechaNac );
	}
	
	public List<Alumno> obtenerAlumnos(){
		
		List<Alumno> alumnos = new ArrayList<Alumno>();
		Conexion c = new Conexion();
		
		try {
            
    		if ( c.conn != null) {
            	
            	c.preparedStatement = c.conn.prepareStatement("SELECT * FROM Persona WHERE tipo = ?");
            	c.preparedStatement.setString( 1, "ALUMNO" );
    			c.result = c.preparedStatement.executeQuery();
            	
            	while ( c.result.next() ) {
            		alumnos.add( new Alumno( c.result.getString("id_persona"), c.result.getString("nombres"), c.result.getString("apellidop"), c.result.getString("apellidom"), c.result.getString("email"), c.result.getString("sexo"), c.result.getString("fechaNac") ) );
            	}
            	
            	
    		}
    		
        }
        catch(SQLException ex) {
            System.out.println("[ERROR] com.simulador.modelos.Alumno.obtenerAlumnos(): "+ ex.getMessage() );
        }
		
		return alumnos;
		
	}
	
	public boolean alta(){
		Conexion c = new Conexion();
		
		try {
            
    		if ( c.conn != null) {
    			
    			setId_persona( "PER" + System.currentTimeMillis() );
    			
    			c.preparedStatement = c.conn.prepareStatement("INSERT INTO Persona VALUES( ?, ?, AES_ENCRYPT( ?,'$eCr3T0' ), ?, ?, ?, ?, ?, ?, ? )");
            	c.preparedStatement.setString( 1, getId_persona() );
            	c.preparedStatement.setString( 2, getUsuario() );
            	c.preparedStatement.setString( 3, getPassword() );
            	c.preparedStatement.setString( 4, getNombres() );
            	c.preparedStatement.setString( 5, getApellidop() );
            	c.preparedStatement.setString( 6, getApellidom() );
            	c.preparedStatement.setString( 7, getEmail() );
            	c.preparedStatement.setString( 8, getSexo() );
            	c.preparedStatement.setDate(   9, java.sql.Date.valueOf( getFechaNac() ) );
            	c.preparedStatement.setString( 10, "ALUMNO" );
    			c.preparedStatement.executeUpdate();
            	
            }
    		
        }
        catch(Exception ex) {
        	System.out.println("[ERROR] com.simulador.modelos.Alumno.alta(): "+ ex.getMessage() );
            return false;
        }
		
		
		return true;
		
	}
	
	public boolean baja(){
		Conexion c = new Conexion();
		
		if( getId_persona() == null ) return false;
		
		try {
            
    		if ( c.conn != null) {
    			
    			c.preparedStatement = c.conn.prepareStatement("DELETE FROM Persona WHERE id_persona = ?");
            	c.preparedStatement.setString( 1, getId_persona() );
            	c.preparedStatement.executeUpdate();
            	
            }
    		
        }
        catch(SQLException ex) {
        	System.out.println("[ERROR] com.simulador.modelos.Alumno.baja(): "+ ex.getMessage() );
            return false;
        }
		
		return true;
	}
    
	public boolean consultar(){
		Conexion c = new Conexion();
		
		if( getUsuario() == null ) return false;
		
		try {
            
    		if ( c.conn != null) {
    			
    			c.preparedStatement = c.conn.prepareStatement("SELECT * FROM Persona WHERE id_persona = ?");
            	c.preparedStatement.setString( 1, getUsuario() );
            	c.result = c.preparedStatement.executeQuery();
            	
            	while( c.result.next() ){
            		
            		this.setId_persona(c.result.getString("id_persona"));
            		this.setNombres( c.result.getString("nombres"));
            		this.setApellidop(c.result.getString("apellidop"));
            		this.setApellidom(c.result.getString("apellidom"));
            		this.setEmail( c.result.getString("email"));
            		this.setSexo(c.result.getString("sexo"));
            		this.setFechaNac(c.result.getString("fechaNac"));
            		this.setUsuario(c.result.getString("usuario"));
            		
            	}
            	
            }
    		
        }
        catch(SQLException ex) {
        	System.out.println("[ERROR] com.simulador.modelos.Alumno.consultar(): "+ ex.getMessage() );
            return false;
        }
		
		return true;
		
	}

	public boolean modificar(){
		Conexion c = new Conexion();
		
		try {
            
    		if ( c.conn != null) {
    			
    			System.out.println( getId_persona() );
    			
    			c.preparedStatement = c.conn.prepareStatement("UPDATE Persona SET nombres = ?, apellidop = ?, apellidom = ?, email = ?, sexo = ?, fechaNac = ? WHERE id_persona = ?");
            	c.preparedStatement.setString( 1, getNombres() );
            	c.preparedStatement.setString( 2, getApellidop() );
            	c.preparedStatement.setString( 3, getApellidom() );
            	c.preparedStatement.setString( 4, getEmail() );
            	c.preparedStatement.setString( 5, getSexo() );
            	c.preparedStatement.setDate(   6, java.sql.Date.valueOf( getFechaNac() ) );
            	c.preparedStatement.setString( 7, getId_persona() );
    			c.preparedStatement.executeUpdate();
            	
            }
    		
        }
        catch(Exception ex) {
        	System.out.println("[ERROR] com.simulador.modelos.Alumno.alta(): "+ ex.getMessage() );
            return false;
        }
		
		return true;
		
	}

}
