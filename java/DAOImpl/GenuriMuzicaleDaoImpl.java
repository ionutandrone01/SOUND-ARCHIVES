package DAOImpl;

import java.util.ArrayList;
import java.util.List;
import javax.persistence.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import pojo.GenuriMuzicale;
import DAO.GenuriMuzicaleDAO;


public class GenuriMuzicaleDaoImpl implements GenuriMuzicaleDAO{

    public void adaugaGenMuzical(GenuriMuzicale genmuzical) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction transaction = session.beginTransaction();
        session.save(genmuzical);
        transaction.commit();
        session.close();
    }

    public List<GenuriMuzicale> afiseazaGenMuzical() {
        List<GenuriMuzicale> listaGenuriMuzicale = new ArrayList();
        Session session = HibernateUtil.getSessionFactory().openSession();;
        org.hibernate.Query query = session.createQuery("From GenuriMuzicale");
        listaGenuriMuzicale = query.list();
        return listaGenuriMuzicale;
    }

    public void modificaGenMuzical(long idgen, String nume, String data_aparitie, String tip) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction transaction = session.beginTransaction();
        GenuriMuzicale detaliigenuri = (GenuriMuzicale) session.load(GenuriMuzicale.class, idgen);
        detaliigenuri.setNume(nume);
        detaliigenuri.setData_aparitie(data_aparitie);
        
        detaliigenuri.setTip(tip);
        session.update(detaliigenuri);
        transaction.commit();
        session.close();
    }

    public void stergeGenMuzical(GenuriMuzicale genmuzical) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction transaction = session.beginTransaction();
        session.delete(genmuzical);
        transaction.commit();
        session.close();
    }
}
