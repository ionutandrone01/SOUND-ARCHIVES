package DAOImpl;

import java.util.ArrayList;
import java.util.List;
import javax.persistence.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import pojo.Albume;
import DAO.AlbumeDAO;


public class AlbumeDaoImpl implements AlbumeDAO{
    
	public AlbumeDaoImpl() {
	}
    public void adaugaAlbum(Albume album) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction transaction = session.beginTransaction();
        session.save(album);
        transaction.commit();
        session.close();
    }

    public List<Albume> afiseazaAlbum() {
        List<Albume> listaAlbume = new ArrayList();
        Session session = HibernateUtil.getSessionFactory().openSession();
        org.hibernate.Query query = session.createQuery("From Albume");
        listaAlbume = query.list();
        return listaAlbume;
    }

    public void modificaAlbum(long idalbum, String nume, String tip) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction transaction = session.beginTransaction();
        Albume detaliialbume = (Albume) session.load(Albume.class, idalbum);
        detaliialbume.setNume(nume);
        detaliialbume.setTip(tip);
        session.update(detaliialbume);
        transaction.commit();
        session.close();
    }

    public void stergeAlbum(Albume album) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction transaction = session.beginTransaction();
        session.delete(album);
        transaction.commit();
        session.close();
    }
}