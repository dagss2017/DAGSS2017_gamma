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
import es.uvigo.esei.dagss.dominio.daos.PrescripcionDAO;
import es.uvigo.esei.dagss.dominio.entidades.Cita;
import es.uvigo.esei.dagss.dominio.entidades.EstadoCita;
import es.uvigo.esei.dagss.dominio.entidades.Medico;
import es.uvigo.esei.dagss.dominio.entidades.Paciente;
import es.uvigo.esei.dagss.dominio.entidades.Prescripcion;
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
@Named(value = "GestionPrescripcionesControlador")
@SessionScoped

public class GestionPrescripcionesControlador implements Serializable {
    
    @Inject
    CitaDAO citaDAO;

    @Inject
    MedicoDAO medicoDAO;

    @Inject
    PacienteDAO pacienteDAO;
    
    @Inject 
    PrescripcionDAO prescripcionDAO;

    
    @Inject
    MedicoControlador medicoControlador;
    
    @Inject
    GestionCitasActualesControlador gestionCitasActualesControlador;
    
    List<Prescripcion> prescripciones;
    Prescripcion prescripcionActual;
    
     public GestionPrescripcionesControlador() {
    }

    @PostConstruct
    public void inicializar() {
        prescripciones = prescripcionDAO.buscarPorPaciente(gestionCitasActualesControlador.citaActual.getPaciente().getId());
    }
    
    public List<Prescripcion> getPrescripciones() {
        return prescripciones;
    }

    public void setPrescripciones(List<Prescripcion> prescripciones) {
        this.prescripciones = prescripciones;
    }
    
    public Prescripcion getPrescripcionActual() {
        return prescripcionActual;
    }

    public void setPrescripcionActual(Prescripcion prescripcionActual) {
        this.prescripcionActual = prescripcionActual;
    }
}
