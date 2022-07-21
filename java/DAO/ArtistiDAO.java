package DAO;

import java.util.List;
import pojo.Artisti;
import pojo.GenuriMuzicale;
import pojo.Albume;
public interface ArtistiDAO {
    public void adaugaArtist(Artisti artist);
    public List<Artisti> afiseazaArtist();
    public void modificaArtist(long idartist, Albume album, GenuriMuzicale genmuzical, String nume, String prenume, String data_lansare, String trupa);
    public void stergeArtist(Artisti artist);
}    
