/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package es.uvigo.esei.dagss.controladores.medico;
/**
 *
 * @author canro
 */

import es.uvigo.esei.dagss.dominio.daos.CitaDAO;
import es.uvigo.esei.dagss.dominio.daos.MedicoDAO;
import es.uvigo.esei.dagss.dominio.daos.PacienteDAO;
import es.uvigo.esei.dagss.dominio.entidades.Cita;
import es.uvigo.esei.dagss.dominio.entidades.EstadoCita;
import es.uvigo.esei.dagss.dominio.entidades.Medico;
import es.uvigo.esei.dagss.dominio.entidades.Paciente;
import javax.inject.Named;
import javax.enterprise.context.SessionScoped;
import java.io.Serializable;
import java.util.List;
import javax.annotation.PostConstruct;
import javax.inject.Inject;

/**
 *
 * @author dagss
 */
@Named(value = "gestionCitasActualesControlador")
@SessionScoped
public class GestionCitasActualesControlador implements Serializable {

    static final public Integer DURACION_CITA_POR_DEFECTO = 15; // Citas de 15 minutos

    @Inject
    CitaDAO citaDAO;

    @Inject
    MedicoDAO medicoDAO;

    @Inject
    PacienteDAO pacienteDAO;

    
    @Inject
    MedicoControlador medicoControlador;
    
    List<Cita> citas;
    
    Cita citaActual;

    public GestionCitasActualesControlador() {
    }

    @PostConstruct
    public void inicializar() {
        citas = citaDAO.buscarPorMedico(medicoControlador.getMedicoActual().getId());
    }

    /*
       Usado en la lista desplegable con los estados de una cita
     */
    public EstadoCita[] getEstadosCitas() {
        return EstadoCita.values();
    }

    public List<Cita> getCitas() {
        return citas;
    }

    public void setCitas(List<Cita> citas) {
        this.citas = citas;
    }
    
    public Cita getCitaActual() {
        return citaActual;
    }

    public void setCitaActual(Cita citaActual) {
        this.citaActual = citaActual;
    }
    
    public void doCompletado(Cita cita) {
        System.out.println(">>> llama a completar con "+cita);
        citaActual = citaDAO.completar(cita);
        //Actualizar lista de citas con el médico en sesión
        citas = citaDAO.buscarPorMedico(medicoControlador.getMedicoActual().getId()); 
    }
    
    public void doAusente(Cita cita) {
        System.out.println(">>> llama a ausentar con "+cita);
        citaActual= citaDAO.ausentar(cita);
        //Actualizar lista de citas con el médico en sesión
        citas = citaDAO.buscarPorMedico(medicoControlador.getMedicoActual().getId()); 
    }
    public void doPrescripciones(Cita cita) {
        citaActual= cita;
        //Redireccionar a atención al paciente
        
    }
    public String doVolver() {
        return "../index?faces-redirect=true";
    }

}