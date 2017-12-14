/*
 Proyecto Java EE, DAGSS-2014
 */

package es.uvigo.esei.dagss.dominio.daos;

import es.uvigo.esei.dagss.dominio.entidades.Cita;
import java.util.List;
import javax.ejb.LocalBean;
import javax.ejb.Stateless;
import javax.persistence.TypedQuery;


@Stateless
@LocalBean
public class CitaDAO  extends GenericoDAO<Cita>{    

    // Completar aqui
    public List<Cita> buscarPorMedico(Long medicoid) {
        String patronUno = "AUSENTE";
        String patronDos = "COMPLETADA";
        TypedQuery<Cita> q = em.createQuery("SELECT c FROM Cita AS c "
                                              + "  WHERE c.medico.id = :id"
                                               + "AND (c.estado NOT LIKE :patronUno) AND "
                                              + " (c.estado NOT LIKE :patronDos)", Cita.class);
        q.setParameter("id",medicoid);
        q.setParameter("patronUno","%"+patronUno+"%");
        q.setParameter("patronDos","%"+patronDos+"%");
        return q.getResultList();
    }
    
    public List<Cita> buscarAusentes(Long medicoid) {
        String patron = "AUSENTE";
        TypedQuery<Cita> q = em.createQuery("SELECT c FROM Cita AS c "
                                              + "  WHERE c.medico.id = :id"
                                               + "AND c.estado LIKE :patron", Cita.class);
        q.setParameter("id",medicoid);
        q.setParameter("patron","%"+patron+"%");
        return q.getResultList();
    }
    
    public List<Cita> buscarCompletadas(Long medicoid) {
        String patron = "COMPLETADA";
        TypedQuery<Cita> q = em.createQuery("SELECT c FROM Cita AS c "
                                              + "  WHERE c.medico.id = :id"
                                               + "AND c.estado LIKE :patron", Cita.class);
        q.setParameter("id",medicoid);
        q.setParameter("patron","%"+patron+"%");
        return q.getResultList();
    }
    
    public void completar(Cita cita){
        TypedQuery<Cita> q = em.createQuery("UPDATE Cita"
                                            +"SET estado = 'COMPLETADA'"
                                            +"WHERE :patron", Cita.class);
        q.setParameter("patron",cita.getId());
    }
    
    public void ausentar(Cita cita){
        TypedQuery<Cita> q = em.createQuery("UPDATE Cita"
                                            +"SET estado = 'AUSENTE'"
                                            +"WHERE :patron", Cita.class);
        q.setParameter("patron",cita.getId());
    }
}
