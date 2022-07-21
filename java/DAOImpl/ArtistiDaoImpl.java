package DAOImpl;

import java.util.ArrayList;
import java.util.List;
import javax.persistence.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import pojo.Artisti;
import DAO.ArtistiDAO;
import java.util.Date;
import pojo.Albume;
import pojo.GenuriMuzicale;


public class ArtistiDaoImpl implements ArtistiDAO{

    public void adaugaArtist(Artisti artist) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction transaction = session.beginTransaction();
        session.save(artist);
        transaction.commit();
        session.close();
    }

    public List<Artisti> afiseazaArtist() {
        List<Artisti> listaArtisti = new ArrayList();
        Session session = HibernateUtil.getSessionFactory().openSession();
        org.hibernate.Query query = session.createQuery("From Artisti");
        listaArtisti = query.list();
        return listaArtisti;
    }

    public void modificaArtist(long idartist, Albume album, GenuriMuzicale genmuzical,  String nume, String prenume, String data_lansare, String trupa) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction transaction = session.beginTransaction();
        Artisti detaliiartisti;
        detaliiartisti = (Artisti) session.load(Artisti.class, idartist);
        detaliiartisti.setGenurimuzicale(genmuzical);
        detaliiartisti.setAlbume(album);     
        detaliiartisti.setNume(nume);
        detaliiartisti.setPrenume(prenume);
        detaliiartisti.setData_lansare(data_lansare);
        detaliiartisti.setTrupa(trupa);
        session.update(detaliiartisti);
        transaction.commit();
        session.close();
    }

    public void stergeArtist(Artisti artist) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction transaction = session.beginTransaction();
        session.delete(artist);
        transaction.commit();
        session.close();
    }
}