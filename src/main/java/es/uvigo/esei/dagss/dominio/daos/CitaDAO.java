/*
 Proyecto Java EE, DAGSS-2014
 */

package es.uvigo.esei.dagss.dominio.daos;

import es.uvigo.esei.dagss.dominio.entidades.Cita;
import es.uvigo.esei.dagss.dominio.entidades.EstadoCita;
import java.util.List;
import javax.ejb.LocalBean;
import javax.ejb.Stateless;
import javax.persistence.TypedQuery;


@Stateless
@LocalBean

public class CitaDAO  extends GenericoDAO<Cita>{    

    // Completar aqui
    public List<Cita> buscarPorMedico(Long medicoid) {
        EstadoCita patronUno = EstadoCita.AUSENTE;
        EstadoCita patronDos = EstadoCita.COMPLETADA;
        TypedQuery<Cita> q = em.createQuery("SELECT c FROM Cita AS c "
                + "  WHERE c.medico.id = :id"
                + "  AND (c.estado != :patronUno)"
                + "  AND (c.estado != :patronDos)", Cita.class);
        q.setParameter("id", medicoid);
        q.setParameter("patronUno", patronUno);
        q.setParameter("patronDos", patronDos);
        return q.getResultList();
    }
    
    
    public Cita completar(Cita cita){
        cita.setEstado(EstadoCita.COMPLETADA);
        return em.merge(cita);
    }

    public Cita ausentar(Cita cita){
         cita.setEstado(EstadoCita.AUSENTE);
         return em.merge(cita);
    }
}
