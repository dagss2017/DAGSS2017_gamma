/*
 Proyecto Java EE, DAGSS-2016
 */
package es.uvigo.esei.dagss.dominio.daos;

import es.uvigo.esei.dagss.dominio.entidades.Cita;
import es.uvigo.esei.dagss.dominio.entidades.Prescripcion;
import static java.time.Instant.now;
import java.util.Date;
import java.util.List;
import javax.ejb.LocalBean;
import javax.ejb.Stateless;
import javax.persistence.TemporalType;
import javax.persistence.TypedQuery;

@Stateless
@LocalBean
public class PrescripcionDAO extends GenericoDAO<Prescripcion> {

    public Prescripcion buscarPorIdConRecetas(Long prescripcionid) {
        TypedQuery<Prescripcion> q = em.createQuery("SELECT p FROM Prescripcion AS p JOIN FETCH p.recetas"
                                                  + "  WHERE p.id = :id", Prescripcion.class);
        q.setParameter("id", prescripcionid);
        
        return q.getSingleResult();
    }
    
    // Completar aqui  
    
    public List<Prescripcion> buscarPorPaciente(Long pacienteid) {
        Date ahora = new Date(); 
        TypedQuery<Prescripcion> q = em.createQuery("SELECT p FROM Prescripcion AS p "
                + "  WHERE p.paciente.id = :id AND"
                       + "p.fechaFin >= :hoy "
                       + "ORDER BY p.fechaInicio", Prescripcion.class);
        q.setParameter("id", pacienteid);
        q.setParameter("hoy",ahora,TemporalType.DATE);
        return q.getResultList();
    }
    //Crear, modificar e eliminar prescripción se hacen en GenericoDAO
}
