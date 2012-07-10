package com.simulador.modelos;

import java.io.Serializable;
public class Persona extends Usuario implements Serializable{
	
	private static final long serialVersionUID = 1L;
	private String id_persona;
	private String nombres;
	private String apellidop;
    private String apellidom;
    private String email;
    private String sexo;
    private String fechaNac;
    
    
    public String getId_persona() {
		return id_persona;
	}
	public void setId_persona(String id_persona) {
		this.id_persona = id_persona;
	}
    public String getNombres() {
		return nombres;
	}
	public void setNombres(String nombres) {
		this.nombres = nombres;
	}
	public String getApellidop() {
		return apellidop;
	}
	public void setApellidop(String apellidop) {
		this.apellidop = apellidop;
	}
	public String getApellidom() {
		return apellidom;
	}
	public void setApellidom(String apellidom) {
		this.apellidom = apellidom;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	
	public String getSexo() {
		return sexo;
	}
	public void setSexo(String sexo) {
		this.sexo = sexo;
	}
	public String getFechaNac() {
		return fechaNac;
	}
	public void setFechaNac(String fechaNac) {
		this.fechaNac = fechaNac;
	}
	public Persona(){}
	
	public Persona(String id, String nombres, String apellidop, String apellidom, String mail, String sexo, String fechaNac ) {
		super();
		this.id_persona = id;
		this.nombres = nombres;
		this.apellidop = apellidop;
		this.apellidom = apellidom;
		this.email = mail;
		this.sexo = sexo;
		this.fechaNac = fechaNac;
	}
	
}
